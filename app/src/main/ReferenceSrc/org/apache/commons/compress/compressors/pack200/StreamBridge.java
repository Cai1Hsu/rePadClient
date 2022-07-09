package org.apache.commons.compress.compressors.pack200;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/pack200/StreamBridge.class */
abstract class StreamBridge extends FilterOutputStream {
    private final Object INPUT_LOCK;
    private InputStream input;

    protected StreamBridge() {
        this(null);
    }

    protected StreamBridge(OutputStream outputStream) {
        super(outputStream);
        this.INPUT_LOCK = new Object();
    }

    InputStream getInput() throws IOException {
        synchronized (this.INPUT_LOCK) {
            if (this.input == null) {
                this.input = getInputView();
            }
        }
        return this.input;
    }

    abstract InputStream getInputView() throws IOException;

    void stop() throws IOException {
        close();
        synchronized (this.INPUT_LOCK) {
            if (this.input != null) {
                this.input.close();
                this.input = null;
            }
        }
    }
}
