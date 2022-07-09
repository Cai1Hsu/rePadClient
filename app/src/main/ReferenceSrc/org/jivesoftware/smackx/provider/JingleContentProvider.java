package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.packet.JingleContent;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentProvider.class */
public class JingleContentProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        xmlPullParser.getName();
        return new JingleContent(xmlPullParser.getAttributeValue("", JingleContent.CREATOR), xmlPullParser.getAttributeValue("", "name"));
    }
}
