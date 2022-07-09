package org.jivesoftware.smackx.pubsub.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.pubsub.Subscription;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/provider/SubscriptionProvider.class */
public class SubscriptionProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        String attributeValue = xmlPullParser.getAttributeValue(null, "jid");
        String attributeValue2 = xmlPullParser.getAttributeValue(null, "node");
        String attributeValue3 = xmlPullParser.getAttributeValue(null, "subid");
        String attributeValue4 = xmlPullParser.getAttributeValue(null, "subscription");
        boolean z = false;
        if (xmlPullParser.next() == 2) {
            z = false;
            if (xmlPullParser.getName().equals("subscribe-options")) {
                boolean z2 = false;
                if (xmlPullParser.next() == 2) {
                    z2 = false;
                    if (xmlPullParser.getName().equals("required")) {
                        z2 = true;
                    }
                }
                while (true) {
                    z = z2;
                    if (xmlPullParser.next() != 3) {
                        if (xmlPullParser.getName() == "subscribe-options") {
                            z = z2;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
        }
        while (xmlPullParser.getEventType() != 3) {
            xmlPullParser.next();
        }
        return new Subscription(attributeValue, attributeValue2, attributeValue3, attributeValue4 == null ? null : Subscription.State.valueOf(attributeValue4), z);
    }
}
