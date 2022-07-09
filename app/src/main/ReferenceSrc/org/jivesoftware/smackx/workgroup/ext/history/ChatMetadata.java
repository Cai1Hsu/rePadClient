package org.jivesoftware.smackx.workgroup.ext.history;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.workgroup.MetaData;
import org.jivesoftware.smackx.workgroup.util.MetaDataUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/history/ChatMetadata.class */
public class ChatMetadata extends IQ {
    public static final String ELEMENT_NAME = "chat-metadata";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private Map<String, List<String>> map = new HashMap();
    private String sessionID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/history/ChatMetadata$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            ChatMetadata chatMetadata = new ChatMetadata();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("sessionID")) {
                        chatMetadata.setSessionID(xmlPullParser.nextText());
                    } else if (xmlPullParser.getName().equals(MetaData.ELEMENT_NAME)) {
                        chatMetadata.setMetadata(MetaDataUtils.parseMetaData(xmlPullParser));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(ChatMetadata.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return chatMetadata;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\">");
        sb.append("<sessionID>").append(getSessionID()).append("</sessionID>");
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public Map<String, List<String>> getMetadata() {
        return this.map;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public void setMetadata(Map<String, List<String>> map) {
        this.map = map;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
    }
}
