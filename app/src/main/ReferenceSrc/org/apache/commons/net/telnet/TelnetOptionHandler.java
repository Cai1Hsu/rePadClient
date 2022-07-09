package org.apache.commons.net.telnet;

/* loaded from: classes.jar:org/apache/commons/net/telnet/TelnetOptionHandler.class */
public abstract class TelnetOptionHandler {
    private boolean acceptLocal;
    private boolean acceptRemote;
    private boolean initialLocal;
    private boolean initialRemote;
    private int optionCode;
    private boolean doFlag = false;
    private boolean willFlag = false;

    public TelnetOptionHandler(int i, boolean z, boolean z2, boolean z3, boolean z4) {
        this.optionCode = -1;
        this.initialLocal = false;
        this.initialRemote = false;
        this.acceptLocal = false;
        this.acceptRemote = false;
        this.optionCode = i;
        this.initialLocal = z;
        this.initialRemote = z2;
        this.acceptLocal = z3;
        this.acceptRemote = z4;
    }

    public abstract int[] answerSubnegotiation(int[] iArr, int i);

    public boolean getAcceptLocal() {
        return this.acceptLocal;
    }

    public boolean getAcceptRemote() {
        return this.acceptRemote;
    }

    boolean getDo() {
        return this.doFlag;
    }

    public boolean getInitLocal() {
        return this.initialLocal;
    }

    public boolean getInitRemote() {
        return this.initialRemote;
    }

    public int getOptionCode() {
        return this.optionCode;
    }

    boolean getWill() {
        return this.willFlag;
    }

    public void setAcceptLocal(boolean z) {
        this.acceptLocal = z;
    }

    public void setAcceptRemote(boolean z) {
        this.acceptRemote = z;
    }

    void setDo(boolean z) {
        this.doFlag = z;
    }

    public void setInitLocal(boolean z) {
        this.initialLocal = z;
    }

    public void setInitRemote(boolean z) {
        this.initialRemote = z;
    }

    void setWill(boolean z) {
        this.willFlag = z;
    }

    public abstract int[] startSubnegotiationLocal();

    public abstract int[] startSubnegotiationRemote();
}
