package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.zip.Adler32;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import java.util.zip.Checksum;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm.class */
public class ChecksumAlgorithm implements Algorithm {
    private String algorithm = "CRC";
    private Checksum checksum = null;

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public String getValue(File file) {
        initChecksum();
        String str = null;
        try {
            if (file.canRead()) {
                this.checksum.reset();
                CheckedInputStream checkedInputStream = new CheckedInputStream(new FileInputStream(file), this.checksum);
                BufferedInputStream bufferedInputStream = new BufferedInputStream(checkedInputStream);
                do {
                } while (bufferedInputStream.read() != -1);
                str = Long.toString(checkedInputStream.getChecksum().getValue());
                bufferedInputStream.close();
            }
        } catch (Exception e) {
            str = null;
        }
        return str;
    }

    public void initChecksum() {
        if (this.checksum != null) {
            return;
        }
        if ("CRC".equals(this.algorithm)) {
            this.checksum = new CRC32();
        } else if (!"ADLER".equals(this.algorithm)) {
            throw new BuildException(new NoSuchAlgorithmException());
        } else {
            this.checksum = new Adler32();
        }
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public boolean isValid() {
        return "CRC".equals(this.algorithm) || "ADLER".equals(this.algorithm);
    }

    public void setAlgorithm(String str) {
        this.algorithm = str != null ? str.toUpperCase(Locale.ENGLISH) : null;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("<ChecksumAlgorithm:");
        stringBuffer.append("algorithm=").append(this.algorithm);
        stringBuffer.append(">");
        return stringBuffer.toString();
    }
}
