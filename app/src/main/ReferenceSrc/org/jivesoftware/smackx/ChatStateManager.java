package org.jivesoftware.smackx;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ChatManagerListener;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.PacketInterceptor;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.NotFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.util.collections.ReferenceMap;
import org.jivesoftware.smackx.packet.ChatStateExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/ChatStateManager.class */
public class ChatStateManager {
    private final Connection connection;
    private static final Map<Connection, WeakReference<ChatStateManager>> managers = new WeakHashMap();
    private static final PacketFilter filter = new NotFilter(new PacketExtensionFilter("http://jabber.org/protocol/chatstates"));
    private final OutgoingMessageInterceptor outgoingInterceptor = new OutgoingMessageInterceptor();
    private final IncomingMessageInterceptor incomingInterceptor = new IncomingMessageInterceptor();
    private final Map<Chat, ChatState> chatStates = new ReferenceMap(2, 0);

    /* loaded from: classes.jar:org/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor.class */
    private class IncomingMessageInterceptor implements ChatManagerListener, MessageListener {
        private IncomingMessageInterceptor() {
            ChatStateManager.this = r4;
        }

        @Override // org.jivesoftware.smack.ChatManagerListener
        public void chatCreated(Chat chat, boolean z) {
            chat.addMessageListener(this);
        }

        @Override // org.jivesoftware.smack.MessageListener
        public void processMessage(Chat chat, Message message) {
            PacketExtension extension = message.getExtension("http://jabber.org/protocol/chatstates");
            if (extension == null) {
                return;
            }
            try {
                ChatStateManager.this.fireNewChatState(chat, ChatState.valueOf(extension.getElementName()));
            } catch (Exception e) {
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor.class */
    private class OutgoingMessageInterceptor implements PacketInterceptor {
        private OutgoingMessageInterceptor() {
            ChatStateManager.this = r4;
        }

        @Override // org.jivesoftware.smack.PacketInterceptor
        public void interceptPacket(Packet packet) {
            Message message = (Message) packet;
            Chat threadChat = ChatStateManager.this.connection.getChatManager().getThreadChat(message.getThread());
            if (threadChat != null && ChatStateManager.this.updateChatState(threadChat, ChatState.active)) {
                message.addExtension(new ChatStateExtension(ChatState.active));
            }
        }
    }

    private ChatStateManager(Connection connection) {
        this.connection = connection;
    }

    public void fireNewChatState(Chat chat, ChatState chatState) {
        for (MessageListener messageListener : chat.getListeners()) {
            if (messageListener instanceof ChatStateListener) {
                ((ChatStateListener) messageListener).stateChanged(chat, chatState);
            }
        }
    }

    public static ChatStateManager getInstance(Connection connection) {
        ChatStateManager chatStateManager;
        if (connection == null) {
            chatStateManager = null;
        } else {
            synchronized (managers) {
                WeakReference<ChatStateManager> weakReference = managers.get(connection);
                if (weakReference == null) {
                    ChatStateManager chatStateManager2 = new ChatStateManager(connection);
                    chatStateManager2.init();
                    managers.put(connection, new WeakReference<>(chatStateManager2));
                    chatStateManager = chatStateManager2;
                } else {
                    chatStateManager = weakReference.get();
                }
            }
        }
        return chatStateManager;
    }

    private void init() {
        this.connection.getChatManager().addOutgoingMessageInterceptor(this.outgoingInterceptor, filter);
        this.connection.getChatManager().addChatListener(this.incomingInterceptor);
        ServiceDiscoveryManager.getInstanceFor(this.connection).addFeature("http://jabber.org/protocol/chatstates");
    }

    public boolean updateChatState(Chat chat, ChatState chatState) {
        boolean z;
        if (this.chatStates.get(chat) != chatState) {
            this.chatStates.put(chat, chatState);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean equals(Object obj) {
        return this == obj ? true : (obj == null || getClass() != obj.getClass()) ? false : this.connection.equals(((ChatStateManager) obj).connection);
    }

    public int hashCode() {
        return this.connection.hashCode();
    }

    public void setCurrentState(ChatState chatState, Chat chat) throws XMPPException {
        if (chat == null || chatState == null) {
            throw new IllegalArgumentException("Arguments cannot be null.");
        }
        if (!updateChatState(chat, chatState)) {
            return;
        }
        Message message = new Message();
        message.addExtension(new ChatStateExtension(chatState));
        chat.sendMessage(message);
    }
}
