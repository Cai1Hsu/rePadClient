package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLDigestMD5Mechanism.class */
public class SASLDigestMD5Mechanism extends SASLMechanism {
    public SASLDigestMD5Mechanism(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "DIGEST-MD5";
    }
}
