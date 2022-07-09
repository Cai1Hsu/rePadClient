package org.jivesoftware.smack.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/provider/PacketExtensionProvider.class */
public interface PacketExtensionProvider {
    PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception;
}
