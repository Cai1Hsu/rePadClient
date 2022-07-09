package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/ExitException.class */
public class ExitException extends SecurityException {
    private static final long serialVersionUID = 2772487854280543363L;
    private int status;

    public ExitException(int i) {
        super(new StringBuffer().append("ExitException: status ").append(i).toString());
        this.status = i;
    }

    public ExitException(String str, int i) {
        super(str);
        this.status = i;
    }

    public int getStatus() {
        return this.status;
    }
}
