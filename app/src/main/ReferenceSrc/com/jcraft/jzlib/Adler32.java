package com.jcraft.jzlib;

import org.bson.BSON;

/* loaded from: classes.dex */
final class Adler32 {
    private static final int BASE = 65521;
    private static final int NMAX = 5552;

    Adler32() {
    }

    long adler32(long adler, byte[] buf, int index, int len) {
        int index2;
        int index3;
        int index4;
        int index5;
        int index6;
        int index7;
        int index8;
        int index9;
        int index10;
        int index11;
        int index12;
        int index13;
        int index14;
        int index15;
        int index16;
        int index17;
        if (buf == null) {
            return 1L;
        }
        long s1 = adler & 65535;
        long s2 = (adler >> 16) & 65535;
        while (len > 0) {
            int k = len < NMAX ? len : NMAX;
            len -= k;
            int index18 = index;
            while (k >= 16) {
                long s12 = s1 + (buf[index18] & BSON.MINKEY);
                long s22 = s2 + s12;
                long s13 = s12 + (buf[index3] & BSON.MINKEY);
                long s23 = s22 + s13;
                long s14 = s13 + (buf[index4] & BSON.MINKEY);
                long s24 = s23 + s14;
                long s15 = s14 + (buf[index5] & BSON.MINKEY);
                long s25 = s24 + s15;
                long s16 = s15 + (buf[index6] & BSON.MINKEY);
                long s26 = s25 + s16;
                long s17 = s16 + (buf[index7] & BSON.MINKEY);
                long s27 = s26 + s17;
                long s18 = s17 + (buf[index8] & BSON.MINKEY);
                long s28 = s27 + s18;
                long s19 = s18 + (buf[index9] & BSON.MINKEY);
                long s29 = s28 + s19;
                long s110 = s19 + (buf[index10] & BSON.MINKEY);
                long s210 = s29 + s110;
                long s111 = s110 + (buf[index11] & BSON.MINKEY);
                long s211 = s210 + s111;
                long s112 = s111 + (buf[index12] & BSON.MINKEY);
                long s212 = s211 + s112;
                long s113 = s112 + (buf[index13] & BSON.MINKEY);
                long s213 = s212 + s113;
                long s114 = s113 + (buf[index14] & BSON.MINKEY);
                long s214 = s213 + s114;
                long s115 = s114 + (buf[index15] & BSON.MINKEY);
                long s215 = s214 + s115;
                long s116 = s115 + (buf[index16] & BSON.MINKEY);
                long s216 = s215 + s116;
                index18 = index18 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1;
                s1 = s116 + (buf[index17] & BSON.MINKEY);
                s2 = s216 + s1;
                k -= 16;
            }
            if (k != 0) {
                do {
                    index18++;
                    s1 += buf[index2] & BSON.MINKEY;
                    s2 += s1;
                    k--;
                } while (k != 0);
            }
            index = index18;
            s1 %= 65521;
            s2 %= 65521;
        }
        return (s2 << 16) | s1;
    }
}
