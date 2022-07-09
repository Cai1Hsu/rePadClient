package org.apache.tools.mail;

import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/mail/ErrorInQuitException.class */
public class ErrorInQuitException extends IOException {
    public ErrorInQuitException(IOException iOException) {
        super(iOException.getMessage());
    }
}
