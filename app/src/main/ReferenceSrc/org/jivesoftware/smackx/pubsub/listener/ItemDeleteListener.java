package org.jivesoftware.smackx.pubsub.listener;

import org.jivesoftware.smackx.pubsub.ItemDeleteEvent;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/listener/ItemDeleteListener.class */
public interface ItemDeleteListener {
    void handleDeletedItems(ItemDeleteEvent itemDeleteEvent);

    void handlePurge();
}
