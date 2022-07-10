package com.mongodb;

import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
interface ServerSelector {
    List<ServerDescription> choose(ClusterDescription clusterDescription);
}
