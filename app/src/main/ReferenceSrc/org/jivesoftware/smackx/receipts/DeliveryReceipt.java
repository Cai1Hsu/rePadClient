package org.jivesoftware.smackx.receipts;

import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.EmbeddedExtensionProvider;

/* loaded from: classes.jar:org/jivesoftware/smackx/receipts/DeliveryReceipt.class */
public class DeliveryReceipt implements PacketExtension {
    public static final String ELEMENT = "received";
    public static final String NAMESPACE = "urn:xmpp:receipts";
    private String id;

    /* loaded from: classes.jar:org/jivesoftware/smackx/receipts/DeliveryReceipt$Provider.class */
    public static class Provider extends EmbeddedExtensionProvider {
        @Override // org.jivesoftware.smack.provider.EmbeddedExtensionProvider
        protected PacketExtension createReturnExtension(String str, String str2, Map<String, String> map, List<? extends PacketExtension> list) {
            return new DeliveryReceipt(map.get("id"));
        }
    }

    public DeliveryReceipt(String str) {
        this.id = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT;
    }

    public String getId() {
        return this.id;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return "<received xmlns='urn:xmpp:receipts' id='" + this.id + "'/>";
    }
}
