package org.jivesoftware.smackx.pubsub;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Subscription.class */
public class Subscription extends NodeExtension {
    protected boolean configRequired;
    protected String id;
    protected String jid;
    protected State state;

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Subscription$State.class */
    public enum State {
        subscribed,
        unconfigured,
        pending,
        none
    }

    public Subscription(String str) {
        this(str, null, null, null);
    }

    public Subscription(String str, String str2) {
        this(str, str2, null, null);
    }

    public Subscription(String str, String str2, String str3, State state) {
        super(PubSubElementType.SUBSCRIPTION, str2);
        this.configRequired = false;
        this.jid = str;
        this.id = str3;
        this.state = state;
    }

    public Subscription(String str, String str2, String str3, State state, boolean z) {
        super(PubSubElementType.SUBSCRIPTION, str2);
        this.configRequired = false;
        this.jid = str;
        this.id = str3;
        this.state = state;
        this.configRequired = z;
    }

    private void appendAttribute(StringBuilder sb, String str, String str2) {
        sb.append(" ");
        sb.append(str);
        sb.append("='");
        sb.append(str2);
        sb.append("'");
    }

    public String getId() {
        return this.id;
    }

    public String getJid() {
        return this.jid;
    }

    public State getState() {
        return this.state;
    }

    public boolean isConfigRequired() {
        return this.configRequired;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<subscription");
        appendAttribute(sb, "jid", this.jid);
        if (getNode() != null) {
            appendAttribute(sb, "node", getNode());
        }
        if (this.id != null) {
            appendAttribute(sb, "subid", this.id);
        }
        if (this.state != null) {
            appendAttribute(sb, "subscription", this.state.toString());
        }
        sb.append("/>");
        return sb.toString();
    }
}
