package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/FormNodeType.class */
public enum FormNodeType {
    CONFIGURE_OWNER,
    CONFIGURE,
    OPTIONS,
    DEFAULT;

    public static FormNodeType valueOfFromElementName(String str, String str2) {
        return (!"configure".equals(str) || !PubSubNamespace.OWNER.getXmlns().equals(str2)) ? valueOf(str.toUpperCase()) : CONFIGURE_OWNER;
    }

    public PubSubElementType getNodeElement() {
        return PubSubElementType.valueOf(toString());
    }
}
