package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLCramMD5Mechanism.class */
public class SASLCramMD5Mechanism extends SASLMechanism {
    public SASLCramMD5Mechanism(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "CRAM-MD5";
    }
}
