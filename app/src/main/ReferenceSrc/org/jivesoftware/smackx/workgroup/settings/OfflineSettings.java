package org.jivesoftware.smackx.workgroup.settings;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.workgroup.util.ModelUtil;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/OfflineSettings.class */
public class OfflineSettings extends IQ {
    public static final String ELEMENT_NAME = "offline-settings";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String emailAddress;
    private String offlineText;
    private String redirectURL;
    private String subject;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/OfflineSettings$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            OfflineSettings offlineSettings = new OfflineSettings();
            boolean z = false;
            String str = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "redirectPage".equals(xmlPullParser.getName())) {
                    str = xmlPullParser.nextText();
                } else if (next == 2 && "subject".equals(xmlPullParser.getName())) {
                    str2 = xmlPullParser.nextText();
                } else if (next == 2 && "offlineText".equals(xmlPullParser.getName())) {
                    str3 = xmlPullParser.nextText();
                } else if (next == 2 && "emailAddress".equals(xmlPullParser.getName())) {
                    str4 = xmlPullParser.nextText();
                } else if (next == 3 && OfflineSettings.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            offlineSettings.setEmailAddress(str4);
            offlineSettings.setRedirectURL(str);
            offlineSettings.setSubject(str2);
            offlineSettings.setOfflineText(str3);
            return offlineSettings;
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

    public String getEmailAddress() {
        return !ModelUtil.hasLength(this.emailAddress) ? "" : this.emailAddress;
    }

    public String getOfflineText() {
        return !ModelUtil.hasLength(this.offlineText) ? "" : this.offlineText;
    }

    public String getRedirectURL() {
        return !ModelUtil.hasLength(this.redirectURL) ? "" : this.redirectURL;
    }

    public String getSubject() {
        return !ModelUtil.hasLength(this.subject) ? "" : this.subject;
    }

    public boolean isConfigured() {
        return ModelUtil.hasLength(getEmailAddress()) && ModelUtil.hasLength(getSubject()) && ModelUtil.hasLength(getOfflineText());
    }

    public boolean redirects() {
        return ModelUtil.hasLength(getRedirectURL());
    }

    public void setEmailAddress(String str) {
        this.emailAddress = str;
    }

    public void setOfflineText(String str) {
        this.offlineText = str;
    }

    public void setRedirectURL(String str) {
        this.redirectURL = str;
    }

    public void setSubject(String str) {
        this.subject = str;
    }
}
