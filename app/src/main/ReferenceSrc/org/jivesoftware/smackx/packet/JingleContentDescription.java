package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentDescription.class */
public abstract class JingleContentDescription implements PacketExtension {
    public static final String NODENAME = "description";
    private final List<JinglePayloadType> payloads = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentDescription$Audio.class */
    public static class Audio extends JingleContentDescription {
        public static final String NAMESPACE = "urn:xmpp:tmp:jingle:apps:rtp";

        public Audio() {
        }

        public Audio(JinglePayloadType jinglePayloadType) {
            addJinglePayloadType(jinglePayloadType);
        }

        @Override // org.jivesoftware.smackx.packet.JingleContentDescription, org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "urn:xmpp:tmp:jingle:apps:rtp";
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType.class */
    public static class JinglePayloadType {
        public static final String NODENAME = "payload-type";
        private PayloadType payload;

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio.class */
        public static class Audio extends JinglePayloadType {
            public Audio(PayloadType.Audio audio) {
                super(audio);
            }

            @Override // org.jivesoftware.smackx.packet.JingleContentDescription.JinglePayloadType
            protected String getChildAttributes() {
                StringBuilder sb = new StringBuilder();
                PayloadType payloadType = getPayloadType();
                if (payloadType instanceof PayloadType.Audio) {
                    sb.append(" clockrate=\"").append(((PayloadType.Audio) payloadType).getClockRate()).append("\" ");
                }
                return sb.toString();
            }
        }

        public JinglePayloadType() {
            this(null);
        }

        public JinglePayloadType(PayloadType payloadType) {
            this.payload = payloadType;
        }

        public static String getElementName() {
            return "payload-type";
        }

        protected String getChildAttributes() {
            return null;
        }

        public PayloadType getPayloadType() {
            return this.payload;
        }

        public void setPayload(PayloadType payloadType) {
            this.payload = payloadType;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            if (this.payload != null) {
                sb.append("<").append(getElementName()).append(" ");
                if (this.payload.getId() != PayloadType.INVALID_PT) {
                    sb.append(" id=\"").append(this.payload.getId()).append("\"");
                }
                if (this.payload.getName() != null) {
                    sb.append(" name=\"").append(this.payload.getName()).append("\"");
                }
                if (this.payload.getChannels() != 0) {
                    sb.append(" channels=\"").append(this.payload.getChannels()).append("\"");
                }
                if (getChildAttributes() != null) {
                    sb.append(getChildAttributes());
                }
                sb.append("/>");
            }
            return sb.toString();
        }
    }

    public void addAudioPayloadTypes(List<PayloadType.Audio> list) {
        synchronized (this.payloads) {
            for (PayloadType.Audio audio : list) {
                addJinglePayloadType(new JinglePayloadType.Audio(audio));
            }
        }
    }

    public void addJinglePayloadType(JinglePayloadType jinglePayloadType) {
        synchronized (this.payloads) {
            this.payloads.add(jinglePayloadType);
        }
    }

    public ArrayList<PayloadType.Audio> getAudioPayloadTypesList() {
        ArrayList<PayloadType.Audio> arrayList = new ArrayList<>();
        Iterator<JinglePayloadType> jinglePayloadTypes = getJinglePayloadTypes();
        while (jinglePayloadTypes.hasNext()) {
            JinglePayloadType next = jinglePayloadTypes.next();
            if (next instanceof JinglePayloadType.Audio) {
                arrayList.add((PayloadType.Audio) ((JinglePayloadType.Audio) next).getPayloadType());
            }
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "description";
    }

    public Iterator<JinglePayloadType> getJinglePayloadTypes() {
        return Collections.unmodifiableList(getJinglePayloadTypesList()).iterator();
    }

    public int getJinglePayloadTypesCount() {
        int size;
        synchronized (this.payloads) {
            size = this.payloads.size();
        }
        return size;
    }

    public ArrayList<JinglePayloadType> getJinglePayloadTypesList() {
        ArrayList<JinglePayloadType> arrayList;
        synchronized (this.payloads) {
            arrayList = new ArrayList<>(this.payloads);
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public abstract String getNamespace();

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        synchronized (this.payloads) {
            if (this.payloads.size() > 0) {
                sb.append("<").append(getElementName());
                sb.append(" xmlns=\"").append(getNamespace()).append("\" >");
                ListIterator<JinglePayloadType> listIterator = this.payloads.listIterator();
                while (listIterator.hasNext()) {
                    sb.append(listIterator.next().toXML());
                }
                sb.append("</").append(getElementName()).append(">");
            }
        }
        return sb.toString();
    }
}
