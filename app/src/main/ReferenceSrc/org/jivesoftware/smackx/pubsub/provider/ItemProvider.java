package org.jivesoftware.smackx.pubsub.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.pubsub.Item;
import org.jivesoftware.smackx.pubsub.NodeExtension;
import org.jivesoftware.smackx.pubsub.PayloadItem;
import org.jivesoftware.smackx.pubsub.SimplePayload;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/provider/ItemProvider.class */
public class ItemProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        NodeExtension payloadItem;
        boolean z;
        boolean z2;
        String attributeValue = xmlPullParser.getAttributeValue(null, "id");
        String attributeValue2 = xmlPullParser.getAttributeValue(null, "node");
        String name = xmlPullParser.getName();
        int next = xmlPullParser.next();
        if (next == 3) {
            payloadItem = new Item(attributeValue, attributeValue2);
        } else {
            String name2 = xmlPullParser.getName();
            String namespace = xmlPullParser.getNamespace();
            if (ProviderManager.getInstance().getExtensionProvider(name2, namespace) == null) {
                boolean z3 = false;
                boolean z4 = false;
                StringBuilder sb = new StringBuilder();
                while (!z3) {
                    if (next == 3 && xmlPullParser.getName().equals(name)) {
                        z = true;
                        z2 = z4;
                    } else if (xmlPullParser.getEventType() == 2) {
                        sb.append("<").append(xmlPullParser.getName());
                        if (xmlPullParser.getName().equals(name2) && namespace.length() > 0) {
                            sb.append(" xmlns=\"").append(namespace).append("\"");
                        }
                        int attributeCount = xmlPullParser.getAttributeCount();
                        for (int i = 0; i < attributeCount; i++) {
                            sb.append(" ").append(xmlPullParser.getAttributeName(i)).append("=\"").append(xmlPullParser.getAttributeValue(i)).append("\"");
                        }
                        if (xmlPullParser.isEmptyElementTag()) {
                            sb.append("/>");
                            z2 = true;
                            z = z3;
                        } else {
                            sb.append(">");
                            z = z3;
                            z2 = z4;
                        }
                    } else if (xmlPullParser.getEventType() != 3) {
                        z = z3;
                        z2 = z4;
                        if (xmlPullParser.getEventType() == 4) {
                            sb.append(xmlPullParser.getText());
                            z = z3;
                            z2 = z4;
                        }
                    } else if (z4) {
                        z2 = false;
                        z = z3;
                    } else {
                        sb.append("</").append(xmlPullParser.getName()).append(">");
                        z = z3;
                        z2 = z4;
                    }
                    z3 = z;
                    z4 = z2;
                    next = xmlPullParser.next();
                }
                payloadItem = new PayloadItem(attributeValue, attributeValue2, new SimplePayload(name2, namespace, sb.toString()));
            } else {
                payloadItem = new PayloadItem(attributeValue, attributeValue2, PacketParserUtils.parsePacketExtension(name2, namespace, xmlPullParser));
            }
        }
        return payloadItem;
    }
}
