package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/JingleTransportManager.class */
public abstract class JingleTransportManager {
    protected abstract TransportResolver createResolver(JingleSession jingleSession);

    public TransportResolver getResolver(JingleSession jingleSession) throws XMPPException {
        TransportResolver createResolver = createResolver(jingleSession);
        BasicResolver basicResolver = createResolver;
        if (createResolver == null) {
            basicResolver = new BasicResolver();
        }
        basicResolver.initializeAndWait();
        return basicResolver;
    }
}
