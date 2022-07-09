package org.jivesoftware.smackx.workgroup.agent;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/UserRequest.class */
public class UserRequest extends OfferContent {
    private static UserRequest instance = new UserRequest();

    public static OfferContent getInstance() {
        return instance;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isInvitation() {
        return false;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isTransfer() {
        return false;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isUserRequest() {
        return true;
    }
}
