package org.jivesoftware.smackx.commands;

/* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommandNote.class */
public class AdHocCommandNote {
    private Type type;
    private String value;

    /* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommandNote$Type.class */
    public enum Type {
        info,
        warn,
        error
    }

    public AdHocCommandNote(Type type, String str) {
        this.type = type;
        this.value = str;
    }

    public Type getType() {
        return this.type;
    }

    public String getValue() {
        return this.value;
    }
}
