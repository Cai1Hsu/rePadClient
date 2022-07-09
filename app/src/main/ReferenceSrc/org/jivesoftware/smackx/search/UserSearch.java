package org.jivesoftware.smackx.search;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.Nick;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/search/UserSearch.class */
public class UserSearch extends IQ {

    /* loaded from: classes.jar:org/jivesoftware/smackx/search/UserSearch$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            IQ iq;
            IQ iq2 = null;
            SimpleUserSearch simpleUserSearch = new SimpleUserSearch();
            boolean z = false;
            while (true) {
                if (!z) {
                    int next = xmlPullParser.next();
                    if (next == 2 && xmlPullParser.getName().equals("instructions")) {
                        UserSearch.buildDataForm(simpleUserSearch, xmlPullParser.nextText(), xmlPullParser);
                        iq = simpleUserSearch;
                        break;
                    } else if (next == 2 && xmlPullParser.getName().equals("item")) {
                        simpleUserSearch.parseItems(xmlPullParser);
                        iq = simpleUserSearch;
                        break;
                    } else if (next == 2 && xmlPullParser.getNamespace().equals(Form.NAMESPACE)) {
                        iq2 = new UserSearch();
                        iq2.addExtension(PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
                    } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                        z = true;
                    }
                } else {
                    iq = simpleUserSearch;
                    if (iq2 != null) {
                        iq = iq2;
                    }
                }
            }
            return iq;
        }
    }

    public static void buildDataForm(SimpleUserSearch simpleUserSearch, String str, XmlPullParser xmlPullParser) throws Exception {
        DataForm dataForm = new DataForm(Form.TYPE_FORM);
        boolean z = false;
        dataForm.setTitle("User Search");
        dataForm.addInstruction(str);
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2 && !xmlPullParser.getNamespace().equals(Form.NAMESPACE)) {
                String name = xmlPullParser.getName();
                FormField formField = new FormField(name);
                if (name.equals("first")) {
                    formField.setLabel("First Name");
                } else if (name.equals("last")) {
                    formField.setLabel("Last Name");
                } else if (name.equals("email")) {
                    formField.setLabel("Email Address");
                } else if (name.equals(Nick.ELEMENT_NAME)) {
                    formField.setLabel("Nickname");
                }
                formField.setType(FormField.TYPE_TEXT_SINGLE);
                dataForm.addField(formField);
            } else if (next == 3) {
                if (xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            } else if (next == 2 && xmlPullParser.getNamespace().equals(Form.NAMESPACE)) {
                simpleUserSearch.addExtension(PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
                z = true;
            }
        }
        if (simpleUserSearch.getExtension("x", Form.NAMESPACE) == null) {
            simpleUserSearch.addExtension(dataForm);
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<query xmlns=\"jabber:iq:search\">" + getExtensionsXML() + "</query>";
    }

    public Form getSearchForm(Connection connection, String str) throws XMPPException {
        UserSearch userSearch = new UserSearch();
        userSearch.setType(IQ.Type.GET);
        userSearch.setTo(str);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(userSearch.getPacketID()));
        connection.sendPacket(userSearch);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (iq.getError() == null) {
            return Form.getFormFrom(iq);
        }
        throw new XMPPException(iq.getError());
    }

    public ReportedData sendSearchForm(Connection connection, Form form, String str) throws XMPPException {
        UserSearch userSearch = new UserSearch();
        userSearch.setType(IQ.Type.SET);
        userSearch.setTo(str);
        userSearch.addExtension(form.getDataFormToSend());
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(userSearch.getPacketID()));
        connection.sendPacket(userSearch);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        return iq.getError() != null ? sendSimpleSearchForm(connection, form, str) : ReportedData.getReportedDataFrom(iq);
    }

    public ReportedData sendSimpleSearchForm(Connection connection, Form form, String str) throws XMPPException {
        SimpleUserSearch simpleUserSearch = new SimpleUserSearch();
        simpleUserSearch.setForm(form);
        simpleUserSearch.setType(IQ.Type.SET);
        simpleUserSearch.setTo(str);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(simpleUserSearch.getPacketID()));
        connection.sendPacket(simpleUserSearch);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        return iq instanceof SimpleUserSearch ? ((SimpleUserSearch) iq).getReportedData() : null;
    }
}
