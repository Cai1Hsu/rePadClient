package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.commands.AdHocCommand;
import org.jivesoftware.smackx.commands.AdHocCommandNote;
import org.jivesoftware.smackx.packet.AdHocCommandData;
import org.jivesoftware.smackx.packet.DataForm;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider.class */
public class AdHocCommandDataProvider implements IQProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadActionError.class */
    public static class BadActionError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.badAction);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadLocaleError.class */
    public static class BadLocaleError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.badLocale);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadPayloadError.class */
    public static class BadPayloadError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.badPayload);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$BadSessionIDError.class */
    public static class BadSessionIDError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.badSessionid);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$MalformedActionError.class */
    public static class MalformedActionError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.malformedAction);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/AdHocCommandDataProvider$SessionExpiredError.class */
    public static class SessionExpiredError implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            return new AdHocCommandData.SpecificError(AdHocCommand.SpecificErrorCondition.sessionExpired);
        }
    }

    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        AdHocCommandData adHocCommandData = new AdHocCommandData();
        DataFormProvider dataFormProvider = new DataFormProvider();
        adHocCommandData.setSessionID(xmlPullParser.getAttributeValue("", "sessionid"));
        adHocCommandData.setNode(xmlPullParser.getAttributeValue("", "node"));
        String attributeValue = xmlPullParser.getAttributeValue("", "status");
        if (AdHocCommand.Status.executing.toString().equalsIgnoreCase(attributeValue)) {
            adHocCommandData.setStatus(AdHocCommand.Status.executing);
        } else if (AdHocCommand.Status.completed.toString().equalsIgnoreCase(attributeValue)) {
            adHocCommandData.setStatus(AdHocCommand.Status.completed);
        } else if (AdHocCommand.Status.canceled.toString().equalsIgnoreCase(attributeValue)) {
            adHocCommandData.setStatus(AdHocCommand.Status.canceled);
        }
        String attributeValue2 = xmlPullParser.getAttributeValue("", "action");
        boolean z = false;
        if (attributeValue2 != null) {
            AdHocCommand.Action valueOf = AdHocCommand.Action.valueOf(attributeValue2);
            if (valueOf == null || valueOf.equals(AdHocCommand.Action.unknown)) {
                adHocCommandData.setAction(AdHocCommand.Action.unknown);
                z = false;
            } else {
                adHocCommandData.setAction(valueOf);
                z = false;
            }
        }
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            String namespace = xmlPullParser.getNamespace();
            if (next == 2) {
                if (xmlPullParser.getName().equals("actions")) {
                    String attributeValue3 = xmlPullParser.getAttributeValue("", "execute");
                    if (attributeValue3 != null) {
                        adHocCommandData.setExecuteAction(AdHocCommand.Action.valueOf(attributeValue3));
                    }
                } else if (xmlPullParser.getName().equals("next")) {
                    adHocCommandData.addAction(AdHocCommand.Action.next);
                } else if (xmlPullParser.getName().equals("complete")) {
                    adHocCommandData.addAction(AdHocCommand.Action.complete);
                } else if (xmlPullParser.getName().equals("prev")) {
                    adHocCommandData.addAction(AdHocCommand.Action.prev);
                } else if (name.equals("x") && namespace.equals(Form.NAMESPACE)) {
                    adHocCommandData.setForm((DataForm) dataFormProvider.parseExtension(xmlPullParser));
                } else if (xmlPullParser.getName().equals("note")) {
                    adHocCommandData.addNote(new AdHocCommandNote(AdHocCommandNote.Type.valueOf(xmlPullParser.getAttributeValue("", "type")), xmlPullParser.nextText()));
                } else if (xmlPullParser.getName().equals("error")) {
                    adHocCommandData.setError(PacketParserUtils.parseError(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("command")) {
                z = true;
            }
        }
        return adHocCommandData;
    }
}
