package org.jivesoftware.smackx.pubsub.provider;

import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.provider.EmbeddedExtensionProvider;
import org.jivesoftware.smackx.pubsub.Affiliation;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/provider/AffiliationProvider.class */
public class AffiliationProvider extends EmbeddedExtensionProvider {
    @Override // org.jivesoftware.smackx.provider.EmbeddedExtensionProvider
    protected PacketExtension createReturnExtension(String str, String str2, Map<String, String> map, List<? extends PacketExtension> list) {
        return new Affiliation(map.get("node"), Affiliation.Type.valueOf(map.get("affiliation")));
    }
}
