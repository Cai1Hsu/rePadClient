package org.jivesoftware.smackx.workgroup.agent;

import org.jivesoftware.smack.packet.Presence;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/AgentRosterListener.class */
public interface AgentRosterListener {
    void agentAdded(String str);

    void agentRemoved(String str);

    void presenceChanged(Presence presence);
}
