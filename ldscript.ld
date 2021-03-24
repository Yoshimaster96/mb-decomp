OUTPUT_ARCH(sh4)

SECTIONS
{
    . = 0x0C01F000;
    HEADER :
    {
        asm/header.o(.rodata);
    }

    . = 0x0C020000;
    .text :
    {
        src/crt0.o(.text);
        asm/program.o(.text);
    }
    
    FILES :
    {
        asm/files.o(.rodata);
    }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}

__sbss = 0x0C20CAE0;
__ebss = 0x000580F0;
__stack_begin = 0x0CC00000;
main = 0x0C0200E0;
_testModeFlag = 0x0C0CAEF4;
