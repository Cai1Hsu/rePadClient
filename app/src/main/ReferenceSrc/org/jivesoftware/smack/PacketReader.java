package org.jivesoftware.smack;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import org.apache.http.cookie.ClientCookie;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;
import org.jivesoftware.smackx.workgroup.packet.SessionID;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smack/PacketReader.class */
class PacketReader {
    private XMPPConnection connection;
    private String connectionID = null;
    volatile boolean done;
    private ExecutorService listenerExecutor;
    private XmlPullParser parser;
    private Thread readerThread;

    /* loaded from: classes.jar:org/jivesoftware/smack/PacketReader$ListenerNotification.class */
    private class ListenerNotification implements Runnable {
        private Packet packet;

        public ListenerNotification(Packet packet) {
            PacketReader.this = r4;
            this.packet = packet;
        }

        @Override // java.lang.Runnable
        public void run() {
            for (Connection.ListenerWrapper listenerWrapper : PacketReader.this.connection.recvListeners.values()) {
                listenerWrapper.notifyListener(this.packet);
            }
        }
    }

    protected PacketReader(XMPPConnection xMPPConnection) {
        this.connection = xMPPConnection;
        init();
    }

    private void parseFeatures(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        while (!z3) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("starttls")) {
                    z = true;
                } else if (xmlPullParser.getName().equals("mechanisms")) {
                    this.connection.getSASLAuthentication().setAvailableSASLMethods(PacketParserUtils.parseMechanisms(xmlPullParser));
                } else if (xmlPullParser.getName().equals("bind")) {
                    this.connection.getSASLAuthentication().bindingRequired();
                } else if (xmlPullParser.getName().equals(EntityCapsManager.ELEMENT)) {
                    String attributeValue = xmlPullParser.getAttributeValue(null, "node");
                    String attributeValue2 = xmlPullParser.getAttributeValue(null, "ver");
                    if (attributeValue2 != null && attributeValue != null) {
                        this.connection.setServiceCapsNode(attributeValue + "#" + attributeValue2);
                    }
                } else if (xmlPullParser.getName().equals(SessionID.ELEMENT_NAME)) {
                    this.connection.getSASLAuthentication().sessionsSupported();
                } else if (xmlPullParser.getName().equals("compression")) {
                    this.connection.setAvailableCompressionMethods(PacketParserUtils.parseCompressionMethods(xmlPullParser));
                } else if (xmlPullParser.getName().equals("register")) {
                    this.connection.getAccountManager().setSupportsAccountCreation(true);
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("starttls")) {
                    this.connection.startTLSReceived(z2);
                } else if (xmlPullParser.getName().equals("required") && z) {
                    z2 = true;
                } else if (xmlPullParser.getName().equals("features")) {
                    z3 = true;
                }
            }
        }
        if (this.connection.isSecureConnection() || z || this.connection.getConfiguration().getSecurityMode() != ConnectionConfiguration.SecurityMode.required) {
            if (z && this.connection.getConfiguration().getSecurityMode() != ConnectionConfiguration.SecurityMode.disabled) {
                return;
            }
            releaseConnectionIDLock();
            return;
        }
        throw new XMPPException("Server does not support security (TLS), but security required by connection configuration.", new XMPPError(XMPPError.Condition.forbidden));
    }

    public void parsePackets(Thread thread) {
        try {
            int eventType = this.parser.getEventType();
            do {
                if (eventType == 2) {
                    if (this.parser.getName().equals("message")) {
                        processPacket(PacketParserUtils.parseMessage(this.parser));
                    } else if (this.parser.getName().equals("iq")) {
                        processPacket(PacketParserUtils.parseIQ(this.parser, this.connection));
                    } else if (this.parser.getName().equals("presence")) {
                        processPacket(PacketParserUtils.parsePresence(this.parser));
                    } else if (this.parser.getName().equals("stream")) {
                        if ("jabber:client".equals(this.parser.getNamespace(null))) {
                            for (int i = 0; i < this.parser.getAttributeCount(); i++) {
                                if (this.parser.getAttributeName(i).equals("id")) {
                                    this.connectionID = this.parser.getAttributeValue(i);
                                    if (!"1.0".equals(this.parser.getAttributeValue("", ClientCookie.VERSION_ATTR))) {
                                        releaseConnectionIDLock();
                                    }
                                } else if (this.parser.getAttributeName(i).equals(PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM)) {
                                    this.connection.config.setServiceName(this.parser.getAttributeValue(i));
                                }
                            }
                        }
                    } else if (this.parser.getName().equals("error")) {
                        throw new XMPPException(PacketParserUtils.parseStreamError(this.parser));
                    } else {
                        if (this.parser.getName().equals("features")) {
                            parseFeatures(this.parser);
                        } else if (this.parser.getName().equals("proceed")) {
                            this.connection.proceedTLSReceived();
                            resetParser();
                        } else if (this.parser.getName().equals("failure")) {
                            String namespace = this.parser.getNamespace(null);
                            if ("urn:ietf:params:xml:ns:xmpp-tls".equals(namespace)) {
                                throw new Exception("TLS negotiation has failed");
                            }
                            if ("http://jabber.org/protocol/compress".equals(namespace)) {
                                this.connection.streamCompressionDenied();
                            } else {
                                SASLMechanism.Failure parseSASLFailure = PacketParserUtils.parseSASLFailure(this.parser);
                                processPacket(parseSASLFailure);
                                this.connection.getSASLAuthentication().authenticationFailed(parseSASLFailure.getCondition());
                            }
                        } else if (this.parser.getName().equals("challenge")) {
                            String nextText = this.parser.nextText();
                            processPacket(new SASLMechanism.Challenge(nextText));
                            this.connection.getSASLAuthentication().challengeReceived(nextText);
                        } else if (this.parser.getName().equals("success")) {
                            processPacket(new SASLMechanism.Success(this.parser.nextText()));
                            this.connection.packetWriter.openStream();
                            resetParser();
                            this.connection.getSASLAuthentication().authenticated();
                        } else if (this.parser.getName().equals("compressed")) {
                            this.connection.startStreamCompression();
                            resetParser();
                        }
                    }
                } else if (eventType == 3 && this.parser.getName().equals("stream")) {
                    this.connection.disconnect();
                }
                eventType = this.parser.next();
                if (this.done || eventType == 1) {
                    return;
                }
            } while (thread == this.readerThread);
        } catch (Exception e) {
            if (this.done || this.connection.isSocketClosed()) {
                return;
            }
            this.connection.notifyConnectionError(e);
        }
    }

    private void processPacket(Packet packet) {
        if (packet == null) {
            return;
        }
        for (PacketCollector packetCollector : this.connection.getPacketCollectors()) {
            packetCollector.processPacket(packet);
        }
        this.listenerExecutor.submit(new ListenerNotification(packet));
    }

    private void releaseConnectionIDLock() {
        synchronized (this) {
            notify();
        }
    }

    private void resetParser() {
        try {
            this.parser = new MXParser();
            this.parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
            this.parser.setInput(this.connection.reader);
        } catch (XmlPullParserException e) {
            e.printStackTrace();
        }
    }

    void cleanup() {
        this.connection.recvListeners.clear();
        this.connection.collectors.clear();
    }

    protected void init() {
        this.done = false;
        this.connectionID = null;
        this.readerThread = new Thread() { // from class: org.jivesoftware.smack.PacketReader.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                PacketReader.this.parsePackets(this);
            }
        };
        this.readerThread.setName("Smack Packet Reader (" + this.connection.connectionCounterValue + ")");
        this.readerThread.setDaemon(true);
        this.listenerExecutor = Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: org.jivesoftware.smack.PacketReader.2
            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, "Smack Listener Processor (" + PacketReader.this.connection.connectionCounterValue + ")");
                thread.setDaemon(true);
                return thread;
            }
        });
        resetParser();
    }

    public void shutdown() {
        if (!this.done) {
            for (ConnectionListener connectionListener : this.connection.getConnectionListeners()) {
                try {
                    connectionListener.connectionClosed();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        this.done = true;
        this.listenerExecutor.shutdown();
    }

    public void startup() throws XMPPException {
        synchronized (this) {
            this.readerThread.start();
            try {
                wait(SmackConfiguration.getPacketReplyTimeout() * 3);
            } catch (InterruptedException e) {
            }
            if (this.connectionID == null) {
                throw new XMPPException("Connection failed. No response from server.");
            }
            this.connection.connectionID = this.connectionID;
        }
    }
}
