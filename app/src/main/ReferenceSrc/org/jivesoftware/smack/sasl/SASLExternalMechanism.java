package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLExternalMechanism.class */
public class SASLExternalMechanism extends SASLMechanism {
    public SASLExternalMechanism(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "EXTERNAL";
    }
}
