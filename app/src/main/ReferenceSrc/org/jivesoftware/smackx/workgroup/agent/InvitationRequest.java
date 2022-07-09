package org.jivesoftware.smackx.workgroup.agent;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/InvitationRequest.class */
public class InvitationRequest extends OfferContent {
    private String inviter;
    private String reason;
    private String room;

    public InvitationRequest(String str, String str2, String str3) {
        this.inviter = str;
        this.room = str2;
        this.reason = str3;
    }

    public String getInviter() {
        return this.inviter;
    }

    public String getReason() {
        return this.reason;
    }

    public String getRoom() {
        return this.room;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isInvitation() {
        return true;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isTransfer() {
        return false;
    }

    @Override // org.jivesoftware.smackx.workgroup.agent.OfferContent
    boolean isUserRequest() {
        return false;
    }
}
