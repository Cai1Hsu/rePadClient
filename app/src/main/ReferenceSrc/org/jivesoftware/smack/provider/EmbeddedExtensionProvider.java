package org.jivesoftware.smack.provider;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/provider/EmbeddedExtensionProvider.class */
public abstract class EmbeddedExtensionProvider implements PacketExtensionProvider {
    protected abstract PacketExtension createReturnExtension(String str, String str2, Map<String, String> map, List<? extends PacketExtension> list);

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public final PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        String namespace = xmlPullParser.getNamespace();
        String name = xmlPullParser.getName();
        HashMap hashMap = new HashMap();
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            hashMap.put(xmlPullParser.getAttributeName(i), xmlPullParser.getAttributeValue(i));
        }
        ArrayList arrayList = new ArrayList();
        do {
            if (xmlPullParser.next() == 2) {
                arrayList.add(PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
            }
        } while (!name.equals(xmlPullParser.getName()));
        return createReturnExtension(name, namespace, hashMap, arrayList);
    }
}
