package org.apache.tools.ant;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/tools/ant/DemuxInputStream.class */
public class DemuxInputStream extends InputStream {
    private static final int MASK_8BIT = 255;
    private Project project;

    public DemuxInputStream(Project project) {
        this.project = project;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        byte[] bArr = new byte[1];
        if (this.project.demuxInput(bArr, 0, 1) != -1) {
            i = bArr[0] & 255;
        }
        return i;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        return this.project.demuxInput(bArr, i, i2);
    }
}
