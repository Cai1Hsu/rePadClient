package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.SymbolicLinkUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/TokenizedPath.class */
public class TokenizedPath {
    private final String path;
    private final String[] tokenizedPath;
    public static final TokenizedPath EMPTY_PATH = new TokenizedPath("", new String[0]);
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final SymbolicLinkUtils SYMLINK_UTILS = SymbolicLinkUtils.getSymbolicLinkUtils();
    private static final boolean[] CS_SCAN_ONLY = {true};
    private static final boolean[] CS_THEN_NON_CS = {true, false};

    public TokenizedPath(String str) {
        this(str, SelectorUtils.tokenizePathAsArray(str));
    }

    TokenizedPath(String str, String[] strArr) {
        this.path = str;
        this.tokenizedPath = strArr;
    }

    public TokenizedPath(TokenizedPath tokenizedPath, String str) {
        if (tokenizedPath.path.length() <= 0 || tokenizedPath.path.charAt(tokenizedPath.path.length() - 1) == File.separatorChar) {
            this.path = new StringBuffer().append(tokenizedPath.path).append(str).toString();
        } else {
            this.path = new StringBuffer().append(tokenizedPath.path).append(File.separatorChar).append(str).toString();
        }
        this.tokenizedPath = new String[tokenizedPath.tokenizedPath.length + 1];
        System.arraycopy(tokenizedPath.tokenizedPath, 0, this.tokenizedPath, 0, tokenizedPath.tokenizedPath.length);
        this.tokenizedPath[tokenizedPath.tokenizedPath.length] = str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0018, code lost:
        return r11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static File findFile(File file, String[] strArr, boolean z) {
        File file2;
        int i = 0;
        while (true) {
            if (i < strArr.length) {
                if (!file.isDirectory()) {
                    file2 = null;
                    break;
                } else {
                    String[] list = file.list();
                    if (list == null) {
                        throw new BuildException(new StringBuffer().append("IO error scanning directory ").append(file.getAbsolutePath()).toString());
                    }
                    boolean z2 = false;
                    boolean[] zArr = z ? CS_SCAN_ONLY : CS_THEN_NON_CS;
                    for (int i2 = 0; !z2 && i2 < zArr.length; i2++) {
                        for (int i3 = 0; !z2 && i3 < list.length; i3++) {
                            if (zArr[i2]) {
                                if (!list[i3].equals(strArr[i])) {
                                }
                                file = new File(file, list[i3]);
                                z2 = true;
                            } else {
                                if (!list[i3].equalsIgnoreCase(strArr[i])) {
                                }
                                file = new File(file, list[i3]);
                                z2 = true;
                            }
                        }
                    }
                    file2 = null;
                    if (!z2) {
                        break;
                    }
                    i++;
                }
            } else {
                file2 = file;
                if (strArr.length == 0) {
                    file2 = file;
                    if (!file.isDirectory()) {
                        file2 = null;
                    }
                }
            }
        }
    }

    public int depth() {
        return this.tokenizedPath.length;
    }

    public boolean equals(Object obj) {
        return (obj instanceof TokenizedPath) && this.path.equals(((TokenizedPath) obj).path);
    }

    public File findFile(File file, boolean z) {
        File file2;
        String[] strArr = this.tokenizedPath;
        File file3 = file;
        if (FileUtils.isAbsolutePath(this.path)) {
            if (file == null) {
                String[] dissect = FILE_UTILS.dissect(this.path);
                file3 = new File(dissect[0]);
                strArr = SelectorUtils.tokenizePathAsArray(dissect[1]);
            } else {
                File normalize = FILE_UTILS.normalize(this.path);
                String removeLeadingPath = FILE_UTILS.removeLeadingPath(file, normalize);
                if (removeLeadingPath.equals(normalize.getAbsolutePath())) {
                    file2 = null;
                    return file2;
                }
                strArr = SelectorUtils.tokenizePathAsArray(removeLeadingPath);
                file3 = file;
            }
        }
        file2 = findFile(file3, strArr, z);
        return file2;
    }

    String[] getTokens() {
        return this.tokenizedPath;
    }

    public int hashCode() {
        return this.path.hashCode();
    }

    public boolean isSymlink(File file) {
        boolean z;
        for (int i = 0; i < this.tokenizedPath.length; i++) {
            if (file != null) {
                try {
                    if (SYMLINK_UTILS.isSymbolicLink(file, this.tokenizedPath[i])) {
                        z = true;
                        break;
                    }
                } catch (IOException e) {
                    System.err.println("IOException caught while checking for links, couldn't get canonical path!");
                }
            }
            if (file == null && SYMLINK_UTILS.isSymbolicLink(this.tokenizedPath[i])) {
                z = true;
                break;
            }
            file = new File(file, this.tokenizedPath[i]);
        }
        z = false;
        return z;
    }

    public TokenizedPattern toPattern() {
        return new TokenizedPattern(this.path, this.tokenizedPath);
    }

    public String toString() {
        return this.path;
    }
}
