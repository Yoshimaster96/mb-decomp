.section .rodata

# Writes 'text' and pads it with spaces to fill 'nbytes' bytes 
.macro pad_string nbytes:req text:req
    1:
    .ascii "\text"
    .org 1b+\nbytes, ' '
.endm

# System Description
pad_string 16, "NAOMI"

# Publisher/Copyright Holder
pad_string 32, "SEGA ENTERPRISES,LTD."

# Game Title (Japan Region)
pad_string 32, "MONKEY BALL JAPAN VERSION"

# Game Title (USA Region)
pad_string 32, "MONKEY BALL USA VERSION"

# Game Title (Export Region)
pad_string 32, "MONKEY BALL EXPORT VERSION"

# Game Title (Korea Region)
pad_string 32, "MONKEY BALL KOREA VERSION"

# Game Title (Australia Region)
pad_string 32, "MONKEY BALL AUSTRALIA VERSION"

# Game Title (Dummy Region 6)
pad_string 32, "MONKEY BALL"

# Game Title (Dummy Region 7)
pad_string 32, "MONKEY BALL"

# Game Title (Dummy Region 8)
pad_string 32, "MONKEY BALL"

# Year of Manufacture
.2byte 2001

# Month of Manufacture
.byte 3

# Day of Manufacture
.byte 1

# Serial Number
.ascii "BDF0"

# 8MB ROM Mode
.2byte 1

# G1 BUS Init Flag
.2byte 0

# SB_G1RRC Init Value
.4byte 0

# SB_G1RWC Init Value
.4byte 0

# SB_G1FRC Init Value
.4byte 0

# SB_G1FWC Init Value
.4byte 0

# SB_G1CRC Init Value
.4byte 0

# SB_G1CWC Init Value
.4byte 0

# SB_G1GDRC Init Value
.4byte 0

# SB_G1GDWC Init Value
.4byte 0

# M2/M4-Type ROM Checksums
.incbin "baserom.bin", 0x15C, 132

# EEPROM Initialization Table
.incbin "baserom.bin", 0x1E0, 0x80

# Credit Information Strings
pad_string 32, "CREDIT TO START"
pad_string 32, "CREDIT TO CONTINUE"
.fill 32, 1, 0
.fill 32, 1, 0
.fill 32, 1, 0
.fill 32, 1, 0
.fill 32, 1, 0
.fill 32, 1, 0

# Main Executable Load Entries
#      ROM Offset   RAM Address  Size
.4byte 0x00001000,  0x0C020000,  0x00300000
.4byte 0xFFFFFFFF,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0

# Test Executable Load Entries
#      ROM Offset   RAM Address  Size
.4byte 0x00001000,  0x0C020000,  0x00300000
.4byte 0xFFFFFFFF,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0
.4byte          0,           0,           0

# Main Entry Point
.4byte _start

# Test Entry Point
.4byte _start_testmode

# Supported Regions (bit 0 = Japan, bit 1 = USA, bit 2 = Export, bit 3 = Korea, bit 4 = Australia)
.byte 0xFF  ;# All regions are supported.

# Supported Player Numbers (bit 0 = 1-player, bit 1 = 2-player, bit 2 = 3-player, bit 3 = 4-player)
.byte 0x00  ;# All player settings are supported.

# Supported Display Frequencies (0 = 31khz, 1 = 15 khz)
.byte 0  ;# 31khz

# Supported Display Orientations (bit 0 = horizontal mode, bit 1 = vertical mode)
.byte 0  ;# Either is valid.

# Whether to check ROM/DIMM board serial number
.byte 0

# Service Type
.byte 0xFF

# M1-Type ROM Checksums
.incbin "baserom.bin", 0x42E, 144

# Unused Padding
.org 0x4FF, 0xFF

# Header Encryption Flag (0xFF = unencrypted)
.byte 0xFF
