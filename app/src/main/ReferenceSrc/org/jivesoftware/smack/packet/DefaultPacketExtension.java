package org.jivesoftware.smack.packet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/DefaultPacketExtension.class */
public class DefaultPacketExtension implements PacketExtension {
    private String elementName;
    private Map<String, String> map;
    private String namespace;

    public DefaultPacketExtension(String str, String str2) {
        this.elementName = str;
        this.namespace = str2;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.elementName;
    }

    public Collection<String> getNames() {
        Set emptySet;
        synchronized (this) {
            emptySet = this.map == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashMap(this.map).keySet());
        }
        return emptySet;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.namespace;
    }

    public String getValue(String str) {
        String str2;
        synchronized (this) {
            str2 = this.map == null ? null : this.map.get(str);
        }
        return str2;
    }

    public void setValue(String str, String str2) {
        synchronized (this) {
            if (this.map == null) {
                this.map = new HashMap();
            }
            this.map.put(str, str2);
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(this.elementName).append(" xmlns=\"").append(this.namespace).append("\">");
        for (String str : getNames()) {
            String value = getValue(str);
            sb.append("<").append(str).append(">");
            sb.append(value);
            sb.append("</").append(str).append(">");
        }
        sb.append("</").append(this.elementName).append(">");
        return sb.toString();
    }
}
