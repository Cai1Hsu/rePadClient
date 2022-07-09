package org.jivesoftware.smackx.pubsub;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.OrFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.packet.DelayInformation;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.Header;
import org.jivesoftware.smackx.packet.HeadersExtension;
import org.jivesoftware.smackx.pubsub.listener.ItemDeleteListener;
import org.jivesoftware.smackx.pubsub.listener.ItemEventListener;
import org.jivesoftware.smackx.pubsub.listener.NodeConfigListener;
import org.jivesoftware.smackx.pubsub.packet.PubSub;
import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;
import org.jivesoftware.smackx.pubsub.packet.SyncPacketSend;
import org.jivesoftware.smackx.pubsub.util.NodeUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Node.class */
public abstract class Node {
    protected Connection con;
    protected String id;
    protected String to;
    protected ConcurrentHashMap<ItemEventListener<Item>, PacketListener> itemEventToListenerMap = new ConcurrentHashMap<>();
    protected ConcurrentHashMap<ItemDeleteListener, PacketListener> itemDeleteToListenerMap = new ConcurrentHashMap<>();
    protected ConcurrentHashMap<NodeConfigListener, PacketListener> configEventToListenerMap = new ConcurrentHashMap<>();

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Node$EventContentFilter.class */
    class EventContentFilter implements PacketFilter {
        private String firstElement;
        private String secondElement;

        EventContentFilter(String str) {
            Node.this = r4;
            this.firstElement = str;
        }

        EventContentFilter(String str, String str2) {
            Node.this = r4;
            this.firstElement = str;
            this.secondElement = str2;
        }

        @Override // org.jivesoftware.smack.filter.PacketFilter
        public boolean accept(Packet packet) {
            boolean z;
            if (!(packet instanceof Message)) {
                z = false;
            } else {
                EventElement eventElement = (EventElement) packet.getExtension("event", PubSubNamespace.EVENT.getXmlns());
                if (eventElement == null) {
                    z = false;
                } else {
                    NodeExtension event = eventElement.getEvent();
                    if (event == null) {
                        z = false;
                    } else {
                        if (event.getElementName().equals(this.firstElement)) {
                            if (!event.getNode().equals(Node.this.getId())) {
                                z = false;
                            } else if (this.secondElement == null) {
                                z = true;
                            } else if (event instanceof EmbeddedPacketExtension) {
                                List<PacketExtension> extensions = ((EmbeddedPacketExtension) event).getExtensions();
                                if (extensions.size() > 0 && extensions.get(0).getElementName().equals(this.secondElement)) {
                                    z = true;
                                }
                            }
                        }
                        z = false;
                    }
                }
            }
            return z;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator.class */
    public class ItemDeleteTranslator implements PacketListener {
        private ItemDeleteListener listener;

        public ItemDeleteTranslator(ItemDeleteListener itemDeleteListener) {
            Node.this = r4;
            this.listener = itemDeleteListener;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            EventElement eventElement = (EventElement) packet.getExtension("event", PubSubNamespace.EVENT.getXmlns());
            if (eventElement.getExtensions().get(0).getElementName().equals(PubSubElementType.PURGE_EVENT.getElementName())) {
                this.listener.handlePurge();
                return;
            }
            ItemsExtension itemsExtension = (ItemsExtension) eventElement.getEvent();
            List<? extends PacketExtension> items = itemsExtension.getItems();
            Iterator<? extends PacketExtension> it = items.iterator();
            ArrayList arrayList = new ArrayList(items.size());
            while (it.hasNext()) {
                arrayList.add(((RetractItem) it.next()).getId());
            }
            this.listener.handleDeletedItems(new ItemDeleteEvent(itemsExtension.getNode(), arrayList, Node.getSubscriptionIds(packet)));
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Node$ItemEventTranslator.class */
    public class ItemEventTranslator implements PacketListener {
        private ItemEventListener listener;

        public ItemEventTranslator(ItemEventListener itemEventListener) {
            Node.this = r4;
            this.listener = itemEventListener;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            ItemsExtension itemsExtension = (ItemsExtension) ((EventElement) packet.getExtension("event", PubSubNamespace.EVENT.getXmlns())).getEvent();
            DelayInformation delayInformation = (DelayInformation) packet.getExtension("delay", "urn:xmpp:delay");
            DelayInformation delayInformation2 = delayInformation;
            if (delayInformation == null) {
                delayInformation2 = (DelayInformation) packet.getExtension("x", "jabber:x:delay");
            }
            this.listener.handlePublishedItems(new ItemPublishEvent(itemsExtension.getNode(), itemsExtension.getItems(), Node.getSubscriptionIds(packet), delayInformation2 == null ? null : delayInformation2.getStamp()));
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Node$NodeConfigTranslator.class */
    public class NodeConfigTranslator implements PacketListener {
        private NodeConfigListener listener;

        public NodeConfigTranslator(NodeConfigListener nodeConfigListener) {
            Node.this = r4;
            this.listener = nodeConfigListener;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            this.listener.handleNodeConfiguration((ConfigurationEvent) ((EventElement) packet.getExtension("event", PubSubNamespace.EVENT.getXmlns())).getEvent());
        }
    }

    Node(Connection connection, String str) {
        this.con = connection;
        this.id = str;
    }

    public static List<String> getSubscriptionIds(Packet packet) {
        HeadersExtension headersExtension = (HeadersExtension) packet.getExtension("headers", HeadersExtension.NAMESPACE);
        ArrayList arrayList = null;
        if (headersExtension != null) {
            ArrayList arrayList2 = new ArrayList(headersExtension.getHeaders().size());
            Iterator<Header> it = headersExtension.getHeaders().iterator();
            while (true) {
                arrayList = arrayList2;
                if (!it.hasNext()) {
                    break;
                }
                arrayList2.add(it.next().getValue());
            }
        }
        return arrayList;
    }

    public void addConfigurationListener(NodeConfigListener nodeConfigListener) {
        NodeConfigTranslator nodeConfigTranslator = new NodeConfigTranslator(nodeConfigListener);
        this.configEventToListenerMap.put(nodeConfigListener, nodeConfigTranslator);
        this.con.addPacketListener(nodeConfigTranslator, new EventContentFilter(EventElementType.configuration.toString()));
    }

    public void addItemDeleteListener(ItemDeleteListener itemDeleteListener) {
        ItemDeleteTranslator itemDeleteTranslator = new ItemDeleteTranslator(itemDeleteListener);
        this.itemDeleteToListenerMap.put(itemDeleteListener, itemDeleteTranslator);
        this.con.addPacketListener(itemDeleteTranslator, new OrFilter(new EventContentFilter(EventElementType.items.toString(), "retract"), new EventContentFilter(EventElementType.purge.toString())));
    }

    public void addItemEventListener(ItemEventListener itemEventListener) {
        ItemEventTranslator itemEventTranslator = new ItemEventTranslator(itemEventListener);
        this.itemEventToListenerMap.put(itemEventListener, itemEventTranslator);
        this.con.addPacketListener(itemEventTranslator, new EventContentFilter(EventElementType.items.toString(), "item"));
    }

    protected PubSub createPubsubPacket(IQ.Type type, PacketExtension packetExtension) {
        return createPubsubPacket(type, packetExtension, null);
    }

    protected PubSub createPubsubPacket(IQ.Type type, PacketExtension packetExtension, PubSubNamespace pubSubNamespace) {
        return PubSubManager.createPubsubPacket(this.to, type, packetExtension, pubSubNamespace);
    }

    public DiscoverInfo discoverInfo() throws XMPPException {
        DiscoverInfo discoverInfo = new DiscoverInfo();
        discoverInfo.setTo(this.to);
        discoverInfo.setNode(getId());
        return (DiscoverInfo) SyncPacketSend.getReply(this.con, discoverInfo);
    }

    public String getId() {
        return this.id;
    }

    public ConfigureForm getNodeConfiguration() throws XMPPException {
        return NodeUtils.getFormFromPacket(sendPubsubPacket(IQ.Type.GET, new NodeExtension(PubSubElementType.CONFIGURE_OWNER, getId()), PubSubNamespace.OWNER), PubSubElementType.CONFIGURE_OWNER);
    }

    public SubscribeForm getSubscriptionOptions(String str) throws XMPPException {
        return getSubscriptionOptions(str, null);
    }

    public SubscribeForm getSubscriptionOptions(String str, String str2) throws XMPPException {
        return new SubscribeForm(((FormNode) ((PubSub) sendPubsubPacket(IQ.Type.GET, new OptionsExtension(str, getId(), str2))).getExtension(PubSubElementType.OPTIONS)).getForm());
    }

    public List<Subscription> getSubscriptions() throws XMPPException {
        return ((SubscriptionsExtension) ((PubSub) sendPubsubPacket(IQ.Type.GET, new NodeExtension(PubSubElementType.SUBSCRIPTIONS, getId()))).getExtension(PubSubElementType.SUBSCRIPTIONS)).getSubscriptions();
    }

    public void removeConfigurationListener(NodeConfigListener nodeConfigListener) {
        PacketListener remove = this.configEventToListenerMap.remove(nodeConfigListener);
        if (remove != null) {
            this.con.removePacketListener(remove);
        }
    }

    public void removeItemDeleteListener(ItemDeleteListener itemDeleteListener) {
        PacketListener remove = this.itemDeleteToListenerMap.remove(itemDeleteListener);
        if (remove != null) {
            this.con.removePacketListener(remove);
        }
    }

    public void removeItemEventListener(ItemEventListener itemEventListener) {
        PacketListener remove = this.itemEventToListenerMap.remove(itemEventListener);
        if (remove != null) {
            this.con.removePacketListener(remove);
        }
    }

    public void sendConfigurationForm(Form form) throws XMPPException {
        SyncPacketSend.getReply(this.con, createPubsubPacket(IQ.Type.SET, new FormNode(FormNodeType.CONFIGURE_OWNER, getId(), form), PubSubNamespace.OWNER));
    }

    protected Packet sendPubsubPacket(IQ.Type type, NodeExtension nodeExtension) throws XMPPException {
        return PubSubManager.sendPubsubPacket(this.con, this.to, type, nodeExtension);
    }

    protected Packet sendPubsubPacket(IQ.Type type, NodeExtension nodeExtension, PubSubNamespace pubSubNamespace) throws XMPPException {
        return PubSubManager.sendPubsubPacket(this.con, this.to, type, nodeExtension, pubSubNamespace);
    }

    void setTo(String str) {
        this.to = str;
    }

    public Subscription subscribe(String str) throws XMPPException {
        return (Subscription) ((PubSub) sendPubsubPacket(IQ.Type.SET, new SubscribeExtension(str, getId()))).getExtension(PubSubElementType.SUBSCRIPTION);
    }

    public Subscription subscribe(String str, SubscribeForm subscribeForm) throws XMPPException {
        PubSub createPubsubPacket = createPubsubPacket(IQ.Type.SET, new SubscribeExtension(str, getId()));
        createPubsubPacket.addExtension(new FormNode(FormNodeType.OPTIONS, subscribeForm));
        return (Subscription) ((PubSub) PubSubManager.sendPubsubPacket(this.con, str, IQ.Type.SET, createPubsubPacket)).getExtension(PubSubElementType.SUBSCRIPTION);
    }

    public String toString() {
        return super.toString() + " " + getClass().getName() + " id: " + this.id;
    }

    public void unsubscribe(String str) throws XMPPException {
        unsubscribe(str, null);
    }

    public void unsubscribe(String str, String str2) throws XMPPException {
        sendPubsubPacket(IQ.Type.SET, new UnsubscribeExtension(str, getId(), str2));
    }
}
