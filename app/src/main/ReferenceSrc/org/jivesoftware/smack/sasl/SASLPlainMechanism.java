package org.jivesoftware.smack.sasl;

import com.mongodb.MongoCredential;
import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: classes.jar:org/jivesoftware/smack/sasl/SASLPlainMechanism.class */
public class SASLPlainMechanism extends SASLMechanism {
    public SASLPlainMechanism(SASLAuthentication sASLAuthentication) {
        super(sASLAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return MongoCredential.PLAIN_MECHANISM;
    }
}
