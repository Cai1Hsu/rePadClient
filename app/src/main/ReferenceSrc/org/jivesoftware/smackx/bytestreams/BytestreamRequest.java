package org.jivesoftware.smackx.bytestreams;

import org.jivesoftware.smack.XMPPException;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/BytestreamRequest.class */
public interface BytestreamRequest {
    BytestreamSession accept() throws XMPPException, InterruptedException;

    String getFrom();

    String getSessionID();

    void reject();
}
