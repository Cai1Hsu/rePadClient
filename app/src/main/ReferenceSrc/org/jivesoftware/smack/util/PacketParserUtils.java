package org.jivesoftware.smack.util;

import com.edutech.idauthentication.AppEnvironment;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.logging.LogFactory;
import org.apache.tools.ant.taskdefs.condition.ParserSupports;
import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.packet.Authentication;
import org.jivesoftware.smack.packet.Bind;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smack.packet.StreamError;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smack/util/PacketParserUtils.class */
public class PacketParserUtils {
    private static final String PROPERTIES_NAMESPACE = "http://www.jivesoftware.com/xmlns/xmpp/properties";

    /* loaded from: classes.jar:org/jivesoftware/smack/util/PacketParserUtils$UnparsedResultIQ.class */
    public static class UnparsedResultIQ extends IQ {
        private final String str;

        public UnparsedResultIQ(String str) {
            this.str = str;
        }

        @Override // org.jivesoftware.smack.packet.IQ
        public String getChildElementXML() {
            return this.str;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v23, types: [java.lang.Class] */
    /* JADX WARN: Type inference failed for: r0v25, types: [java.lang.Double] */
    /* JADX WARN: Type inference failed for: r0v27, types: [java.lang.Float] */
    /* JADX WARN: Type inference failed for: r0v29, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r0v31, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r0v33, types: [java.lang.Boolean] */
    private static Object decode(Class<?> cls, String str) throws Exception {
        if (!cls.getName().equals("java.lang.String")) {
            str = cls.getName().equals(FormField.TYPE_BOOLEAN) ? Boolean.valueOf(str) : cls.getName().equals("int") ? Integer.valueOf(str) : cls.getName().equals("long") ? Long.valueOf(str) : cls.getName().equals("float") ? Float.valueOf(str) : cls.getName().equals("double") ? Double.valueOf(str) : cls.getName().equals("java.lang.Class") ? Class.forName(str) : null;
        }
        return str;
    }

    private static String getLanguageAttribute(XmlPullParser xmlPullParser) {
        String str;
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            String attributeName = xmlPullParser.getAttributeName(i);
            if ("xml:lang".equals(attributeName) || ("lang".equals(attributeName) && "xml".equals(xmlPullParser.getAttributePrefix(i)))) {
                str = xmlPullParser.getAttributeValue(i);
                break;
            }
        }
        str = null;
        return str;
    }

    private static Authentication parseAuthentication(XmlPullParser xmlPullParser) throws Exception {
        Authentication authentication = new Authentication();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("username")) {
                    authentication.setUsername(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals(AppEnvironment.PASSWORD)) {
                    authentication.setPassword(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("digest")) {
                    authentication.setDigest(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("resource")) {
                    authentication.setResource(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                z = true;
            }
        }
        return authentication;
    }

    public static Collection<String> parseCompressionMethods(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("method")) {
                    arrayList.add(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("compression")) {
                z = true;
            }
        }
        return arrayList;
    }

    private static String parseContent(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        StringBuffer stringBuffer = new StringBuffer();
        int depth = xmlPullParser.getDepth();
        while (true) {
            if (xmlPullParser.next() == 3 && xmlPullParser.getDepth() == depth) {
                return stringBuffer.toString();
            }
            stringBuffer.append(xmlPullParser.getText());
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x0100 -> B:32:0x00ed). Please submit an issue!!! */
    public static XMPPError parseError(XmlPullParser xmlPullParser) throws Exception {
        String str = "-1";
        String str2 = null;
        String str3 = null;
        String str4 = null;
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            if (xmlPullParser.getAttributeName(i).equals("code")) {
                str = xmlPullParser.getAttributeValue("", "code");
            }
            if (xmlPullParser.getAttributeName(i).equals("type")) {
                str2 = xmlPullParser.getAttributeValue("", "type");
            }
        }
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals(ContainsSelector.CONTAINS_KEY)) {
                    str3 = xmlPullParser.nextText();
                } else {
                    String name = xmlPullParser.getName();
                    String namespace = xmlPullParser.getNamespace();
                    if ("urn:ietf:params:xml:ns:xmpp-stanzas".equals(namespace)) {
                        str4 = name;
                    } else {
                        arrayList.add(parsePacketExtension(name, namespace, xmlPullParser));
                    }
                }
            } else if (next == 3 && xmlPullParser.getName().equals("error")) {
                z = true;
            }
        }
        XMPPError.Type type = XMPPError.Type.CANCEL;
        XMPPError.Type type2 = type;
        if (str2 != null) {
            try {
                type2 = XMPPError.Type.valueOf(str2.toUpperCase());
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
                type2 = type;
            }
        }
        return new XMPPError(Integer.parseInt(str), type2, str4, str3, arrayList);
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:82:0x003a */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:83:0x003a */
    public static IQ parseIQ(XmlPullParser xmlPullParser, Connection connection) throws Exception {
        Authentication authentication = null;
        String attributeValue = xmlPullParser.getAttributeValue("", "id");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "to");
        String attributeValue3 = xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM);
        IQ.Type fromString = IQ.Type.fromString(xmlPullParser.getAttributeValue("", "type"));
        XMPPError xMPPError = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (name.equals("error")) {
                    xMPPError = parseError(xmlPullParser);
                } else if (name.equals(STUN.ELEMENT_NAME) && namespace.equals("jabber:iq:auth")) {
                    authentication = parseAuthentication(xmlPullParser);
                } else if (name.equals(STUN.ELEMENT_NAME) && namespace.equals("jabber:iq:roster")) {
                    authentication = parseRoster(xmlPullParser);
                } else if (name.equals(STUN.ELEMENT_NAME) && namespace.equals("jabber:iq:register")) {
                    authentication = parseRegistration(xmlPullParser);
                } else if (!name.equals("bind") || !namespace.equals("urn:ietf:params:xml:ns:xmpp-bind")) {
                    Object iQProvider = ProviderManager.getInstance().getIQProvider(name, namespace);
                    if (iQProvider != null) {
                        if (iQProvider instanceof IQProvider) {
                            authentication = ((IQProvider) iQProvider).parseIQ(xmlPullParser);
                        } else if (iQProvider instanceof Class) {
                            authentication = (IQ) parseWithIntrospection(name, (Class) iQProvider, xmlPullParser);
                        }
                    } else if (IQ.Type.RESULT == fromString) {
                        authentication = new UnparsedResultIQ(parseContent(xmlPullParser));
                    }
                } else {
                    authentication = parseResourceBinding(xmlPullParser);
                }
            } else if (next == 3 && xmlPullParser.getName().equals("iq")) {
                z = true;
            }
        }
        Authentication authentication2 = authentication;
        if (authentication == null) {
            if (IQ.Type.GET == fromString || IQ.Type.SET == fromString) {
                IQ iq = new IQ() { // from class: org.jivesoftware.smack.util.PacketParserUtils.1
                    @Override // org.jivesoftware.smack.packet.IQ
                    public String getChildElementXML() {
                        return null;
                    }
                };
                iq.setPacketID(attributeValue);
                iq.setTo(attributeValue3);
                iq.setFrom(attributeValue2);
                iq.setType(IQ.Type.ERROR);
                iq.setError(new XMPPError(XMPPError.Condition.feature_not_implemented));
                connection.sendPacket(iq);
                authentication2 = null;
                return authentication2;
            }
            authentication2 = new IQ() { // from class: org.jivesoftware.smack.util.PacketParserUtils.2
                @Override // org.jivesoftware.smack.packet.IQ
                public String getChildElementXML() {
                    return null;
                }
            };
        }
        authentication2.setPacketID(attributeValue);
        authentication2.setTo(attributeValue2);
        authentication2.setFrom(attributeValue3);
        authentication2.setType(fromString);
        authentication2.setError(xMPPError);
        return authentication2;
    }

    public static Collection<String> parseMechanisms(XmlPullParser xmlPullParser) throws Exception {
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("mechanism")) {
                    arrayList.add(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("mechanisms")) {
                z = true;
            }
        }
        return arrayList;
    }

    public static Packet parseMessage(XmlPullParser xmlPullParser) throws Exception {
        Message message = new Message();
        String attributeValue = xmlPullParser.getAttributeValue("", "id");
        String str = attributeValue;
        if (attributeValue == null) {
            str = Packet.ID_NOT_AVAILABLE;
        }
        message.setPacketID(str);
        message.setTo(xmlPullParser.getAttributeValue("", "to"));
        message.setFrom(xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        message.setType(Message.Type.fromString(xmlPullParser.getAttributeValue("", "type")));
        String languageAttribute = getLanguageAttribute(xmlPullParser);
        if (languageAttribute == null || "".equals(languageAttribute.trim())) {
            languageAttribute = Packet.getDefaultLanguage();
        } else {
            message.setLanguage(languageAttribute);
        }
        boolean z = false;
        String str2 = null;
        Map<String, Object> map = null;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (name.equals("subject")) {
                    String languageAttribute2 = getLanguageAttribute(xmlPullParser);
                    String str3 = languageAttribute2;
                    if (languageAttribute2 == null) {
                        str3 = languageAttribute;
                    }
                    String parseContent = parseContent(xmlPullParser);
                    if (message.getSubject(str3) == null) {
                        message.addSubject(str3, parseContent);
                    }
                } else if (name.equals("body")) {
                    String languageAttribute3 = getLanguageAttribute(xmlPullParser);
                    String str4 = languageAttribute3;
                    if (languageAttribute3 == null) {
                        str4 = languageAttribute;
                    }
                    String parseContent2 = parseContent(xmlPullParser);
                    if (message.getBody(str4) == null) {
                        message.addBody(str4, parseContent2);
                    }
                } else if (name.equals("thread")) {
                    if (str2 == null) {
                        str2 = xmlPullParser.nextText();
                    }
                } else if (name.equals("error")) {
                    message.setError(parseError(xmlPullParser));
                } else if (!name.equals("properties") || !namespace.equals(PROPERTIES_NAMESPACE)) {
                    message.addExtension(parsePacketExtension(name, namespace, xmlPullParser));
                } else {
                    map = parseProperties(xmlPullParser);
                }
            } else if (next == 3 && xmlPullParser.getName().equals("message")) {
                z = true;
            }
        }
        message.setThread(str2);
        if (map != null) {
            for (String str5 : map.keySet()) {
                message.setProperty(str5, map.get(str5));
            }
        }
        return message;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v30, types: [org.jivesoftware.smack.packet.PacketExtension] */
    public static PacketExtension parsePacketExtension(String str, String str2, XmlPullParser xmlPullParser) throws Exception {
        DefaultPacketExtension defaultPacketExtension;
        Object extensionProvider = ProviderManager.getInstance().getExtensionProvider(str, str2);
        if (extensionProvider != null) {
            if (extensionProvider instanceof PacketExtensionProvider) {
                defaultPacketExtension = ((PacketExtensionProvider) extensionProvider).parseExtension(xmlPullParser);
            } else if (extensionProvider instanceof Class) {
                defaultPacketExtension = (PacketExtension) parseWithIntrospection(str, (Class) extensionProvider, xmlPullParser);
            }
            return defaultPacketExtension;
        }
        DefaultPacketExtension defaultPacketExtension2 = new DefaultPacketExtension(str, str2);
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                if (xmlPullParser.isEmptyElementTag()) {
                    defaultPacketExtension2.setValue(name, "");
                } else if (xmlPullParser.next() == 4) {
                    defaultPacketExtension2.setValue(name, xmlPullParser.getText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals(str)) {
                z = true;
            }
        }
        defaultPacketExtension = defaultPacketExtension2;
        return defaultPacketExtension;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x00c7 -> B:7:0x0025). Please submit an issue!!! */
    public static Presence parsePresence(XmlPullParser xmlPullParser) throws Exception {
        Presence.Type type = Presence.Type.available;
        String attributeValue = xmlPullParser.getAttributeValue("", "type");
        Presence.Type type2 = type;
        if (attributeValue != null) {
            type2 = type;
            if (!attributeValue.equals("")) {
                try {
                    type2 = Presence.Type.valueOf(attributeValue);
                } catch (IllegalArgumentException e) {
                    System.err.println("Found invalid presence type " + attributeValue);
                    type2 = type;
                }
            }
        }
        Presence presence = new Presence(type2);
        presence.setTo(xmlPullParser.getAttributeValue("", "to"));
        presence.setFrom(xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        String attributeValue2 = xmlPullParser.getAttributeValue("", "id");
        presence.setPacketID(attributeValue2 == null ? Packet.ID_NOT_AVAILABLE : attributeValue2);
        String languageAttribute = getLanguageAttribute(xmlPullParser);
        if (languageAttribute != null && !"".equals(languageAttribute.trim())) {
            presence.setLanguage(languageAttribute);
        }
        String str = attributeValue2;
        if (attributeValue2 == null) {
            str = Packet.ID_NOT_AVAILABLE;
        }
        presence.setPacketID(str);
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (name.equals("status")) {
                    presence.setStatus(xmlPullParser.nextText());
                } else if (name.equals(LogFactory.PRIORITY_KEY)) {
                    try {
                        presence.setPriority(Integer.parseInt(xmlPullParser.nextText()));
                    } catch (NumberFormatException e2) {
                    } catch (IllegalArgumentException e3) {
                        presence.setPriority(0);
                    }
                } else if (name.equals("show")) {
                    String nextText = xmlPullParser.nextText();
                    try {
                        presence.setMode(Presence.Mode.valueOf(nextText));
                    } catch (IllegalArgumentException e4) {
                        System.err.println("Found invalid presence mode " + nextText);
                    }
                } else if (name.equals("error")) {
                    presence.setError(parseError(xmlPullParser));
                } else if (!name.equals("properties") || !namespace.equals(PROPERTIES_NAMESPACE)) {
                    try {
                        presence.addExtension(parsePacketExtension(name, namespace, xmlPullParser));
                    } catch (Exception e5) {
                        System.err.println("Failed to parse extension packet in Presence packet.");
                    }
                } else {
                    Map<String, Object> parseProperties = parseProperties(xmlPullParser);
                    for (String str2 : parseProperties.keySet()) {
                        presence.setProperty(str2, parseProperties.get(str2));
                    }
                }
            } else if (next == 3 && xmlPullParser.getName().equals("presence")) {
                z = true;
            }
        }
        return presence;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v64, types: [java.lang.Boolean] */
    /* JADX WARN: Type inference failed for: r0v66, types: [java.lang.Double] */
    /* JADX WARN: Type inference failed for: r0v68, types: [java.lang.Float] */
    /* JADX WARN: Type inference failed for: r0v70, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r0v78, types: [java.lang.Integer] */
    public static Map<String, Object> parseProperties(XmlPullParser xmlPullParser) throws Exception {
        String str;
        HashMap hashMap = new HashMap();
        while (true) {
            int next = xmlPullParser.next();
            if (next == 2 && xmlPullParser.getName().equals(ParserSupports.PROPERTY)) {
                boolean z = false;
                String str2 = null;
                String str3 = null;
                String str4 = null;
                String str5 = null;
                while (!z) {
                    int next2 = xmlPullParser.next();
                    if (next2 == 2) {
                        String name = xmlPullParser.getName();
                        if (name.equals("name")) {
                            str2 = xmlPullParser.nextText();
                        } else if (name.equals(SizeSelector.SIZE_KEY)) {
                            str3 = xmlPullParser.getAttributeValue("", "type");
                            str4 = xmlPullParser.nextText();
                        }
                    } else if (next2 == 3 && xmlPullParser.getName().equals(ParserSupports.PROPERTY)) {
                        if ("integer".equals(str3)) {
                            str = Integer.valueOf(str4);
                        } else if ("long".equals(str3)) {
                            str = Long.valueOf(str4);
                        } else if ("float".equals(str3)) {
                            str = Float.valueOf(str4);
                        } else if ("double".equals(str3)) {
                            str = Double.valueOf(str4);
                        } else if (FormField.TYPE_BOOLEAN.equals(str3)) {
                            str = Boolean.valueOf(str4);
                        } else if ("string".equals(str3)) {
                            str = str4;
                        } else {
                            str = str5;
                            if ("java-object".equals(str3)) {
                                try {
                                    str = new ObjectInputStream(new ByteArrayInputStream(StringUtils.decodeBase64(str4))).readObject();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    str = str5;
                                }
                            }
                        }
                        if (str2 != null && str != null) {
                            hashMap.put(str2, str);
                        }
                        z = true;
                        str5 = str;
                    }
                }
            } else if (next == 3 && xmlPullParser.getName().equals("properties")) {
                return hashMap;
            }
        }
    }

    private static Registration parseRegistration(XmlPullParser xmlPullParser) throws Exception {
        Registration registration = new Registration();
        HashMap hashMap = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getNamespace().equals("jabber:iq:register")) {
                    String name = xmlPullParser.getName();
                    HashMap hashMap2 = hashMap;
                    if (hashMap == null) {
                        hashMap2 = new HashMap();
                    }
                    String str = "";
                    if (xmlPullParser.next() == 4) {
                        str = xmlPullParser.getText();
                    }
                    if (!name.equals("instructions")) {
                        hashMap2.put(name, str);
                        hashMap = hashMap2;
                    } else {
                        registration.setInstructions(str);
                        hashMap = hashMap2;
                    }
                } else {
                    registration.addExtension(parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                z = true;
            }
        }
        registration.setAttributes(hashMap);
        return registration;
    }

    private static Bind parseResourceBinding(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        Bind bind = new Bind();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("resource")) {
                    bind.setResource(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("jid")) {
                    bind.setJid(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("bind")) {
                z = true;
            }
        }
        return bind;
    }

    private static RosterPacket parseRoster(XmlPullParser xmlPullParser) throws Exception {
        RosterPacket rosterPacket = new RosterPacket();
        boolean z = false;
        RosterPacket.Item item = null;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                RosterPacket.Item item2 = item;
                if (xmlPullParser.getName().equals("item")) {
                    RosterPacket.Item item3 = new RosterPacket.Item(xmlPullParser.getAttributeValue("", "jid"), xmlPullParser.getAttributeValue("", "name"));
                    item3.setItemStatus(RosterPacket.ItemStatus.fromString(xmlPullParser.getAttributeValue("", "ask")));
                    String attributeValue = xmlPullParser.getAttributeValue("", "subscription");
                    if (attributeValue == null) {
                        attributeValue = "none";
                    }
                    item3.setItemType(RosterPacket.ItemType.valueOf(attributeValue));
                    item2 = item3;
                }
                item = item2;
                if (xmlPullParser.getName().equals("group")) {
                    item = item2;
                    if (item2 != null) {
                        String nextText = xmlPullParser.nextText();
                        item = item2;
                        if (nextText != null) {
                            item = item2;
                            if (nextText.trim().length() > 0) {
                                item2.addGroupName(nextText);
                                item = item2;
                            }
                        }
                    }
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("item")) {
                    rosterPacket.addRosterItem(item);
                }
                if (xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            }
        }
        return rosterPacket;
    }

    public static SASLMechanism.Failure parseSASLFailure(XmlPullParser xmlPullParser) throws Exception {
        String str = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (!xmlPullParser.getName().equals("failure")) {
                    str = xmlPullParser.getName();
                }
            } else if (next == 3 && xmlPullParser.getName().equals("failure")) {
                z = true;
            }
        }
        return new SASLMechanism.Failure(str);
    }

    public static StreamError parseStreamError(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        StreamError streamError = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                streamError = new StreamError(xmlPullParser.getName());
            } else if (next == 3 && xmlPullParser.getName().equals("error")) {
                z = true;
            }
        }
        return streamError;
    }

    public static Object parseWithIntrospection(String str, Class<?> cls, XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        Object newInstance = cls.newInstance();
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String nextText = xmlPullParser.nextText();
                PropertyDescriptor propertyDescriptor = new PropertyDescriptor(name, cls);
                propertyDescriptor.getWriteMethod().invoke(newInstance, decode(propertyDescriptor.getPropertyType(), nextText));
            } else if (next == 3 && xmlPullParser.getName().equals(str)) {
                z = true;
            }
        }
        return newInstance;
    }
}
