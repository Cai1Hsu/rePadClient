package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.packet.JingleContentDescription;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentDescriptionProvider.class */
public abstract class JingleContentDescriptionProvider implements PacketExtensionProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentDescriptionProvider$Audio.class */
    public static class Audio extends JingleContentDescriptionProvider {
        @Override // org.jivesoftware.smackx.provider.JingleContentDescriptionProvider
        protected JingleContentDescription getInstance() {
            return new JingleContentDescription.Audio();
        }

        @Override // org.jivesoftware.smackx.provider.JingleContentDescriptionProvider
        public JingleContentDescription.JinglePayloadType parsePayload(XmlPullParser xmlPullParser) throws Exception {
            int i;
            PayloadType.Audio audio = new PayloadType.Audio(super.parsePayload(xmlPullParser).getPayloadType());
            try {
                i = Integer.parseInt(xmlPullParser.getAttributeValue("", "clockrate"));
            } catch (Exception e) {
                i = 0;
            }
            audio.setClockRate(i);
            return new JingleContentDescription.JinglePayloadType.Audio(audio);
        }
    }

    protected abstract JingleContentDescription getInstance();

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        JingleContentDescription jingleContentDescriptionProvider = getInstance();
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            if (next == 2) {
                if (!name.equals("payload-type")) {
                    throw new Exception("Unknow element \"" + name + "\" in content.");
                }
                jingleContentDescriptionProvider.addJinglePayloadType(parsePayload(xmlPullParser));
            } else if (next == 3 && name.equals("description")) {
                z = true;
            }
        }
        return jingleContentDescriptionProvider;
    }

    protected JingleContentDescription.JinglePayloadType parsePayload(XmlPullParser xmlPullParser) throws Exception {
        int i;
        int i2 = 0;
        try {
            i = Integer.parseInt(xmlPullParser.getAttributeValue("", "id"));
        } catch (Exception e) {
            i = 0;
        }
        String attributeValue = xmlPullParser.getAttributeValue("", "name");
        try {
            i2 = Integer.parseInt(xmlPullParser.getAttributeValue("", "channels"));
        } catch (Exception e2) {
        }
        return new JingleContentDescription.JinglePayloadType(new PayloadType(i, attributeValue, i2));
    }
}
