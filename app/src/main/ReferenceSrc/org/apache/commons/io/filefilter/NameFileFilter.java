package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.List;
import org.apache.commons.io.IOCase;

/* loaded from: classes.jar:org/apache/commons/io/filefilter/NameFileFilter.class */
public class NameFileFilter extends AbstractFileFilter implements Serializable {
    private final IOCase caseSensitivity;
    private final String[] names;

    public NameFileFilter(String str) {
        this(str, (IOCase) null);
    }

    public NameFileFilter(String str, IOCase iOCase) {
        if (str == null) {
            throw new IllegalArgumentException("The wildcard must not be null");
        }
        this.names = new String[]{str};
        this.caseSensitivity = iOCase == null ? IOCase.SENSITIVE : iOCase;
    }

    public NameFileFilter(List<String> list) {
        this(list, (IOCase) null);
    }

    public NameFileFilter(List<String> list, IOCase iOCase) {
        if (list == null) {
            throw new IllegalArgumentException("The list of names must not be null");
        }
        this.names = (String[]) list.toArray(new String[list.size()]);
        this.caseSensitivity = iOCase == null ? IOCase.SENSITIVE : iOCase;
    }

    public NameFileFilter(String[] strArr) {
        this(strArr, (IOCase) null);
    }

    public NameFileFilter(String[] strArr, IOCase iOCase) {
        if (strArr == null) {
            throw new IllegalArgumentException("The array of names must not be null");
        }
        this.names = new String[strArr.length];
        System.arraycopy(strArr, 0, this.names, 0, strArr.length);
        this.caseSensitivity = iOCase == null ? IOCase.SENSITIVE : iOCase;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        boolean z;
        String name = file.getName();
        String[] strArr = this.names;
        int length = strArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                z = false;
                break;
            }
            if (this.caseSensitivity.checkEquals(name, strArr[i])) {
                z = true;
                break;
            }
            i++;
        }
        return z;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String str) {
        boolean z;
        String[] strArr = this.names;
        int length = strArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                z = false;
                break;
            }
            if (this.caseSensitivity.checkEquals(str, strArr[i])) {
                z = true;
                break;
            }
            i++;
        }
        return z;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("(");
        if (this.names != null) {
            for (int i = 0; i < this.names.length; i++) {
                if (i > 0) {
                    sb.append(",");
                }
                sb.append(this.names[i]);
            }
        }
        sb.append(")");
        return sb.toString();
    }
}
