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

    . = 0x0C20CAE0;
    __sbss = .;
    .sbss :
    {
	/* TODO: include .sbss sections here */
	. += 0x580F0;
    }
    __sbss_size = . - __sbss;

    __ebss = .;
    .ebss :
    {
	/* TODO: include .ebss sections here */
    }
    
    . = 0xC31F000;
    FILES :
    {
	. = 0x0500000; files/stage/STAGE01_10.lz.o(.data);
	. = 0x0600000; files/stage/STAGE11_20.lz.o(.data);
	. = 0x0700000; files/stage/STAGE21_30.lz.o(.data);
	. = 0x0800000; files/stage/STAGE31_40.lz.o(.data);
	. = 0x0900000; files/stage/STAGE41_50.lz.o(.data);
	. = 0x0A00000; files/stage/STAGE51_60.lz.o(.data);
	. = 0x0B00000; files/stage/STAGE61_70.lz.o(.data);
	. = 0x0C00000; files/stage/STAGE71_80.lz.o(.data);
	. = 0x0D00000; files/stage/STAGE81_90.lz.o(.data);
	. = 0x0E00000; files/stage/STAGE91_100.lz.o(.data);
	. = 0x0F00000; files/stage/STAGE101_110.lz.o(.data);
	. = 0x1000000; files/stage/STAGE111_120.lz.o(.data);
	. = 0x1100000; files/stage/STAGE121_130.lz.o(.data);
	. = 0x2420000; files/snd/stream/lim2.spsd.o(.data);
	. = 0x2520000; files/snd/stream/stf.spsd.o(.data);
	. = 0x2600000; files/snd/stream/lim1.spsd.o(.data);
	. = 0x2620000; files/snd/stream/adv1.spsd.o(.data);
	. = 0x2640000; files/snd/stream/adv2.spsd.o(.data);
	. = 0x27A0000; files/snd/stream/ent1.spsd.o(.data);
	. = 0x27C0000; files/snd/stream/st1a1.spsd.o(.data);
	. = 0x27E0000; files/snd/stream/st2a2.spsd.o(.data);
	. = 0x2A60000; files/snd/stream/st3b2.spsd.o(.data);
	. = 0x2D00000; files/common/chara_p.lz.o(.data);
	. = 0x3D00000; files/common/common_p.lz.o(.data);
	. = 0x4100000; files/bg/bg_a_p.lz.o(.data);
	. = 0x4160000; files/bg/bg_b_p.lz.o(.data);
	. = 0x41C0000; files/bg/bg_c_p.lz.o(.data);
	. = 0x4220000; files/bg/bg_d_p.lz.o(.data);
	. = 0x4280000; files/bg/bg_e_p.lz.o(.data);
	. = 0x42E0000; files/bg/bg_f_p.lz.o(.data);
	. = 0x4340000; files/bg/bg_g_p.lz.o(.data);
	. = 0x43A0000; files/bg/bg_h_p.lz.o(.data);
	. = 0x4400000; files/bg/bg_i_p.lz.o(.data);
	. = 0x4460000; files/bg/bg_j_p.lz.o(.data);
	. = 0x4500000; files/stage/st01_10_p.lz.o(.data);
	. = 0x4680000; files/stage/st11_20_p.lz.o(.data);
	. = 0x4800000; files/stage/st21_30_p.lz.o(.data);
	. = 0x4980000; files/stage/st31_40_p.lz.o(.data);
	. = 0x4B00000; files/stage/st41_50_p.lz.o(.data);
	. = 0x4C80000; files/stage/st51_60_p.lz.o(.data);
	. = 0x4E00000; files/stage/st61_70_p.lz.o(.data);
	. = 0x4F80000; files/stage/st71_80_p.lz.o(.data);
	. = 0x5100000; files/stage/st81_90_p.lz.o(.data);
	. = 0x5280000; files/stage/st91_100_p.lz.o(.data);
	. = 0x5400000; files/stage/st101_110_p.lz.o(.data);
	. = 0x5580000; files/stage/st111_120_p.lz.o(.data);
	. = 0x5700000; files/stage/st121_130_p.lz.o(.data);
	. = 0x5900000; files/common/common.lz.o(.data);
	. = 0x5C00000; files/common/chara.lz.o(.data);
	. = 0x5D00000; files/bg/bg_a.lz.o(.data);
	. = 0x5E00000; files/bg/bg_b.lz.o(.data);
	. = 0x5F00000; files/bg/bg_c.lz.o(.data);
	. = 0x6000000; files/bg/bg_d.lz.o(.data);
	. = 0x6100000; files/bg/bg_e.lz.o(.data);
	. = 0x6200000; files/bg/bg_f.lz.o(.data);
	. = 0x6300000; files/bg/bg_g.lz.o(.data);
	. = 0x6400000; files/bg/bg_h.lz.o(.data);
	. = 0x6500000; files/bg/bg_i.lz.o(.data);
	. = 0x6600000; files/bg/bg_j.lz.o(.data);
	. = 0x6700000; files/stage/st01_10.lz.o(.data);
	. = 0x6800000; files/stage/st11_20.lz.o(.data);
	. = 0x6900000; files/stage/st21_30.lz.o(.data);
	. = 0x6A00000; files/stage/st31_40.lz.o(.data);
	. = 0x6B00000; files/stage/st41_50.lz.o(.data);
	. = 0x6C00000; files/stage/st51_60.lz.o(.data);
	. = 0x7700000; files/stage/st61_70.lz.o(.data);
	. = 0x7800000; files/stage/st71_80.lz.o(.data);
	. = 0x7900000; files/stage/st81_90.lz.o(.data);
	. = 0x7A00000; files/stage/st91_100.lz.o(.data);
	. = 0x7B00000; files/stage/st101_110.lz.o(.data);
	. = 0x7C00000; files/stage/st111_120.lz.o(.data);
	. = 0x7D00000; files/stage/st121_130.lz.o(.data);
	. = 0x7E00000; files/snd/stream/st1a2.spsd.o(.data);
	. = 0x8160000; files/snd/stream/st1b1.spsd.o(.data);
	. = 0x8180000; files/snd/stream/st2a1.spsd.o(.data);
	. = 0x81A0000; files/snd/stream/st3b1.spsd.o(.data);
	. = 0x81E0000; files/snd/stream/st4a1.spsd.o(.data);
	. = 0x8200000; files/snd/stream/st4b1.spsd.o(.data);
	. = 0x8220000; files/snd/stream/st4b2.spsd.o(.data);
	/* TODO: identify these unknown files */
	. = 0x8500000; files/unknown1.bin.o(.data);
	. = 0x8600000; files/unknown2.bin.o(.data);
	. = 0x8700000; files/unknown3.bin.o(.data);
	. = 0x8800000; files/unknown4.bin.o(.data);
	. = 0x8900000; files/unknown5.bin.o(.data);
	. = 0x8A80000; files/snd/stream/st1b2.spsd.o(.data);
	. = 0x8E20000; files/snd/stream/st5a1.spsd.o(.data);
	. = 0x8E40000; files/snd/stream/st5a2.spsd.o(.data);
	. = 0x91A0000; files/snd/stream/st5b2.spsd.o(.data);
	/* TODO: What is this? */
	. = 0x9500000; files/motdat.bin.o(.data);
	. = 0x9680000; files/motinfo.bin.o(.data);
	. = 0x9700000; files/motlabel.bin.o(.data);
	. = 0x9740000; files/motskl.bin.o(.data);
	. = 0x9760000; files/snd/stream/st5b1.spsd.o(.data);
	. = 0x97A0000; files/snd/stream/st4a2.spsd.o(.data);
	. = 0x99C0000; files/snd/stream/ent2.spsd.o(.data);
	. = 0x9C00000; asm/files.o(.rodata2);
	. = 0x9C40000; files/snd/stream/st3a2.spsd.o(.data);
	. = 0x9FE0000; files/snd/stream/st3a1.spsd.o(.data);
	. = 0xA000000; files/snd/stream/st2b2.spsd.o(.data);
	. = 0xA2A0000; files/snd/stream/st2b1.spsd.o(.data);
	. = 0xA2C0000; files/snd/se/se4.dtpk.o(.data);
	. = 0xA300000; files/snd/se/se.dtpk.o(.data);
	. = 0xA600000; files/snd/se/se2.dtpk.o(.data);
	. = 0xA840000; files/snd/se/se3.dtpk.o(.data);
	. = 0xA940000; files/snd/se/nar.dtpk.o(.data);
	. = 0xAA40000; files/snd/se/ape.dtpk.o(.data);
	. = 0xAB20000; files/snd/se/gal.dtpk.o(.data);
	. = 0xAC00000; files/snd/se/kid.dtpk.o(.data);
	. = 0xACE0000; files/snd/driver.bin.o(.data);
	
    }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}

__stack_begin = 0x0CC00000;
main = 0x0C0200E0;
_testModeFlag = 0x0C0CAEF4;
