package org.jivesoftware.smackx.bytestreams.socks5;

import org.jivesoftware.smackx.bytestreams.BytestreamListener;
import org.jivesoftware.smackx.bytestreams.BytestreamRequest;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamListener.class */
public abstract class Socks5BytestreamListener implements BytestreamListener {
    @Override // org.jivesoftware.smackx.bytestreams.BytestreamListener
    public void incomingBytestreamRequest(BytestreamRequest bytestreamRequest) {
        incomingBytestreamRequest((Socks5BytestreamRequest) bytestreamRequest);
    }

    public abstract void incomingBytestreamRequest(Socks5BytestreamRequest socks5BytestreamRequest);
}
