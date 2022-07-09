package org.jivesoftware.smackx.commands;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.NodeInformationProvider;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.commands.AdHocCommand;
import org.jivesoftware.smackx.packet.AdHocCommandData;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommandManager.class */
public class AdHocCommandManager {
    private static final String DISCO_NAMESPACE = "http://jabber.org/protocol/commands";
    private static final int SESSION_TIMEOUT = 120;
    private static final String discoNode = "http://jabber.org/protocol/commands";
    private static Map<Connection, AdHocCommandManager> instances = new ConcurrentHashMap();
    private Map<String, AdHocCommandInfo> commands;
    private Connection connection;
    private Map<String, LocalCommand> executingCommands;
    private Thread sessionsSweeper;

    /* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommandManager$AdHocCommandInfo.class */
    private static class AdHocCommandInfo {
        private LocalCommandFactory factory;
        private String name;
        private String node;
        private String ownerJID;

        public AdHocCommandInfo(String str, String str2, String str3, LocalCommandFactory localCommandFactory) {
            this.node = str;
            this.name = str2;
            this.ownerJID = str3;
            this.factory = localCommandFactory;
        }

        public LocalCommand getCommandInstance() throws InstantiationException, IllegalAccessException {
            return this.factory.getInstance();
        }

        public String getName() {
            return this.name;
        }

        public String getNode() {
            return this.node;
        }

        public String getOwnerJID() {
            return this.ownerJID;
        }
    }

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new AdHocCommandManager(connection);
            }
        });
    }

    private AdHocCommandManager(Connection connection) {
        this.commands = new ConcurrentHashMap();
        this.executingCommands = new ConcurrentHashMap();
        this.connection = connection;
        init();
    }

    public static AdHocCommandManager getAddHocCommandsManager(Connection connection) {
        return instances.get(connection);
    }

    public Collection<AdHocCommandInfo> getRegisteredCommands() {
        return this.commands.values();
    }

    private void init() {
        instances.put(this.connection, this);
        this.connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.4
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                AdHocCommandManager.instances.remove(AdHocCommandManager.this.connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                AdHocCommandManager.instances.remove(AdHocCommandManager.this.connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int i) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception exc) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
                AdHocCommandManager.instances.put(AdHocCommandManager.this.connection, AdHocCommandManager.this);
            }
        });
        ServiceDiscoveryManager.getInstanceFor(this.connection).addFeature(AdHocCommandData.SpecificError.namespace);
        ServiceDiscoveryManager.getInstanceFor(this.connection).setNodeInformationProvider(AdHocCommandData.SpecificError.namespace, new NodeInformationProvider() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.5
            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<String> getNodeFeatures() {
                return null;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverInfo.Identity> getNodeIdentities() {
                return null;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverItems.Item> getNodeItems() {
                ArrayList arrayList = new ArrayList();
                for (AdHocCommandInfo adHocCommandInfo : AdHocCommandManager.this.getRegisteredCommands()) {
                    DiscoverItems.Item item = new DiscoverItems.Item(adHocCommandInfo.getOwnerJID());
                    item.setName(adHocCommandInfo.getName());
                    item.setNode(adHocCommandInfo.getNode());
                    arrayList.add(item);
                }
                return arrayList;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<PacketExtension> getNodePacketExtensions() {
                return null;
            }
        });
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.6
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                AdHocCommandManager.this.processAdHocCommand((AdHocCommandData) packet);
            }
        }, new PacketTypeFilter(AdHocCommandData.class));
        this.sessionsSweeper = null;
    }

    private LocalCommand newInstanceOfCmd(String str, String str2) throws XMPPException {
        AdHocCommandInfo adHocCommandInfo = this.commands.get(str);
        try {
            LocalCommand commandInstance = adHocCommandInfo.getCommandInstance();
            commandInstance.setSessionID(str2);
            commandInstance.setName(adHocCommandInfo.getName());
            commandInstance.setNode(adHocCommandInfo.getNode());
            return commandInstance;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            throw new XMPPException(new XMPPError(XMPPError.Condition.interna_server_error));
        } catch (InstantiationException e2) {
            e2.printStackTrace();
            throw new XMPPException(new XMPPError(XMPPError.Condition.interna_server_error));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:61:0x01ff, code lost:
        if (org.jivesoftware.smackx.commands.AdHocCommand.Action.execute.equals(r0) != false) goto L62;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void processAdHocCommand(AdHocCommandData adHocCommandData) {
        AdHocCommand.Action action;
        if (adHocCommandData.getType() != IQ.Type.SET) {
            return;
        }
        AdHocCommandData adHocCommandData2 = new AdHocCommandData();
        adHocCommandData2.setTo(adHocCommandData.getFrom());
        adHocCommandData2.setPacketID(adHocCommandData.getPacketID());
        adHocCommandData2.setNode(adHocCommandData.getNode());
        adHocCommandData2.setId(adHocCommandData.getTo());
        String sessionID = adHocCommandData.getSessionID();
        String node = adHocCommandData.getNode();
        if (sessionID == null) {
            if (!this.commands.containsKey(node)) {
                respondError(adHocCommandData2, XMPPError.Condition.item_not_found);
                return;
            }
            String randomString = StringUtils.randomString(15);
            try {
                LocalCommand newInstanceOfCmd = newInstanceOfCmd(node, randomString);
                adHocCommandData2.setType(IQ.Type.RESULT);
                newInstanceOfCmd.setData(adHocCommandData2);
                if (!newInstanceOfCmd.hasPermission(adHocCommandData.getFrom())) {
                    respondError(adHocCommandData2, XMPPError.Condition.forbidden);
                    return;
                }
                AdHocCommand.Action action2 = adHocCommandData.getAction();
                if (action2 != null && action2.equals(AdHocCommand.Action.unknown)) {
                    respondError(adHocCommandData2, XMPPError.Condition.bad_request, AdHocCommand.SpecificErrorCondition.malformedAction);
                    return;
                } else if (action2 != null && !action2.equals(AdHocCommand.Action.execute)) {
                    respondError(adHocCommandData2, XMPPError.Condition.bad_request, AdHocCommand.SpecificErrorCondition.badAction);
                    return;
                } else {
                    newInstanceOfCmd.incrementStage();
                    newInstanceOfCmd.execute();
                    if (newInstanceOfCmd.isLastStage()) {
                        adHocCommandData2.setStatus(AdHocCommand.Status.completed);
                    } else {
                        adHocCommandData2.setStatus(AdHocCommand.Status.executing);
                        this.executingCommands.put(randomString, newInstanceOfCmd);
                        if (this.sessionsSweeper == null) {
                            this.sessionsSweeper = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.7
                                @Override // java.lang.Runnable
                                public void run() {
                                    while (true) {
                                        for (String str : AdHocCommandManager.this.executingCommands.keySet()) {
                                            LocalCommand localCommand = (LocalCommand) AdHocCommandManager.this.executingCommands.get(str);
                                            if (localCommand != null) {
                                                if (System.currentTimeMillis() - localCommand.getCreationDate() > 240000) {
                                                    AdHocCommandManager.this.executingCommands.remove(str);
                                                }
                                            }
                                        }
                                        try {
                                            Thread.sleep(1000L);
                                        } catch (InterruptedException e) {
                                        }
                                    }
                                }
                            });
                            this.sessionsSweeper.setDaemon(true);
                            this.sessionsSweeper.start();
                        }
                    }
                    this.connection.sendPacket(adHocCommandData2);
                    return;
                }
            } catch (XMPPException e) {
                XMPPError xMPPError = e.getXMPPError();
                if (XMPPError.Type.CANCEL.equals(xMPPError.getType())) {
                    adHocCommandData2.setStatus(AdHocCommand.Status.canceled);
                    this.executingCommands.remove(randomString);
                }
                respondError(adHocCommandData2, xMPPError);
                e.printStackTrace();
                return;
            }
        }
        LocalCommand localCommand = this.executingCommands.get(sessionID);
        if (localCommand == null) {
            respondError(adHocCommandData2, XMPPError.Condition.bad_request, AdHocCommand.SpecificErrorCondition.badSessionid);
            return;
        }
        if (System.currentTimeMillis() - localCommand.getCreationDate() > 120000) {
            this.executingCommands.remove(sessionID);
            respondError(adHocCommandData2, XMPPError.Condition.not_allowed, AdHocCommand.SpecificErrorCondition.sessionExpired);
            return;
        }
        synchronized (localCommand) {
            AdHocCommand.Action action3 = adHocCommandData.getAction();
            if (action3 != null && action3.equals(AdHocCommand.Action.unknown)) {
                respondError(adHocCommandData2, XMPPError.Condition.bad_request, AdHocCommand.SpecificErrorCondition.malformedAction);
                return;
            }
            if (action3 != null) {
                action = action3;
            }
            action = localCommand.getExecuteAction();
            if (!localCommand.isValidAction(action)) {
                respondError(adHocCommandData2, XMPPError.Condition.bad_request, AdHocCommand.SpecificErrorCondition.badAction);
                return;
            }
            try {
                adHocCommandData2.setType(IQ.Type.RESULT);
                localCommand.setData(adHocCommandData2);
                if (AdHocCommand.Action.next.equals(action)) {
                    localCommand.incrementStage();
                    localCommand.next(new Form(adHocCommandData.getForm()));
                    if (localCommand.isLastStage()) {
                        adHocCommandData2.setStatus(AdHocCommand.Status.completed);
                    } else {
                        adHocCommandData2.setStatus(AdHocCommand.Status.executing);
                    }
                } else if (AdHocCommand.Action.complete.equals(action)) {
                    localCommand.incrementStage();
                    localCommand.complete(new Form(adHocCommandData.getForm()));
                    adHocCommandData2.setStatus(AdHocCommand.Status.completed);
                    this.executingCommands.remove(sessionID);
                } else if (AdHocCommand.Action.prev.equals(action)) {
                    localCommand.decrementStage();
                    localCommand.prev();
                } else if (AdHocCommand.Action.cancel.equals(action)) {
                    localCommand.cancel();
                    adHocCommandData2.setStatus(AdHocCommand.Status.canceled);
                    this.executingCommands.remove(sessionID);
                }
                this.connection.sendPacket(adHocCommandData2);
            } catch (XMPPException e2) {
                XMPPError xMPPError2 = e2.getXMPPError();
                if (XMPPError.Type.CANCEL.equals(xMPPError2.getType())) {
                    adHocCommandData2.setStatus(AdHocCommand.Status.canceled);
                    this.executingCommands.remove(sessionID);
                }
                respondError(adHocCommandData2, xMPPError2);
                e2.printStackTrace();
            }
        }
    }

    private void respondError(AdHocCommandData adHocCommandData, XMPPError.Condition condition) {
        respondError(adHocCommandData, new XMPPError(condition));
    }

    private void respondError(AdHocCommandData adHocCommandData, XMPPError.Condition condition, AdHocCommand.SpecificErrorCondition specificErrorCondition) {
        XMPPError xMPPError = new XMPPError(condition);
        xMPPError.addExtension(new AdHocCommandData.SpecificError(specificErrorCondition));
        respondError(adHocCommandData, xMPPError);
    }

    private void respondError(AdHocCommandData adHocCommandData, XMPPError xMPPError) {
        adHocCommandData.setType(IQ.Type.ERROR);
        adHocCommandData.setError(xMPPError);
        this.connection.sendPacket(adHocCommandData);
    }

    public DiscoverItems discoverCommands(String str) throws XMPPException {
        return ServiceDiscoveryManager.getInstanceFor(this.connection).discoverItems(str, AdHocCommandData.SpecificError.namespace);
    }

    public RemoteCommand getRemoteCommand(String str, String str2) {
        return new RemoteCommand(this.connection, str2, str);
    }

    public void publishCommands(String str) throws XMPPException {
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.connection);
        DiscoverItems discoverItems = new DiscoverItems();
        for (AdHocCommandInfo adHocCommandInfo : getRegisteredCommands()) {
            DiscoverItems.Item item = new DiscoverItems.Item(adHocCommandInfo.getOwnerJID());
            item.setName(adHocCommandInfo.getName());
            item.setNode(adHocCommandInfo.getNode());
            discoverItems.addItem(item);
        }
        instanceFor.publishItems(str, AdHocCommandData.SpecificError.namespace, discoverItems);
    }

    public void registerCommand(String str, String str2, final Class<? extends LocalCommand> cls) {
        registerCommand(str, str2, new LocalCommandFactory() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.2
            @Override // org.jivesoftware.smackx.commands.LocalCommandFactory
            public LocalCommand getInstance() throws InstantiationException, IllegalAccessException {
                return (LocalCommand) cls.newInstance();
            }
        });
    }

    public void registerCommand(String str, final String str2, LocalCommandFactory localCommandFactory) {
        this.commands.put(str, new AdHocCommandInfo(str, str2, this.connection.getUser(), localCommandFactory));
        ServiceDiscoveryManager.getInstanceFor(this.connection).setNodeInformationProvider(str, new NodeInformationProvider() { // from class: org.jivesoftware.smackx.commands.AdHocCommandManager.3
            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<String> getNodeFeatures() {
                ArrayList arrayList = new ArrayList();
                arrayList.add(AdHocCommandData.SpecificError.namespace);
                arrayList.add(Form.NAMESPACE);
                return arrayList;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverInfo.Identity> getNodeIdentities() {
                ArrayList arrayList = new ArrayList();
                arrayList.add(new DiscoverInfo.Identity("automation", str2, "command-node"));
                return arrayList;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverItems.Item> getNodeItems() {
                return null;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<PacketExtension> getNodePacketExtensions() {
                return null;
            }
        });
    }
}
