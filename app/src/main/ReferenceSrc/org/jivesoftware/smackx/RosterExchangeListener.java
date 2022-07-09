package org.jivesoftware.smackx;

import java.util.Iterator;

/* loaded from: classes.jar:org/jivesoftware/smackx/RosterExchangeListener.class */
public interface RosterExchangeListener {
    void entriesReceived(String str, Iterator<RemoteRosterEntry> it);
}
