package org.jivesoftware.smackx.provider;

import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.packet.HeadersExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/HeadersProvider.class */
public class HeadersProvider extends EmbeddedExtensionProvider {
    @Override // org.jivesoftware.smackx.provider.EmbeddedExtensionProvider
    protected PacketExtension createReturnExtension(String str, String str2, Map<String, String> map, List<? extends PacketExtension> list) {
        return new HeadersExtension(list);
    }
}
