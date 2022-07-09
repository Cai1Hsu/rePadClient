package org.jivesoftware.smackx.workgroup.settings;

import java.util.HashMap;
import java.util.Map;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.workgroup.util.ModelUtil;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/GenericSettings.class */
public class GenericSettings extends IQ {
    public static final String ELEMENT_NAME = "generic-metadata";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private Map<String, String> map = new HashMap();
    private String query;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/GenericSettings$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            GenericSettings genericSettings = new GenericSettings();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "entry".equals(xmlPullParser.getName())) {
                    xmlPullParser.next();
                    String nextText = xmlPullParser.nextText();
                    xmlPullParser.next();
                    genericSettings.getMap().put(nextText, xmlPullParser.nextText());
                } else if (next == 3 && GenericSettings.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return genericSettings;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=");
        sb.append('\"');
        sb.append("http://jivesoftware.com/protocol/workgroup");
        sb.append('\"');
        sb.append(">");
        if (ModelUtil.hasLength(getQuery())) {
            sb.append("<query>" + getQuery() + "</query>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public Map<String, String> getMap() {
        return this.map;
    }

    public String getQuery() {
        return this.query;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

    public void setQuery(String str) {
        this.query = str;
    }
}
