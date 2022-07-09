package org.apache.tools.ant.taskdefs;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.bzip2.CBZip2OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/BZip2.class */
public class BZip2 extends Pack {
    static Class class$org$apache$tools$ant$taskdefs$BZip2;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Pack
    protected void pack() {
        Throwable th;
        CBZip2OutputStream cBZip2OutputStream;
        CBZip2OutputStream cBZip2OutputStream2;
        IOException e;
        CBZip2OutputStream cBZip2OutputStream3 = null;
        try {
            try {
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(this.zipFile));
                bufferedOutputStream.write(66);
                bufferedOutputStream.write(90);
                cBZip2OutputStream2 = new CBZip2OutputStream(bufferedOutputStream);
            } catch (IOException e2) {
                e = e2;
                cBZip2OutputStream2 = null;
            }
        } catch (Throwable th2) {
            th = th2;
            cBZip2OutputStream = cBZip2OutputStream3;
        }
        try {
            zipResource(getSrcResource(), cBZip2OutputStream2);
            FileUtils.close(cBZip2OutputStream2);
        } catch (IOException e3) {
            e = e3;
            CBZip2OutputStream cBZip2OutputStream4 = cBZip2OutputStream2;
            CBZip2OutputStream cBZip2OutputStream5 = cBZip2OutputStream2;
            CBZip2OutputStream cBZip2OutputStream6 = cBZip2OutputStream2;
            CBZip2OutputStream cBZip2OutputStream7 = cBZip2OutputStream2;
            cBZip2OutputStream3 = cBZip2OutputStream2;
            throw new BuildException(new StringBuffer().append("Problem creating bzip2 ").append(e.getMessage()).toString(), e, getLocation());
        } catch (Throwable th3) {
            cBZip2OutputStream = cBZip2OutputStream2;
            th = th3;
            FileUtils.close(cBZip2OutputStream);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Pack
    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$BZip2 == null) {
            cls = class$("org.apache.tools.ant.taskdefs.BZip2");
            class$org$apache$tools$ant$taskdefs$BZip2 = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$BZip2;
        }
        return cls2.equals(cls);
    }
}
