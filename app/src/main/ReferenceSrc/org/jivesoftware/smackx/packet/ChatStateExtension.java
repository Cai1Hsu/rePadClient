package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.ChatState;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/ChatStateExtension.class */
public class ChatStateExtension implements PacketExtension {
    private ChatState state;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/ChatStateExtension$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:7:0x0014 -> B:3:0x000a). Please submit an issue!!! */
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            ChatState chatState;
            try {
                chatState = ChatState.valueOf(xmlPullParser.getName());
            } catch (Exception e) {
                chatState = ChatState.active;
            }
            return new ChatStateExtension(chatState);
        }
    }

    public ChatStateExtension(ChatState chatState) {
        this.state = chatState;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.state.name();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/chatstates";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return "<" + getElementName() + " xmlns=\"" + getNamespace() + "\" />";
    }
}
