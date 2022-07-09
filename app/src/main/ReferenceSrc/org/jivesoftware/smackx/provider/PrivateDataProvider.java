package org.jivesoftware.smackx.provider;

import org.jivesoftware.smackx.packet.PrivateData;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/PrivateDataProvider.class */
public interface PrivateDataProvider {
    PrivateData parsePrivateData(XmlPullParser xmlPullParser) throws Exception;
}
