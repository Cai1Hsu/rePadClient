package com.mongodb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
class ServerVersion implements Comparable<ServerVersion> {
    private final List<Integer> versionList;

    public ServerVersion() {
        this.versionList = Collections.unmodifiableList(Arrays.asList(0, 0, 0));
    }

    public ServerVersion(List<Integer> versionList) {
        Assertions.notNull("versionList", versionList);
        Assertions.isTrue("version array has three elements", versionList.size() == 3);
        this.versionList = Collections.unmodifiableList(new ArrayList(versionList));
    }

    public ServerVersion(int majorVersion, int minorVersion) {
        this(Arrays.asList(Integer.valueOf(majorVersion), Integer.valueOf(minorVersion), 0));
    }

    public List<Integer> getVersionList() {
        return this.versionList;
    }

    public int compareTo(ServerVersion o) {
        int retVal = 0;
        for (int i = 0; i < this.versionList.size() && (retVal = this.versionList.get(i).compareTo(o.versionList.get(i))) == 0; i++) {
        }
        return retVal;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ServerVersion that = (ServerVersion) o;
        return this.versionList.equals(that.versionList);
    }

    public int hashCode() {
        return this.versionList.hashCode();
    }

    public String toString() {
        return "ServerVersion{versionList=" + this.versionList + '}';
    }
}
