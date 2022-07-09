package org.apache.tools.ant.taskdefs;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.bzip2.CBZip2InputStream;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Untar.class */
public class Untar extends Expand {
    private UntarCompressionMethod compression = new UntarCompressionMethod();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod.class */
    public static final class UntarCompressionMethod extends EnumeratedAttribute {
        private static final String BZIP2 = "bzip2";
        private static final String GZIP = "gzip";
        private static final String NONE = "none";

        public UntarCompressionMethod() {
            setValue("none");
        }

        public InputStream decompress(String str, InputStream inputStream) throws IOException, BuildException {
            GZIPInputStream gZIPInputStream;
            String value = getValue();
            if (GZIP.equals(value)) {
                gZIPInputStream = new GZIPInputStream(inputStream);
            } else {
                gZIPInputStream = inputStream;
                if ("bzip2".equals(value)) {
                    for (char c : new char[]{'B', 'Z'}) {
                        if (inputStream.read() != c) {
                            throw new BuildException(new StringBuffer().append("Invalid bz2 file.").append(str).toString());
                        }
                    }
                    gZIPInputStream = new CBZip2InputStream(inputStream);
                }
            }
            return gZIPInputStream;
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"none", GZIP, "bzip2"};
        }
    }

    private void expandStream(String str, InputStream inputStream, File file) throws IOException {
        TarInputStream tarInputStream;
        try {
            TarInputStream tarInputStream2 = new TarInputStream(this.compression.decompress(str, new BufferedInputStream(inputStream)));
            try {
                log(new StringBuffer().append("Expanding: ").append(str).append(" into ").append(file).toString(), 2);
                boolean z = true;
                FileNameMapper mapper = getMapper();
                while (true) {
                    TarEntry nextEntry = tarInputStream2.getNextEntry();
                    if (nextEntry == null) {
                        break;
                    }
                    z = false;
                    extractFile(FileUtils.getFileUtils(), null, file, tarInputStream2, nextEntry.getName(), nextEntry.getModTime(), nextEntry.isDirectory(), mapper);
                }
                if (z && getFailOnEmptyArchive()) {
                    throw new BuildException(new StringBuffer().append("archive '").append(str).append("' is empty").toString());
                }
                log("expand complete", 3);
                FileUtils.close(tarInputStream2);
            } catch (Throwable th) {
                th = th;
                tarInputStream = tarInputStream2;
                FileUtils.close(tarInputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            tarInputStream = null;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Expand
    protected void expandFile(FileUtils fileUtils, File file, File file2) {
        Throwable th;
        FileInputStream fileInputStream;
        IOException e;
        FileInputStream fileInputStream2;
        FileInputStream fileInputStream3;
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("Unable to untar ").append(file).append(" as the file does not exist").toString(), getLocation());
        }
        FileInputStream fileInputStream4 = null;
        try {
            try {
                fileInputStream3 = new FileInputStream(file);
            } catch (IOException e2) {
                e = e2;
                fileInputStream2 = null;
            }
        } catch (Throwable th2) {
            th = th2;
            fileInputStream = fileInputStream4;
        }
        try {
            expandStream(file.getPath(), fileInputStream3, file2);
            FileUtils.close(fileInputStream3);
        } catch (IOException e3) {
            fileInputStream2 = fileInputStream3;
            e = e3;
            FileInputStream fileInputStream5 = fileInputStream2;
            FileInputStream fileInputStream6 = fileInputStream2;
            FileInputStream fileInputStream7 = fileInputStream2;
            fileInputStream4 = fileInputStream2;
            throw new BuildException(new StringBuffer().append("Error while expanding ").append(file.getPath()).append("\n").append(e.toString()).toString(), e, getLocation());
        } catch (Throwable th3) {
            fileInputStream = fileInputStream3;
            th = th3;
            FileUtils.close(fileInputStream);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.Expand
    protected void expandResource(Resource resource, File file) {
        if (!resource.isExists()) {
            throw new BuildException(new StringBuffer().append("Unable to untar ").append(resource.getName()).append(" as the it does not exist").toString(), getLocation());
        }
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        try {
            try {
                InputStream inputStream3 = resource.getInputStream();
                inputStream2 = inputStream3;
                inputStream = inputStream3;
                expandStream(resource.getName(), inputStream3, file);
                FileUtils.close(inputStream3);
            } catch (IOException e) {
                InputStream inputStream4 = inputStream2;
                InputStream inputStream5 = inputStream2;
                InputStream inputStream6 = inputStream2;
                inputStream = inputStream2;
                throw new BuildException(new StringBuffer().append("Error while expanding ").append(resource.getName()).toString(), e, getLocation());
            }
        } catch (Throwable th) {
            FileUtils.close(inputStream);
            throw th;
        }
    }

    public void setCompression(UntarCompressionMethod untarCompressionMethod) {
        this.compression = untarCompressionMethod;
    }

    @Override // org.apache.tools.ant.taskdefs.Expand
    public void setEncoding(String str) {
        throw new BuildException(new StringBuffer().append("The ").append(getTaskName()).append(" task doesn't support the encoding").append(" attribute").toString(), getLocation());
    }

    @Override // org.apache.tools.ant.taskdefs.Expand
    public void setScanForUnicodeExtraFields(boolean z) {
        throw new BuildException(new StringBuffer().append("The ").append(getTaskName()).append(" task doesn't support the encoding").append(" attribute").toString(), getLocation());
    }
}
