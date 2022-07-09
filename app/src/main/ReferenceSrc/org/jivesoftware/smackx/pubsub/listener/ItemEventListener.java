package org.jivesoftware.smackx.pubsub.listener;

import org.jivesoftware.smackx.pubsub.Item;
import org.jivesoftware.smackx.pubsub.ItemPublishEvent;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/listener/ItemEventListener.class */
public interface ItemEventListener<T extends Item> {
    void handlePublishedItems(ItemPublishEvent<T> itemPublishEvent);
}
