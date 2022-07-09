package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContent.class */
public class JingleContent implements PacketExtension {
    public static final String CREATOR = "creator";
    public static final String NAME = "name";
    public static final String NODENAME = "content";
    private String creator;
    private JingleDescription description;
    private String name;
    private final List<JingleTransport> transports = new ArrayList();

    public JingleContent(String str, String str2) {
        this.creator = str;
        this.name = str2;
    }

    public void addJingleTransport(JingleTransport jingleTransport) {
        synchronized (this.transports) {
            this.transports.add(jingleTransport);
        }
    }

    public void addTransports(List<JingleTransport> list) {
        synchronized (list) {
            for (JingleTransport jingleTransport : list) {
                addJingleTransport(jingleTransport);
            }
        }
    }

    public String getCreator() {
        return this.creator;
    }

    public JingleDescription getDescription() {
        return this.description;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return NODENAME;
    }

    public Iterator<JingleTransport> getJingleTransports() {
        return Collections.unmodifiableList(getJingleTransportsList()).iterator();
    }

    public int getJingleTransportsCount() {
        int size;
        synchronized (this.transports) {
            size = this.transports.size();
        }
        return size;
    }

    public List<JingleTransport> getJingleTransportsList() {
        ArrayList arrayList;
        synchronized (this.transports) {
            arrayList = new ArrayList(this.transports);
        }
        return arrayList;
    }

    public String getName() {
        return this.name;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "";
    }

    public void setDescription(JingleDescription jingleDescription) {
        this.description = jingleDescription;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        synchronized (this.transports) {
            sb.append("<").append(getElementName());
            sb.append(" creator='" + this.creator + "' name='" + this.name + "'>");
            if (this.description != null) {
                sb.append(this.description.toXML());
            }
            for (JingleTransport jingleTransport : this.transports) {
                sb.append(jingleTransport.toXML());
            }
            sb.append("</").append(getElementName()).append(">");
        }
        return sb.toString();
    }
}
