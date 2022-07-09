package org.apache.commons.compress.archivers.zip;

import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException.class */
public class UnsupportedZipFeatureException extends ZipException {
    private static final long serialVersionUID = 4430521921766595597L;
    private final ZipArchiveEntry entry;
    private final Feature reason;

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature.class */
    public static class Feature {
        private final String name;
        public static final Feature ENCRYPTION = new Feature("encryption");
        public static final Feature METHOD = new Feature("compression method");
        public static final Feature DATA_DESCRIPTOR = new Feature("data descriptor");

        private Feature(String str) {
            this.name = str;
        }

        public String toString() {
            return this.name;
        }
    }

    public UnsupportedZipFeatureException(Feature feature, ZipArchiveEntry zipArchiveEntry) {
        super("unsupported feature " + feature + " used in entry " + zipArchiveEntry.getName());
        this.reason = feature;
        this.entry = zipArchiveEntry;
    }

    public ZipArchiveEntry getEntry() {
        return this.entry;
    }

    public Feature getFeature() {
        return this.reason;
    }
}
