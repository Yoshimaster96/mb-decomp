# Game Data Files (TODO: include them)
.section .rodata
.incbin "baserom.bin", 0x9800000, 0x9A421F0-0x9800000

.section .rodata2
.incbin "baserom.bin", 0x9F00000, 0x15D0
