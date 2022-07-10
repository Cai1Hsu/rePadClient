package com.mongodb;

import com.mongodb.util.management.MBeanServerFactory;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class JMXConnectionPoolListener implements ConnectionPoolListener {
    private final String clusterDescription;
    private final ConcurrentMap<ClusterIdServerAddressPair, ConnectionPoolStatistics> map = new ConcurrentHashMap();

    public JMXConnectionPoolListener(String clusterDescription) {
        this.clusterDescription = clusterDescription;
    }

    public String getMBeanObjectName(String clusterId, ServerAddress serverAddress) {
        String adjustedClusterId = clusterId.replace(":", "%3A");
        String adjustedHost = serverAddress.getHost().replace(":", "%3A");
        String objectName = String.format("org.mongodb.driver:type=ConnectionPool,clusterId=%s,host=%s,port=%s", adjustedClusterId, adjustedHost, Integer.valueOf(serverAddress.getPort()));
        if (this.clusterDescription != null) {
            String adjustedClusterDescription = this.clusterDescription.replace(":", "%3A");
            return objectName + String.format(",description=%s", adjustedClusterDescription);
        }
        return objectName;
    }

    public ConnectionPoolStatisticsMBean getMBean(String clusterId, ServerAddress serverAddress) {
        return getStatistics(clusterId, serverAddress);
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolOpened(ConnectionPoolOpenedEvent event) {
        ConnectionPoolStatistics statistics = new ConnectionPoolStatistics(event);
        this.map.put(new ClusterIdServerAddressPair(event.getClusterId(), event.getServerAddress(), null), statistics);
        MBeanServerFactory.getMBeanServer().registerMBean(statistics, getMBeanObjectName(event.getClusterId(), event.getServerAddress()));
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolClosed(ConnectionPoolEvent event) {
        this.map.remove(new ClusterIdServerAddressPair(event.getClusterId(), event.getServerAddress(), null));
        MBeanServerFactory.getMBeanServer().unregisterMBean(getMBeanObjectName(event.getClusterId(), event.getServerAddress()));
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedOut(ConnectionEvent event) {
        ConnectionPoolStatistics statistics = getStatistics(event);
        if (statistics != null) {
            statistics.connectionCheckedOut(event);
        }
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedIn(ConnectionEvent event) {
        ConnectionPoolStatistics statistics = getStatistics(event);
        if (statistics != null) {
            statistics.connectionCheckedIn(event);
        }
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueEntered(ConnectionPoolWaitQueueEvent event) {
        ConnectionPoolListener statistics = getStatistics(event);
        if (statistics != null) {
            statistics.waitQueueEntered(event);
        }
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueExited(ConnectionPoolWaitQueueEvent event) {
        ConnectionPoolListener statistics = getStatistics(event);
        if (statistics != null) {
            statistics.waitQueueExited(event);
        }
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionAdded(ConnectionEvent event) {
        ConnectionPoolStatistics statistics = getStatistics(event);
        if (statistics != null) {
            statistics.connectionAdded(event);
        }
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionRemoved(ConnectionEvent event) {
        ConnectionPoolStatistics statistics = getStatistics(event);
        if (statistics != null) {
            statistics.connectionRemoved(event);
        }
    }

    private ConnectionPoolStatistics getStatistics(ConnectionEvent event) {
        return getStatistics(event.getClusterId(), event.getServerAddress());
    }

    private ConnectionPoolListener getStatistics(ConnectionPoolEvent event) {
        return getStatistics(event.getClusterId(), event.getServerAddress());
    }

    private ConnectionPoolStatistics getStatistics(String clusterId, ServerAddress serverAddress) {
        return this.map.get(new ClusterIdServerAddressPair(clusterId, serverAddress, null));
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static final class ClusterIdServerAddressPair {
        private final String clusterId;
        private final ServerAddress serverAddress;

        /* synthetic */ ClusterIdServerAddressPair(String x0, ServerAddress x1, AnonymousClass1 x2) {
            this(x0, x1);
        }

        private ClusterIdServerAddressPair(String clusterId, ServerAddress serverAddress) {
            this.clusterId = clusterId;
            this.serverAddress = serverAddress;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            ClusterIdServerAddressPair that = (ClusterIdServerAddressPair) o;
            return this.clusterId.equals(that.clusterId) && this.serverAddress.equals(that.serverAddress);
        }

        public int hashCode() {
            int result = this.clusterId.hashCode();
            return (result * 31) + this.serverAddress.hashCode();
        }
    }
}
