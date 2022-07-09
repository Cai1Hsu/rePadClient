package org.jivesoftware.smackx.jingle;

import android.support.v4.os.EnvironmentCompat;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleActionEnum.class */
public enum JingleActionEnum {
    UNKNOWN(EnvironmentCompat.MEDIA_UNKNOWN),
    CONTENT_ACCEPT("content-accept"),
    CONTENT_ADD("content-add"),
    CONTENT_MODIFY("content-modify"),
    CONTENT_REMOVE("content-remove"),
    SESSION_ACCEPT("session-accept"),
    SESSION_INFO("session-info"),
    SESSION_INITIATE("session-initiate"),
    SESSION_TERMINATE("session-terminate"),
    TRANSPORT_INFO("transport-info");
    
    private String actionCode;

    JingleActionEnum(String str) {
        this.actionCode = str;
    }

    public static JingleActionEnum getAction(String str) {
        JingleActionEnum jingleActionEnum;
        JingleActionEnum[] values = values();
        int length = values.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                jingleActionEnum = null;
                break;
            }
            JingleActionEnum jingleActionEnum2 = values[i];
            if (jingleActionEnum2.actionCode.equals(str)) {
                jingleActionEnum = jingleActionEnum2;
                break;
            }
            i++;
        }
        return jingleActionEnum;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.actionCode;
    }
}
