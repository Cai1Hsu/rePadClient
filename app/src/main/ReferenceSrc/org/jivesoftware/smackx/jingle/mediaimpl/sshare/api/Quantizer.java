package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer.class */
public interface Quantizer {
    void addPixels(int[] iArr, int i, int i2);

    int[] buildColorTable();

    int getIndexForColor(int i);

    void setup(int i);
}
