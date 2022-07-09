package org.jivesoftware.smackx.workgroup.agent;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/OfferListener.class */
public interface OfferListener {
    void offerReceived(Offer offer);

    void offerRevoked(RevokedOffer revokedOffer);
}
