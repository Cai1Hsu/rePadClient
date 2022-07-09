package org.apache.commons.net.telnet;

/* loaded from: classes.jar:org/apache/commons/net/telnet/TerminalTypeOptionHandler.class */
public class TerminalTypeOptionHandler extends TelnetOptionHandler {
    protected static final int TERMINAL_TYPE = 24;
    protected static final int TERMINAL_TYPE_IS = 0;
    protected static final int TERMINAL_TYPE_SEND = 1;
    private final String termType;

    public TerminalTypeOptionHandler(String str) {
        super(24, false, false, false, false);
        this.termType = str;
    }

    public TerminalTypeOptionHandler(String str, boolean z, boolean z2, boolean z3, boolean z4) {
        super(24, z, z2, z3, z4);
        this.termType = str;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] answerSubnegotiation(int[] iArr, int i) {
        int[] iArr2;
        if (iArr != null && i > 1 && this.termType != null && iArr[0] == 24 && iArr[1] == 1) {
            int[] iArr3 = new int[this.termType.length() + 2];
            iArr3[0] = 24;
            iArr3[1] = 0;
            int i2 = 0;
            while (true) {
                iArr2 = iArr3;
                if (i2 >= this.termType.length()) {
                    break;
                }
                iArr3[i2 + 2] = this.termType.charAt(i2);
                i2++;
            }
        } else {
            iArr2 = null;
        }
        return iArr2;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationLocal() {
        return null;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationRemote() {
        return null;
    }
}
