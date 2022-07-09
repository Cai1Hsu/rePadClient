package org.jivesoftware.smackx.pubsub.provider;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.pubsub.packet.PubSub;
import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/provider/PubSubProvider.class */
public class PubSubProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        PubSub pubSub = new PubSub();
        String namespace = xmlPullParser.getNamespace();
        pubSub.setPubSubNamespace(PubSubNamespace.valueOfFromXmlns(namespace));
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                PacketExtension parsePacketExtension = PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), namespace, xmlPullParser);
                if (parsePacketExtension != null) {
                    pubSub.addExtension(parsePacketExtension);
                }
            } else if (next == 3 && xmlPullParser.getName().equals("pubsub")) {
                z = true;
            }
        }
        return pubSub;
    }
}
