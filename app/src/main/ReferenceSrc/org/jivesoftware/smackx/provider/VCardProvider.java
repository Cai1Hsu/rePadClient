package org.jivesoftware.smackx.provider;

import com.mining.app.zxing.decoding.Intents;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilderFactory;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.VCard;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/VCardProvider.class */
public class VCardProvider implements IQProvider {
    private static final String PREFERRED_ENCODING = "UTF-8";

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/VCardProvider$VCardReader.class */
    private static class VCardReader {
        private final Document document;
        private final VCard vCard;

        VCardReader(VCard vCard, Document document) {
            this.vCard = vCard;
            this.document = document;
        }

        private void appendText(StringBuilder sb, Node node) {
            NodeList childNodes = node.getChildNodes();
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node item = childNodes.item(i);
                String nodeValue = item.getNodeValue();
                if (nodeValue != null) {
                    sb.append(nodeValue);
                }
                appendText(sb, item);
            }
        }

        private String getTagContents(String str) {
            NodeList elementsByTagName = this.document.getElementsByTagName(str);
            return (elementsByTagName == null || elementsByTagName.getLength() != 1) ? null : getTextContent(elementsByTagName.item(0));
        }

        private String getTextContent(Node node) {
            StringBuilder sb = new StringBuilder();
            appendText(sb, node);
            return sb.toString();
        }

        private boolean isWorkHome(String str) {
            return "HOME".equals(str) || "WORK".equals(str);
        }

        private void setupAddresses() {
            NodeList elementsByTagName = this.document.getElementsByTagName("ADR");
            if (elementsByTagName == null) {
                return;
            }
            for (int i = 0; i < elementsByTagName.getLength(); i++) {
                Element element = (Element) elementsByTagName.item(i);
                String str = null;
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                NodeList childNodes = element.getChildNodes();
                for (int i2 = 0; i2 < childNodes.getLength(); i2++) {
                    Node item = childNodes.item(i2);
                    if (item.getNodeType() == 1) {
                        String nodeName = item.getNodeName();
                        if (isWorkHome(nodeName)) {
                            str = nodeName;
                        } else {
                            arrayList.add(nodeName);
                            arrayList2.add(getTextContent(item));
                        }
                    }
                }
                for (int i3 = 0; i3 < arrayList2.size(); i3++) {
                    if ("HOME".equals(str)) {
                        this.vCard.setAddressFieldHome((String) arrayList.get(i3), (String) arrayList2.get(i3));
                    } else {
                        this.vCard.setAddressFieldWork((String) arrayList.get(i3), (String) arrayList2.get(i3));
                    }
                }
            }
        }

        private void setupEmails() {
            NodeList elementsByTagName = this.document.getElementsByTagName("USERID");
            if (elementsByTagName == null) {
                return;
            }
            for (int i = 0; i < elementsByTagName.getLength(); i++) {
                Element element = (Element) elementsByTagName.item(i);
                if ("WORK".equals(element.getParentNode().getFirstChild().getNodeName())) {
                    this.vCard.setEmailWork(getTextContent(element));
                } else {
                    this.vCard.setEmailHome(getTextContent(element));
                }
            }
        }

        private void setupPhones() {
            NodeList elementsByTagName = this.document.getElementsByTagName("TEL");
            if (elementsByTagName == null) {
                return;
            }
            for (int i = 0; i < elementsByTagName.getLength(); i++) {
                NodeList childNodes = elementsByTagName.item(i).getChildNodes();
                String str = null;
                String str2 = null;
                String str3 = null;
                for (int i2 = 0; i2 < childNodes.getLength(); i2++) {
                    Node item = childNodes.item(i2);
                    if (item.getNodeType() == 1) {
                        String nodeName = item.getNodeName();
                        if ("NUMBER".equals(nodeName)) {
                            str3 = getTextContent(item);
                        } else if (isWorkHome(nodeName)) {
                            str = nodeName;
                        } else {
                            str2 = nodeName;
                        }
                    }
                }
                if (str2 != null && str3 != null) {
                    if ("HOME".equals(str)) {
                        this.vCard.setPhoneHome(str2, str3);
                    } else {
                        this.vCard.setPhoneWork(str2, str3);
                    }
                }
            }
        }

        private void setupPhoto() {
            String str = null;
            String str2 = null;
            NodeList elementsByTagName = this.document.getElementsByTagName("PHOTO");
            if (elementsByTagName.getLength() != 1) {
                return;
            }
            NodeList childNodes = elementsByTagName.item(0).getChildNodes();
            int length = childNodes.getLength();
            ArrayList<Node> arrayList = new ArrayList(length);
            for (int i = 0; i < length; i++) {
                arrayList.add(childNodes.item(i));
            }
            for (Node node : arrayList) {
                String nodeName = node.getNodeName();
                String textContent = node.getTextContent();
                if (nodeName.equals("BINVAL")) {
                    str = textContent;
                } else if (nodeName.equals(Intents.WifiConnect.TYPE)) {
                    str2 = textContent;
                }
            }
            if (str == null || str2 == null) {
                return;
            }
            this.vCard.setAvatar(str, str2);
        }

        private void setupSimpleFields() {
            NodeList childNodes = this.document.getDocumentElement().getChildNodes();
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node item = childNodes.item(i);
                if (item instanceof Element) {
                    Element element = (Element) item;
                    String nodeName = element.getNodeName();
                    if (element.getChildNodes().getLength() == 0) {
                        this.vCard.setField(nodeName, "");
                    } else if (element.getChildNodes().getLength() == 1 && (element.getChildNodes().item(0) instanceof Text)) {
                        this.vCard.setField(nodeName, getTextContent(element));
                    }
                }
            }
        }

        public void initializeFields() {
            this.vCard.setFirstName(getTagContents("GIVEN"));
            this.vCard.setLastName(getTagContents("FAMILY"));
            this.vCard.setMiddleName(getTagContents("MIDDLE"));
            setupPhoto();
            setupEmails();
            this.vCard.setOrganization(getTagContents("ORGNAME"));
            this.vCard.setOrganizationUnit(getTagContents("ORGUNIT"));
            setupSimpleFields();
            setupPhones();
            setupAddresses();
        }
    }

    public static VCard createVCardFromXML(String str) throws Exception {
        VCard vCard = new VCard();
        new VCardReader(vCard, DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(str.getBytes("UTF-8")))).initializeFields();
        return vCard;
    }

    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        int eventType;
        StringBuilder sb = new StringBuilder();
        try {
            eventType = xmlPullParser.getEventType();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XmlPullParserException e2) {
            e2.printStackTrace();
        }
        while (true) {
            switch (eventType) {
                case 2:
                    sb.append('<').append(xmlPullParser.getName()).append('>');
                    break;
                case 3:
                    sb.append("</").append(xmlPullParser.getName()).append('>');
                    break;
                case 4:
                    sb.append(StringUtils.escapeForXML(xmlPullParser.getText()));
                    break;
            }
            if (eventType == 3) {
                if ("vCard".equals(xmlPullParser.getName())) {
                    return createVCardFromXML(sb.toString());
                }
            }
            eventType = xmlPullParser.next();
        }
    }
}
