package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smackx.jingle.JingleSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/BasicTransportManager.class */
public class BasicTransportManager extends JingleTransportManager {
    @Override // org.jivesoftware.smackx.jingle.nat.JingleTransportManager
    protected TransportResolver createResolver(JingleSession jingleSession) {
        return new BasicResolver();
    }
}
