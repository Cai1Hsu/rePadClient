package org.jivesoftware.smack.packet;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/StreamError.class */
public class StreamError {
    private String code;

    public StreamError(String str) {
        this.code = str;
    }

    public String getCode() {
        return this.code;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("stream:error (").append(this.code).append(")");
        return sb.toString();
    }
}
