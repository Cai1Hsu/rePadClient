package org.jivesoftware.smackx.jingle.nat;

import java.net.DatagramPacket;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/DatagramListener.class */
public interface DatagramListener {
    boolean datagramReceived(DatagramPacket datagramPacket);
}
