package org.apache.commons.compress.compressors.pack200;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;
import java.util.jar.Pack200;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/pack200/Pack200Utils.class */
public class Pack200Utils {
    private Pack200Utils() {
    }

    public static void normalize(File file) throws IOException {
        normalize(file, file, null);
    }

    public static void normalize(File file, File file2) throws IOException {
        normalize(file, file2, null);
    }

    public static void normalize(File file, File file2, Map<String, String> map) throws IOException {
        JarOutputStream th;
        JarFile jarFile;
        JarOutputStream jarOutputStream;
        HashMap hashMap = map;
        if (map == null) {
            hashMap = new HashMap();
        }
        hashMap.put("pack.segment.limit", "-1");
        File createTempFile = File.createTempFile("commons-compress", "pack200normalize");
        createTempFile.deleteOnExit();
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(createTempFile);
            JarOutputStream jarOutputStream2 = fileOutputStream;
            try {
                Pack200.Packer newPacker = Pack200.newPacker();
                newPacker.properties().putAll(hashMap);
                JarFile jarFile2 = new JarFile(file);
                try {
                    newPacker.pack(jarFile2, fileOutputStream);
                    jarFile = null;
                    fileOutputStream.close();
                    Pack200.Unpacker newUnpacker = Pack200.newUnpacker();
                    jarOutputStream2 = null;
                    jarOutputStream = new JarOutputStream(new FileOutputStream(file2));
                    try {
                        newUnpacker.unpack(createTempFile, jarOutputStream);
                        if (0 != 0) {
                            throw new NullPointerException();
                        }
                        if (jarOutputStream != null) {
                            jarOutputStream.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        jarOutputStream2 = jarOutputStream;
                        if (jarFile != null) {
                            jarFile.close();
                        }
                        if (jarOutputStream2 != null) {
                            jarOutputStream2.close();
                        }
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    jarFile = jarFile2;
                    jarOutputStream2 = fileOutputStream;
                }
            } catch (Throwable unused) {
                jarFile = null;
                th = jarOutputStream;
            }
        } finally {
            createTempFile.delete();
        }
    }

    public static void normalize(File file, Map<String, String> map) throws IOException {
        normalize(file, file, map);
    }
}
