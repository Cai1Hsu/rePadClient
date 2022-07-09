package org.apache.tools.ant.taskdefs;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.bzip2.CBZip2InputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/BUnzip2.class */
public class BUnzip2 extends Unpack {
    private static final int BUFFER_SIZE = 8192;
    private static final String DEFAULT_EXTENSION = ".bz2";
    static Class class$org$apache$tools$ant$taskdefs$BUnzip2;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Unpack
    protected void extract() {
        BufferedInputStream bufferedInputStream;
        FileOutputStream fileOutputStream;
        BufferedInputStream bufferedInputStream2;
        FileOutputStream fileOutputStream2;
        Throwable th;
        int read;
        if (this.source.lastModified() > this.dest.lastModified()) {
            log(new StringBuffer().append("Expanding ").append(this.source.getAbsolutePath()).append(" to ").append(this.dest.getAbsolutePath()).toString());
            CBZip2InputStream cBZip2InputStream = null;
            InputStream inputStream = null;
            InputStream inputStream2 = null;
            BufferedInputStream bufferedInputStream3 = null;
            InputStream inputStream3 = null;
            FileOutputStream fileOutputStream3 = null;
            CBZip2InputStream cBZip2InputStream2 = null;
            try {
                try {
                    fileOutputStream = new FileOutputStream(this.dest);
                    inputStream3 = null;
                    try {
                        inputStream2 = this.srcResource.getInputStream();
                        inputStream3 = inputStream2;
                        inputStream = inputStream2;
                        bufferedInputStream = new BufferedInputStream(inputStream2);
                        try {
                            if (bufferedInputStream.read() != 66) {
                                throw new BuildException("Invalid bz2 file.", getLocation());
                            }
                            if (bufferedInputStream.read() != 90) {
                                throw new BuildException("Invalid bz2 file.", getLocation());
                            }
                            CBZip2InputStream cBZip2InputStream3 = new CBZip2InputStream(bufferedInputStream);
                            try {
                                byte[] bArr = new byte[8192];
                                int i = 0;
                                do {
                                    fileOutputStream.write(bArr, 0, i);
                                    read = cBZip2InputStream3.read(bArr, 0, bArr.length);
                                    i = read;
                                } while (read != -1);
                                FileUtils.close(bufferedInputStream);
                                FileUtils.close(inputStream2);
                                FileUtils.close(fileOutputStream);
                                FileUtils.close(cBZip2InputStream3);
                            } catch (IOException e) {
                                cBZip2InputStream = cBZip2InputStream3;
                                e = e;
                                BufferedInputStream bufferedInputStream4 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream5 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream6 = bufferedInputStream;
                                BufferedInputStream bufferedInputStream7 = bufferedInputStream;
                                bufferedInputStream3 = bufferedInputStream;
                                inputStream3 = inputStream2;
                                fileOutputStream3 = fileOutputStream;
                                cBZip2InputStream2 = cBZip2InputStream;
                                throw new BuildException(new StringBuffer().append("Problem expanding bzip2 ").append(e.getMessage()).toString(), e, getLocation());
                            } catch (Throwable th2) {
                                bufferedInputStream2 = bufferedInputStream;
                                inputStream3 = inputStream2;
                                fileOutputStream2 = fileOutputStream;
                                cBZip2InputStream2 = cBZip2InputStream3;
                                th = th2;
                                FileUtils.close(bufferedInputStream2);
                                FileUtils.close(inputStream3);
                                FileUtils.close(fileOutputStream2);
                                FileUtils.close(cBZip2InputStream2);
                                throw th;
                            }
                        } catch (IOException e2) {
                            e = e2;
                        } catch (Throwable th3) {
                            bufferedInputStream2 = bufferedInputStream;
                            inputStream3 = inputStream2;
                            fileOutputStream2 = fileOutputStream;
                            cBZip2InputStream2 = null;
                            th = th3;
                        }
                    } catch (IOException e3) {
                        bufferedInputStream = null;
                        inputStream2 = inputStream;
                        e = e3;
                    } catch (Throwable th4) {
                        th = th4;
                        fileOutputStream2 = fileOutputStream;
                        bufferedInputStream2 = null;
                        cBZip2InputStream2 = null;
                    }
                } catch (IOException e4) {
                    e = e4;
                    bufferedInputStream = null;
                    fileOutputStream = null;
                }
            } catch (Throwable th5) {
                th = th5;
                fileOutputStream2 = fileOutputStream3;
                bufferedInputStream2 = bufferedInputStream3;
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
        if (class$org$apache$tools$ant$taskdefs$BUnzip2 == null) {
            cls = class$("org.apache.tools.ant.taskdefs.BUnzip2");
            class$org$apache$tools$ant$taskdefs$BUnzip2 = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$BUnzip2;
        }
        return cls2.equals(cls);
    }
}
