package org.jivesoftware.smackx.workgroup.ext.macros;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/macros/Macro.class */
public class Macro {
    public static final int IMAGE = 2;
    public static final int TEXT = 0;
    public static final int URL = 1;
    private String description;
    private String response;
    private String title;
    private int type;

    public String getDescription() {
        return this.description;
    }

    public String getResponse() {
        return this.response;
    }

    public String getTitle() {
        return this.title;
    }

    public int getType() {
        return this.type;
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setResponse(String str) {
        this.response = str;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public void setType(int i) {
        this.type = i;
    }
}
