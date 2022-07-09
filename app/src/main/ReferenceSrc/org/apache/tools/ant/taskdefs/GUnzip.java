package org.apache.tools.ant.taskdefs;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/GUnzip.class */
public class GUnzip extends Unpack {
    private static final int BUFFER_SIZE = 8192;
    private static final String DEFAULT_EXTENSION = ".gz";
    static Class class$org$apache$tools$ant$taskdefs$GUnzip;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Unpack
    protected void extract() {
        Throwable th;
        FileOutputStream fileOutputStream;
        IOException e;
        int read;
        if (this.source.lastModified() > this.dest.lastModified()) {
            log(new StringBuffer().append("Expanding ").append(this.source.getAbsolutePath()).append(" to ").append(this.dest.getAbsolutePath()).toString());
            GZIPInputStream gZIPInputStream = null;
            InputStream inputStream = null;
            InputStream inputStream2 = null;
            FileOutputStream fileOutputStream2 = null;
            GZIPInputStream gZIPInputStream2 = null;
            try {
                try {
                    fileOutputStream = new FileOutputStream(this.dest);
                    InputStream inputStream3 = null;
                    InputStream inputStream4 = null;
                    try {
                        inputStream = this.srcResource.getInputStream();
                        inputStream3 = inputStream;
                        inputStream4 = inputStream;
                        gZIPInputStream2 = new GZIPInputStream(inputStream);
                    } catch (IOException e2) {
                        e = e2;
                        inputStream = inputStream4;
                    } catch (Throwable th2) {
                        inputStream = inputStream3;
                        fileOutputStream2 = fileOutputStream;
                        gZIPInputStream2 = null;
                        th = th2;
                    }
                } catch (IOException e3) {
                    e = e3;
                    fileOutputStream = null;
                }
            } catch (Throwable th3) {
                th = th3;
                inputStream = inputStream2;
            }
            try {
                byte[] bArr = new byte[8192];
                int i = 0;
                do {
                    fileOutputStream.write(bArr, 0, i);
                    read = gZIPInputStream2.read(bArr, 0, bArr.length);
                    i = read;
                } while (read != -1);
                FileUtils.close(inputStream);
                FileUtils.close(fileOutputStream);
                FileUtils.close(gZIPInputStream2);
            } catch (IOException e4) {
                e = e4;
                gZIPInputStream = gZIPInputStream2;
                InputStream inputStream5 = inputStream;
                InputStream inputStream6 = inputStream;
                InputStream inputStream7 = inputStream;
                InputStream inputStream8 = inputStream;
                inputStream2 = inputStream;
                fileOutputStream2 = fileOutputStream;
                gZIPInputStream2 = gZIPInputStream;
                throw new BuildException(new StringBuffer().append("Problem expanding gzip ").append(e.getMessage()).toString(), e, getLocation());
            } catch (Throwable th4) {
                fileOutputStream2 = fileOutputStream;
                th = th4;
                FileUtils.close(inputStream);
                FileUtils.close(fileOutputStream2);
                FileUtils.close(gZIPInputStream2);
                throw th;
            }
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Unpack
    protected String getDefaultExtension() {
        return DEFAULT_EXTENSION;
    }

    @Override // org.apache.tools.ant.taskdefs.Unpack
    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$GUnzip == null) {
            cls = class$("org.apache.tools.ant.taskdefs.GUnzip");
            class$org$apache$tools$ant$taskdefs$GUnzip = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$GUnzip;
        }
        return cls2.equals(cls);
    }
}
