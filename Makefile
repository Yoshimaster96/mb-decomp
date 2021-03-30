ifneq (,$(findstring Windows,$(OS)))
  EXE := .exe
endif

### Build Options ###
# Whether to verify the build output hash
COMPARE ?= 1
# Prefix for SH4 binutils
CROSS_PREFIX ?= sh4-linux-gnu-

### Tools ###
AS      := $(CROSS_PREFIX)as
LD      := $(CROSS_PREFIX)ld
OBJCOPY := $(CROSS_PREFIX)objcopy
SHA1SUM := sha1sum
HOSTCC  := cc
EXTRACT := files/dump-files$(EXE)

ASFLAGS     := -EL
LDFLAGS     := -EL --accept-unknown-input-arch
HOSTCCFLAGS := -Wall -O0 -g

### Files ###
BASEROM := baserom.bin
BIN := monkeyball.bin
ELF := $(BIN:.bin=.elf)
LDSCRIPT := ldscript.ld
S_FILES := $(wildcard asm/*.s) $(wildcard src/*.s)
# Read list of files from file-list.txt
DATAFILES := $(shell awk '{print "files/"$$1}' files/file-list.txt)
O_FILES := $(S_FILES:.s=.o) $(DATAFILES:=.o)

### Main Rules ###

# Remove builtin rules
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

$(BIN): $(ELF)
	$(OBJCOPY) --gap-fill 0x00 --pad-to 0x1A01F000 -O binary $< $@
ifeq ($(COMPARE),1)
	$(SHA1SUM) -c monkeyball.sha1
endif

$(ELF): $(LDSCRIPT) $(O_FILES)
	$(LD) $(LDFLAGS) -T $(LDSCRIPT) -Map $(@:.elf=.map) -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

%.o: %
	$(OBJCOPY) -I binary -O elf32-little $< $@

$(EXTRACT): files/dump-files.c
	$(HOSTCC) $(HOSTCCFLAGS) $^ -o $@

$(DATAFILES): $(EXTRACT) files/file-list.txt $(BASEROM)
	@echo 'Extracting Files...'
	cd files && ./dump-files$(EXE) ../baserom.bin

$(BASEROM):
	@echo 'Error: $(BASEROM) not found'
	@echo 'Please place a copy of the original BALL.BIN file in this directory and rename it to $(BASEROM)'
	@false

clean:
	$(RM) $(BIN) $(ELF) $(O_FILES) $(DATAFILES) $(EXTRACT)

# Extra dependencies
asm/files.o: $(BASEROM)
asm/header.o: $(BASEROM)
asm/program.o: $(BASEROM)
