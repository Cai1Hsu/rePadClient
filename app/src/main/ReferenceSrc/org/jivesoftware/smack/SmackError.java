package org.jivesoftware.smack;

/* loaded from: classes.jar:org/jivesoftware/smack/SmackError.class */
public enum SmackError {
    NO_RESPONSE_FROM_SERVER("No response from server.");
    
    private String message;

    SmackError(String str) {
        this.message = str;
    }

    public static SmackError getErrorCode(String str) {
        SmackError smackError;
        SmackError[] values = values();
        int length = values.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                smackError = null;
                break;
            }
            SmackError smackError2 = values[i];
            if (smackError2.message.equals(str)) {
                smackError = smackError2;
                break;
            }
            i++;
        }
        return smackError;
    }

    public String getErrorMessage() {
        return this.message;
    }
}
