package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.packet.JingleDescription;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleDescriptionProvider.class */
public abstract class JingleDescriptionProvider implements PacketExtensionProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleDescriptionProvider$Audio.class */
    public static class Audio extends JingleDescriptionProvider {
        @Override // org.jivesoftware.smackx.provider.JingleDescriptionProvider
        protected JingleDescription getInstance() {
            return new JingleDescription.Audio();
        }

        @Override // org.jivesoftware.smackx.provider.JingleDescriptionProvider
        public PayloadType parsePayload(XmlPullParser xmlPullParser) throws Exception {
            int i;
            PayloadType.Audio audio = new PayloadType.Audio(super.parsePayload(xmlPullParser));
            try {
                i = Integer.parseInt(xmlPullParser.getAttributeValue("", "clockrate"));
            } catch (Exception e) {
                i = 0;
            }
            audio.setClockRate(i);
            return audio;
        }
    }

    protected abstract JingleDescription getInstance();

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        JingleDescription jingleDescriptionProvider = getInstance();
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            if (next == 2) {
                if (!name.equals("payload-type")) {
                    throw new Exception("Unknow element \"" + name + "\" in content.");
                }
                jingleDescriptionProvider.addPayloadType(parsePayload(xmlPullParser));
            } else if (next == 3 && name.equals("description")) {
                z = true;
            }
        }
        return jingleDescriptionProvider;
    }

    protected PayloadType parsePayload(XmlPullParser xmlPullParser) throws Exception {
        int i = 0;
        int i2 = 0;
        try {
            i = Integer.parseInt(xmlPullParser.getAttributeValue("", "id"));
        } catch (Exception e) {
        }
        String attributeValue = xmlPullParser.getAttributeValue("", "name");
        try {
            i2 = Integer.parseInt(xmlPullParser.getAttributeValue("", "channels"));
        } catch (Exception e2) {
        }
        return new PayloadType(i, attributeValue, i2);
    }
}
