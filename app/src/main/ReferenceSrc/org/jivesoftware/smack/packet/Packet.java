package org.jivesoftware.smack.packet;

import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Packet.class */
public abstract class Packet {
    public static final String ID_NOT_AVAILABLE = "ID_NOT_AVAILABLE";
    private XMPPError error;
    private String from;
    private final List<PacketExtension> packetExtensions;
    private String packetID;
    private final Map<String, Object> properties;
    private String to;
    private String xmlns;
    protected static final String DEFAULT_LANGUAGE = Locale.getDefault().getLanguage().toLowerCase();
    private static String DEFAULT_XML_NS = null;
    private static String prefix = StringUtils.randomString(5) + "-";
    private static long id = 0;

    public Packet() {
        this.xmlns = DEFAULT_XML_NS;
        this.packetID = null;
        this.to = null;
        this.from = null;
        this.packetExtensions = new CopyOnWriteArrayList();
        this.properties = new HashMap();
        this.error = null;
    }

    public Packet(Packet packet) {
        this.xmlns = DEFAULT_XML_NS;
        this.packetID = null;
        this.to = null;
        this.from = null;
        this.packetExtensions = new CopyOnWriteArrayList();
        this.properties = new HashMap();
        this.error = null;
        this.packetID = packet.getPacketID();
        this.to = packet.getTo();
        this.from = packet.getFrom();
        this.xmlns = packet.xmlns;
        this.error = packet.error;
        for (PacketExtension packetExtension : packet.getExtensions()) {
            addExtension(packetExtension);
        }
    }

    public static String getDefaultLanguage() {
        return DEFAULT_LANGUAGE;
    }

    public static String nextID() {
        String sb;
        synchronized (Packet.class) {
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

    public static void setDefaultXmlns(String str) {
        DEFAULT_XML_NS = str;
    }

    public void addExtension(PacketExtension packetExtension) {
        if (packetExtension == null) {
            return;
        }
        this.packetExtensions.add(packetExtension);
    }

    public void addExtensions(Collection<PacketExtension> collection) {
        if (collection == null) {
            return;
        }
        this.packetExtensions.addAll(collection);
    }

    public void deleteProperty(String str) {
        synchronized (this) {
            if (this.properties != null) {
                this.properties.remove(str);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x003e, code lost:
        if (r3.error.equals(r0.error) != false) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0056, code lost:
        if (r3.from.equals(r0.from) != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x007f, code lost:
        if (r3.packetID.equals(r0.packetID) != false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0097, code lost:
        if (r3.properties.equals(r0.properties) != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00af, code lost:
        if (r3.to.equals(r0.to) != false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c7, code lost:
        if (r3.xmlns.equals(r0.xmlns) == false) goto L37;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else {
            z = false;
            if (obj != null) {
                z = false;
                if (getClass() == obj.getClass()) {
                    Packet packet = (Packet) obj;
                    if (this.error != null) {
                        z = false;
                    } else {
                        if (packet.error != null) {
                            z = false;
                        }
                        if (this.from != null) {
                            z = false;
                        } else {
                            if (packet.from != null) {
                                z = false;
                            }
                            z = false;
                            if (this.packetExtensions.equals(packet.packetExtensions)) {
                                if (this.packetID != null) {
                                    z = false;
                                } else {
                                    if (packet.packetID != null) {
                                        z = false;
                                    }
                                    if (this.properties != null) {
                                        z = false;
                                    } else {
                                        if (packet.properties != null) {
                                            z = false;
                                        }
                                        if (this.to != null) {
                                            z = false;
                                        } else {
                                            if (packet.to != null) {
                                                z = false;
                                            }
                                            if (this.xmlns != null) {
                                                z = true;
                                            } else {
                                                if (packet.xmlns == null) {
                                                    z = true;
                                                }
                                                z = false;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public XMPPError getError() {
        return this.error;
    }

    public PacketExtension getExtension(String str) {
        return getExtension(null, str);
    }

    public PacketExtension getExtension(String str, String str2) {
        PacketExtension packetExtension;
        if (str2 != null) {
            Iterator<PacketExtension> it = this.packetExtensions.iterator();
            while (true) {
                if (!it.hasNext()) {
                    packetExtension = null;
                    break;
                }
                PacketExtension next = it.next();
                if (str == null || str.equals(next.getElementName())) {
                    if (str2.equals(next.getNamespace())) {
                        packetExtension = next;
                        break;
                    }
                }
            }
        } else {
            packetExtension = null;
        }
        return packetExtension;
    }

    public Collection<PacketExtension> getExtensions() {
        List emptyList;
        synchronized (this) {
            emptyList = this.packetExtensions == null ? Collections.emptyList() : Collections.unmodifiableList(new ArrayList(this.packetExtensions));
        }
        return emptyList;
    }

    protected String getExtensionsXML() {
        String sb;
        Throwable th;
        Exception e;
        ByteArrayOutputStream byteArrayOutputStream;
        ObjectOutputStream objectOutputStream;
        synchronized (this) {
            StringBuilder sb2 = new StringBuilder();
            for (PacketExtension packetExtension : getExtensions()) {
                sb2.append(packetExtension.toXML());
            }
            if (this.properties != null && !this.properties.isEmpty()) {
                sb2.append("<properties xmlns=\"http://www.jivesoftware.com/xmlns/xmpp/properties\">");
                for (String str : getPropertyNames()) {
                    Object property = getProperty(str);
                    sb2.append("<property>");
                    sb2.append("<name>").append(StringUtils.escapeForXML(str)).append("</name>");
                    sb2.append("<value type=\"");
                    if (property instanceof Integer) {
                        sb2.append("integer\">").append(property).append("</value>");
                    } else if (property instanceof Long) {
                        sb2.append("long\">").append(property).append("</value>");
                    } else if (property instanceof Float) {
                        sb2.append("float\">").append(property).append("</value>");
                    } else if (property instanceof Double) {
                        sb2.append("double\">").append(property).append("</value>");
                    } else if (property instanceof Boolean) {
                        sb2.append("boolean\">").append(property).append("</value>");
                    } else if (property instanceof String) {
                        sb2.append("string\">");
                        sb2.append(StringUtils.escapeForXML((String) property));
                        sb2.append("</value>");
                    } else {
                        ObjectOutputStream objectOutputStream2 = null;
                        ByteArrayOutputStream byteArrayOutputStream2 = null;
                        ObjectOutputStream objectOutputStream3 = null;
                        try {
                            try {
                                byteArrayOutputStream = new ByteArrayOutputStream();
                                try {
                                    objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
                                } catch (Exception e2) {
                                    e = e2;
                                } catch (Throwable th2) {
                                    byteArrayOutputStream2 = byteArrayOutputStream;
                                    objectOutputStream3 = null;
                                    th = th2;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        } catch (Exception e3) {
                            e = e3;
                            byteArrayOutputStream = null;
                        }
                        try {
                            objectOutputStream.writeObject(property);
                            sb2.append("java-object\">");
                            sb2.append(StringUtils.encodeBase64(byteArrayOutputStream.toByteArray())).append("</value>");
                            if (objectOutputStream != null) {
                                try {
                                    objectOutputStream.close();
                                } catch (Exception e4) {
                                }
                            }
                            if (byteArrayOutputStream != null) {
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e5) {
                                }
                            }
                        } catch (Exception e6) {
                            e = e6;
                            objectOutputStream2 = objectOutputStream;
                            e.printStackTrace();
                            if (objectOutputStream2 != null) {
                                try {
                                    objectOutputStream2.close();
                                } catch (Exception e7) {
                                }
                            }
                            if (byteArrayOutputStream != null) {
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e8) {
                                }
                            }
                            sb2.append("</property>");
                        } catch (Throwable th4) {
                            objectOutputStream3 = objectOutputStream;
                            byteArrayOutputStream2 = byteArrayOutputStream;
                            th = th4;
                            if (objectOutputStream3 != null) {
                                try {
                                    objectOutputStream3.close();
                                } catch (Exception e9) {
                                }
                            }
                            if (byteArrayOutputStream2 != null) {
                                try {
                                    byteArrayOutputStream2.close();
                                } catch (Exception e10) {
                                }
                            }
                            throw th;
                        }
                    }
                    sb2.append("</property>");
                }
                sb2.append("</properties>");
            }
            sb = sb2.toString();
        }
        return sb;
    }

    public String getFrom() {
        return this.from;
    }

    public String getPacketID() {
        String str;
        if (ID_NOT_AVAILABLE.equals(this.packetID)) {
            str = null;
        } else {
            if (this.packetID == null) {
                this.packetID = nextID();
            }
            str = this.packetID;
        }
        return str;
    }

    public Object getProperty(String str) {
        Object obj;
        synchronized (this) {
            obj = this.properties == null ? null : this.properties.get(str);
        }
        return obj;
    }

    public Collection<String> getPropertyNames() {
        Set emptySet;
        synchronized (this) {
            emptySet = this.properties == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashSet(this.properties.keySet()));
        }
        return emptySet;
    }

    public String getTo() {
        return this.to;
    }

    public String getXmlns() {
        return this.xmlns;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = this.xmlns != null ? this.xmlns.hashCode() : 0;
        int hashCode2 = this.packetID != null ? this.packetID.hashCode() : 0;
        int hashCode3 = this.to != null ? this.to.hashCode() : 0;
        int hashCode4 = this.from != null ? this.from.hashCode() : 0;
        int hashCode5 = this.packetExtensions.hashCode();
        int hashCode6 = this.properties.hashCode();
        if (this.error != null) {
            i = this.error.hashCode();
        }
        return (((((((((((hashCode * 31) + hashCode2) * 31) + hashCode3) * 31) + hashCode4) * 31) + hashCode5) * 31) + hashCode6) * 31) + i;
    }

    public void removeExtension(PacketExtension packetExtension) {
        this.packetExtensions.remove(packetExtension);
    }

    public void setError(XMPPError xMPPError) {
        this.error = xMPPError;
    }

    public void setFrom(String str) {
        this.from = str;
    }

    public void setPacketID(String str) {
        this.packetID = str;
    }

    public void setProperty(String str, Object obj) {
        synchronized (this) {
            if (!(obj instanceof Serializable)) {
                throw new IllegalArgumentException("Value must be serialiazble");
            }
            this.properties.put(str, obj);
        }
    }

    public void setTo(String str) {
        this.to = str;
    }

    public abstract String toXML();
}
