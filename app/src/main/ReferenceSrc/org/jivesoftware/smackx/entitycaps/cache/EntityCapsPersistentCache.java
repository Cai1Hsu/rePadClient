package org.jivesoftware.smackx.entitycaps.cache;

import java.io.IOException;
import org.jivesoftware.smackx.packet.DiscoverInfo;

/* loaded from: classes.jar:org/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache.class */
public interface EntityCapsPersistentCache {
    void addDiscoverInfoByNodePersistent(String str, DiscoverInfo discoverInfo);

    void emptyCache();

    void replay() throws IOException;
}
