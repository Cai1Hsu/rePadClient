package org.apache.tools.ant.types;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;
import java.util.zip.ZipException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.ZipResource;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

/* loaded from: classes.jar:org/apache/tools/ant/types/ZipScanner.class */
public class ZipScanner extends ArchiveScanner {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.ArchiveScanner
    protected void fillMapsFromArchive(Resource resource, String str, Map map, Map map2, Map map3, Map map4) {
        Class cls;
        ZipFile zipFile;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        if (fileProvider != null) {
            File file = fileProvider.getFile();
            try {
                try {
                    zipFile = new ZipFile(file, str);
                } catch (Throwable th) {
                    th = th;
                    zipFile = null;
                }
                try {
                    Enumeration entries = zipFile.getEntries();
                    while (entries.hasMoreElements()) {
                        ZipEntry zipEntry = (ZipEntry) entries.nextElement();
                        ZipResource zipResource = new ZipResource(file, str, zipEntry);
                        String name = zipEntry.getName();
                        if (zipEntry.isDirectory()) {
                            String trimSeparator = trimSeparator(name);
                            map3.put(trimSeparator, zipResource);
                            if (match(trimSeparator)) {
                                map4.put(trimSeparator, zipResource);
                            }
                        } else {
                            map.put(name, zipResource);
                            if (match(name)) {
                                map2.put(name, zipResource);
                            }
                        }
                    }
                    ZipFile.closeQuietly(zipFile);
                    return;
                } catch (Throwable th2) {
                    th = th2;
                    ZipFile.closeQuietly(zipFile);
                    throw th;
                }
            } catch (ZipException e) {
                throw new BuildException(new StringBuffer().append("Problem reading ").append(file).toString(), e);
            } catch (IOException e2) {
                throw new BuildException(new StringBuffer().append("Problem opening ").append(file).toString(), e2);
            }
        }
        throw new BuildException("Only file provider resources are supported");
    }
}
