package org.apache.commons.net;

import java.util.EventListener;

/* loaded from: classes.jar:org/apache/commons/net/ProtocolCommandListener.class */
public interface ProtocolCommandListener extends EventListener {
    void protocolCommandSent(ProtocolCommandEvent protocolCommandEvent);

    void protocolReplyReceived(ProtocolCommandEvent protocolCommandEvent);
}
