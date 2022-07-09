package org.jivesoftware.smack.sasl;

import java.io.IOException;
import java.util.HashMap;
import javax.security.auth.callback.CallbackHandler;
import javax.security.sasl.Sasl;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.XMPPException;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLGSSAPIMechanism.class */
public class SASLGSSAPIMechanism extends SASLMechanism {
    public SASLGSSAPIMechanism(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
        System.setProperty("javax.security.auth.useSubjectCredsOnly", "false");
        System.setProperty("java.security.auth.login.config", "gss.conf");
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String str, String str2, String str3) throws IOException, XMPPException {
        String name = getName();
        HashMap hashMap = new HashMap();
        hashMap.put("javax.security.sasl.server.authentication", "TRUE");
        this.sc = Sasl.createSaslClient(new String[]{name}, str, "xmpp", str2, hashMap, this);
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String str, String str2, CallbackHandler callbackHandler) throws IOException, XMPPException {
        String name = getName();
        HashMap hashMap = new HashMap();
        hashMap.put("javax.security.sasl.server.authentication", "TRUE");
        this.sc = Sasl.createSaslClient(new String[]{name}, str, "xmpp", str2, hashMap, callbackHandler);
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "GSSAPI";
    }
}
