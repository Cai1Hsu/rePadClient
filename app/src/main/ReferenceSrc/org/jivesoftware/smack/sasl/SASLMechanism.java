package org.jivesoftware.smack.sasl;

import java.io.IOException;
import java.util.HashMap;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.sasl.RealmCallback;
import javax.security.sasl.RealmChoiceCallback;
import javax.security.sasl.Sasl;
import javax.security.sasl.SaslClient;
import javax.security.sasl.SaslException;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism.class */
public abstract class SASLMechanism implements CallbackHandler {
    protected String authenticationId;
    protected String hostname;
    protected String password;
    private SASLAuthentication saslAuthentication;
    protected SaslClient sc;

    /* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism.class */
    public class AuthMechanism extends Packet {
        private final String authenticationText;
        private final String name;

        public AuthMechanism(String str, String str2) {
            SASLMechanism.this = r5;
            if (str == null) {
                throw new NullPointerException("SASL mechanism name shouldn't be null.");
            }
            this.name = str;
            this.authenticationText = str2;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<auth mechanism=\"").append(this.name);
            sb.append("\" xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.authenticationText != null && this.authenticationText.trim().length() > 0) {
                sb.append(this.authenticationText);
            }
            sb.append("</auth>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism$Challenge.class */
    public static class Challenge extends Packet {
        private final String data;

        public Challenge(String str) {
            this.data = str;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<challenge xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.data != null && this.data.trim().length() > 0) {
                sb.append(this.data);
            }
            sb.append("</challenge>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism$Failure.class */
    public static class Failure extends Packet {
        private final String condition;

        public Failure(String str) {
            this.condition = str;
        }

        public String getCondition() {
            return this.condition;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<failure xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.condition != null && this.condition.trim().length() > 0) {
                sb.append("<").append(this.condition).append("/>");
            }
            sb.append("</failure>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism$Response.class */
    public class Response extends Packet {
        private final String authenticationText;

        public Response() {
            SASLMechanism.this = r4;
            this.authenticationText = null;
        }

        public Response(String str) {
            SASLMechanism.this = r4;
            if (str == null || str.trim().length() == 0) {
                this.authenticationText = null;
            } else {
                this.authenticationText = str;
            }
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<response xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.authenticationText != null) {
                sb.append(this.authenticationText);
            }
            sb.append("</response>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLMechanism$Success.class */
    public static class Success extends Packet {
        private final String data;

        public Success(String str) {
            this.data = str;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<success xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.data != null && this.data.trim().length() > 0) {
                sb.append(this.data);
            }
            sb.append("</success>");
            return sb.toString();
        }
    }

    public SASLMechanism(SASLAuthentication sASLAuthentication) {
        this.saslAuthentication = sASLAuthentication;
    }

    protected void authenticate() throws IOException, XMPPException {
        String str = null;
        try {
            if (this.sc.hasInitialResponse()) {
                str = StringUtils.encodeBase64(this.sc.evaluateChallenge(new byte[0]), false);
            }
            getSASLAuthentication().send(new AuthMechanism(getName(), str));
        } catch (SaslException e) {
            throw new XMPPException("SASL authentication failed", (Throwable) e);
        }
    }

    public void authenticate(String str, String str2, String str3) throws IOException, XMPPException {
        authenticate(str, str2, str2, str3);
    }

    public void authenticate(String str, String str2, String str3, String str4) throws IOException, XMPPException {
        this.authenticationId = str;
        this.password = str4;
        this.hostname = str2;
        this.sc = Sasl.createSaslClient(new String[]{getName()}, str, "xmpp", str3, new HashMap(), this);
        authenticate();
    }

    public void authenticate(String str, String str2, CallbackHandler callbackHandler) throws IOException, XMPPException {
        this.sc = Sasl.createSaslClient(new String[]{getName()}, str, "xmpp", str2, new HashMap(), callbackHandler);
        authenticate();
    }

    public void challengeReceived(String str) throws IOException {
        byte[] evaluateChallenge = str != null ? this.sc.evaluateChallenge(StringUtils.decodeBase64(str)) : this.sc.evaluateChallenge(new byte[0]);
        getSASLAuthentication().send(evaluateChallenge == null ? new Response() : new Response(StringUtils.encodeBase64(evaluateChallenge, false)));
    }

    protected abstract String getName();

    protected SASLAuthentication getSASLAuthentication() {
        return this.saslAuthentication;
    }

    @Override // javax.security.auth.callback.CallbackHandler
    public void handle(Callback[] callbackArr) throws IOException, UnsupportedCallbackException {
        for (int i = 0; i < callbackArr.length; i++) {
            if (callbackArr[i] instanceof NameCallback) {
                ((NameCallback) callbackArr[i]).setName(this.authenticationId);
            } else if (callbackArr[i] instanceof PasswordCallback) {
                ((PasswordCallback) callbackArr[i]).setPassword(this.password.toCharArray());
            } else if (callbackArr[i] instanceof RealmCallback) {
                RealmCallback realmCallback = (RealmCallback) callbackArr[i];
                realmCallback.setText(realmCallback.getDefaultText());
            } else if (!(callbackArr[i] instanceof RealmChoiceCallback)) {
                throw new UnsupportedCallbackException(callbackArr[i]);
            }
        }
    }
}
