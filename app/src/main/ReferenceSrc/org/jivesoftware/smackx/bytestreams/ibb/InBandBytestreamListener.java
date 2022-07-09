package org.jivesoftware.smackx.bytestreams.ibb;

import org.jivesoftware.smackx.bytestreams.BytestreamListener;
import org.jivesoftware.smackx.bytestreams.BytestreamRequest;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamListener.class */
public abstract class InBandBytestreamListener implements BytestreamListener {
    @Override // org.jivesoftware.smackx.bytestreams.BytestreamListener
    public void incomingBytestreamRequest(BytestreamRequest bytestreamRequest) {
        incomingBytestreamRequest((InBandBytestreamRequest) bytestreamRequest);
    }

    public abstract void incomingBytestreamRequest(InBandBytestreamRequest inBandBytestreamRequest);
}
