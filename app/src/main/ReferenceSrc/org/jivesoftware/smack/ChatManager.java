package org.jivesoftware.smack;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromContainsFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.ThreadFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.collections.ReferenceMap;

/* loaded from: classes.jar:org/jivesoftware/smack/ChatManager.class */
public class ChatManager {
    private Connection connection;
    private static String prefix = StringUtils.randomString(5);
    private static long id = 0;
    private Map<String, Chat> threadChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Map<String, Chat> jidChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Map<String, Chat> baseJidChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Set<ChatManagerListener> chatManagerListeners = new CopyOnWriteArraySet();
    private Map<PacketInterceptor, PacketFilter> interceptors = new WeakHashMap();

    ChatManager(Connection connection) {
        this.connection = connection;
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smack.ChatManager.2
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Chat chat;
                Message message = (Message) packet;
                if (message.getThread() == null) {
                    chat = ChatManager.this.getUserChat(message.getFrom());
                } else {
                    Chat threadChat = ChatManager.this.getThreadChat(message.getThread());
                    chat = threadChat;
                    if (threadChat == null) {
                        chat = ChatManager.this.getUserChat(message.getFrom());
                    }
                }
                Chat chat2 = chat;
                if (chat == null) {
                    chat2 = ChatManager.this.createChat(message);
                }
                ChatManager.this.deliverMessage(chat2, message);
            }
        }, new PacketFilter() { // from class: org.jivesoftware.smack.ChatManager.1
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                boolean z;
                if (!(packet instanceof Message)) {
                    z = false;
                } else {
                    Message.Type type = ((Message) packet).getType();
                    z = false;
                    if (type != Message.Type.groupchat) {
                        z = false;
                        if (type != Message.Type.headline) {
                            z = true;
                        }
                    }
                }
                return z;
            }
        });
    }

    private Chat createChat(String str, String str2, boolean z) {
        Chat chat = new Chat(this, str, str2);
        this.threadChats.put(str2, chat);
        this.jidChats.put(str, chat);
        this.baseJidChats.put(StringUtils.parseBareAddress(str), chat);
        for (ChatManagerListener chatManagerListener : this.chatManagerListeners) {
            chatManagerListener.chatCreated(chat, z);
        }
        return chat;
    }

    public Chat createChat(Message message) {
        String thread = message.getThread();
        String str = thread;
        if (thread == null) {
            str = nextID();
        }
        return createChat(message.getFrom(), str, false);
    }

    public void deliverMessage(Chat chat, Message message) {
        chat.deliver(message);
    }

    public Chat getUserChat(String str) {
        Chat chat = this.jidChats.get(str);
        Chat chat2 = chat;
        if (chat == null) {
            chat2 = this.baseJidChats.get(StringUtils.parseBareAddress(str));
        }
        return chat2;
    }

    private static String nextID() {
        String sb;
        synchronized (ChatManager.class) {
            try {
                StringBuilder append = new StringBuilder().append(prefix);
                long j = id;
                id = 1 + j;
                sb = append.append(Long.toString(j)).toString();
            } catch (Throwable th) {
                throw th;
            }
        }
        return sb;
    }

    public void addChatListener(ChatManagerListener chatManagerListener) {
        this.chatManagerListeners.add(chatManagerListener);
    }

    public void addOutgoingMessageInterceptor(PacketInterceptor packetInterceptor) {
        addOutgoingMessageInterceptor(packetInterceptor, null);
    }

    public void addOutgoingMessageInterceptor(PacketInterceptor packetInterceptor, PacketFilter packetFilter) {
        if (packetInterceptor != null) {
            this.interceptors.put(packetInterceptor, packetFilter);
        }
    }

    public Chat createChat(String str, String str2, MessageListener messageListener) {
        String str3 = str2;
        if (str2 == null) {
            str3 = nextID();
        }
        if (this.threadChats.get(str3) != null) {
            throw new IllegalArgumentException("ThreadID is already used");
        }
        Chat createChat = createChat(str, str3, true);
        createChat.addMessageListener(messageListener);
        return createChat;
    }

    public Chat createChat(String str, MessageListener messageListener) {
        String nextID;
        do {
            nextID = nextID();
        } while (this.threadChats.get(nextID) != null);
        return createChat(str, nextID, messageListener);
    }

    PacketCollector createPacketCollector(Chat chat) {
        return this.connection.createPacketCollector(new AndFilter(new ThreadFilter(chat.getThreadID()), new FromContainsFilter(chat.getParticipant())));
    }

    public Collection<ChatManagerListener> getChatListeners() {
        return Collections.unmodifiableCollection(this.chatManagerListeners);
    }

    public Chat getThreadChat(String str) {
        return this.threadChats.get(str);
    }

    public void removeChatListener(ChatManagerListener chatManagerListener) {
        this.chatManagerListeners.remove(chatManagerListener);
    }

    void sendMessage(Chat chat, Message message) {
        for (Map.Entry<PacketInterceptor, PacketFilter> entry : this.interceptors.entrySet()) {
            PacketFilter value = entry.getValue();
            if (value != null && value.accept(message)) {
                entry.getKey().interceptPacket(message);
            }
        }
        if (message.getFrom() == null) {
            message.setFrom(this.connection.getUser());
        }
        this.connection.sendPacket(message);
    }
}
