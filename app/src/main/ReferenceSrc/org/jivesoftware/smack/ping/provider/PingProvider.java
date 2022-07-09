package org.jivesoftware.smack.ping.provider;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.ping.packet.Ping;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/ping/provider/PingProvider.class */
public class PingProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        return new Ping();
    }
}
