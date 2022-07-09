package org.jivesoftware.smack;

import java.util.Random;
import org.jivesoftware.smack.packet.StreamError;

/* loaded from: classes.jar:org/jivesoftware/smack/ReconnectionManager.class */
public class ReconnectionManager implements ConnectionListener {
    private Connection connection;
    boolean done;
    private int randomBase;
    private Thread reconnectionThread;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.ReconnectionManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                connection.addConnectionListener(new ReconnectionManager(connection));
            }
        });
    }

    private ReconnectionManager(Connection connection) {
        this.randomBase = new Random().nextInt(11) + 5;
        this.done = false;
        this.connection = connection;
    }

    public boolean isReconnectionAllowed() {
        return !this.done && !this.connection.isConnected() && this.connection.isReconnectionAllowed();
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosed() {
        this.done = true;
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosedOnError(Exception exc) {
        StreamError streamError;
        this.done = false;
        if ((!(exc instanceof XMPPException) || (streamError = ((XMPPException) exc).getStreamError()) == null || !"conflict".equals(streamError.getCode())) && isReconnectionAllowed()) {
            reconnect();
        }
    }

    protected void notifyAttemptToReconnectIn(int i) {
        if (isReconnectionAllowed()) {
            for (ConnectionListener connectionListener : this.connection.connectionListeners) {
                connectionListener.reconnectingIn(i);
            }
        }
    }

    protected void notifyReconnectionFailed(Exception exc) {
        if (isReconnectionAllowed()) {
            for (ConnectionListener connectionListener : this.connection.connectionListeners) {
                connectionListener.reconnectionFailed(exc);
            }
        }
    }

    protected void reconnect() {
        synchronized (this) {
            if (isReconnectionAllowed() && (this.reconnectionThread == null || !this.reconnectionThread.isAlive())) {
                this.reconnectionThread = new Thread() { // from class: org.jivesoftware.smack.ReconnectionManager.2
                    private int attempts = 0;

                    private int timeDelay() {
                        this.attempts++;
                        return this.attempts > 13 ? ReconnectionManager.this.randomBase * 6 * 5 : this.attempts > 7 ? ReconnectionManager.this.randomBase * 6 : ReconnectionManager.this.randomBase;
                    }

                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        while (ReconnectionManager.this.isReconnectionAllowed()) {
                            int timeDelay = timeDelay();
                            while (ReconnectionManager.this.isReconnectionAllowed() && timeDelay > 0) {
                                int i = timeDelay;
                                try {
                                    Thread.sleep(1000L);
                                    timeDelay--;
                                    ReconnectionManager.this.notifyAttemptToReconnectIn(timeDelay);
                                } catch (InterruptedException e) {
                                    e.printStackTrace();
                                    ReconnectionManager.this.notifyReconnectionFailed(e);
                                    timeDelay = i;
                                }
                            }
                            try {
                                if (ReconnectionManager.this.isReconnectionAllowed()) {
                                    ReconnectionManager.this.connection.connect();
                                }
                            } catch (XMPPException e2) {
                                ReconnectionManager.this.notifyReconnectionFailed(e2);
                            }
                        }
                    }
                };
                this.reconnectionThread.setName("Smack Reconnection Manager");
                this.reconnectionThread.setDaemon(true);
                this.reconnectionThread.start();
            }
        }
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectingIn(int i) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionFailed(Exception exc) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionSuccessful() {
    }
}
