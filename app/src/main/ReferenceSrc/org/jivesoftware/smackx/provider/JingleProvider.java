package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.jingle.ContentNegotiator;
import org.jivesoftware.smackx.jingle.JingleActionEnum;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.packet.JingleContentInfo;
import org.jivesoftware.smackx.packet.JingleDescription;
import org.jivesoftware.smackx.packet.JingleTransport;
import org.jivesoftware.smackx.provider.JingleContentInfoProvider;
import org.jivesoftware.smackx.provider.JingleDescriptionProvider;
import org.jivesoftware.smackx.provider.JingleTransportProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleProvider.class */
public class JingleProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        Jingle jingle = new Jingle();
        boolean z = false;
        JingleContent jingleContent = null;
        JingleContentProvider jingleContentProvider = new JingleContentProvider();
        JingleDescriptionProvider.Audio audio = new JingleDescriptionProvider.Audio();
        JingleTransportProvider.RawUdp rawUdp = new JingleTransportProvider.RawUdp();
        JingleTransportProvider.Ice ice = new JingleTransportProvider.Ice();
        JingleContentInfoProvider.Audio audio2 = new JingleContentInfoProvider.Audio();
        String attributeValue = xmlPullParser.getAttributeValue("", "sid");
        JingleActionEnum action = JingleActionEnum.getAction(xmlPullParser.getAttributeValue("", "action"));
        String attributeValue2 = xmlPullParser.getAttributeValue("", ContentNegotiator.INITIATOR);
        String attributeValue3 = xmlPullParser.getAttributeValue("", ContentNegotiator.RESPONDER);
        jingle.setSid(attributeValue);
        jingle.setAction(action);
        jingle.setInitiator(attributeValue2);
        jingle.setResponder(attributeValue3);
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            String namespace = xmlPullParser.getNamespace();
            if (next == 2) {
                if (name.equals(JingleContent.NODENAME)) {
                    jingleContent = (JingleContent) jingleContentProvider.parseExtension(xmlPullParser);
                    jingle.addContent(jingleContent);
                } else if (name.equals("description") && namespace.equals("urn:xmpp:tmp:jingle:apps:rtp")) {
                    jingleContent.setDescription((JingleDescription) audio.parseExtension(xmlPullParser));
                } else if (name.equals("transport")) {
                    if (namespace.equals(JingleTransport.RawUdp.NAMESPACE)) {
                        jingleContent.addJingleTransport((JingleTransport) rawUdp.parseExtension(xmlPullParser));
                    } else if (!namespace.equals(JingleTransport.Ice.NAMESPACE)) {
                        throw new XMPPException("Unknown transport namespace \"" + namespace + "\" in Jingle packet.");
                    } else {
                        jingleContent.addJingleTransport((JingleTransport) ice.parseExtension(xmlPullParser));
                    }
                } else if (!namespace.equals("urn:xmpp:tmp:jingle:apps:rtp")) {
                    throw new XMPPException("Unknown combination of namespace \"" + namespace + "\" and element name \"" + name + "\" in Jingle packet.");
                } else {
                    jingle.setContentInfo((JingleContentInfo) audio2.parseExtension(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(Jingle.getElementName())) {
                z = true;
            }
        }
        return jingle;
    }
}
