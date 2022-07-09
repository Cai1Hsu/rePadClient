package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.File;
import java.io.FileInputStream;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.Locale;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm.class */
public class DigestAlgorithm implements Algorithm {
    private static final int BUFFER_SIZE = 8192;
    private static final int BYTE_MASK = 255;
    private String algorithm = "MD5";
    private String provider = null;
    private MessageDigest messageDigest = null;
    private int readBufferSize = 8192;

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public String getValue(File file) {
        String str;
        FileInputStream fileInputStream;
        initMessageDigest();
        try {
            if (!file.canRead()) {
                str = null;
            } else {
                byte[] bArr = new byte[this.readBufferSize];
                try {
                    this.messageDigest.reset();
                    fileInputStream = new FileInputStream(file);
                } catch (Exception e) {
                }
                try {
                    DigestInputStream digestInputStream = new DigestInputStream(fileInputStream, this.messageDigest);
                    do {
                    } while (digestInputStream.read(bArr, 0, this.readBufferSize) != -1);
                    digestInputStream.close();
                    fileInputStream.close();
                    byte[] digest = this.messageDigest.digest();
                    StringBuffer stringBuffer = new StringBuffer();
                    for (byte b : digest) {
                        String hexString = Integer.toHexString(b & 255);
                        if (hexString.length() < 2) {
                            stringBuffer.append("0");
                        }
                        stringBuffer.append(hexString);
                    }
                    str = stringBuffer.toString();
                } catch (Exception e2) {
                    str = null;
                    return str;
                }
            }
        } catch (Exception e3) {
            str = null;
        }
        return str;
    }

    public void initMessageDigest() {
        if (this.messageDigest != null) {
            return;
        }
        if (this.provider == null || "".equals(this.provider) || "null".equals(this.provider)) {
            try {
                this.messageDigest = MessageDigest.getInstance(this.algorithm);
                return;
            } catch (NoSuchAlgorithmException e) {
                throw new BuildException(e);
            }
        }
        try {
            this.messageDigest = MessageDigest.getInstance(this.algorithm, this.provider);
        } catch (NoSuchAlgorithmException e2) {
            throw new BuildException(e2);
        } catch (NoSuchProviderException e3) {
            throw new BuildException(e3);
        }
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public boolean isValid() {
        return "SHA".equals(this.algorithm) || "MD5".equals(this.algorithm);
    }

    public void setAlgorithm(String str) {
        this.algorithm = str != null ? str.toUpperCase(Locale.ENGLISH) : null;
    }

    public void setProvider(String str) {
        this.provider = str;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("<DigestAlgorithm:");
        stringBuffer.append("algorithm=").append(this.algorithm);
        stringBuffer.append(";provider=").append(this.provider);
        stringBuffer.append(">");
        return stringBuffer.toString();
    }
}
