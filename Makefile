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

ASFLAGS := -EL
LDFLAGS := -EL

### Files ###
BASEROM := baserom.bin
BIN := monkeyball.bin
ELF := monkeyball.elf
LDSCRIPT := ldscript.ld
S_FILES := $(wildcard asm/*.s) $(wildcard src/*.s)
O_FILES := $(S_FILES:.s=.o)

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@
ifeq ($(COMPARE),1)
	$(SHA1SUM) -c monkeyball.sha1
endif

$(ELF): $(LDSCRIPT) $(O_FILES)
	$(LD) $(LDFLAGS) -T $(LDSCRIPT) $(O_FILES) -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(BIN) $(ELF) $(O_FILES)
