package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/OfflineMessageRequest.class */
public class OfflineMessageRequest extends IQ {
    private List<Item> items = new ArrayList();
    private boolean purge = false;
    private boolean fetch = false;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/OfflineMessageRequest$Item.class */
    public static class Item {
        private String action;
        private String jid;
        private String node;

        public Item(String str) {
            this.node = str;
        }

        public String getAction() {
            return this.action;
        }

        public String getJid() {
            return this.jid;
        }

        public String getNode() {
            return this.node;
        }

        public void setAction(String str) {
            this.action = str;
        }

        public void setJid(String str) {
            this.jid = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<item");
            if (getAction() != null) {
                sb.append(" action=\"").append(getAction()).append("\"");
            }
            if (getJid() != null) {
                sb.append(" jid=\"").append(getJid()).append("\"");
            }
            if (getNode() != null) {
                sb.append(" node=\"").append(getNode()).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/OfflineMessageRequest$Provider.class */
    public static class Provider implements IQProvider {
        private Item parseItem(XmlPullParser xmlPullParser) throws Exception {
            boolean z = false;
            Item item = new Item(xmlPullParser.getAttributeValue("", "node"));
            item.setAction(xmlPullParser.getAttributeValue("", "action"));
            item.setJid(xmlPullParser.getAttributeValue("", "jid"));
            while (!z) {
                if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals("item")) {
                    z = true;
                }
            }
            return item;
        }

        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            OfflineMessageRequest offlineMessageRequest = new OfflineMessageRequest();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("item")) {
                        offlineMessageRequest.addItem(parseItem(xmlPullParser));
                    } else if (xmlPullParser.getName().equals("purge")) {
                        offlineMessageRequest.setPurge(true);
                    } else if (xmlPullParser.getName().equals("fetch")) {
                        offlineMessageRequest.setFetch(true);
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(MessageEvent.OFFLINE)) {
                    z = true;
                }
            }
            return offlineMessageRequest;
        }
    }

    public void addItem(Item item) {
        synchronized (this.items) {
            this.items.add(item);
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<offline xmlns=\"http://jabber.org/protocol/offline\">");
        synchronized (this.items) {
            for (int i = 0; i < this.items.size(); i++) {
                sb.append(this.items.get(i).toXML());
            }
        }
        if (this.purge) {
            sb.append("<purge/>");
        }
        if (this.fetch) {
            sb.append("<fetch/>");
        }
        sb.append(getExtensionsXML());
        sb.append("</offline>");
        return sb.toString();
    }

    public Iterator<Item> getItems() {
        Iterator<Item> it;
        synchronized (this.items) {
            it = Collections.unmodifiableList(new ArrayList(this.items)).iterator();
        }
        return it;
    }

    public boolean isFetch() {
        return this.fetch;
    }

    public boolean isPurge() {
        return this.purge;
    }

    public void setFetch(boolean z) {
        this.fetch = z;
    }

    public void setPurge(boolean z) {
        this.purge = z;
    }
}
