package org.apache.tools.ant.taskdefs.cvslib;

import java.util.Date;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/CVSEntry.class */
public class CVSEntry {
    private String author;
    private final String comment;
    private Date date;
    private final Vector files = new Vector();

    public CVSEntry(Date date, String str, String str2) {
        this.date = date;
        this.author = str;
        this.comment = str2;
    }

    public void addFile(String str, String str2) {
        this.files.addElement(new RCSFile(str, str2));
    }

    public void addFile(String str, String str2, String str3) {
        this.files.addElement(new RCSFile(str, str2, str3));
    }

    public String getAuthor() {
        return this.author;
    }

    public String getComment() {
        return this.comment;
    }

    public Date getDate() {
        return this.date;
    }

    public Vector getFiles() {
        return this.files;
    }

    public void setAuthor(String str) {
        this.author = str;
    }

    public String toString() {
        return new StringBuffer().append(getAuthor()).append("\n").append(getDate()).append("\n").append(getFiles()).append("\n").append(getComment()).toString();
    }
}
