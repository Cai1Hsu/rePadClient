package org.jivesoftware.smack.provider;

import org.jivesoftware.smack.packet.IQ;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/provider/IQProvider.class */
public interface IQProvider {
    IQ parseIQ(XmlPullParser xmlPullParser) throws Exception;
}
