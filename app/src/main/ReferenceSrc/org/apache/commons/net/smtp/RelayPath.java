package org.apache.commons.net.smtp;

import java.util.Enumeration;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/commons/net/smtp/RelayPath.class */
public final class RelayPath {
    String _emailAddress;
    Vector<String> _path = new Vector<>();

    public RelayPath(String str) {
        this._emailAddress = str;
    }

    public void addRelay(String str) {
        this._path.addElement(str);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append('<');
        Enumeration<String> elements = this._path.elements();
        if (elements.hasMoreElements()) {
            sb.append('@');
            sb.append(elements.nextElement());
            while (elements.hasMoreElements()) {
                sb.append(",@");
                sb.append(elements.nextElement());
            }
            sb.append(':');
        }
        sb.append(this._emailAddress);
        sb.append('>');
        return sb.toString();
    }
}
