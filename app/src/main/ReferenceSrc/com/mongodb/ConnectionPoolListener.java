package com.mongodb;

import java.util.EventListener;

/* loaded from: classes.dex */
interface ConnectionPoolListener extends EventListener {
    void connectionAdded(ConnectionEvent connectionEvent);

    void connectionCheckedIn(ConnectionEvent connectionEvent);

    void connectionCheckedOut(ConnectionEvent connectionEvent);

    void connectionPoolClosed(ConnectionPoolEvent connectionPoolEvent);

    void connectionPoolOpened(ConnectionPoolOpenedEvent connectionPoolOpenedEvent);

    void connectionRemoved(ConnectionEvent connectionEvent);

    void waitQueueEntered(ConnectionPoolWaitQueueEvent connectionPoolWaitQueueEvent);

    void waitQueueExited(ConnectionPoolWaitQueueEvent connectionPoolWaitQueueEvent);
}
