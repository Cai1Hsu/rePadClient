package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/FixedResolver.class */
public class FixedResolver extends TransportResolver {
    TransportCandidate fixedCandidate;

    public FixedResolver(String str, int i) {
        setFixedCandidate(str, i);
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void cancel() throws XMPPException {
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void initialize() throws XMPPException {
        setInitialized();
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void resolve(JingleSession jingleSession) throws XMPPException {
        synchronized (this) {
            if (!isResolving()) {
                setResolveInit();
                clearCandidates();
                if (this.fixedCandidate.getLocalIp() == null) {
                    this.fixedCandidate.setLocalIp(this.fixedCandidate.getIp());
                }
                if (this.fixedCandidate != null) {
                    addCandidate(this.fixedCandidate);
                }
                setResolveEnd();
            }
        }
    }

    public void setFixedCandidate(String str, int i) {
        this.fixedCandidate = new TransportCandidate.Fixed(str, i);
    }
}
