package org.apache.tools.ant;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceFactory;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.selectors.FileSelector;
import org.apache.tools.ant.types.selectors.SelectorScanner;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.types.selectors.TokenizedPath;
import org.apache.tools.ant.types.selectors.TokenizedPattern;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.SymbolicLinkUtils;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/DirectoryScanner.class */
public class DirectoryScanner implements FileScanner, SelectorScanner, ResourceFactory {
    public static final String DOES_NOT_EXIST_POSTFIX = " does not exist.";
    public static final int MAX_LEVELS_OF_SYMLINKS = 5;
    protected File basedir;
    protected Vector dirsDeselected;
    protected Vector dirsExcluded;
    protected Vector dirsIncluded;
    protected Vector dirsNotIncluded;
    private TokenizedPattern[] excludePatterns;
    protected String[] excludes;
    protected Vector filesDeselected;
    protected Vector filesExcluded;
    protected Vector filesIncluded;
    protected Vector filesNotIncluded;
    private TokenizedPattern[] includePatterns;
    protected String[] includes;
    private static final boolean ON_VMS = Os.isFamily(Os.FAMILY_VMS);
    protected static final String[] DEFAULTEXCLUDES = {"**/*~", "**/#*#", "**/.#*", "**/%*%", "**/._*", "**/CVS", "**/CVS/**", "**/.cvsignore", "**/SCCS", "**/SCCS/**", "**/vssver.scc", "**/.svn", "**/.svn/**", "**/.git", "**/.git/**", "**/.gitattributes", "**/.gitignore", "**/.gitmodules", "**/.hg", "**/.hg/**", "**/.hgignore", "**/.hgsub", "**/.hgsubstate", "**/.hgtags", "**/.bzr", "**/.bzr/**", "**/.bzrignore", "**/.DS_Store"};
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final SymbolicLinkUtils SYMLINK_UTILS = SymbolicLinkUtils.getSymbolicLinkUtils();
    private static final Set defaultExcludes = new HashSet();
    protected FileSelector[] selectors = null;
    protected boolean haveSlowResults = false;
    protected boolean isCaseSensitive = true;
    protected boolean errorOnMissingDir = true;
    private boolean followSymlinks = true;
    protected boolean everythingIncluded = true;
    private Set scannedDirs = new HashSet();
    private Map includeNonPatterns = new HashMap();
    private Map excludeNonPatterns = new HashMap();
    private boolean areNonPatternSetsReady = false;
    private boolean scanning = false;
    private Object scanLock = new Object();
    private boolean slowScanning = false;
    private Object slowScanLock = new Object();
    private IllegalStateException illegal = null;
    private int maxLevelsOfSymlinks = 5;
    private Set notFollowedSymlinks = new HashSet();

    static {
        resetDefaultExcludes();
    }

    private void accountForIncludedDir(TokenizedPath tokenizedPath, File file, boolean z) {
        processIncluded(tokenizedPath, file, this.dirsIncluded, this.dirsExcluded, this.dirsDeselected);
        if (!z || !couldHoldIncluded(tokenizedPath) || contentsExcluded(tokenizedPath)) {
            return;
        }
        scandir(file, tokenizedPath, z);
    }

    private void accountForIncludedDir(TokenizedPath tokenizedPath, File file, boolean z, String[] strArr, LinkedList linkedList) {
        processIncluded(tokenizedPath, file, this.dirsIncluded, this.dirsExcluded, this.dirsDeselected);
        if (!z || !couldHoldIncluded(tokenizedPath) || contentsExcluded(tokenizedPath)) {
            return;
        }
        scandir(file, tokenizedPath, z, strArr, linkedList);
    }

    private void accountForIncludedFile(TokenizedPath tokenizedPath, File file) {
        processIncluded(tokenizedPath, file, this.filesIncluded, this.filesExcluded, this.filesDeselected);
    }

    public static boolean addDefaultExclude(String str) {
        boolean add;
        synchronized (defaultExcludes) {
            add = defaultExcludes.add(str);
        }
        return add;
    }

    private boolean causesIllegalSymlinkLoop(String str, File file, LinkedList linkedList) {
        boolean z;
        try {
            if (linkedList.size() >= this.maxLevelsOfSymlinks && CollectionUtils.frequency(linkedList, str) >= this.maxLevelsOfSymlinks && SYMLINK_UTILS.isSymbolicLink(file, str)) {
                ArrayList arrayList = new ArrayList();
                String canonicalPath = FILE_UTILS.resolveFile(file, str).getCanonicalPath();
                arrayList.add(canonicalPath);
                Iterator it = linkedList.iterator();
                String str2 = "";
                while (it.hasNext()) {
                    String stringBuffer = new StringBuffer().append(str2).append("../").toString();
                    String str3 = (String) it.next();
                    str2 = stringBuffer;
                    if (str.equals(str3)) {
                        arrayList.add(FILE_UTILS.resolveFile(file, new StringBuffer().append(stringBuffer).append(str3).toString()).getCanonicalPath());
                        str2 = stringBuffer;
                        if (arrayList.size() > this.maxLevelsOfSymlinks) {
                            str2 = stringBuffer;
                            if (CollectionUtils.frequency(arrayList, canonicalPath) > this.maxLevelsOfSymlinks) {
                                z = true;
                                break;
                            }
                        } else {
                            continue;
                        }
                    }
                }
            }
            z = false;
            return z;
        } catch (IOException e) {
            throw new BuildException("Caught error while checking for symbolic links", e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x014a, code lost:
        if (org.apache.tools.ant.DirectoryScanner.ON_VMS != false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x01c1, code lost:
        if (r8.exists() == false) goto L60;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void checkIncludePatterns() {
        TokenizedPath tokenizedPath;
        String str;
        File file;
        ensureNonPatternSetsReady();
        HashMap hashMap = new HashMap();
        for (int i = 0; i < this.includePatterns.length; i++) {
            String tokenizedPattern = this.includePatterns[i].toString();
            if (!shouldSkipPattern(tokenizedPattern)) {
                hashMap.put(this.includePatterns[i].rtrimWildcardTokens(), tokenizedPattern);
            }
        }
        for (Map.Entry entry : this.includeNonPatterns.entrySet()) {
            String str2 = (String) entry.getKey();
            if (!shouldSkipPattern(str2)) {
                hashMap.put((TokenizedPath) entry.getValue(), str2);
            }
        }
        if (hashMap.containsKey(TokenizedPath.EMPTY_PATH) && this.basedir != null) {
            scandir(this.basedir, "", true);
            return;
        }
        File file2 = null;
        if (this.basedir != null) {
            try {
                file2 = this.basedir.getCanonicalFile();
            } catch (IOException e) {
                throw new BuildException(e);
            }
        }
        for (Map.Entry entry2 : hashMap.entrySet()) {
            TokenizedPath tokenizedPath2 = (TokenizedPath) entry2.getKey();
            String tokenizedPath3 = tokenizedPath2.toString();
            if (this.basedir != null || FileUtils.isAbsolutePath(tokenizedPath3)) {
                File file3 = new File(this.basedir, tokenizedPath3);
                TokenizedPath tokenizedPath4 = tokenizedPath2;
                String str3 = tokenizedPath3;
                File file4 = file3;
                if (file3.exists()) {
                    try {
                        if ((this.basedir == null ? file3.getCanonicalPath() : FILE_UTILS.removeLeadingPath(file2, file3.getCanonicalFile())).equals(tokenizedPath3)) {
                            tokenizedPath4 = tokenizedPath2;
                            str3 = tokenizedPath3;
                            file4 = file3;
                        }
                        File findFile = tokenizedPath2.findFile(this.basedir, true);
                        tokenizedPath4 = tokenizedPath2;
                        str3 = tokenizedPath3;
                        file4 = findFile;
                        if (findFile != null) {
                            tokenizedPath4 = tokenizedPath2;
                            str3 = tokenizedPath3;
                            file4 = findFile;
                            if (this.basedir != null) {
                                String removeLeadingPath = FILE_UTILS.removeLeadingPath(this.basedir, findFile);
                                tokenizedPath4 = tokenizedPath2;
                                str3 = removeLeadingPath;
                                file4 = findFile;
                                if (!tokenizedPath2.toString().equals(removeLeadingPath)) {
                                    tokenizedPath4 = new TokenizedPath(removeLeadingPath);
                                    file4 = findFile;
                                    str3 = removeLeadingPath;
                                }
                            }
                        }
                    } catch (IOException e2) {
                        throw new BuildException(e2);
                    }
                }
                if (file4 != null) {
                    tokenizedPath = tokenizedPath4;
                    str = str3;
                    file = file4;
                }
                tokenizedPath = tokenizedPath4;
                str = str3;
                file = file4;
                if (!isCaseSensitive()) {
                    File findFile2 = tokenizedPath4.findFile(this.basedir, false);
                    tokenizedPath = tokenizedPath4;
                    str = str3;
                    file = file4;
                    if (findFile2 != null) {
                        tokenizedPath = tokenizedPath4;
                        str = str3;
                        file = file4;
                        if (findFile2.exists()) {
                            String absolutePath = this.basedir == null ? findFile2.getAbsolutePath() : FILE_UTILS.removeLeadingPath(this.basedir, findFile2);
                            file = findFile2;
                            tokenizedPath = new TokenizedPath(absolutePath);
                            str = absolutePath;
                        }
                    }
                }
                if (file != null && file.exists()) {
                    if (this.followSymlinks || !tokenizedPath.isSymlink(this.basedir)) {
                        if (!file.isDirectory()) {
                            String str4 = (String) entry2.getValue();
                            if (isCaseSensitive() ? str4.equals(str) : str4.equalsIgnoreCase(str)) {
                                accountForIncludedFile(tokenizedPath, file);
                            }
                        } else if (!isIncluded(tokenizedPath) || str.length() <= 0) {
                            scandir(file, tokenizedPath, true);
                        } else {
                            accountForIncludedDir(tokenizedPath, file, true);
                        }
                    } else if (!isExcluded(tokenizedPath)) {
                        this.notFollowedSymlinks.add(file.getAbsolutePath());
                    }
                }
            }
        }
    }

    private void clearCaches() {
        synchronized (this) {
            this.includeNonPatterns.clear();
            this.excludeNonPatterns.clear();
            this.includePatterns = null;
            this.excludePatterns = null;
            this.areNonPatternSetsReady = false;
        }
    }

    private boolean couldHoldIncluded(TokenizedPath tokenizedPath) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= this.includePatterns.length) {
                Iterator it = this.includeNonPatterns.values().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        z = false;
                        break;
                    } else if (couldHoldIncluded(tokenizedPath, ((TokenizedPath) it.next()).toPattern())) {
                        z = true;
                        break;
                    }
                }
            } else if (couldHoldIncluded(tokenizedPath, this.includePatterns[i])) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private boolean couldHoldIncluded(TokenizedPath tokenizedPath, TokenizedPattern tokenizedPattern) {
        return tokenizedPattern.matchStartOf(tokenizedPath, isCaseSensitive()) && isMorePowerfulThanExcludes(tokenizedPath.toString()) && isDeeper(tokenizedPattern, tokenizedPath);
    }

    private TokenizedPattern[] fillNonPatternSet(Map map, String[] strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (int i = 0; i < strArr.length; i++) {
            if (!SelectorUtils.hasWildcards(strArr[i])) {
                String upperCase = isCaseSensitive() ? strArr[i] : strArr[i].toUpperCase();
                map.put(upperCase, new TokenizedPath(upperCase));
            } else {
                arrayList.add(new TokenizedPattern(strArr[i]));
            }
        }
        return (TokenizedPattern[]) arrayList.toArray(new TokenizedPattern[arrayList.size()]);
    }

    public static String[] getDefaultExcludes() {
        String[] strArr;
        synchronized (defaultExcludes) {
            strArr = (String[]) defaultExcludes.toArray(new String[defaultExcludes.size()]);
        }
        return strArr;
    }

    private boolean hasBeenScanned(String str) {
        return !this.scannedDirs.add(str);
    }

    private boolean isDeeper(TokenizedPattern tokenizedPattern, TokenizedPath tokenizedPath) {
        return tokenizedPattern.containsPattern(SelectorUtils.DEEP_TREE_MATCH) || tokenizedPattern.depth() > tokenizedPath.depth();
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0033, code lost:
        if (r4.excludeNonPatterns.containsKey(r5.toString().toUpperCase()) == false) goto L11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean isExcluded(TokenizedPath tokenizedPath) {
        boolean z;
        ensureNonPatternSetsReady();
        if (isCaseSensitive()) {
            if (this.excludeNonPatterns.containsKey(tokenizedPath.toString())) {
                z = true;
            }
            int i = 0;
            while (true) {
                if (i >= this.excludePatterns.length) {
                    z = false;
                    break;
                }
                z = true;
                if (this.excludePatterns[i].matchPath(tokenizedPath, isCaseSensitive())) {
                    break;
                }
                i++;
            }
        } else {
            z = true;
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0033, code lost:
        if (r4.includeNonPatterns.containsKey(r5.toString().toUpperCase()) == false) goto L11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean isIncluded(TokenizedPath tokenizedPath) {
        boolean z;
        ensureNonPatternSetsReady();
        if (isCaseSensitive()) {
            if (this.includeNonPatterns.containsKey(tokenizedPath.toString())) {
                z = true;
            }
            int i = 0;
            while (true) {
                if (i >= this.includePatterns.length) {
                    z = false;
                    break;
                }
                z = true;
                if (this.includePatterns[i].matchPath(tokenizedPath, isCaseSensitive())) {
                    break;
                }
                i++;
            }
        } else {
            z = true;
        }
        return z;
    }

    private boolean isMorePowerfulThanExcludes(String str) {
        boolean z;
        String stringBuffer = new StringBuffer().append(str).append(File.separatorChar).append(SelectorUtils.DEEP_TREE_MATCH).toString();
        int i = 0;
        while (true) {
            if (i >= this.excludePatterns.length) {
                z = true;
                break;
            } else if (this.excludePatterns[i].toString().equals(stringBuffer)) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public static boolean match(String str, String str2) {
        return SelectorUtils.match(str, str2);
    }

    protected static boolean match(String str, String str2, boolean z) {
        return SelectorUtils.match(str, str2, z);
    }

    protected static boolean matchPath(String str, String str2) {
        return SelectorUtils.matchPath(str, str2);
    }

    protected static boolean matchPath(String str, String str2, boolean z) {
        return SelectorUtils.matchPath(str, str2, z);
    }

    protected static boolean matchPatternStart(String str, String str2) {
        return SelectorUtils.matchPatternStart(str, str2);
    }

    protected static boolean matchPatternStart(String str, String str2, boolean z) {
        return SelectorUtils.matchPatternStart(str, str2, z);
    }

    private static String normalizePattern(String str) {
        String replace = str.replace('/', File.separatorChar).replace('\\', File.separatorChar);
        String str2 = replace;
        if (replace.endsWith(File.separator)) {
            str2 = new StringBuffer().append(replace).append(SelectorUtils.DEEP_TREE_MATCH).toString();
        }
        return str2;
    }

    private void processIncluded(TokenizedPath tokenizedPath, File file, Vector vector, Vector vector2, Vector vector3) {
        String tokenizedPath2 = tokenizedPath.toString();
        if (vector.contains(tokenizedPath2) || vector2.contains(tokenizedPath2) || vector3.contains(tokenizedPath2)) {
            return;
        }
        boolean z = false;
        if (isExcluded(tokenizedPath)) {
            vector2.add(tokenizedPath2);
        } else if (isSelected(tokenizedPath2, file)) {
            z = true;
            vector.add(tokenizedPath2);
        } else {
            vector3.add(tokenizedPath2);
        }
        this.everythingIncluded &= z;
    }

    private void processSlowScan(String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            TokenizedPath tokenizedPath = new TokenizedPath(strArr[i]);
            if (!couldHoldIncluded(tokenizedPath) || contentsExcluded(tokenizedPath)) {
                scandir(new File(this.basedir, strArr[i]), tokenizedPath, false);
            }
        }
    }

    public static boolean removeDefaultExclude(String str) {
        boolean remove;
        synchronized (defaultExcludes) {
            remove = defaultExcludes.remove(str);
        }
        return remove;
    }

    public static void resetDefaultExcludes() {
        synchronized (defaultExcludes) {
            defaultExcludes.clear();
            for (int i = 0; i < DEFAULTEXCLUDES.length; i++) {
                defaultExcludes.add(DEFAULTEXCLUDES[i]);
            }
        }
    }

    private void scandir(File file, TokenizedPath tokenizedPath, boolean z) {
        if (file == null) {
            throw new BuildException("dir must not be null.");
        }
        String[] list = file.list();
        if (list != null) {
            scandir(file, tokenizedPath, z, list, new LinkedList());
        } else if (!file.exists()) {
            throw new BuildException(new StringBuffer().append(file).append(DOES_NOT_EXIST_POSTFIX).toString());
        } else {
            if (file.isDirectory()) {
                throw new BuildException(new StringBuffer().append("IO error scanning directory '").append(file.getAbsolutePath()).append("'").toString());
            }
            throw new BuildException(new StringBuffer().append(file).append(" is not a directory.").toString());
        }
    }

    private void scandir(File file, TokenizedPath tokenizedPath, boolean z, String[] strArr, LinkedList linkedList) {
        String tokenizedPath2 = tokenizedPath.toString();
        String str = tokenizedPath2;
        if (tokenizedPath2.length() > 0) {
            str = tokenizedPath2;
            if (!tokenizedPath2.endsWith(File.separator)) {
                str = new StringBuffer().append(tokenizedPath2).append(File.separator).toString();
            }
        }
        if (!z || !hasBeenScanned(str)) {
            if (!this.followSymlinks) {
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < strArr.length; i++) {
                    try {
                        if (SYMLINK_UTILS.isSymbolicLink(file, strArr[i])) {
                            String stringBuffer = new StringBuffer().append(str).append(strArr[i]).toString();
                            File file2 = new File(file, strArr[i]);
                            (file2.isDirectory() ? this.dirsExcluded : this.filesExcluded).addElement(stringBuffer);
                            if (!isExcluded(stringBuffer)) {
                                this.notFollowedSymlinks.add(file2.getAbsolutePath());
                            }
                        } else {
                            arrayList.add(strArr[i]);
                        }
                    } catch (IOException e) {
                        System.err.println("IOException caught while checking for links, couldn't get canonical path!");
                        arrayList.add(strArr[i]);
                    }
                }
                strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
            } else {
                linkedList.addFirst(file.getName());
            }
            for (int i2 = 0; i2 < strArr.length; i2++) {
                String stringBuffer2 = new StringBuffer().append(str).append(strArr[i2]).toString();
                TokenizedPath tokenizedPath3 = new TokenizedPath(tokenizedPath, strArr[i2]);
                File file3 = new File(file, strArr[i2]);
                String[] list = file3.list();
                if (list == null || (list.length == 0 && file3.isFile())) {
                    if (isIncluded(tokenizedPath3)) {
                        accountForIncludedFile(tokenizedPath3, file3);
                    } else {
                        this.everythingIncluded = false;
                        this.filesNotIncluded.addElement(stringBuffer2);
                    }
                } else if (!this.followSymlinks || !causesIllegalSymlinkLoop(strArr[i2], file, linkedList)) {
                    if (isIncluded(tokenizedPath3)) {
                        accountForIncludedDir(tokenizedPath3, file3, z, list, linkedList);
                    } else {
                        this.everythingIncluded = false;
                        this.dirsNotIncluded.addElement(stringBuffer2);
                        if (z && couldHoldIncluded(tokenizedPath3) && !contentsExcluded(tokenizedPath3)) {
                            scandir(file3, tokenizedPath3, z, list, linkedList);
                        }
                    }
                    if (!z) {
                        scandir(file3, tokenizedPath3, z, list, linkedList);
                    }
                } else {
                    System.err.println(new StringBuffer().append("skipping symbolic link ").append(file3.getAbsolutePath()).append(" -- too many levels of symbolic").append(" links.").toString());
                    this.notFollowedSymlinks.add(file3.getAbsolutePath());
                }
            }
            if (!this.followSymlinks) {
                return;
            }
            linkedList.removeFirst();
        }
    }

    private boolean shouldSkipPattern(String str) {
        boolean z = true;
        if (!FileUtils.isAbsolutePath(str) ? this.basedir != null : !(this.basedir != null && !SelectorUtils.matchPatternStart(str, this.basedir.getAbsolutePath(), isCaseSensitive()))) {
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.ant.FileScanner
    public void addDefaultExcludes() {
        int i = 0;
        synchronized (this) {
            if (this.excludes != null) {
                i = this.excludes.length;
            }
            String[] defaultExcludes2 = getDefaultExcludes();
            String[] strArr = new String[defaultExcludes2.length + i];
            if (i > 0) {
                System.arraycopy(this.excludes, 0, strArr, 0, i);
            }
            for (int i2 = 0; i2 < defaultExcludes2.length; i2++) {
                strArr[i2 + i] = defaultExcludes2[i2].replace('/', File.separatorChar).replace('\\', File.separatorChar);
            }
            this.excludes = strArr;
        }
    }

    public void addExcludes(String[] strArr) {
        synchronized (this) {
            if (strArr != null) {
                if (strArr.length > 0) {
                    if (this.excludes == null || this.excludes.length <= 0) {
                        setExcludes(strArr);
                    } else {
                        String[] strArr2 = new String[strArr.length + this.excludes.length];
                        System.arraycopy(this.excludes, 0, strArr2, 0, this.excludes.length);
                        for (int i = 0; i < strArr.length; i++) {
                            strArr2[this.excludes.length + i] = normalizePattern(strArr[i]);
                        }
                        this.excludes = strArr2;
                    }
                }
            }
        }
    }

    protected void clearResults() {
        synchronized (this) {
            this.filesIncluded = new VectorSet();
            this.filesNotIncluded = new VectorSet();
            this.filesExcluded = new VectorSet();
            this.filesDeselected = new VectorSet();
            this.dirsIncluded = new VectorSet();
            this.dirsNotIncluded = new VectorSet();
            this.dirsExcluded = new VectorSet();
            this.dirsDeselected = new VectorSet();
            this.everythingIncluded = this.basedir != null;
            this.scannedDirs.clear();
            this.notFollowedSymlinks.clear();
        }
    }

    boolean contentsExcluded(TokenizedPath tokenizedPath) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= this.excludePatterns.length) {
                z = false;
                break;
            } else if (this.excludePatterns[i].endsWith(SelectorUtils.DEEP_TREE_MATCH) && this.excludePatterns[i].withoutLastToken().matchPath(tokenizedPath, isCaseSensitive())) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    protected boolean couldHoldIncluded(String str) {
        return couldHoldIncluded(new TokenizedPath(str));
    }

    void ensureNonPatternSetsReady() {
        synchronized (this) {
            if (!this.areNonPatternSetsReady) {
                this.includePatterns = fillNonPatternSet(this.includeNonPatterns, this.includes);
                this.excludePatterns = fillNonPatternSet(this.excludeNonPatterns, this.excludes);
                this.areNonPatternSetsReady = true;
            }
        }
    }

    @Override // org.apache.tools.ant.FileScanner
    public File getBasedir() {
        File file;
        synchronized (this) {
            file = this.basedir;
        }
        return file;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorScanner
    public String[] getDeselectedDirectories() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.dirsDeselected.size()];
            this.dirsDeselected.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorScanner
    public String[] getDeselectedFiles() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.filesDeselected.size()];
            this.filesDeselected.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getExcludedDirectories() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.dirsExcluded.size()];
            this.dirsExcluded.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getExcludedFiles() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.filesExcluded.size()];
            this.filesExcluded.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getIncludedDirectories() {
        String[] strArr;
        synchronized (this) {
            if (this.dirsIncluded == null) {
                throw new IllegalStateException("Must call scan() first");
            }
            strArr = new String[this.dirsIncluded.size()];
            this.dirsIncluded.copyInto(strArr);
        }
        Arrays.sort(strArr);
        return strArr;
    }

    public int getIncludedDirsCount() {
        int size;
        synchronized (this) {
            if (this.dirsIncluded == null) {
                throw new IllegalStateException("Must call scan() first");
            }
            size = this.dirsIncluded.size();
        }
        return size;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getIncludedFiles() {
        String[] strArr;
        synchronized (this) {
            if (this.filesIncluded == null) {
                throw new IllegalStateException("Must call scan() first");
            }
            strArr = new String[this.filesIncluded.size()];
            this.filesIncluded.copyInto(strArr);
        }
        Arrays.sort(strArr);
        return strArr;
    }

    public int getIncludedFilesCount() {
        int size;
        synchronized (this) {
            if (this.filesIncluded == null) {
                throw new IllegalStateException("Must call scan() first");
            }
            size = this.filesIncluded.size();
        }
        return size;
    }

    public String[] getNotFollowedSymlinks() {
        String[] strArr;
        synchronized (this) {
            synchronized (this) {
                strArr = (String[]) this.notFollowedSymlinks.toArray(new String[this.notFollowedSymlinks.size()]);
            }
            return strArr;
        }
        Arrays.sort(strArr);
        return strArr;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getNotIncludedDirectories() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.dirsNotIncluded.size()];
            this.dirsNotIncluded.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.FileScanner
    public String[] getNotIncludedFiles() {
        String[] strArr;
        synchronized (this) {
            slowScan();
            strArr = new String[this.filesNotIncluded.size()];
            this.filesNotIncluded.copyInto(strArr);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.types.ResourceFactory
    public Resource getResource(String str) {
        FileResource fileResource;
        synchronized (this) {
            fileResource = new FileResource(this.basedir, str);
        }
        return fileResource;
    }

    Set getScannedDirs() {
        return this.scannedDirs;
    }

    public boolean isCaseSensitive() {
        boolean z;
        synchronized (this) {
            z = this.isCaseSensitive;
        }
        return z;
    }

    public boolean isEverythingIncluded() {
        boolean z;
        synchronized (this) {
            z = this.everythingIncluded;
        }
        return z;
    }

    protected boolean isExcluded(String str) {
        return isExcluded(new TokenizedPath(str));
    }

    public boolean isFollowSymlinks() {
        boolean z;
        synchronized (this) {
            z = this.followSymlinks;
        }
        return z;
    }

    protected boolean isIncluded(String str) {
        return isIncluded(new TokenizedPath(str));
    }

    protected boolean isSelected(String str, File file) {
        boolean z;
        if (this.selectors != null) {
            for (int i = 0; i < this.selectors.length; i++) {
                if (!this.selectors[i].isSelected(this.basedir, str, file)) {
                    z = false;
                    break;
                }
            }
        }
        z = true;
        return z;
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // org.apache.tools.ant.FileScanner
    public void scan() throws IllegalStateException {
        String[] strArr;
        boolean z = true;
        synchronized (this.scanLock) {
            if (this.scanning) {
                while (this.scanning) {
                    try {
                        this.scanLock.wait();
                    } catch (InterruptedException e) {
                    }
                }
                if (this.illegal == null) {
                    return;
                }
                throw this.illegal;
            }
            this.scanning = true;
            File file = this.basedir;
            try {
                try {
                    synchronized (this) {
                        this.illegal = null;
                        clearResults();
                        boolean z2 = this.includes == null;
                        if (z2) {
                            strArr = new String[1];
                            strArr[0] = SelectorUtils.DEEP_TREE_MATCH;
                        } else {
                            strArr = this.includes;
                        }
                        this.includes = strArr;
                        if (this.excludes != null) {
                            z = false;
                        }
                        this.excludes = z ? new String[0] : this.excludes;
                        if (this.basedir != null && !this.followSymlinks && SYMLINK_UTILS.isSymbolicLink(this.basedir)) {
                            this.notFollowedSymlinks.add(this.basedir.getAbsolutePath());
                            this.basedir = null;
                        }
                        if (this.basedir != null) {
                            if (!this.basedir.exists()) {
                                if (!this.errorOnMissingDir) {
                                    this.basedir = file;
                                    synchronized (this.scanLock) {
                                        this.scanning = false;
                                        this.scanLock.notifyAll();
                                    }
                                    return;
                                }
                                this.illegal = new IllegalStateException(new StringBuffer().append("basedir ").append(this.basedir).append(DOES_NOT_EXIST_POSTFIX).toString());
                            } else if (!this.basedir.isDirectory()) {
                                this.illegal = new IllegalStateException(new StringBuffer().append("basedir ").append(this.basedir).append(" is not a").append(" directory.").toString());
                            }
                            if (this.illegal != null) {
                                throw this.illegal;
                            }
                        } else if (z2) {
                            this.basedir = file;
                            synchronized (this.scanLock) {
                                this.scanning = false;
                                this.scanLock.notifyAll();
                            }
                            return;
                        }
                        if (!isIncluded(TokenizedPath.EMPTY_PATH)) {
                            this.dirsNotIncluded.addElement("");
                        } else if (isExcluded(TokenizedPath.EMPTY_PATH)) {
                            this.dirsExcluded.addElement("");
                        } else if (isSelected("", this.basedir)) {
                            this.dirsIncluded.addElement("");
                        } else {
                            this.dirsDeselected.addElement("");
                        }
                        checkIncludePatterns();
                        clearCaches();
                        this.includes = z2 ? null : this.includes;
                        this.excludes = z ? null : this.excludes;
                        this.basedir = file;
                        synchronized (this.scanLock) {
                            this.scanning = false;
                            this.scanLock.notifyAll();
                        }
                    }
                } catch (IOException e2) {
                    throw new BuildException(e2);
                }
            } catch (Throwable th) {
                this.basedir = file;
                synchronized (this.scanLock) {
                    this.scanning = false;
                    this.scanLock.notifyAll();
                    throw th;
                }
            }
        }
    }

    protected void scandir(File file, String str, boolean z) {
        scandir(file, new TokenizedPath(str), z);
    }

    @Override // org.apache.tools.ant.FileScanner
    public void setBasedir(File file) {
        synchronized (this) {
            this.basedir = file;
        }
    }

    @Override // org.apache.tools.ant.FileScanner
    public void setBasedir(String str) {
        setBasedir(str == null ? null : new File(str.replace('/', File.separatorChar).replace('\\', File.separatorChar)));
    }

    @Override // org.apache.tools.ant.FileScanner
    public void setCaseSensitive(boolean z) {
        synchronized (this) {
            this.isCaseSensitive = z;
        }
    }

    public void setErrorOnMissingDir(boolean z) {
        this.errorOnMissingDir = z;
    }

    @Override // org.apache.tools.ant.FileScanner
    public void setExcludes(String[] strArr) {
        synchronized (this) {
            if (strArr == null) {
                this.excludes = null;
            } else {
                this.excludes = new String[strArr.length];
                for (int i = 0; i < strArr.length; i++) {
                    this.excludes[i] = normalizePattern(strArr[i]);
                }
            }
        }
    }

    public void setFollowSymlinks(boolean z) {
        synchronized (this) {
            this.followSymlinks = z;
        }
    }

    @Override // org.apache.tools.ant.FileScanner
    public void setIncludes(String[] strArr) {
        synchronized (this) {
            if (strArr == null) {
                this.includes = null;
            } else {
                this.includes = new String[strArr.length];
                for (int i = 0; i < strArr.length; i++) {
                    this.includes[i] = normalizePattern(strArr[i]);
                }
            }
        }
    }

    public void setMaxLevelsOfSymlinks(int i) {
        this.maxLevelsOfSymlinks = i;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorScanner
    public void setSelectors(FileSelector[] fileSelectorArr) {
        synchronized (this) {
            this.selectors = fileSelectorArr;
        }
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    protected void slowScan() {
        String[] strArr;
        boolean z = true;
        synchronized (this.slowScanLock) {
            if (this.haveSlowResults) {
                return;
            }
            if (this.slowScanning) {
                while (this.slowScanning) {
                    try {
                        this.slowScanLock.wait();
                    } catch (InterruptedException e) {
                    }
                }
                return;
            }
            this.slowScanning = true;
            try {
                synchronized (this) {
                    boolean z2 = this.includes == null;
                    if (z2) {
                        strArr = new String[1];
                        strArr[0] = SelectorUtils.DEEP_TREE_MATCH;
                    } else {
                        strArr = this.includes;
                    }
                    this.includes = strArr;
                    if (this.excludes != null) {
                        z = false;
                    }
                    this.excludes = z ? new String[0] : this.excludes;
                    String[] strArr2 = new String[this.dirsExcluded.size()];
                    this.dirsExcluded.copyInto(strArr2);
                    String[] strArr3 = new String[this.dirsNotIncluded.size()];
                    this.dirsNotIncluded.copyInto(strArr3);
                    ensureNonPatternSetsReady();
                    processSlowScan(strArr2);
                    processSlowScan(strArr3);
                    clearCaches();
                    this.includes = z2 ? null : this.includes;
                    this.excludes = z ? null : this.excludes;
                }
                synchronized (this.slowScanLock) {
                    this.haveSlowResults = true;
                    this.slowScanning = false;
                    this.slowScanLock.notifyAll();
                }
            } catch (Throwable th) {
                synchronized (this.slowScanLock) {
                    this.haveSlowResults = true;
                    this.slowScanning = false;
                    this.slowScanLock.notifyAll();
                    throw th;
                }
            }
        }
    }
}
