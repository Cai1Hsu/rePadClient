package org.apache.commons.compress.compressors;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.compress.compressors.bzip2.BZip2CompressorInputStream;
import org.apache.commons.compress.compressors.bzip2.BZip2CompressorOutputStream;
import org.apache.commons.compress.compressors.gzip.GzipCompressorInputStream;
import org.apache.commons.compress.compressors.gzip.GzipCompressorOutputStream;
import org.apache.commons.compress.compressors.pack200.Pack200CompressorInputStream;
import org.apache.commons.compress.compressors.pack200.Pack200CompressorOutputStream;
import org.apache.commons.compress.compressors.xz.XZCompressorInputStream;
import org.apache.commons.compress.compressors.xz.XZCompressorOutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/CompressorStreamFactory.class */
public class CompressorStreamFactory {
    public static final String BZIP2 = "bzip2";
    public static final String GZIP = "gz";
    public static final String PACK200 = "pack200";
    public static final String XZ = "xz";

    public CompressorInputStream createCompressorInputStream(InputStream inputStream) throws CompressorException {
        CompressorInputStream pack200CompressorInputStream;
        if (inputStream == null) {
            throw new IllegalArgumentException("Stream must not be null.");
        }
        if (!inputStream.markSupported()) {
            throw new IllegalArgumentException("Mark is not supported.");
        }
        byte[] bArr = new byte[12];
        inputStream.mark(bArr.length);
        try {
            int read = inputStream.read(bArr);
            inputStream.reset();
            if (BZip2CompressorInputStream.matches(bArr, read)) {
                pack200CompressorInputStream = new BZip2CompressorInputStream(inputStream);
            } else if (GzipCompressorInputStream.matches(bArr, read)) {
                pack200CompressorInputStream = new GzipCompressorInputStream(inputStream);
            } else if (XZCompressorInputStream.matches(bArr, read)) {
                pack200CompressorInputStream = new XZCompressorInputStream(inputStream);
            } else if (!Pack200CompressorInputStream.matches(bArr, read)) {
                throw new CompressorException("No Compressor found for the stream signature.");
            } else {
                pack200CompressorInputStream = new Pack200CompressorInputStream(inputStream);
            }
            return pack200CompressorInputStream;
        } catch (IOException e) {
            throw new CompressorException("Failed to detect Compressor from InputStream.", e);
        }
    }

    public CompressorInputStream createCompressorInputStream(String str, InputStream inputStream) throws CompressorException {
        CompressorInputStream pack200CompressorInputStream;
        if (str == null || inputStream == null) {
            throw new IllegalArgumentException("Compressor name and stream must not be null.");
        }
        try {
            if (GZIP.equalsIgnoreCase(str)) {
                pack200CompressorInputStream = new GzipCompressorInputStream(inputStream);
            } else if (BZIP2.equalsIgnoreCase(str)) {
                pack200CompressorInputStream = new BZip2CompressorInputStream(inputStream);
            } else if (XZ.equalsIgnoreCase(str)) {
                pack200CompressorInputStream = new XZCompressorInputStream(inputStream);
            } else if (!PACK200.equalsIgnoreCase(str)) {
                throw new CompressorException("Compressor: " + str + " not found.");
            } else {
                pack200CompressorInputStream = new Pack200CompressorInputStream(inputStream);
            }
            return pack200CompressorInputStream;
        } catch (IOException e) {
            throw new CompressorException("Could not create CompressorInputStream.", e);
        }
    }

    public CompressorOutputStream createCompressorOutputStream(String str, OutputStream outputStream) throws CompressorException {
        CompressorOutputStream pack200CompressorOutputStream;
        if (str == null || outputStream == null) {
            throw new IllegalArgumentException("Compressor name and stream must not be null.");
        }
        try {
            if (GZIP.equalsIgnoreCase(str)) {
                pack200CompressorOutputStream = new GzipCompressorOutputStream(outputStream);
            } else if (BZIP2.equalsIgnoreCase(str)) {
                pack200CompressorOutputStream = new BZip2CompressorOutputStream(outputStream);
            } else if (XZ.equalsIgnoreCase(str)) {
                pack200CompressorOutputStream = new XZCompressorOutputStream(outputStream);
            } else if (!PACK200.equalsIgnoreCase(str)) {
                throw new CompressorException("Compressor: " + str + " not found.");
            } else {
                pack200CompressorOutputStream = new Pack200CompressorOutputStream(outputStream);
            }
            return pack200CompressorOutputStream;
        } catch (IOException e) {
            throw new CompressorException("Could not create CompressorOutputStream", e);
        }
    }
}
