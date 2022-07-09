package org.jivesoftware.smackx.receipts;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/receipts/DeliveryReceiptRequest.class */
public class DeliveryReceiptRequest implements PacketExtension {
    public static final String ELEMENT = "request";

    /* loaded from: classes.jar:org/jivesoftware/smackx/receipts/DeliveryReceiptRequest$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) {
            return new DeliveryReceiptRequest();
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return DeliveryReceipt.NAMESPACE;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return "<request xmlns='urn:xmpp:receipts'/>";
    }
}
