package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUNTransportManager.class */
public class STUNTransportManager extends JingleTransportManager {
    STUNResolver stunResolver;

    public STUNTransportManager() {
        this.stunResolver = null;
        this.stunResolver = new STUNResolver() { // from class: org.jivesoftware.smackx.jingle.nat.STUNTransportManager.1
        };
        try {
            this.stunResolver.initializeAndWait();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }

    @Override // org.jivesoftware.smackx.jingle.nat.JingleTransportManager
    protected TransportResolver createResolver(JingleSession jingleSession) {
        try {
            this.stunResolver.resolve(jingleSession);
        } catch (XMPPException e) {
            e.printStackTrace();
        }
        return this.stunResolver;
    }
}
