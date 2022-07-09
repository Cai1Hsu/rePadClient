package org.jivesoftware.smackx.workgroup.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromContainsFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.muc.InvitationListener;
import org.jivesoftware.smackx.muc.MultiUserChat;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.MUCUser;
import org.jivesoftware.smackx.workgroup.MetaData;
import org.jivesoftware.smackx.workgroup.WorkgroupInvitation;
import org.jivesoftware.smackx.workgroup.WorkgroupInvitationListener;
import org.jivesoftware.smackx.workgroup.ext.forms.WorkgroupForm;
import org.jivesoftware.smackx.workgroup.packet.DepartQueuePacket;
import org.jivesoftware.smackx.workgroup.packet.QueueUpdate;
import org.jivesoftware.smackx.workgroup.packet.SessionID;
import org.jivesoftware.smackx.workgroup.packet.UserID;
import org.jivesoftware.smackx.workgroup.settings.ChatSetting;
import org.jivesoftware.smackx.workgroup.settings.ChatSettings;
import org.jivesoftware.smackx.workgroup.settings.OfflineSettings;
import org.jivesoftware.smackx.workgroup.settings.SoundSettings;
import org.jivesoftware.smackx.workgroup.settings.WorkgroupProperties;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/user/Workgroup.class */
public class Workgroup {
    private Connection connection;
    private boolean inQueue;
    private List<WorkgroupInvitationListener> invitationListeners;
    private List<QueueListener> queueListeners;
    private int queuePosition = -1;
    private int queueRemainingTime = -1;
    private String workgroupJID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/user/Workgroup$JoinQueuePacket.class */
    private class JoinQueuePacket extends IQ {
        private DataForm form;
        private String userID;

        public JoinQueuePacket(String str, Form form, String str2) {
            Workgroup.this = r4;
            this.userID = null;
            this.userID = str2;
            setTo(str);
            setType(IQ.Type.SET);
            this.form = form.getDataFormToSend();
            addExtension(this.form);
        }

        @Override // org.jivesoftware.smack.packet.IQ
        public String getChildElementXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<join-queue xmlns=\"http://jabber.org/protocol/workgroup\">");
            sb.append("<queue-notifications/>");
            if (Workgroup.this.connection.isAnonymous()) {
                sb.append(new UserID(this.userID).toXML());
            }
            sb.append(this.form.toXML());
            sb.append("</join-queue>");
            return sb.toString();
        }
    }

    public Workgroup(String str, Connection connection) {
        if (!connection.isAuthenticated()) {
            throw new IllegalStateException("Must login to server before creating workgroup.");
        }
        this.workgroupJID = str;
        this.connection = connection;
        this.inQueue = false;
        this.invitationListeners = new ArrayList();
        this.queueListeners = new ArrayList();
        addQueueListener(new QueueListener() { // from class: org.jivesoftware.smackx.workgroup.user.Workgroup.1
            @Override // org.jivesoftware.smackx.workgroup.user.QueueListener
            public void departedQueue() {
                Workgroup.this.inQueue = false;
                Workgroup.this.queuePosition = -1;
                Workgroup.this.queueRemainingTime = -1;
            }

            @Override // org.jivesoftware.smackx.workgroup.user.QueueListener
            public void joinedQueue() {
                Workgroup.this.inQueue = true;
            }

            @Override // org.jivesoftware.smackx.workgroup.user.QueueListener
            public void queuePositionUpdated(int i) {
                Workgroup.this.queuePosition = i;
            }

            @Override // org.jivesoftware.smackx.workgroup.user.QueueListener
            public void queueWaitTimeUpdated(int i) {
                Workgroup.this.queueRemainingTime = i;
            }
        });
        MultiUserChat.addInvitationListener(connection, new InvitationListener() { // from class: org.jivesoftware.smackx.workgroup.user.Workgroup.2
            @Override // org.jivesoftware.smackx.muc.InvitationListener
            public void invitationReceived(Connection connection2, String str2, String str3, String str4, String str5, Message message) {
                Workgroup.this.inQueue = false;
                Workgroup.this.queuePosition = -1;
                Workgroup.this.queueRemainingTime = -1;
            }
        });
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.workgroup.user.Workgroup.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Workgroup.this.handlePacket(packet);
            }
        }, new PacketTypeFilter(Message.class));
    }

    private void fireInvitationEvent(WorkgroupInvitation workgroupInvitation) {
        synchronized (this.invitationListeners) {
            for (WorkgroupInvitationListener workgroupInvitationListener : this.invitationListeners) {
                workgroupInvitationListener.invitationReceived(workgroupInvitation);
            }
        }
    }

    private void fireQueueDepartedEvent() {
        synchronized (this.queueListeners) {
            for (QueueListener queueListener : this.queueListeners) {
                queueListener.departedQueue();
            }
        }
    }

    private void fireQueueJoinedEvent() {
        synchronized (this.queueListeners) {
            for (QueueListener queueListener : this.queueListeners) {
                queueListener.joinedQueue();
            }
        }
    }

    private void fireQueuePositionEvent(int i) {
        synchronized (this.queueListeners) {
            for (QueueListener queueListener : this.queueListeners) {
                queueListener.queuePositionUpdated(i);
            }
        }
    }

    private void fireQueueTimeEvent(int i) {
        synchronized (this.queueListeners) {
            for (QueueListener queueListener : this.queueListeners) {
                queueListener.queueWaitTimeUpdated(i);
            }
        }
    }

    private ChatSettings getChatSettings(String str, int i) throws XMPPException {
        ChatSettings chatSettings = new ChatSettings();
        if (str != null) {
            chatSettings.setKey(str);
        }
        if (i != -1) {
            chatSettings.setType(i);
        }
        chatSettings.setType(IQ.Type.GET);
        chatSettings.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(chatSettings.getPacketID()));
        this.connection.sendPacket(chatSettings);
        ChatSettings chatSettings2 = (ChatSettings) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (chatSettings2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (chatSettings2.getError() == null) {
            return chatSettings2;
        }
        throw new XMPPException(chatSettings2.getError());
    }

    public void handlePacket(Packet packet) {
        if (packet instanceof Message) {
            Message message = (Message) packet;
            PacketExtension extension = message.getExtension("depart-queue", "http://jabber.org/protocol/workgroup");
            PacketExtension extension2 = message.getExtension(QueueUpdate.ELEMENT_NAME, "http://jabber.org/protocol/workgroup");
            if (extension != null) {
                fireQueueDepartedEvent();
            } else if (extension2 != null) {
                QueueUpdate queueUpdate = (QueueUpdate) extension2;
                if (queueUpdate.getPosition() != -1) {
                    fireQueuePositionEvent(queueUpdate.getPosition());
                }
                if (queueUpdate.getRemaingTime() == -1) {
                    return;
                }
                fireQueueTimeEvent(queueUpdate.getRemaingTime());
            } else {
                MUCUser mUCUser = (MUCUser) message.getExtension("x", "http://jabber.org/protocol/muc#user");
                MUCUser.Invite invite = mUCUser != null ? mUCUser.getInvite() : null;
                if (invite == null || !this.workgroupJID.equals(invite.getFrom())) {
                    return;
                }
                String str = null;
                Map<String, List<String>> map = null;
                PacketExtension extension3 = message.getExtension(SessionID.ELEMENT_NAME, "http://jivesoftware.com/protocol/workgroup");
                if (extension3 != null) {
                    str = ((SessionID) extension3).getSessionID();
                }
                PacketExtension extension4 = message.getExtension(MetaData.ELEMENT_NAME, "http://jivesoftware.com/protocol/workgroup");
                if (extension4 != null) {
                    map = ((MetaData) extension4).getMetaData();
                }
                fireInvitationEvent(new WorkgroupInvitation(this.connection.getUser(), message.getFrom(), this.workgroupJID, str, message.getBody(), message.getFrom(), map));
            }
        }
    }

    public void addInvitationListener(WorkgroupInvitationListener workgroupInvitationListener) {
        synchronized (this.invitationListeners) {
            if (!this.invitationListeners.contains(workgroupInvitationListener)) {
                this.invitationListeners.add(workgroupInvitationListener);
            }
        }
    }

    public void addQueueListener(QueueListener queueListener) {
        synchronized (this.queueListeners) {
            if (!this.queueListeners.contains(queueListener)) {
                this.queueListeners.add(queueListener);
            }
        }
    }

    public void departQueue() throws XMPPException {
        if (!this.inQueue) {
            return;
        }
        DepartQueuePacket departQueuePacket = new DepartQueuePacket(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(departQueuePacket.getPacketID()));
        this.connection.sendPacket(departQueuePacket);
        IQ iq = (IQ) createPacketCollector.nextResult(5000L);
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        fireQueueDepartedEvent();
    }

    public ChatSetting getChatSetting(String str) throws XMPPException {
        return getChatSettings(str, -1).getFirstEntry();
    }

    public ChatSettings getChatSettings() throws XMPPException {
        return getChatSettings(null, -1);
    }

    public ChatSettings getChatSettings(int i) throws XMPPException {
        return getChatSettings(null, i);
    }

    public OfflineSettings getOfflineSettings() throws XMPPException {
        OfflineSettings offlineSettings = new OfflineSettings();
        offlineSettings.setType(IQ.Type.GET);
        offlineSettings.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(offlineSettings.getPacketID()));
        this.connection.sendPacket(offlineSettings);
        OfflineSettings offlineSettings2 = (OfflineSettings) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (offlineSettings2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (offlineSettings2.getError() == null) {
            return offlineSettings2;
        }
        throw new XMPPException(offlineSettings2.getError());
    }

    public int getQueuePosition() {
        return this.queuePosition;
    }

    public int getQueueRemainingTime() {
        return this.queueRemainingTime;
    }

    public SoundSettings getSoundSettings() throws XMPPException {
        SoundSettings soundSettings = new SoundSettings();
        soundSettings.setType(IQ.Type.GET);
        soundSettings.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(soundSettings.getPacketID()));
        this.connection.sendPacket(soundSettings);
        SoundSettings soundSettings2 = (SoundSettings) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (soundSettings2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (soundSettings2.getError() == null) {
            return soundSettings2;
        }
        throw new XMPPException(soundSettings2.getError());
    }

    public Form getWorkgroupForm() throws XMPPException {
        WorkgroupForm workgroupForm = new WorkgroupForm();
        workgroupForm.setType(IQ.Type.GET);
        workgroupForm.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(workgroupForm.getPacketID()));
        this.connection.sendPacket(workgroupForm);
        WorkgroupForm workgroupForm2 = (WorkgroupForm) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (workgroupForm2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (workgroupForm2.getError() == null) {
            return Form.getFormFrom(workgroupForm2);
        }
        throw new XMPPException(workgroupForm2.getError());
    }

    public String getWorkgroupJID() {
        return this.workgroupJID;
    }

    public WorkgroupProperties getWorkgroupProperties() throws XMPPException {
        WorkgroupProperties workgroupProperties = new WorkgroupProperties();
        workgroupProperties.setType(IQ.Type.GET);
        workgroupProperties.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(workgroupProperties.getPacketID()));
        this.connection.sendPacket(workgroupProperties);
        WorkgroupProperties workgroupProperties2 = (WorkgroupProperties) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (workgroupProperties2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (workgroupProperties2.getError() == null) {
            return workgroupProperties2;
        }
        throw new XMPPException(workgroupProperties2.getError());
    }

    public WorkgroupProperties getWorkgroupProperties(String str) throws XMPPException {
        WorkgroupProperties workgroupProperties = new WorkgroupProperties();
        workgroupProperties.setJid(str);
        workgroupProperties.setType(IQ.Type.GET);
        workgroupProperties.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(workgroupProperties.getPacketID()));
        this.connection.sendPacket(workgroupProperties);
        WorkgroupProperties workgroupProperties2 = (WorkgroupProperties) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (workgroupProperties2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (workgroupProperties2.getError() == null) {
            return workgroupProperties2;
        }
        throw new XMPPException(workgroupProperties2.getError());
    }

    public boolean isAvailable() {
        boolean z = false;
        Presence presence = new Presence(Presence.Type.available);
        presence.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new FromContainsFilter(this.workgroupJID), new PacketTypeFilter(Presence.class)));
        this.connection.sendPacket(presence);
        Presence presence2 = (Presence) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (presence2 != null && presence2.getError() == null) {
            z = Presence.Type.available == presence2.getType();
        }
        return z;
    }

    public boolean isEmailAvailable() {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(StringUtils.parseServer(this.workgroupJID)).containsFeature("jive:email:provider");
        } catch (XMPPException e) {
            z = false;
        }
        return z;
    }

    public boolean isInQueue() {
        return this.inQueue;
    }

    public void joinQueue() throws XMPPException {
        joinQueue(null);
    }

    public void joinQueue(Map<String, Object> map, String str) throws XMPPException {
        if (this.inQueue) {
            throw new IllegalStateException("Already in queue " + this.workgroupJID);
        }
        Form form = new Form(Form.TYPE_SUBMIT);
        for (String str2 : map.keySet()) {
            String obj = map.get(str2).toString();
            String escapeForXML = StringUtils.escapeForXML(str2);
            String escapeForXML2 = StringUtils.escapeForXML(obj);
            FormField formField = new FormField(escapeForXML);
            formField.setType(FormField.TYPE_TEXT_SINGLE);
            form.addField(formField);
            form.setAnswer(escapeForXML, escapeForXML2);
        }
        joinQueue(form, str);
    }

    public void joinQueue(Form form) throws XMPPException {
        joinQueue(form, (String) null);
    }

    public void joinQueue(Form form, String str) throws XMPPException {
        if (this.inQueue) {
            throw new IllegalStateException("Already in queue " + this.workgroupJID);
        }
        JoinQueuePacket joinQueuePacket = new JoinQueuePacket(this.workgroupJID, form, str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(joinQueuePacket.getPacketID()));
        this.connection.sendPacket(joinQueuePacket);
        IQ iq = (IQ) createPacketCollector.nextResult(10000L);
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        fireQueueJoinedEvent();
    }

    public void removeQueueListener(WorkgroupInvitationListener workgroupInvitationListener) {
        synchronized (this.invitationListeners) {
            this.invitationListeners.remove(workgroupInvitationListener);
        }
    }

    public void removeQueueListener(QueueListener queueListener) {
        synchronized (this.queueListeners) {
            this.queueListeners.remove(queueListener);
        }
    }
}
