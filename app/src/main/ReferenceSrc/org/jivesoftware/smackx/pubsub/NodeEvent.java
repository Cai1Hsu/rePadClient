package org.jivesoftware.smackx.pubsub;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/NodeEvent.class */
public abstract class NodeEvent {
    private String nodeId;

    protected NodeEvent(String str) {
        this.nodeId = str;
    }

    public String getNodeId() {
        return this.nodeId;
    }
}
