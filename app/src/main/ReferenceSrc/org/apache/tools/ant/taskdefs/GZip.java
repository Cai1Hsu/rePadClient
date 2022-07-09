package org.apache.tools.ant.taskdefs;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/GZip.class */
public class GZip extends Pack {
    static Class class$org$apache$tools$ant$taskdefs$GZip;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Pack
    protected void pack() {
        GZIPOutputStream gZIPOutputStream;
        Throwable th;
        IOException e;
        GZIPOutputStream gZIPOutputStream2 = null;
        try {
            try {
                gZIPOutputStream = new GZIPOutputStream(new FileOutputStream(this.zipFile));
            } catch (IOException e2) {
                e = e2;
                gZIPOutputStream = null;
            }
        } catch (Throwable th2) {
            th = th2;
            gZIPOutputStream = gZIPOutputStream2;
        }
        try {
            zipResource(getSrcResource(), gZIPOutputStream);
            FileUtils.close(gZIPOutputStream);
        } catch (IOException e3) {
            e = e3;
            GZIPOutputStream gZIPOutputStream3 = gZIPOutputStream;
            GZIPOutputStream gZIPOutputStream4 = gZIPOutputStream;
            GZIPOutputStream gZIPOutputStream5 = gZIPOutputStream;
            GZIPOutputStream gZIPOutputStream6 = gZIPOutputStream;
            gZIPOutputStream2 = gZIPOutputStream;
            throw new BuildException(new StringBuffer().append("Problem creating gzip ").append(e.getMessage()).toString(), e, getLocation());
        } catch (Throwable th3) {
            th = th3;
            FileUtils.close(gZIPOutputStream);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Pack
    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$GZip == null) {
            cls = class$("org.apache.tools.ant.taskdefs.GZip");
            class$org$apache$tools$ant$taskdefs$GZip = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$GZip;
        }
        return cls2.equals(cls);
    }
}
