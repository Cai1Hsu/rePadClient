package org.jivesoftware.smack.packet;

import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Registration.class */
public class Registration extends IQ {
    private String instructions = null;
    private Map<String, String> attributes = null;

    public Map<String, String> getAttributes() {
        return this.attributes;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:register\">");
        if (this.instructions != null) {
            sb.append("<instructions>").append(this.instructions).append("</instructions>");
        }
        if (this.attributes != null && this.attributes.size() > 0) {
            for (String str : this.attributes.keySet()) {
                String str2 = this.attributes.get(str);
                sb.append("<").append(str).append(">");
                sb.append(str2);
                sb.append("</").append(str).append(">");
            }
        }
        sb.append(getExtensionsXML());
        sb.append("</query>");
        return sb.toString();
    }

    public String getInstructions() {
        return this.instructions;
    }

    public void setAttributes(Map<String, String> map) {
        this.attributes = map;
    }

    public void setInstructions(String str) {
        this.instructions = str;
    }
}
