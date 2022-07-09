package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/HashvalueAlgorithm.class */
public class HashvalueAlgorithm implements Algorithm {
    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public String getValue(File file) {
        FileReader fileReader;
        Throwable th;
        FileReader fileReader2;
        String str;
        try {
            if (!file.canRead()) {
                FileUtils.close((Reader) null);
                str = null;
            } else {
                fileReader = new FileReader(file);
                try {
                    str = Integer.toString(FileUtils.readFully(fileReader).hashCode());
                    FileUtils.close(fileReader);
                } catch (Exception e) {
                    fileReader2 = fileReader;
                    FileUtils.close(fileReader2);
                    str = null;
                    return str;
                } catch (Throwable th2) {
                    th = th2;
                    FileUtils.close(fileReader);
                    throw th;
                }
            }
        } catch (Exception e2) {
            fileReader2 = null;
        } catch (Throwable th3) {
            th = th3;
            fileReader = null;
        }
        return str;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Algorithm
    public boolean isValid() {
        return true;
    }

    public String toString() {
        return "HashvalueAlgorithm";
    }
}
