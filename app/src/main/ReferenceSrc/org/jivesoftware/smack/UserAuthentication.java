package org.jivesoftware.smack;

import javax.security.auth.callback.CallbackHandler;

/* loaded from: classes.jar:org/jivesoftware/smack/UserAuthentication.class */
interface UserAuthentication {
    String authenticate(String str, String str2, String str3) throws XMPPException;

    String authenticate(String str, String str2, CallbackHandler callbackHandler) throws XMPPException;

    String authenticateAnonymously() throws XMPPException;
}
