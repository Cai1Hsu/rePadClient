package org.jivesoftware.smackx.pubsub;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/ConfigurationEvent.class */
public class ConfigurationEvent extends NodeExtension implements EmbeddedPacketExtension {
    private ConfigureForm form;

    public ConfigurationEvent(String str) {
        super(PubSubElementType.CONFIGURATION, str);
    }

    public ConfigurationEvent(String str, ConfigureForm configureForm) {
        super(PubSubElementType.CONFIGURATION, str);
        this.form = configureForm;
    }

    public ConfigureForm getConfiguration() {
        return this.form;
    }

    @Override // org.jivesoftware.smackx.pubsub.EmbeddedPacketExtension
    public List<PacketExtension> getExtensions() {
        return getConfiguration() == null ? Collections.EMPTY_LIST : Arrays.asList(getConfiguration().getDataFormToSend());
    }
}
