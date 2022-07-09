package org.jivesoftware.smackx.packet;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DiscoverInfo.class */
public class DiscoverInfo extends IQ {
    public static final String NAMESPACE = "http://jabber.org/protocol/disco#info";
    private final List<Feature> features = new CopyOnWriteArrayList();
    private final List<Identity> identities = new CopyOnWriteArrayList();
    private String node;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/DiscoverInfo$Feature.class */
    public static class Feature {
        private String variable;

        public Feature(String str) {
            if (str == null) {
                throw new IllegalArgumentException("variable cannot be null");
            }
            this.variable = str;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (obj != null) {
                if (obj == this) {
                    z = true;
                } else if (obj.getClass() == getClass()) {
                    z = this.variable.equals(((Feature) obj).variable);
                }
            }
            return z;
        }

        public String getVar() {
            return this.variable;
        }

        public int hashCode() {
            return this.variable.hashCode() * 37;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<feature var=\"").append(StringUtils.escapeForXML(this.variable)).append("\"/>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/DiscoverInfo$Identity.class */
    public static class Identity implements Comparable<Identity> {
        private String category;
        private String lang;
        private String name;
        private String type;

        public Identity(String str, String str2) {
            this.category = str;
            this.name = str2;
        }

        public Identity(String str, String str2, String str3) {
            if (str == null || str3 == null) {
                throw new IllegalArgumentException("category and type cannot be null");
            }
            this.category = str;
            this.name = str2;
            this.type = str3;
        }

        public int compareTo(Identity identity) {
            String str = identity.lang == null ? "" : identity.lang;
            String str2 = this.lang == null ? "" : this.lang;
            String str3 = identity.type == null ? "" : identity.type;
            String str4 = this.type == null ? "" : this.type;
            return this.category.equals(identity.category) ? str4.equals(str3) ? str2.equals(str) ? 0 : str2.compareTo(str) : str4.compareTo(str3) : this.category.compareTo(identity.category);
        }

        public boolean equals(Object obj) {
            boolean z;
            if (obj == null) {
                z = false;
            } else if (obj == this) {
                z = true;
            } else {
                z = false;
                if (obj.getClass() == getClass()) {
                    Identity identity = (Identity) obj;
                    z = false;
                    if (this.category.equals(identity.category)) {
                        z = false;
                        if ((identity.lang == null ? "" : identity.lang).equals(this.lang == null ? "" : this.lang)) {
                            z = false;
                            if ((identity.type == null ? "" : identity.type).equals(this.type == null ? "" : this.type)) {
                                z = false;
                                if ((this.name == null ? "" : identity.name).equals(identity.name == null ? "" : identity.name)) {
                                    z = true;
                                }
                            }
                        }
                    }
                }
            }
            return z;
        }

        public String getCategory() {
            return this.category;
        }

        public String getLanguage() {
            return this.lang;
        }

        public String getName() {
            return this.name;
        }

        public String getType() {
            return this.type;
        }

        public int hashCode() {
            int i = 0;
            int hashCode = this.category.hashCode();
            int hashCode2 = this.lang == null ? 0 : this.lang.hashCode();
            int hashCode3 = this.type == null ? 0 : this.type.hashCode();
            if (this.name != null) {
                i = this.name.hashCode();
            }
            return ((((((hashCode + 37) * 37) + hashCode2) * 37) + hashCode3) * 37) + i;
        }

        public void setLanguage(String str) {
            this.lang = str;
        }

        public void setType(String str) {
            this.type = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<identity");
            if (this.lang != null) {
                sb.append(" xml:lang=\"").append(StringUtils.escapeForXML(this.lang)).append("\"");
            }
            sb.append(" category=\"").append(StringUtils.escapeForXML(this.category)).append("\"");
            sb.append(" name=\"").append(StringUtils.escapeForXML(this.name)).append("\"");
            if (this.type != null) {
                sb.append(" type=\"").append(StringUtils.escapeForXML(this.type)).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    public DiscoverInfo() {
    }

    public DiscoverInfo(DiscoverInfo discoverInfo) {
        super(discoverInfo);
        setNode(discoverInfo.getNode());
        synchronized (discoverInfo.features) {
            for (Feature feature : discoverInfo.features) {
                addFeature(feature);
            }
        }
        synchronized (discoverInfo.identities) {
            for (Identity identity : discoverInfo.identities) {
                addIdentity(identity);
            }
        }
    }

    private void addFeature(Feature feature) {
        synchronized (this.features) {
            this.features.add(feature);
        }
    }

    public void addFeature(String str) {
        addFeature(new Feature(str));
    }

    public void addFeatures(Collection<String> collection) {
        if (collection == null) {
            return;
        }
        for (String str : collection) {
            addFeature(str);
        }
    }

    public void addIdentities(Collection<Identity> collection) {
        if (collection == null) {
            return;
        }
        synchronized (this.identities) {
            this.identities.addAll(collection);
        }
    }

    public void addIdentity(Identity identity) {
        synchronized (this.identities) {
            this.identities.add(identity);
        }
    }

    public boolean containsDuplicateFeatures() {
        boolean z;
        LinkedList<Feature> linkedList = new LinkedList();
        Iterator<Feature> it = this.features.iterator();
        loop0: while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            Feature next = it.next();
            for (Feature feature : linkedList) {
                if (next.equals(feature)) {
                    z = true;
                    break loop0;
                }
            }
            linkedList.add(next);
        }
        return z;
    }

    public boolean containsDuplicateIdentities() {
        boolean z;
        LinkedList<Identity> linkedList = new LinkedList();
        Iterator<Identity> it = this.identities.iterator();
        loop0: while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            Identity next = it.next();
            for (Identity identity : linkedList) {
                if (next.equals(identity)) {
                    z = true;
                    break loop0;
                }
            }
            linkedList.add(next);
        }
        return z;
    }

    public boolean containsFeature(String str) {
        boolean z;
        Iterator<Feature> features = getFeatures();
        while (true) {
            if (!features.hasNext()) {
                z = false;
                break;
            } else if (str.equals(features.next().getVar())) {
                z = true;
                break;
            }
        }
        return z;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"http://jabber.org/protocol/disco#info\"");
        if (getNode() != null) {
            sb.append(" node=\"");
            sb.append(StringUtils.escapeForXML(getNode()));
            sb.append("\"");
        }
        sb.append(">");
        synchronized (this.identities) {
            for (Identity identity : this.identities) {
                sb.append(identity.toXML());
            }
        }
        synchronized (this.features) {
            for (Feature feature : this.features) {
                sb.append(feature.toXML());
            }
        }
        sb.append(getExtensionsXML());
        sb.append("</query>");
        return sb.toString();
    }

    public Iterator<Feature> getFeatures() {
        Iterator<Feature> it;
        synchronized (this.features) {
            it = Collections.unmodifiableList(this.features).iterator();
        }
        return it;
    }

    public Iterator<Identity> getIdentities() {
        Iterator<Identity> it;
        synchronized (this.identities) {
            it = Collections.unmodifiableList(this.identities).iterator();
        }
        return it;
    }

    public String getNode() {
        return this.node;
    }

    public void setNode(String str) {
        this.node = str;
    }
}
