package com.mongodb;

import java.util.List;

/* loaded from: classes.dex */
interface ServerSelector {
    List<ServerDescription> choose(ClusterDescription clusterDescription);
}
