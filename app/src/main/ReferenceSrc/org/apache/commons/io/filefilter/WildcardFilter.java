package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.List;
import org.apache.commons.io.FilenameUtils;

@Deprecated
/* loaded from: classes.jar:org/apache/commons/io/filefilter/WildcardFilter.class */
public class WildcardFilter extends AbstractFileFilter implements Serializable {
    private final String[] wildcards;

    public WildcardFilter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("The wildcard must not be null");
        }
        this.wildcards = new String[]{str};
    }

    public WildcardFilter(List<String> list) {
        if (list == null) {
            throw new IllegalArgumentException("The wildcard list must not be null");
        }
        this.wildcards = (String[]) list.toArray(new String[list.size()]);
    }

    public WildcardFilter(String[] strArr) {
        if (strArr == null) {
            throw new IllegalArgumentException("The wildcard array must not be null");
        }
        this.wildcards = new String[strArr.length];
        System.arraycopy(strArr, 0, this.wildcards, 0, strArr.length);
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        boolean z;
        if (!file.isDirectory()) {
            String[] strArr = this.wildcards;
            int length = strArr.length;
            int i = 0;
            while (true) {
                z = false;
                if (i >= length) {
                    break;
                }
                if (FilenameUtils.wildcardMatch(file.getName(), strArr[i])) {
                    z = true;
                    break;
                }
                i++;
            }
        } else {
            z = false;
        }
        return z;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String str) {
        boolean z;
        if (file == null || !new File(file, str).isDirectory()) {
            String[] strArr = this.wildcards;
            int length = strArr.length;
            int i = 0;
            while (true) {
                z = false;
                if (i >= length) {
                    break;
                } else if (FilenameUtils.wildcardMatch(str, strArr[i])) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        } else {
            z = false;
        }
        return z;
    }
}
