package org.apache.commons.net.telnet;

/* loaded from: classes.jar:org/apache/commons/net/telnet/EchoOptionHandler.class */
public class EchoOptionHandler extends TelnetOptionHandler {
    public EchoOptionHandler() {
        super(1, false, false, false, false);
    }

    public EchoOptionHandler(boolean z, boolean z2, boolean z3, boolean z4) {
        super(1, z, z2, z3, z4);
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] answerSubnegotiation(int[] iArr, int i) {
        return null;
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
