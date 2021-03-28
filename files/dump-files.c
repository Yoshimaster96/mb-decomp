//THIS PROGRAM IS TO DUMP FILES FROM A DECRYPTED BALL.BIN OR .DAT FILE
//IN ORDER TO AVOID DISTRIBUTING THEM WITH THE DECOMPILED SOURCE CODE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char ** argv) {
	if(argc!=2) {
		printf("Usage: dump-files [decrypted BALL.BIN or .dat file]");
		return -1;
	}
	FILE * fp = fopen(argv[1],"rb");
	if(fp==NULL) {
		printf("Could not open decrypted BALL.BIN or .dat file for reading!");
		return -1;
	}
	FILE * list = fopen("file-list.txt","r");
	for(int i=0; i<108; i++) {
		//Get data from list
		char fileName[80];
		long offset,size;
		fscanf(list,"%s %lx %lx",fileName,&offset,&size);
		//Handle special file sizes
		if(size==0) {
			//Get size from compressed LZ file
			fseek(fp,offset,SEEK_SET);
			size = getc(fp)|(getc(fp)<<8)|(getc(fp)<<16)|(getc(fp)<<24);
		}
		if(size==1) {
			//Get size from list of 10 LZ files (for stages)
			fseek(fp,offset+72,SEEK_SET);
			long lo = getc(fp)|(getc(fp)<<8)|(getc(fp)<<16)|(getc(fp)<<24);
			long ls = getc(fp)|(getc(fp)<<8)|(getc(fp)<<16)|(getc(fp)<<24);
			size = lo+ls;
		}
		if(size==2) {
			//Get size from SPSD file
			fseek(fp,offset+12,SEEK_SET);
			size = getc(fp)|(getc(fp)<<8)|(getc(fp)<<16)|(getc(fp)<<24);
			size += 0x40;
		}
		if(size==3) {
			//Get size from DTPK file
			fseek(fp,offset+8,SEEK_SET);
			size = getc(fp)|(getc(fp)<<8)|(getc(fp)<<16)|(getc(fp)<<24);
		}
		//Dump file
		char * buffer = (char*)malloc(size);
		FILE * out = fopen(fileName,"wb");
		fseek(fp,offset,SEEK_SET);
		fread(buffer,1,size,fp);
		fwrite(buffer,1,size,out);
		fclose(out);
		free(buffer);
	}
	fclose(fp);
	fclose(list);
	return 0;
}
