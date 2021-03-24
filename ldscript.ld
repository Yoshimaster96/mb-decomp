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
