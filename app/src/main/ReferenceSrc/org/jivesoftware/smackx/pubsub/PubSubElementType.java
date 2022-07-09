package org.jivesoftware.smackx.pubsub;

import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/PubSubElementType.class */
public enum PubSubElementType {
    CREATE("create", PubSubNamespace.BASIC),
    DELETE(HotDeploymentTool.ACTION_DELETE, PubSubNamespace.OWNER),
    DELETE_EVENT(HotDeploymentTool.ACTION_DELETE, PubSubNamespace.EVENT),
    CONFIGURE("configure", PubSubNamespace.BASIC),
    CONFIGURE_OWNER("configure", PubSubNamespace.OWNER),
    CONFIGURATION("configuration", PubSubNamespace.EVENT),
    OPTIONS("options", PubSubNamespace.BASIC),
    DEFAULT("default", PubSubNamespace.OWNER),
    ITEMS("items", PubSubNamespace.BASIC),
    ITEMS_EVENT("items", PubSubNamespace.EVENT),
    ITEM("item", PubSubNamespace.BASIC),
    ITEM_EVENT("item", PubSubNamespace.EVENT),
    PUBLISH("publish", PubSubNamespace.BASIC),
    PUBLISH_OPTIONS("publish-options", PubSubNamespace.BASIC),
    PURGE_OWNER("purge", PubSubNamespace.OWNER),
    PURGE_EVENT("purge", PubSubNamespace.EVENT),
    RETRACT("retract", PubSubNamespace.BASIC),
    AFFILIATIONS("affiliations", PubSubNamespace.BASIC),
    SUBSCRIBE("subscribe", PubSubNamespace.BASIC),
    SUBSCRIPTION("subscription", PubSubNamespace.BASIC),
    SUBSCRIPTIONS("subscriptions", PubSubNamespace.BASIC),
    UNSUBSCRIBE("unsubscribe", PubSubNamespace.BASIC);
    
    private String eName;
    private PubSubNamespace nSpace;

    PubSubElementType(String str, PubSubNamespace pubSubNamespace) {
        this.eName = str;
        this.nSpace = pubSubNamespace;
    }

    public static PubSubElementType valueOfFromElemName(String str, String str2) {
        int lastIndexOf = str2.lastIndexOf(35);
        String substring = lastIndexOf == -1 ? null : str2.substring(lastIndexOf + 1);
        return substring != null ? valueOf((str + '_' + substring).toUpperCase()) : valueOf(str.toUpperCase().replace('-', '_'));
    }

    public String getElementName() {
        return this.eName;
    }

    public PubSubNamespace getNamespace() {
        return this.nSpace;
    }
}
