package org.jivesoftware.smackx.workgroup.settings;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/SoundSettings.class */
public class SoundSettings extends IQ {
    public static final String ELEMENT_NAME = "sound-settings";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String incomingSound;
    private String outgoingSound;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/SoundSettings$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            SoundSettings soundSettings = new SoundSettings();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "outgoingSound".equals(xmlPullParser.getName())) {
                    soundSettings.setOutgoingSound(xmlPullParser.nextText());
                } else if (next == 2 && "incomingSound".equals(xmlPullParser.getName())) {
                    soundSettings.setIncomingSound(xmlPullParser.nextText());
                } else if (next == 3 && SoundSettings.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return soundSettings;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=");
        sb.append('\"');
        sb.append("http://jivesoftware.com/protocol/workgroup");
        sb.append('\"');
        sb.append("></").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public byte[] getIncomingSoundBytes() {
        return StringUtils.decodeBase64(this.incomingSound);
    }

    public byte[] getOutgoingSoundBytes() {
        return StringUtils.decodeBase64(this.outgoingSound);
    }

    public void setIncomingSound(String str) {
        this.incomingSound = str;
    }

    public void setOutgoingSound(String str) {
        this.outgoingSound = str;
    }
}
