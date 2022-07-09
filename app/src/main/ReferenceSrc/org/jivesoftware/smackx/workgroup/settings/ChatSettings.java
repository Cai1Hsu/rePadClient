package org.jivesoftware.smackx.workgroup.settings;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/ChatSettings.class */
public class ChatSettings extends IQ {
    public static final int BOT_SETTINGS = 2;
    public static final String ELEMENT_NAME = "chat-settings";
    public static final int IMAGE_SETTINGS = 0;
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    public static final int TEXT_SETTINGS = 1;
    private String key;
    private List<ChatSetting> settings;
    private int type;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/settings/ChatSettings$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        private ChatSetting parseChatSetting(XmlPullParser xmlPullParser) throws Exception {
            boolean z = false;
            String str = null;
            String str2 = null;
            int i = 0;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "key".equals(xmlPullParser.getName())) {
                    str = xmlPullParser.nextText();
                } else if (next == 2 && SizeSelector.SIZE_KEY.equals(xmlPullParser.getName())) {
                    str2 = xmlPullParser.nextText();
                } else if (next == 2 && "type".equals(xmlPullParser.getName())) {
                    i = Integer.parseInt(xmlPullParser.nextText());
                } else if (next == 3 && "chat-setting".equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return new ChatSetting(str, str2, i);
        }

        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            ChatSettings chatSettings = new ChatSettings();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "chat-setting".equals(xmlPullParser.getName())) {
                    chatSettings.addSetting(parseChatSetting(xmlPullParser));
                } else if (next == 3 && ChatSettings.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return chatSettings;
        }
    }

    public ChatSettings() {
        this.type = -1;
        this.settings = new ArrayList();
    }

    public ChatSettings(String str) {
        this.type = -1;
        setKey(str);
    }

    public void addSetting(ChatSetting chatSetting) {
        this.settings.add(chatSetting);
    }

    public ChatSetting getChatSetting(String str) {
        ChatSetting chatSetting;
        Collection<ChatSetting> settings = getSettings();
        if (settings != null) {
            for (ChatSetting chatSetting2 : settings) {
                if (chatSetting2.getKey().equals(str)) {
                    chatSetting = chatSetting2;
                    break;
                }
            }
        }
        chatSetting = null;
        return chatSetting;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=");
        sb.append('\"');
        sb.append("http://jivesoftware.com/protocol/workgroup");
        sb.append('\"');
        if (this.key != null) {
            sb.append(" key=\"" + this.key + "\"");
        }
        if (this.type != -1) {
            sb.append(" type=\"" + this.type + "\"");
        }
        sb.append("></").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public ChatSetting getFirstEntry() {
        return this.settings.size() > 0 ? this.settings.get(0) : null;
    }

    public Collection<ChatSetting> getSettings() {
        return this.settings;
    }

    public void setKey(String str) {
        this.key = str;
    }

    public void setType(int i) {
        this.type = i;
    }
}
