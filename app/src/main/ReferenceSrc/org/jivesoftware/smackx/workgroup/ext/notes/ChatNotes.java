package org.jivesoftware.smackx.workgroup.ext.notes;

import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/notes/ChatNotes.class */
public class ChatNotes extends IQ {
    public static final String ELEMENT_NAME = "chat-notes";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String notes;
    private String sessionID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/notes/ChatNotes$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            ChatNotes chatNotes = new ChatNotes();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("sessionID")) {
                        chatNotes.setSessionID(xmlPullParser.nextText());
                    } else if (xmlPullParser.getName().equals(ContainsSelector.CONTAINS_KEY)) {
                        chatNotes.setNotes(xmlPullParser.nextText().replaceAll("\\\\n", "\n"));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(ChatNotes.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return chatNotes;
        }
    }

    public static final String replace(String str, String str2, String str3) {
        String str4;
        int i;
        if (str == null) {
            str4 = null;
        } else {
            str4 = str;
            if (str3 != null) {
                int indexOf = str.indexOf(str2, 0);
                str4 = str;
                if (indexOf >= 0) {
                    char[] charArray = str.toCharArray();
                    char[] charArray2 = str3.toCharArray();
                    int length = str2.length();
                    StringBuilder sb = new StringBuilder(charArray.length);
                    sb.append(charArray, 0, indexOf).append(charArray2);
                    int i2 = indexOf;
                    while (true) {
                        i = i2 + length;
                        int indexOf2 = str.indexOf(str2, i);
                        if (indexOf2 <= 0) {
                            break;
                        }
                        sb.append(charArray, i, indexOf2 - i).append(charArray2);
                        i2 = indexOf2;
                    }
                    sb.append(charArray, i, charArray.length - i);
                    str4 = sb.toString();
                }
            }
        }
        return str4;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\">");
        sb.append("<sessionID>").append(getSessionID()).append("</sessionID>");
        if (getNotes() != null) {
            sb.append("<notes>").append(getNotes()).append("</notes>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public String getNotes() {
        return this.notes;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public void setNotes(String str) {
        this.notes = str;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
    }
}
