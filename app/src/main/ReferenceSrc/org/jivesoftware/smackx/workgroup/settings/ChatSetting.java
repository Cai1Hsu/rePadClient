package org.jivesoftware.smackx.workgroup.settings;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/ChatSetting.class */
public class ChatSetting {
    private String key;
    private int type;
    private String value;

    public ChatSetting(String str, String str2, int i) {
        setKey(str);
        setValue(str2);
        setType(i);
    }

    public String getKey() {
        return this.key;
    }

    public int getType() {
        return this.type;
    }

    public String getValue() {
        return this.value;
    }

    public void setKey(String str) {
        this.key = str;
    }

    public void setType(int i) {
        this.type = i;
    }

    public void setValue(String str) {
        this.value = str;
    }
}
