package org.jivesoftware.smack;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.PasswordCallback;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.Authentication;
import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smack/NonSASLAuthentication.class */
class NonSASLAuthentication implements UserAuthentication {
    private Connection connection;

    public NonSASLAuthentication(Connection connection) {
        this.connection = connection;
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String str, String str2, String str3) throws XMPPException {
        Authentication authentication = new Authentication();
        authentication.setType(IQ.Type.GET);
        authentication.setUsername(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(authentication.getPacketID()));
        this.connection.sendPacket(authentication);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() == IQ.Type.ERROR) {
            throw new XMPPException(iq.getError());
        }
        Authentication authentication2 = (Authentication) iq;
        createPacketCollector.cancel();
        Authentication authentication3 = new Authentication();
        authentication3.setUsername(str);
        if (authentication2.getDigest() != null) {
            authentication3.setDigest(this.connection.getConnectionID(), str2);
        } else if (authentication2.getPassword() == null) {
            throw new XMPPException("Server does not support compatible authentication mechanism.");
        } else {
            authentication3.setPassword(str2);
        }
        authentication3.setResource(str3);
        PacketCollector createPacketCollector2 = this.connection.createPacketCollector(new PacketIDFilter(authentication3.getPacketID()));
        this.connection.sendPacket(authentication3);
        IQ iq2 = (IQ) createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (iq2 == null) {
            throw new XMPPException("Authentication failed.");
        }
        if (iq2.getType() == IQ.Type.ERROR) {
            throw new XMPPException(iq2.getError());
        }
        createPacketCollector2.cancel();
        return iq2.getTo();
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String str, String str2, CallbackHandler callbackHandler) throws XMPPException {
        PasswordCallback passwordCallback = new PasswordCallback("Password: ", false);
        try {
            callbackHandler.handle(new Callback[]{passwordCallback});
            return authenticate(str, String.valueOf(passwordCallback.getPassword()), str2);
        } catch (Exception e) {
            throw new XMPPException("Unable to determine password.", e);
        }
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticateAnonymously() throws XMPPException {
        Authentication authentication = new Authentication();
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(authentication.getPacketID()));
        this.connection.sendPacket(authentication);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (iq == null) {
            throw new XMPPException("Anonymous login failed.");
        }
        if (iq.getType() == IQ.Type.ERROR) {
            throw new XMPPException(iq.getError());
        }
        createPacketCollector.cancel();
        return iq.getTo() != null ? iq.getTo() : this.connection.getServiceName() + "/" + ((Authentication) iq).getResource();
    }
}
