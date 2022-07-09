package org.jivesoftware.smackx.pubsub.provider;

import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.provider.EmbeddedExtensionProvider;
import org.jivesoftware.smackx.pubsub.FormNode;
import org.jivesoftware.smackx.pubsub.FormNodeType;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/provider/FormNodeProvider.class */
public class FormNodeProvider extends EmbeddedExtensionProvider {
    @Override // org.jivesoftware.smackx.provider.EmbeddedExtensionProvider
    protected PacketExtension createReturnExtension(String str, String str2, Map<String, String> map, List<? extends PacketExtension> list) {
        return new FormNode(FormNodeType.valueOfFromElementName(str, str2), map.get("node"), new Form((DataForm) list.iterator().next()));
    }
}
