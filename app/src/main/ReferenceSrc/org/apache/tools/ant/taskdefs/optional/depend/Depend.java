package org.apache.tools.ant.taskdefs.optional.depend;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/Depend.class */
public class Depend extends MatchingTask {
    private static final String CACHE_FILE_NAME = "dependencies.txt";
    private static final String CLASSNAME_PREPEND = "||:";
    private static final int ONE_SECOND = 1000;
    private Hashtable affectedClassMap;
    private File cache;
    private Hashtable classFileInfoMap;
    private Hashtable classpathDependencies;
    private Path dependClasspath;
    private Path destPath;
    private Hashtable outOfDateClasses;
    private Path srcPath;
    private String[] srcPathList;
    private boolean closure = false;
    private boolean warnOnRmiStubs = true;
    private boolean dump = false;

    /* renamed from: org.apache.tools.ant.taskdefs.optional.depend.Depend$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/Depend$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo.class */
    private static class ClassFileInfo {
        private File absoluteFile;
        private String className;
        private boolean isUserWarned;
        private File sourceFile;

        private ClassFileInfo() {
            this.isUserWarned = false;
        }

        ClassFileInfo(AnonymousClass1 anonymousClass1) {
            this();
        }
    }

    private void addClassFiles(Vector vector, File file, File file2) {
        String[] list = file.list();
        if (list == null) {
            return;
        }
        int length = list.length;
        int length2 = file2.getPath().length();
        File file3 = null;
        for (int i = 0; i < length; i++) {
            File file4 = new File(file, list[i]);
            if (list[i].endsWith(".class")) {
                ClassFileInfo classFileInfo = new ClassFileInfo(null);
                classFileInfo.absoluteFile = file4;
                String substring = file4.getPath().substring(length2 + 1, file4.getPath().length() - ".class".length());
                classFileInfo.className = ClassFileUtils.convertSlashName(substring);
                file3 = findSourceFile(substring, file3);
                classFileInfo.sourceFile = file3;
                vector.addElement(classFileInfo);
            } else {
                addClassFiles(vector, file4, file2);
            }
        }
    }

    private int deleteAffectedFiles(String str) {
        int i = 0;
        Hashtable hashtable = (Hashtable) this.affectedClassMap.get(str);
        if (hashtable == null) {
            i = 0;
        } else {
            Enumeration keys = hashtable.keys();
            while (keys.hasMoreElements()) {
                String str2 = (String) keys.nextElement();
                ClassFileInfo classFileInfo = (ClassFileInfo) hashtable.get(str2);
                if (classFileInfo.absoluteFile.exists()) {
                    if (classFileInfo.sourceFile == null) {
                        warnOutOfDateButNotDeleted(classFileInfo, str2, str);
                    } else {
                        log(new StringBuffer().append("Deleting file ").append(classFileInfo.absoluteFile.getPath()).append(" since ").append(str).append(" out of date").toString(), 3);
                        classFileInfo.absoluteFile.delete();
                        int i2 = i + 1;
                        if (this.closure) {
                            i = i2 + deleteAffectedFiles(str2);
                        } else {
                            i = i2;
                            if (str2.indexOf("$") != -1) {
                                String substring = str2.substring(0, str2.indexOf("$"));
                                log(new StringBuffer().append("Top level class = ").append(substring).toString(), 3);
                                ClassFileInfo classFileInfo2 = (ClassFileInfo) this.classFileInfoMap.get(substring);
                                i = i2;
                                if (classFileInfo2 != null) {
                                    i = i2;
                                    if (classFileInfo2.absoluteFile.exists()) {
                                        log(new StringBuffer().append("Deleting file ").append(classFileInfo2.absoluteFile.getPath()).append(" since one of its inner classes was removed").toString(), 3);
                                        classFileInfo2.absoluteFile.delete();
                                        int i3 = i2 + 1;
                                        i = i3;
                                        if (this.closure) {
                                            i = i3 + deleteAffectedFiles(substring);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return i;
    }

    private int deleteAllAffectedFiles() {
        int i = 0;
        Enumeration elements = this.outOfDateClasses.elements();
        while (elements.hasMoreElements()) {
            String str = (String) elements.nextElement();
            int deleteAffectedFiles = i + deleteAffectedFiles(str);
            ClassFileInfo classFileInfo = (ClassFileInfo) this.classFileInfoMap.get(str);
            i = deleteAffectedFiles;
            if (classFileInfo != null) {
                i = deleteAffectedFiles;
                if (classFileInfo.absoluteFile.exists()) {
                    if (classFileInfo.sourceFile == null) {
                        warnOutOfDateButNotDeleted(classFileInfo, str, str);
                        i = deleteAffectedFiles;
                    } else {
                        classFileInfo.absoluteFile.delete();
                        i = deleteAffectedFiles + 1;
                    }
                }
            }
        }
        return i;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, IGET]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, INVOKE]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, MOVE]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Incorrect finally slice size: {[MOVE, CONSTRUCTOR] complete}, expected: {[MOVE] complete} */
    /* JADX WARN: Finally extract failed */
    private void determineDependencies() throws IOException {
        this.affectedClassMap = new Hashtable();
        this.classFileInfoMap = new Hashtable();
        boolean z = false;
        Hashtable hashtable = new Hashtable();
        boolean z2 = true;
        long j = Long.MAX_VALUE;
        Hashtable hashtable2 = hashtable;
        if (this.cache != null) {
            File file = new File(this.cache, CACHE_FILE_NAME);
            boolean exists = file.exists();
            long lastModified = file.lastModified();
            z2 = exists;
            j = lastModified;
            hashtable2 = hashtable;
            if (exists) {
                hashtable2 = readCachedDependencies(file);
                j = lastModified;
                z2 = exists;
            }
        }
        Enumeration elements = getClassFiles(this.destPath).elements();
        while (elements.hasMoreElements()) {
            ClassFileInfo classFileInfo = (ClassFileInfo) elements.nextElement();
            log(new StringBuffer().append("Adding class info for ").append(classFileInfo.className).toString(), 4);
            this.classFileInfoMap.put(classFileInfo.className, classFileInfo);
            Vector vector = null;
            if (this.cache != null) {
                vector = null;
                if (z2) {
                    vector = null;
                    if (j > classFileInfo.absoluteFile.lastModified()) {
                        vector = (Vector) hashtable2.get(classFileInfo.className);
                    }
                }
            }
            boolean z3 = z;
            Vector vector2 = vector;
            if (vector == null) {
                AntAnalyzer antAnalyzer = new AntAnalyzer();
                antAnalyzer.addRootClass(classFileInfo.className);
                antAnalyzer.addClassPath(this.destPath);
                antAnalyzer.setClosure(false);
                vector2 = new Vector();
                Enumeration classDependencies = antAnalyzer.getClassDependencies();
                while (classDependencies.hasMoreElements()) {
                    Object nextElement = classDependencies.nextElement();
                    vector2.addElement(nextElement);
                    log(new StringBuffer().append("Class ").append(classFileInfo.className).append(" depends on ").append(nextElement).toString(), 4);
                }
                z3 = true;
                hashtable2.put(classFileInfo.className, vector2);
            }
            Enumeration elements2 = vector2.elements();
            while (true) {
                z = z3;
                if (elements2.hasMoreElements()) {
                    String str = (String) elements2.nextElement();
                    Hashtable hashtable3 = (Hashtable) this.affectedClassMap.get(str);
                    Hashtable hashtable4 = hashtable3;
                    if (hashtable3 == null) {
                        hashtable4 = new Hashtable();
                        this.affectedClassMap.put(str, hashtable4);
                    }
                    hashtable4.put(classFileInfo.className, classFileInfo);
                    log(new StringBuffer().append(str).append(" affects ").append(classFileInfo.className).toString(), 4);
                }
            }
        }
        this.classpathDependencies = null;
        Path checkClassPath = getCheckClassPath();
        if (checkClassPath != null) {
            this.classpathDependencies = new Hashtable();
            AntClassLoader antClassLoader = null;
            try {
                AntClassLoader createClassLoader = getProject().createClassLoader(checkClassPath);
                Hashtable hashtable5 = new Hashtable();
                Object obj = new Object();
                Enumeration keys = hashtable2.keys();
                while (keys.hasMoreElements()) {
                    String str2 = (String) keys.nextElement();
                    log(new StringBuffer().append("Determining classpath dependencies for ").append(str2).toString(), 4);
                    Vector vector3 = (Vector) hashtable2.get(str2);
                    Hashtable hashtable6 = new Hashtable();
                    this.classpathDependencies.put(str2, hashtable6);
                    Enumeration elements3 = vector3.elements();
                    while (elements3.hasMoreElements()) {
                        String str3 = (String) elements3.nextElement();
                        log(new StringBuffer().append("Looking for ").append(str3).toString(), 4);
                        File file2 = hashtable5.get(str3);
                        if (file2 == null) {
                            file2 = obj;
                            if (str3.startsWith("java.") || str3.startsWith("javax.")) {
                                log(new StringBuffer().append("Ignoring base classlib dependency ").append(str3).toString(), 4);
                            } else {
                                URL resource = createClassLoader.getResource(new StringBuffer().append(str3.replace('.', '/')).append(".class").toString());
                                log(new StringBuffer().append("URL is ").append(resource).toString(), 4);
                                Object obj2 = file2;
                                if (resource != null) {
                                    if (resource.getProtocol().equals(ArchiveStreamFactory.JAR)) {
                                        String file3 = resource.getFile();
                                        String substring = file3.substring(0, file3.indexOf(33));
                                        if (!substring.startsWith("file:")) {
                                            antClassLoader = createClassLoader;
                                            throw new IOException(new StringBuffer().append("Bizarre nested path in jar: protocol: ").append(substring).toString());
                                        }
                                        file2 = new File(FileUtils.getFileUtils().fromURI(substring));
                                    } else if (resource.getProtocol().equals("file")) {
                                        file2 = new File(FileUtils.getFileUtils().fromURI(resource.toExternalForm()));
                                    }
                                    log(new StringBuffer().append("Class ").append(str2).append(" depends on ").append(file2).append(" due to ").append(str3).toString(), 4);
                                    obj2 = file2;
                                }
                                file2 = obj2;
                            }
                            hashtable5.put(str3, file2);
                        }
                        if (file2 != obj) {
                            File file4 = (File) file2;
                            log(new StringBuffer().append("Adding a classpath dependency on ").append(file4).toString(), 4);
                            hashtable6.put(file4, file4);
                        }
                    }
                }
                if (createClassLoader != null) {
                    createClassLoader.cleanup();
                }
            } catch (Throwable th) {
                if (antClassLoader != null) {
                    antClassLoader.cleanup();
                }
                throw th;
            }
        } else {
            log("No classpath to check", 4);
        }
        if (this.cache == null || !z) {
            return;
        }
        writeCachedDependencies(hashtable2);
    }

    private void determineOutOfDateClasses() {
        ClassFileInfo classFileInfo;
        this.outOfDateClasses = new Hashtable();
        for (int i = 0; i < this.srcPathList.length; i++) {
            File resolveFile = getProject().resolveFile(this.srcPathList[i]);
            if (resolveFile.exists()) {
                scanDir(resolveFile, getDirectoryScanner(resolveFile).getIncludedFiles());
            }
        }
        if (this.classpathDependencies == null) {
            return;
        }
        Enumeration keys = this.classpathDependencies.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            if (!this.outOfDateClasses.containsKey(str) && (classFileInfo = (ClassFileInfo) this.classFileInfoMap.get(str)) != null) {
                Enumeration elements = ((Hashtable) this.classpathDependencies.get(str)).elements();
                while (true) {
                    if (elements.hasMoreElements()) {
                        File file = (File) elements.nextElement();
                        if (file.lastModified() > classFileInfo.absoluteFile.lastModified()) {
                            log(new StringBuffer().append("Class ").append(str).append(" is out of date with respect to ").append(file).toString(), 4);
                            this.outOfDateClasses.put(str, str);
                            break;
                        }
                    }
                }
            }
        }
    }

    private void dumpDependencies() {
        log(new StringBuffer().append("Reverse Dependency Dump for ").append(this.affectedClassMap.size()).append(" classes:").toString(), 4);
        Enumeration keys = this.affectedClassMap.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            log(new StringBuffer().append(" Class ").append(str).append(" affects:").toString(), 4);
            Hashtable hashtable = (Hashtable) this.affectedClassMap.get(str);
            Enumeration keys2 = hashtable.keys();
            while (keys2.hasMoreElements()) {
                String str2 = (String) keys2.nextElement();
                log(new StringBuffer().append("    ").append(str2).append(" in ").append(((ClassFileInfo) hashtable.get(str2)).absoluteFile.getPath()).toString(), 4);
            }
        }
        if (this.classpathDependencies != null) {
            log("Classpath file dependencies (Forward):", 4);
            Enumeration keys3 = this.classpathDependencies.keys();
            while (keys3.hasMoreElements()) {
                String str3 = (String) keys3.nextElement();
                log(new StringBuffer().append(" Class ").append(str3).append(" depends on:").toString(), 4);
                Enumeration elements = ((Hashtable) this.classpathDependencies.get(str3)).elements();
                while (elements.hasMoreElements()) {
                    log(new StringBuffer().append("    ").append(((File) elements.nextElement()).getPath()).toString(), 4);
                }
            }
        }
    }

    private File findSourceFile(String str, File file) {
        File file2;
        int indexOf = str.indexOf("$");
        String stringBuffer = indexOf != -1 ? new StringBuffer().append(str.substring(0, indexOf)).append(".java").toString() : new StringBuffer().append(str).append(".java").toString();
        int i = 0;
        while (true) {
            if (i >= this.srcPathList.length) {
                file2 = null;
                break;
            }
            File file3 = new File(this.srcPathList[i], stringBuffer);
            file2 = file3;
            if (file3.equals(file)) {
                break;
            } else if (file3.exists()) {
                file2 = file3;
                break;
            } else {
                i++;
            }
        }
        return file2;
    }

    private Path getCheckClassPath() {
        Path path;
        if (this.dependClasspath == null) {
            path = null;
        } else {
            String[] list = this.destPath.list();
            String[] list2 = this.dependClasspath.list();
            String str = "";
            int i = 0;
            while (i < list2.length) {
                String str2 = list2[i];
                boolean z = false;
                for (int i2 = 0; i2 < list.length && !z; i2++) {
                    z = list[i2].equals(str2);
                }
                String str3 = str;
                if (!z) {
                    str3 = str.length() == 0 ? str2 : new StringBuffer().append(str).append(":").append(str2).toString();
                }
                i++;
                str = str3;
            }
            path = null;
            if (str.length() > 0) {
                path = new Path(getProject(), str);
            }
            log(new StringBuffer().append("Classpath without dest dir is ").append(path).toString(), 4);
        }
        return path;
    }

    private Vector getClassFiles(Path path) {
        String[] list = path.list();
        Vector vector = new Vector();
        for (String str : list) {
            File file = new File(str);
            if (file.isDirectory()) {
                addClassFiles(vector, file, file);
            }
        }
        return vector;
    }

    private boolean isRmiStub(String str, String str2) {
        return isStub(str, str2, DefaultRmicAdapter.RMI_STUB_SUFFIX) || isStub(str, str2, DefaultRmicAdapter.RMI_SKEL_SUFFIX) || isStub(str, str2, DefaultRmicAdapter.RMI_STUB_SUFFIX) || isStub(str, str2, DefaultRmicAdapter.RMI_SKEL_SUFFIX);
    }

    private boolean isStub(String str, String str2, String str3) {
        return new StringBuffer().append(str2).append(str3).toString().equals(str);
    }

    private Hashtable readCachedDependencies(File file) throws IOException {
        BufferedReader bufferedReader;
        Hashtable hashtable = new Hashtable();
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            Vector vector = null;
            try {
                int length = CLASSNAME_PREPEND.length();
                while (true) {
                    String readLine = bufferedReader2.readLine();
                    if (readLine == null) {
                        FileUtils.close(bufferedReader2);
                        return hashtable;
                    } else if (readLine.startsWith(CLASSNAME_PREPEND)) {
                        vector = new Vector();
                        hashtable.put(readLine.substring(length), vector);
                    } else {
                        vector.addElement(readLine);
                    }
                }
            } catch (Throwable th) {
                th = th;
                bufferedReader = bufferedReader2;
                FileUtils.close(bufferedReader);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            bufferedReader = null;
        }
    }

    private void warnOutOfDateButNotDeleted(ClassFileInfo classFileInfo, String str, String str2) {
        if (classFileInfo.isUserWarned) {
            return;
        }
        int i = 1;
        if (!this.warnOnRmiStubs) {
            i = 1;
            if (isRmiStub(str, str2)) {
                i = 3;
            }
        }
        log(new StringBuffer().append("The class ").append(str).append(" in file ").append(classFileInfo.absoluteFile.getPath()).append(" is out of date due to ").append(str2).append(" but has not been deleted because its source file").append(" could not be determined").toString(), i);
        classFileInfo.isUserWarned = true;
    }

    private void writeCachedDependencies(Hashtable hashtable) throws IOException {
        BufferedWriter bufferedWriter;
        Throwable th;
        if (this.cache != null) {
            try {
                this.cache.mkdirs();
                bufferedWriter = new BufferedWriter(new FileWriter(new File(this.cache, CACHE_FILE_NAME)));
                try {
                    Enumeration keys = hashtable.keys();
                    while (keys.hasMoreElements()) {
                        String str = (String) keys.nextElement();
                        bufferedWriter.write(new StringBuffer().append(CLASSNAME_PREPEND).append(str).toString());
                        bufferedWriter.newLine();
                        Vector vector = (Vector) hashtable.get(str);
                        int size = vector.size();
                        for (int i = 0; i < size; i++) {
                            bufferedWriter.write(String.valueOf(vector.elementAt(i)));
                            bufferedWriter.newLine();
                        }
                    }
                    FileUtils.close(bufferedWriter);
                } catch (Throwable th2) {
                    th = th2;
                    FileUtils.close(bufferedWriter);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                bufferedWriter = null;
            }
        }
    }

    public Path createClasspath() {
        if (this.dependClasspath == null) {
            this.dependClasspath = new Path(getProject());
        }
        return this.dependClasspath.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        try {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.srcPath == null) {
                throw new BuildException("srcdir attribute must be set", getLocation());
            }
            this.srcPathList = this.srcPath.list();
            if (this.srcPathList.length == 0) {
                throw new BuildException("srcdir attribute must be non-empty", getLocation());
            }
            if (this.destPath == null) {
                this.destPath = this.srcPath;
            }
            if (this.cache != null && this.cache.exists() && !this.cache.isDirectory()) {
                throw new BuildException("The cache, if specified, must point to a directory");
            }
            if (this.cache != null && !this.cache.exists()) {
                this.cache.mkdirs();
            }
            determineDependencies();
            if (this.dump) {
                dumpDependencies();
            }
            determineOutOfDateClasses();
            int deleteAllAffectedFiles = deleteAllAffectedFiles();
            log(new StringBuffer().append("Deleted ").append(deleteAllAffectedFiles).append(" out of date files in ").append((System.currentTimeMillis() - currentTimeMillis) / 1000).append(" seconds").toString(), deleteAllAffectedFiles > 0 ? 2 : 4);
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    public Path getClasspath() {
        return this.dependClasspath;
    }

    protected void scanDir(File file, String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            File file2 = new File(file, strArr[i]);
            if (strArr[i].endsWith(".java")) {
                String path = file2.getPath();
                String convertSlashName = ClassFileUtils.convertSlashName(path.substring(file.getPath().length() + 1, path.length() - ".java".length()));
                ClassFileInfo classFileInfo = (ClassFileInfo) this.classFileInfoMap.get(convertSlashName);
                if (classFileInfo == null) {
                    this.outOfDateClasses.put(convertSlashName, convertSlashName);
                } else if (file2.lastModified() > classFileInfo.absoluteFile.lastModified()) {
                    this.outOfDateClasses.put(convertSlashName, convertSlashName);
                }
            }
        }
    }

    public void setCache(File file) {
        this.cache = file;
    }

    public void setClasspath(Path path) {
        if (this.dependClasspath == null) {
            this.dependClasspath = path;
        } else {
            this.dependClasspath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setClosure(boolean z) {
        this.closure = z;
    }

    public void setDestDir(Path path) {
        this.destPath = path;
    }

    public void setDump(boolean z) {
        this.dump = z;
    }

    public void setSrcdir(Path path) {
        this.srcPath = path;
    }

    public void setWarnOnRmiStubs(boolean z) {
        this.warnOnRmiStubs = z;
    }
}
