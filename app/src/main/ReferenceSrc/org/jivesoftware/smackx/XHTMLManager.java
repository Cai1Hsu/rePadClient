package org.jivesoftware.smackx;

import java.util.Iterator;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smackx.packet.XHTMLExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/XHTMLManager.class */
public class XHTMLManager {
    private static final String namespace = "http://jabber.org/protocol/xhtml-im";

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.XHTMLManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                XHTMLManager.setServiceEnabled(connection, true);
            }
        });
    }

    public static void addBody(Message message, String str) {
        XHTMLExtension xHTMLExtension = (XHTMLExtension) message.getExtension("html", namespace);
        XHTMLExtension xHTMLExtension2 = xHTMLExtension;
        if (xHTMLExtension == null) {
            xHTMLExtension2 = new XHTMLExtension();
            message.addExtension(xHTMLExtension2);
        }
        xHTMLExtension2.addBody(str);
    }

    public static Iterator<String> getBodies(Message message) {
        XHTMLExtension xHTMLExtension = (XHTMLExtension) message.getExtension("html", namespace);
        return xHTMLExtension != null ? xHTMLExtension.getBodies() : null;
    }

    public static boolean isServiceEnabled(Connection connection) {
        return ServiceDiscoveryManager.getInstanceFor(connection).includesFeature(namespace);
    }

    public static boolean isServiceEnabled(Connection connection, String str) {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(str).containsFeature(namespace);
        } catch (XMPPException e) {
            e.printStackTrace();
            z = false;
        }
        return z;
    }

    public static boolean isXHTMLMessage(Message message) {
        return message.getExtension("html", namespace) != null;
    }

    public static void setServiceEnabled(Connection connection, boolean z) {
        synchronized (XHTMLManager.class) {
            try {
                if (isServiceEnabled(connection) != z) {
                    if (z) {
                        ServiceDiscoveryManager.getInstanceFor(connection).addFeature(namespace);
                    } else {
                        ServiceDiscoveryManager.getInstanceFor(connection).removeFeature(namespace);
                    }
                }
            } finally {
            }
        }
    }
}
