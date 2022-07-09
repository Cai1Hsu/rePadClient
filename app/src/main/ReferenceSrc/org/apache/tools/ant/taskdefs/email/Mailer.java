package org.apache.tools.ant.taskdefs.email;

import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.DateUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/Mailer.class */
public abstract class Mailer {
    protected EmailAddress from;
    protected Message message;
    protected Task task;
    protected String host = null;
    protected int port = -1;
    protected String user = null;
    protected String password = null;
    protected boolean SSL = false;
    protected Vector replyToList = null;
    protected Vector toList = null;
    protected Vector ccList = null;
    protected Vector bccList = null;
    protected Vector files = null;
    protected String subject = null;
    protected boolean includeFileNames = false;
    protected Vector headers = null;
    private boolean ignoreInvalidRecipients = false;
    private boolean starttls = false;
    private boolean portExplicitlySpecified = false;

    protected final String getDate() {
        return DateUtils.getDateForHeader();
    }

    protected boolean isPortExplicitlySpecified() {
        return this.portExplicitlySpecified;
    }

    protected boolean isStartTLSEnabled() {
        return this.starttls;
    }

    public abstract void send() throws BuildException;

    public void setBccList(Vector vector) {
        this.bccList = vector;
    }

    public void setCcList(Vector vector) {
        this.ccList = vector;
    }

    public void setEnableStartTLS(boolean z) {
        this.starttls = z;
    }

    public void setFiles(Vector vector) {
        this.files = vector;
    }

    public void setFrom(EmailAddress emailAddress) {
        this.from = emailAddress;
    }

    public void setHeaders(Vector vector) {
        this.headers = vector;
    }

    public void setHost(String str) {
        this.host = str;
    }

    public void setIgnoreInvalidRecipients(boolean z) {
        this.ignoreInvalidRecipients = z;
    }

    public void setIncludeFileNames(boolean z) {
        this.includeFileNames = z;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setPortExplicitlySpecified(boolean z) {
        this.portExplicitlySpecified = z;
    }

    public void setReplyToList(Vector vector) {
        this.replyToList = vector;
    }

    public void setSSL(boolean z) {
        this.SSL = z;
    }

    public void setSubject(String str) {
        this.subject = str;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public void setToList(Vector vector) {
        this.toList = vector;
    }

    public void setUser(String str) {
        this.user = str;
    }

    protected boolean shouldIgnoreInvalidRecipients() {
        return this.ignoreInvalidRecipients;
    }
}
