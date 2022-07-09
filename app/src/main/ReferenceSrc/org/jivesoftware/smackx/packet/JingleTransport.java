package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.jingle.nat.ICECandidate;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport.class */
public class JingleTransport implements PacketExtension {
    public static final String NODENAME = "transport";
    protected final List<JingleTransportCandidate> candidates = new ArrayList();
    protected String namespace;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport$Ice.class */
    public static class Ice extends JingleTransport {
        public static final String NAMESPACE = "urn:xmpp:tmp:jingle:transports:ice-udp";

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport$Ice$Candidate.class */
        public static class Candidate extends JingleTransportCandidate {
            public Candidate() {
            }

            public Candidate(TransportCandidate transportCandidate) {
                super(transportCandidate);
            }

            @Override // org.jivesoftware.smackx.packet.JingleTransport.JingleTransportCandidate
            protected String getChildElements() {
                StringBuilder sb = new StringBuilder();
                if (this.transportCandidate != null) {
                    ICECandidate iCECandidate = (ICECandidate) this.transportCandidate;
                    sb.append(" generation=\"").append(iCECandidate.getGeneration()).append("\"");
                    sb.append(" ip=\"").append(iCECandidate.getIp()).append("\"");
                    sb.append(" port=\"").append(iCECandidate.getPort()).append("\"");
                    sb.append(" network=\"").append(iCECandidate.getNetwork()).append("\"");
                    sb.append(" username=\"").append(iCECandidate.getUsername()).append("\"");
                    sb.append(" password=\"").append(iCECandidate.getPassword()).append("\"");
                    sb.append(" preference=\"").append(iCECandidate.getPreference()).append("\"");
                    sb.append(" type=\"").append(iCECandidate.getType()).append("\"");
                    if (this.transportCandidate.getName() != null) {
                        sb.append(" name=\"").append(iCECandidate.getName()).append("\"");
                    }
                }
                return sb.toString();
            }
        }

        public Ice() {
            setNamespace(NAMESPACE);
        }

        @Override // org.jivesoftware.smackx.packet.JingleTransport
        public void addCandidate(JingleTransportCandidate jingleTransportCandidate) {
            super.addCandidate(jingleTransportCandidate);
        }

        @Override // org.jivesoftware.smackx.packet.JingleTransport
        public List<JingleTransportCandidate> getCandidatesList() {
            ArrayList arrayList = new ArrayList();
            List<JingleTransportCandidate> candidatesList = super.getCandidatesList();
            for (int i = 0; i < candidatesList.size(); i++) {
                arrayList.add(candidatesList.get(i));
            }
            return arrayList;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate.class */
    public static abstract class JingleTransportCandidate {
        public static final String NODENAME = "candidate";
        protected TransportCandidate transportCandidate;

        public JingleTransportCandidate() {
        }

        public JingleTransportCandidate(TransportCandidate transportCandidate) {
            setMediaTransport(transportCandidate);
        }

        public static String getElementName() {
            return NODENAME;
        }

        protected String getChildElements() {
            return null;
        }

        public TransportCandidate getMediaTransport() {
            return this.transportCandidate;
        }

        public void setMediaTransport(TransportCandidate transportCandidate) {
            if (transportCandidate != null) {
                this.transportCandidate = transportCandidate;
            }
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            String childElements = getChildElements();
            if (this.transportCandidate != null && childElements != null) {
                sb.append("<").append(getElementName()).append(" ");
                sb.append(childElements);
                sb.append("/>");
            }
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport$RawUdp.class */
    public static class RawUdp extends JingleTransport {
        public static final String NAMESPACE = "http://www.xmpp.org/extensions/xep-0177.html#ns";

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleTransport$RawUdp$Candidate.class */
        public static class Candidate extends JingleTransportCandidate {
            public Candidate() {
            }

            public Candidate(TransportCandidate transportCandidate) {
                super(transportCandidate);
            }

            @Override // org.jivesoftware.smackx.packet.JingleTransport.JingleTransportCandidate
            protected String getChildElements() {
                StringBuilder sb = new StringBuilder();
                if (this.transportCandidate != null && (this.transportCandidate instanceof TransportCandidate.Fixed)) {
                    TransportCandidate.Fixed fixed = (TransportCandidate.Fixed) this.transportCandidate;
                    sb.append(" generation=\"").append(fixed.getGeneration()).append("\"");
                    sb.append(" ip=\"").append(fixed.getIp()).append("\"");
                    sb.append(" port=\"").append(fixed.getPort()).append("\"");
                    String name = fixed.getName();
                    if (name != null) {
                        sb.append(" name=\"").append(name).append("\"");
                    }
                }
                return sb.toString();
            }
        }

        public RawUdp() {
            setNamespace(NAMESPACE);
        }

        @Override // org.jivesoftware.smackx.packet.JingleTransport
        public void addCandidate(JingleTransportCandidate jingleTransportCandidate) {
            this.candidates.clear();
            super.addCandidate(jingleTransportCandidate);
        }

        @Override // org.jivesoftware.smackx.packet.JingleTransport
        public List<JingleTransportCandidate> getCandidatesList() {
            ArrayList arrayList = new ArrayList();
            List<JingleTransportCandidate> candidatesList = super.getCandidatesList();
            if (candidatesList.size() > 0) {
                arrayList.add(candidatesList.get(0));
            }
            return arrayList;
        }
    }

    public JingleTransport() {
    }

    public JingleTransport(JingleTransportCandidate jingleTransportCandidate) {
        addCandidate(jingleTransportCandidate);
    }

    public JingleTransport(JingleTransport jingleTransport) {
        if (jingleTransport != null) {
            this.namespace = jingleTransport.namespace;
            if (jingleTransport.candidates.size() <= 0) {
                return;
            }
            this.candidates.addAll(jingleTransport.candidates);
        }
    }

    public void addCandidate(JingleTransportCandidate jingleTransportCandidate) {
        if (jingleTransportCandidate != null) {
            synchronized (this.candidates) {
                this.candidates.add(jingleTransportCandidate);
            }
        }
    }

    public Iterator<JingleTransportCandidate> getCandidates() {
        return Collections.unmodifiableList(getCandidatesList()).iterator();
    }

    public int getCandidatesCount() {
        return getCandidatesList().size();
    }

    public List<JingleTransportCandidate> getCandidatesList() {
        Throwable th;
        ArrayList arrayList;
        synchronized (this.candidates) {
            try {
                arrayList = new ArrayList(this.candidates);
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                return arrayList;
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "transport";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.namespace;
    }

    protected void setNamespace(String str) {
        this.namespace = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"");
        sb.append(getNamespace()).append("\" ");
        synchronized (this.candidates) {
            if (getCandidatesCount() > 0) {
                sb.append(">");
                Iterator<JingleTransportCandidate> candidates = getCandidates();
                while (candidates.hasNext()) {
                    sb.append(candidates.next().toXML());
                }
                sb.append("</").append(getElementName()).append(">");
            } else {
                sb.append("/>");
            }
        }
        return sb.toString();
    }
}
