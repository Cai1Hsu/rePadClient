package com.mongodb;

import java.util.Arrays;
import java.util.List;

/* loaded from: classes.dex */
class ServerAddressSelector implements ServerSelector {
    private final ServerAddress address;

    public ServerAddressSelector(ServerAddress address) {
        this.address = address;
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return Arrays.asList(clusterDescription.getByServerAddress(this.address));
    }
}
