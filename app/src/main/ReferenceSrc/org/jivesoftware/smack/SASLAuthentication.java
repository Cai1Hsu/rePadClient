package org.jivesoftware.smack;

import com.mongodb.MongoCredential;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.security.auth.callback.CallbackHandler;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.Bind;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Session;
import org.jivesoftware.smack.sasl.SASLAnonymous;
import org.jivesoftware.smack.sasl.SASLCramMD5Mechanism;
import org.jivesoftware.smack.sasl.SASLDigestMD5Mechanism;
import org.jivesoftware.smack.sasl.SASLExternalMechanism;
import org.jivesoftware.smack.sasl.SASLGSSAPIMechanism;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.jivesoftware.smack.sasl.SASLPlainMechanism;

/* loaded from: classes.jar:org/jivesoftware/smack/SASLAuthentication.class */
public class SASLAuthentication implements UserAuthentication {
    private static Map<String, Class<? extends SASLMechanism>> implementedMechanisms = new HashMap();
    private static List<String> mechanismsPreferences = new ArrayList();
    private Connection connection;
    private String errorCondition;
    private boolean resourceBinded;
    private boolean saslFailed;
    private boolean saslNegotiated;
    private boolean sessionSupported;
    private Collection<String> serverMechanisms = new ArrayList();
    private SASLMechanism currentMechanism = null;

    static {
        registerSASLMechanism("EXTERNAL", SASLExternalMechanism.class);
        registerSASLMechanism("GSSAPI", SASLGSSAPIMechanism.class);
        registerSASLMechanism("DIGEST-MD5", SASLDigestMD5Mechanism.class);
        registerSASLMechanism("CRAM-MD5", SASLCramMD5Mechanism.class);
        registerSASLMechanism(MongoCredential.PLAIN_MECHANISM, SASLPlainMechanism.class);
        registerSASLMechanism("ANONYMOUS", SASLAnonymous.class);
        supportSASLMechanism("GSSAPI", 0);
        supportSASLMechanism("DIGEST-MD5", 1);
        supportSASLMechanism("CRAM-MD5", 2);
        supportSASLMechanism(MongoCredential.PLAIN_MECHANISM, 3);
        supportSASLMechanism("ANONYMOUS", 4);
    }

    SASLAuthentication(Connection connection) {
        this.connection = connection;
        init();
    }

    private String bindResourceAndEstablishSession(String str) throws XMPPException {
        synchronized (this) {
            if (!this.resourceBinded) {
                try {
                    wait(30000L);
                } catch (InterruptedException e) {
                }
            }
        }
        if (!this.resourceBinded) {
            throw new XMPPException("Resource binding not offered by server");
        }
        Bind bind = new Bind();
        bind.setResource(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(bind.getPacketID()));
        this.connection.sendPacket(bind);
        Bind bind2 = (Bind) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (bind2 == null) {
            throw new XMPPException("No response from the server.");
        }
        if (bind2.getType() == IQ.Type.ERROR) {
            throw new XMPPException(bind2.getError());
        }
        String jid = bind2.getJid();
        if (this.sessionSupported) {
            Session session = new Session();
            PacketCollector createPacketCollector2 = this.connection.createPacketCollector(new PacketIDFilter(session.getPacketID()));
            this.connection.sendPacket(session);
            IQ iq = (IQ) createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector2.cancel();
            if (iq == null) {
                throw new XMPPException("No response from the server.");
            }
            if (iq.getType() == IQ.Type.ERROR) {
                throw new XMPPException(iq.getError());
            }
        }
        return jid;
    }

    public static List<Class<? extends SASLMechanism>> getRegisterSASLMechanisms() {
        ArrayList arrayList = new ArrayList();
        for (String str : mechanismsPreferences) {
            arrayList.add(implementedMechanisms.get(str));
        }
        return arrayList;
    }

    public static void registerSASLMechanism(String str, Class<? extends SASLMechanism> cls) {
        implementedMechanisms.put(str, cls);
    }

    public static void supportSASLMechanism(String str) {
        mechanismsPreferences.add(0, str);
    }

    public static void supportSASLMechanism(String str, int i) {
        mechanismsPreferences.add(i, str);
    }

    public static void unregisterSASLMechanism(String str) {
        implementedMechanisms.remove(str);
        mechanismsPreferences.remove(str);
    }

    public static void unsupportSASLMechanism(String str) {
        mechanismsPreferences.remove(str);
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String str, String str2, String str3) throws XMPPException {
        String str4;
        String authenticate;
        Iterator<String> it = mechanismsPreferences.iterator();
        while (true) {
            str4 = null;
            if (!it.hasNext()) {
                break;
            }
            str4 = it.next();
            if (implementedMechanisms.containsKey(str4) && this.serverMechanisms.contains(str4)) {
                break;
            }
        }
        if (str4 != null) {
            try {
                this.currentMechanism = implementedMechanisms.get(str4).getConstructor(SASLAuthentication.class).newInstance(this);
                this.currentMechanism.authenticate(str, this.connection.getHost(), this.connection.getServiceName(), str2);
                synchronized (this) {
                    if (!this.saslNegotiated && !this.saslFailed) {
                        try {
                            wait(30000L);
                        } catch (InterruptedException e) {
                        }
                    }
                }
                if (this.saslFailed) {
                    if (this.errorCondition == null) {
                        throw new XMPPException("SASL authentication failed using mechanism " + str4);
                    }
                    throw new XMPPException("SASL authentication " + str4 + " failed: " + this.errorCondition);
                }
                authenticate = this.saslNegotiated ? bindResourceAndEstablishSession(str3) : new NonSASLAuthentication(this.connection).authenticate(str, str2, str3);
            } catch (XMPPException e2) {
                throw e2;
            } catch (Exception e3) {
                e3.printStackTrace();
                authenticate = new NonSASLAuthentication(this.connection).authenticate(str, str2, str3);
            }
        } else {
            authenticate = new NonSASLAuthentication(this.connection).authenticate(str, str2, str3);
        }
        return authenticate;
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String str, String str2, CallbackHandler callbackHandler) throws XMPPException {
        String str3;
        Iterator<String> it = mechanismsPreferences.iterator();
        while (true) {
            str3 = null;
            if (!it.hasNext()) {
                break;
            }
            str3 = it.next();
            if (implementedMechanisms.containsKey(str3) && this.serverMechanisms.contains(str3)) {
                break;
            }
        }
        if (str3 != null) {
            try {
                this.currentMechanism = implementedMechanisms.get(str3).getConstructor(SASLAuthentication.class).newInstance(this);
                this.currentMechanism.authenticate(str, this.connection.getHost(), callbackHandler);
                synchronized (this) {
                    if (!this.saslNegotiated && !this.saslFailed) {
                        try {
                            wait(30000L);
                        } catch (InterruptedException e) {
                        }
                    }
                }
            } catch (XMPPException e2) {
                throw e2;
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            if (this.saslFailed) {
                if (this.errorCondition == null) {
                    throw new XMPPException("SASL authentication failed using mechanism " + str3);
                }
                throw new XMPPException("SASL authentication " + str3 + " failed: " + this.errorCondition);
            }
            if (this.saslNegotiated) {
                return bindResourceAndEstablishSession(str2);
            }
            throw new XMPPException("SASL authentication failed");
        }
        throw new XMPPException("SASL Authentication failed. No known authentication mechanisims.");
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticateAnonymously() throws XMPPException {
        String str;
        try {
            this.currentMechanism = new SASLAnonymous(this);
            this.currentMechanism.authenticate(null, null, null, "");
            synchronized (this) {
                if (!this.saslNegotiated && !this.saslFailed) {
                    try {
                        wait(5000L);
                    } catch (InterruptedException e) {
                    }
                }
            }
        } catch (IOException e2) {
            str = new NonSASLAuthentication(this.connection).authenticateAnonymously();
        }
        if (!this.saslFailed) {
            str = this.saslNegotiated ? bindResourceAndEstablishSession(null) : new NonSASLAuthentication(this.connection).authenticateAnonymously();
            return str;
        } else if (this.errorCondition == null) {
            throw new XMPPException("SASL authentication failed");
        } else {
            throw new XMPPException("SASL authentication failed: " + this.errorCondition);
        }
    }

    void authenticated() {
        synchronized (this) {
            this.saslNegotiated = true;
            notify();
        }
    }

    void authenticationFailed() {
        authenticationFailed(null);
    }

    void authenticationFailed(String str) {
        synchronized (this) {
            this.saslFailed = true;
            this.errorCondition = str;
            notify();
        }
    }

    void bindingRequired() {
        synchronized (this) {
            this.resourceBinded = true;
            notify();
        }
    }

    void challengeReceived(String str) throws IOException {
        this.currentMechanism.challengeReceived(str);
    }

    public boolean hasAnonymousAuthentication() {
        return this.serverMechanisms.contains("ANONYMOUS");
    }

    public boolean hasNonAnonymousAuthentication() {
        boolean z;
        if (!this.serverMechanisms.isEmpty()) {
            z = true;
            if (this.serverMechanisms.size() == 1) {
                if (!hasAnonymousAuthentication()) {
                    z = true;
                }
            }
            return z;
        }
        z = false;
        return z;
    }

    protected void init() {
        this.saslNegotiated = false;
        this.saslFailed = false;
        this.resourceBinded = false;
        this.sessionSupported = false;
    }

    public boolean isAuthenticated() {
        return this.saslNegotiated;
    }

    public void send(Packet packet) {
        this.connection.sendPacket(packet);
    }

    void sessionsSupported() {
        this.sessionSupported = true;
    }

    void setAvailableSASLMethods(Collection<String> collection) {
        this.serverMechanisms = collection;
    }
}
