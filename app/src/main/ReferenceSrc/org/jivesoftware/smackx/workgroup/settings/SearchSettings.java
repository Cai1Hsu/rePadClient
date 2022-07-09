package org.jivesoftware.smackx.workgroup.settings;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.workgroup.util.ModelUtil;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/SearchSettings.class */
public class SearchSettings extends IQ {
    public static final String ELEMENT_NAME = "search-settings";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String forumsLocation;
    private String kbLocation;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/SearchSettings$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            SearchSettings searchSettings = new SearchSettings();
            boolean z = false;
            String str = null;
            String str2 = null;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "forums".equals(xmlPullParser.getName())) {
                    str2 = xmlPullParser.nextText();
                } else if (next == 2 && "kb".equals(xmlPullParser.getName())) {
                    str = xmlPullParser.nextText();
                } else if (next == 3 && SearchSettings.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            searchSettings.setForumsLocation(str2);
            searchSettings.setKbLocation(str);
            return searchSettings;
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

    public String getForumsLocation() {
        return this.forumsLocation;
    }

    public String getKbLocation() {
        return this.kbLocation;
    }

    public boolean hasForums() {
        return ModelUtil.hasLength(getForumsLocation());
    }

    public boolean hasKB() {
        return ModelUtil.hasLength(getKbLocation());
    }

    public boolean isSearchEnabled() {
        return ModelUtil.hasLength(getForumsLocation()) && ModelUtil.hasLength(getKbLocation());
    }

    public void setForumsLocation(String str) {
        this.forumsLocation = str;
    }

    public void setKbLocation(String str) {
        this.kbLocation = str;
    }
}
