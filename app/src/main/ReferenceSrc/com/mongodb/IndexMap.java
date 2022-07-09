package com.mongodb;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
abstract class IndexMap {
    abstract IndexMap add(int i, int i2);

    abstract int map(int i);

    IndexMap() {
    }

    static IndexMap create() {
        return new RangeBased();
    }

    static IndexMap create(int startIndex, int count) {
        return new RangeBased(startIndex, count);
    }

    /* loaded from: classes.dex */
    private static class HashBased extends IndexMap {
        private final Map<Integer, Integer> indexMap = new HashMap();

        public HashBased(int startIndex, int count) {
            for (int i = startIndex; i <= count; i++) {
                this.indexMap.put(Integer.valueOf(i - startIndex), Integer.valueOf(i));
            }
        }

        @Override // com.mongodb.IndexMap
        public IndexMap add(int index, int originalIndex) {
            this.indexMap.put(Integer.valueOf(index), Integer.valueOf(originalIndex));
            return this;
        }

        @Override // com.mongodb.IndexMap
        public int map(int index) {
            Integer originalIndex = this.indexMap.get(Integer.valueOf(index));
            if (originalIndex == null) {
                throw new MongoInternalException("no mapping found for index " + index);
            }
            return originalIndex.intValue();
        }
    }

    /* loaded from: classes.dex */
    private static class RangeBased extends IndexMap {
        private int count;
        private int startIndex;

        public RangeBased() {
        }

        public RangeBased(int startIndex, int count) {
            this.startIndex = startIndex;
            this.count = count;
        }

        @Override // com.mongodb.IndexMap
        public IndexMap add(int index, int originalIndex) {
            if (this.count == 0) {
                this.startIndex = originalIndex;
                this.count = 1;
                return this;
            } else if (originalIndex == this.startIndex + this.count) {
                this.count++;
                return this;
            } else {
                IndexMap hashBasedMap = new HashBased(this.startIndex, this.count);
                hashBasedMap.add(index, originalIndex);
                return hashBasedMap;
            }
        }

        @Override // com.mongodb.IndexMap
        public int map(int index) {
            if (index >= this.count) {
                throw new MongoInternalException("index should not be greater than count");
            }
            return this.startIndex + index;
        }
    }
}
