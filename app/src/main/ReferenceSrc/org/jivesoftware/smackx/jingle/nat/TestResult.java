package org.jivesoftware.smackx.jingle.nat;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TestResult.class */
public class TestResult {
    private boolean result = false;
    private String ip = null;
    private int port = 0;

    public String getIp() {
        return this.ip;
    }

    public int getPort() {
        return this.port;
    }

    public boolean isReachable() {
        return this.result;
    }

    public void setIp(String str) {
        this.ip = str;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setResult(boolean z) {
        this.result = z;
    }
}
