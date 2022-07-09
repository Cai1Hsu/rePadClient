package org.jivesoftware.smackx.pubsub.packet;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/packet/PubSubNamespace.class */
public enum PubSubNamespace {
    BASIC(null),
    ERROR("errors"),
    EVENT("event"),
    OWNER("owner");
    
    private String fragment;

    PubSubNamespace(String str) {
        this.fragment = str;
    }

    public static PubSubNamespace valueOfFromXmlns(String str) {
        return str.lastIndexOf(35) != -1 ? valueOf(str.substring(str.lastIndexOf(35) + 1).toUpperCase()) : BASIC;
    }

    public String getFragment() {
        return this.fragment;
    }

    public String getXmlns() {
        String str = "http://jabber.org/protocol/pubsub";
        if (this.fragment != null) {
            str = "http://jabber.org/protocol/pubsub#" + this.fragment;
        }
        return str;
    }
}
