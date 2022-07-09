package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleDescription.class */
public abstract class JingleDescription implements PacketExtension {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleDescription.class);
    public static final String NODENAME = "description";
    private final List<PayloadType> payloads = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleDescription$Audio.class */
    public static class Audio extends JingleDescription {
        public static final String NAMESPACE = "urn:xmpp:tmp:jingle:apps:rtp";

        public Audio() {
        }

        public Audio(PayloadType payloadType) {
            addPayloadType(payloadType);
        }

        @Override // org.jivesoftware.smackx.packet.JingleDescription, org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "urn:xmpp:tmp:jingle:apps:rtp";
        }
    }

    public void addAudioPayloadTypes(List<PayloadType> list) {
        synchronized (this.payloads) {
            Iterator<PayloadType> it = list.iterator();
            while (it.hasNext()) {
                addPayloadType(new PayloadType.Audio((PayloadType.Audio) it.next()));
            }
        }
    }

    public void addPayloadType(PayloadType payloadType) {
        synchronized (this.payloads) {
            if (payloadType == null) {
                LOGGER.error("Null payload type");
            } else {
                this.payloads.add(payloadType);
            }
        }
    }

    public List<PayloadType> getAudioPayloadTypesList() {
        ArrayList arrayList = new ArrayList();
        Iterator<PayloadType> payloadTypes = getPayloadTypes();
        while (payloadTypes.hasNext()) {
            PayloadType next = payloadTypes.next();
            if (next instanceof PayloadType.Audio) {
                arrayList.add((PayloadType.Audio) next);
            }
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "description";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public abstract String getNamespace();

    public Iterator<PayloadType> getPayloadTypes() {
        return Collections.unmodifiableList(getPayloadTypesList()).iterator();
    }

    public int getPayloadTypesCount() {
        int size;
        synchronized (this.payloads) {
            size = this.payloads.size();
        }
        return size;
    }

    public List<PayloadType> getPayloadTypesList() {
        ArrayList arrayList;
        synchronized (this.payloads) {
            arrayList = new ArrayList(this.payloads);
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        synchronized (this.payloads) {
            if (this.payloads.size() > 0) {
                sb.append("<").append(getElementName());
                sb.append(" xmlns=\"").append(getNamespace()).append("\" >");
                for (PayloadType payloadType : this.payloads) {
                    if (payloadType != null) {
                        sb.append(payloadType.toXML());
                    }
                }
                sb.append("</").append(getElementName()).append(">");
            }
        }
        return sb.toString();
    }
}
