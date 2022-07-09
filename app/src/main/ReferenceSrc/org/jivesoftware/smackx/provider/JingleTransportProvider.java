package org.jivesoftware.smackx.provider;

import com.edutech.idauthentication.AppEnvironment;
import org.apache.http.cookie.ClientCookie;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.jingle.nat.ICECandidate;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.jivesoftware.smackx.packet.JingleTransport;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleTransportProvider.class */
public abstract class JingleTransportProvider implements PacketExtensionProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleTransportProvider$Ice.class */
    public static class Ice extends JingleTransportProvider {
        @Override // org.jivesoftware.smackx.provider.JingleTransportProvider
        protected JingleTransport getInstance() {
            return new JingleTransport.Ice();
        }

        @Override // org.jivesoftware.smackx.provider.JingleTransportProvider
        protected JingleTransport.JingleTransportCandidate parseCandidate(XmlPullParser xmlPullParser) throws Exception {
            JingleTransport.Ice.Candidate candidate;
            ICECandidate iCECandidate = new ICECandidate();
            String attributeValue = xmlPullParser.getAttributeValue("", "channel");
            String attributeValue2 = xmlPullParser.getAttributeValue("", "generation");
            String attributeValue3 = xmlPullParser.getAttributeValue("", "ip");
            String attributeValue4 = xmlPullParser.getAttributeValue("", "name");
            String attributeValue5 = xmlPullParser.getAttributeValue("", "network");
            String attributeValue6 = xmlPullParser.getAttributeValue("", "username");
            String attributeValue7 = xmlPullParser.getAttributeValue("", AppEnvironment.PASSWORD);
            String attributeValue8 = xmlPullParser.getAttributeValue("", ClientCookie.PORT_ATTR);
            String attributeValue9 = xmlPullParser.getAttributeValue("", "preference");
            String attributeValue10 = xmlPullParser.getAttributeValue("", "proto");
            String attributeValue11 = xmlPullParser.getAttributeValue("", "type");
            if (attributeValue != null) {
                iCECandidate.setChannel(new TransportCandidate.Channel(attributeValue));
            }
            if (attributeValue2 != null) {
                try {
                    iCECandidate.setGeneration(Integer.parseInt(attributeValue2));
                } catch (Exception e) {
                }
            }
            if (attributeValue3 != null) {
                iCECandidate.setIp(attributeValue3);
                if (attributeValue4 != null) {
                    iCECandidate.setName(attributeValue4);
                }
                if (attributeValue5 != null) {
                    try {
                        iCECandidate.setNetwork(Integer.parseInt(attributeValue5));
                    } catch (Exception e2) {
                    }
                }
                if (attributeValue6 != null) {
                    iCECandidate.setUsername(attributeValue6);
                }
                if (attributeValue7 != null) {
                    iCECandidate.setPassword(attributeValue7);
                }
                if (attributeValue8 != null) {
                    try {
                        iCECandidate.setPort(Integer.parseInt(attributeValue8));
                    } catch (Exception e3) {
                    }
                }
                if (attributeValue9 != null) {
                    try {
                        iCECandidate.setPreference(Integer.parseInt(attributeValue9));
                    } catch (Exception e4) {
                    }
                }
                if (attributeValue10 != null) {
                    iCECandidate.setProto(new TransportCandidate.Protocol(attributeValue10));
                }
                if (attributeValue11 != null) {
                    iCECandidate.setType(ICECandidate.Type.valueOf(attributeValue11));
                }
                candidate = new JingleTransport.Ice.Candidate(iCECandidate);
            } else {
                candidate = null;
            }
            return candidate;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleTransportProvider$RawUdp.class */
    public static class RawUdp extends JingleTransportProvider {
        @Override // org.jivesoftware.smackx.provider.JingleTransportProvider
        protected JingleTransport getInstance() {
            return new JingleTransport.RawUdp();
        }

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x006d -> B:14:0x0064). Please submit an issue!!! */
        @Override // org.jivesoftware.smackx.provider.JingleTransportProvider
        protected JingleTransport.JingleTransportCandidate parseCandidate(XmlPullParser xmlPullParser) throws Exception {
            TransportCandidate.Fixed fixed = new TransportCandidate.Fixed();
            String attributeValue = xmlPullParser.getAttributeValue("", "generation");
            String attributeValue2 = xmlPullParser.getAttributeValue("", "ip");
            String attributeValue3 = xmlPullParser.getAttributeValue("", "name");
            String attributeValue4 = xmlPullParser.getAttributeValue("", ClientCookie.PORT_ATTR);
            if (attributeValue != null) {
                try {
                    fixed.setGeneration(Integer.parseInt(attributeValue));
                } catch (Exception e) {
                }
            }
            if (attributeValue2 != null) {
                fixed.setIp(attributeValue2);
            }
            if (attributeValue3 != null) {
                fixed.setName(attributeValue3);
            }
            if (attributeValue4 != null) {
                try {
                    fixed.setPort(Integer.parseInt(attributeValue4));
                } catch (Exception e2) {
                }
            }
            return new JingleTransport.RawUdp.Candidate(fixed);
        }
    }

    protected JingleTransport getInstance() {
        return new JingleTransport();
    }

    protected abstract JingleTransport.JingleTransportCandidate parseCandidate(XmlPullParser xmlPullParser) throws Exception;

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        JingleTransport jingleTransportProvider = getInstance();
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            if (next == 2) {
                if (!name.equals(JingleTransport.JingleTransportCandidate.NODENAME)) {
                    throw new Exception("Unknown tag \"" + name + "\" in transport element.");
                }
                JingleTransport.JingleTransportCandidate parseCandidate = parseCandidate(xmlPullParser);
                if (parseCandidate != null) {
                    jingleTransportProvider.addCandidate(parseCandidate);
                }
            } else if (next == 3 && name.equals("transport")) {
                z = true;
            }
        }
        return jingleTransportProvider;
    }
}
