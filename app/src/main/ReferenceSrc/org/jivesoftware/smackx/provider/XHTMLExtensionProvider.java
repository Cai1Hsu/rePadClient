package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.XHTMLExtension;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/XHTMLExtensionProvider.class */
public class XHTMLExtensionProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        XHTMLExtension xHTMLExtension = new XHTMLExtension();
        boolean z = false;
        StringBuilder sb = new StringBuilder();
        int depth = xmlPullParser.getDepth();
        int depth2 = xmlPullParser.getDepth();
        String str = "";
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("body")) {
                    sb = new StringBuilder();
                    depth2 = xmlPullParser.getDepth();
                }
                str = xmlPullParser.getText();
                sb.append(xmlPullParser.getText());
            } else if (next == 4) {
                if (sb != null) {
                    sb.append(StringUtils.escapeForXML(xmlPullParser.getText()));
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("body") && xmlPullParser.getDepth() <= depth2) {
                    sb.append(xmlPullParser.getText());
                    xHTMLExtension.addBody(sb.toString());
                } else if (xmlPullParser.getName().equals(xHTMLExtension.getElementName()) && xmlPullParser.getDepth() <= depth) {
                    z = true;
                } else if (!str.equals(xmlPullParser.getText())) {
                    sb.append(xmlPullParser.getText());
                }
            }
        }
        return xHTMLExtension;
    }
}
