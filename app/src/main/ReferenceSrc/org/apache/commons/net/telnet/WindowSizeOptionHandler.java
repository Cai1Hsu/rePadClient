package org.apache.commons.net.telnet;

/* loaded from: classes.jar:org/apache/commons/net/telnet/WindowSizeOptionHandler.class */
public class WindowSizeOptionHandler extends TelnetOptionHandler {
    protected static final int WINDOW_SIZE = 31;
    private int m_nHeight;
    private int m_nWidth;

    public WindowSizeOptionHandler(int i, int i2) {
        super(31, false, false, false, false);
        this.m_nWidth = 80;
        this.m_nHeight = 24;
        this.m_nWidth = i;
        this.m_nHeight = i2;
    }

    public WindowSizeOptionHandler(int i, int i2, boolean z, boolean z2, boolean z3, boolean z4) {
        super(31, z, z2, z3, z4);
        this.m_nWidth = 80;
        this.m_nHeight = 24;
        this.m_nWidth = i;
        this.m_nHeight = i2;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] answerSubnegotiation(int[] iArr, int i) {
        return null;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationLocal() {
        int i = this.m_nWidth;
        int i2 = this.m_nHeight;
        int i3 = 5;
        if (this.m_nWidth % 256 == 255) {
            i3 = 5 + 1;
        }
        int i4 = i3;
        if (this.m_nWidth / 256 == 255) {
            i4 = i3 + 1;
        }
        int i5 = i4;
        if (this.m_nHeight % 256 == 255) {
            i5 = i4 + 1;
        }
        int i6 = i5;
        if (this.m_nHeight / 256 == 255) {
            i6 = i5 + 1;
        }
        int[] iArr = new int[i6];
        iArr[0] = 31;
        int i7 = 1;
        int i8 = 24;
        while (i7 < i6) {
            iArr[i7] = (((i * 65536) + i2) & (255 << i8)) >>> i8;
            int i9 = i7;
            if (iArr[i7] == 255) {
                i9 = i7 + 1;
                iArr[i9] = 255;
            }
            i7 = i9 + 1;
            i8 -= 8;
        }
        return iArr;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationRemote() {
        return null;
    }
}
