package org.jivesoftware.smackx.packet;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DefaultPrivateData.class */
public class DefaultPrivateData implements PrivateData {
    private String elementName;
    private Map<String, String> map;
    private String namespace;

    public DefaultPrivateData(String str, String str2) {
        this.elementName = str;
        this.namespace = str2;
    }

    @Override // org.jivesoftware.smackx.packet.PrivateData
    public String getElementName() {
        return this.elementName;
    }

    public Iterator<String> getNames() {
        Iterator<String> it;
        synchronized (this) {
            it = this.map == null ? Collections.emptyList().iterator() : Collections.unmodifiableSet(this.map.keySet()).iterator();
        }
        return it;
    }

    @Override // org.jivesoftware.smackx.packet.PrivateData
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

    @Override // org.jivesoftware.smackx.packet.PrivateData
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(this.elementName).append(" xmlns=\"").append(this.namespace).append("\">");
        Iterator<String> names = getNames();
        while (names.hasNext()) {
            String next = names.next();
            String value = getValue(next);
            sb.append("<").append(next).append(">");
            sb.append(value);
            sb.append("</").append(next).append(">");
        }
        sb.append("</").append(this.elementName).append(">");
        return sb.toString();
    }
}
