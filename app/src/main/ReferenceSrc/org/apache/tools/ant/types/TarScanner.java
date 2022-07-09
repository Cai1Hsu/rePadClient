package org.apache.tools.ant.types;

import java.io.IOException;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.resources.TarResource;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/types/TarScanner.class */
public class TarScanner extends ArchiveScanner {
    @Override // org.apache.tools.ant.types.ArchiveScanner
    protected void fillMapsFromArchive(Resource resource, String str, Map map, Map map2, Map map3, Map map4) {
        TarInputStream tarInputStream;
        Throwable th;
        TarInputStream tarInputStream2 = null;
        try {
            try {
                TarInputStream tarInputStream3 = new TarInputStream(resource.getInputStream());
                while (true) {
                    try {
                        TarEntry nextEntry = tarInputStream3.getNextEntry();
                        if (nextEntry == null) {
                            FileUtils.close(tarInputStream3);
                            return;
                        }
                        TarResource tarResource = new TarResource(resource, nextEntry);
                        String name = nextEntry.getName();
                        if (nextEntry.isDirectory()) {
                            String trimSeparator = trimSeparator(name);
                            map3.put(trimSeparator, tarResource);
                            if (match(trimSeparator)) {
                                map4.put(trimSeparator, tarResource);
                            }
                        } else {
                            map.put(name, tarResource);
                            if (match(name)) {
                                map2.put(name, tarResource);
                            }
                        }
                    } catch (IOException e) {
                        e = e;
                        tarInputStream = tarInputStream3;
                        TarInputStream tarInputStream4 = tarInputStream;
                        TarInputStream tarInputStream5 = tarInputStream;
                        TarInputStream tarInputStream6 = tarInputStream;
                        TarInputStream tarInputStream7 = tarInputStream;
                        throw new BuildException(new StringBuffer().append("problem reading ").append(this.srcFile).toString(), e);
                    } catch (Throwable th2) {
                        th = th2;
                        tarInputStream2 = tarInputStream3;
                        FileUtils.close(tarInputStream2);
                        throw th;
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e2) {
            try {
                throw new BuildException(new StringBuffer().append("problem opening ").append(this.srcFile).toString(), e2);
            } catch (IOException e3) {
                e = e3;
                tarInputStream = null;
                TarInputStream tarInputStream42 = tarInputStream;
                TarInputStream tarInputStream52 = tarInputStream;
                TarInputStream tarInputStream62 = tarInputStream;
                TarInputStream tarInputStream72 = tarInputStream;
                throw new BuildException(new StringBuffer().append("problem reading ").append(this.srcFile).toString(), e);
            }
        }
    }
}
