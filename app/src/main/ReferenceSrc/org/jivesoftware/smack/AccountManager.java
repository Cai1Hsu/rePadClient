package org.jivesoftware.smack;

import com.edutech.idauthentication.AppEnvironment;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smack/AccountManager.class */
public class AccountManager {
    private Connection connection;
    private Registration info = null;
    private boolean accountCreationSupported = false;

    public AccountManager(Connection connection) {
        this.connection = connection;
    }

    private void getRegistrationInfo() throws XMPPException {
        synchronized (this) {
            Registration registration = new Registration();
            registration.setTo(this.connection.getServiceName());
            PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
            this.connection.sendPacket(registration);
            IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector.cancel();
            if (iq == null) {
                throw new XMPPException("No response from server.");
            }
            if (iq.getType() == IQ.Type.ERROR) {
                throw new XMPPException(iq.getError());
            }
            this.info = (Registration) iq;
        }
    }

    public void changePassword(String str) throws XMPPException {
        Registration registration = new Registration();
        registration.setType(IQ.Type.SET);
        registration.setTo(this.connection.getServiceName());
        HashMap hashMap = new HashMap();
        hashMap.put("username", StringUtils.parseName(this.connection.getUser()));
        hashMap.put(AppEnvironment.PASSWORD, str);
        registration.setAttributes(hashMap);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
        this.connection.sendPacket(registration);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void createAccount(String str, String str2) throws XMPPException {
        if (!supportsAccountCreation()) {
            throw new XMPPException("Server does not support account creation.");
        }
        HashMap hashMap = new HashMap();
        for (String str3 : getAccountAttributes()) {
            hashMap.put(str3, "");
        }
        createAccount(str, str2, hashMap);
    }

    public void createAccount(String str, String str2, Map<String, String> map) throws XMPPException {
        if (!supportsAccountCreation()) {
            throw new XMPPException("Server does not support account creation.");
        }
        Registration registration = new Registration();
        registration.setType(IQ.Type.SET);
        registration.setTo(this.connection.getServiceName());
        map.put("username", str);
        map.put(AppEnvironment.PASSWORD, str2);
        registration.setAttributes(map);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
        this.connection.sendPacket(registration);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void deleteAccount() throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Must be logged in to delete a account.");
        }
        Registration registration = new Registration();
        registration.setType(IQ.Type.SET);
        registration.setTo(this.connection.getServiceName());
        HashMap hashMap = new HashMap();
        hashMap.put(DiscoverItems.Item.REMOVE_ACTION, "");
        registration.setAttributes(hashMap);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
        this.connection.sendPacket(registration);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public String getAccountAttribute(String str) {
        String str2;
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            str2 = this.info.getAttributes().get(str);
        } catch (XMPPException e) {
            e.printStackTrace();
            str2 = null;
        }
        return str2;
    }

    public Collection<String> getAccountAttributes() {
        Set emptySet;
        Map<String, String> attributes;
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            attributes = this.info.getAttributes();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
        if (attributes != null) {
            emptySet = Collections.unmodifiableSet(attributes.keySet());
            return emptySet;
        }
        emptySet = Collections.emptySet();
        return emptySet;
    }

    public String getAccountInstructions() {
        String str;
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            str = this.info.getInstructions();
        } catch (XMPPException e) {
            str = null;
        }
        return str;
    }

    void setSupportsAccountCreation(boolean z) {
        this.accountCreationSupported = z;
    }

    public boolean supportsAccountCreation() {
        boolean z = true;
        if (!this.accountCreationSupported) {
            try {
                if (this.info == null) {
                    getRegistrationInfo();
                    this.accountCreationSupported = this.info.getType() != IQ.Type.ERROR;
                }
                z = this.accountCreationSupported;
            } catch (XMPPException e) {
                z = false;
            }
        }
        return z;
    }
}
