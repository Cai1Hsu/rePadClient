package org.jivesoftware.smack.sasl;

import java.io.IOException;
import javax.security.auth.callback.CallbackHandler;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.sasl.SASLMechanism;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLAnonymous.class */
public class SASLAnonymous extends SASLMechanism {
    public SASLAnonymous(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected void authenticate() throws IOException {
        getSASLAuthentication().send(new SASLMechanism.AuthMechanism(getName(), null));
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String str, String str2, String str3) throws IOException {
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String str, String str2, CallbackHandler callbackHandler) throws IOException {
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void challengeReceived(String str) throws IOException {
        getSASLAuthentication().send(new SASLMechanism.Response());
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "ANONYMOUS";
    }
}
