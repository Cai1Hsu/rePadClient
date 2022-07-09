package org.apache.tools.ant.taskdefs.optional.unix;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.dispatch.DispatchTask;
import org.apache.tools.ant.dispatch.DispatchUtils;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.SymbolicLinkUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/unix/Symlink.class */
public class Symlink extends DispatchTask {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final SymbolicLinkUtils SYMLINK_UTILS = SymbolicLinkUtils.getSymbolicLinkUtils();
    private boolean failonerror;
    private String link;
    private String linkFileName;
    private boolean overwrite;
    private String resource;
    private Vector fileSets = new Vector();
    private boolean executing = false;

    public static void deleteSymlink(File file) throws IOException {
        SYMLINK_UTILS.deleteSymbolicLink(file, null);
    }

    public static void deleteSymlink(String str) throws IOException, FileNotFoundException {
        SYMLINK_UTILS.deleteSymbolicLink(new File(str), null);
    }

    private void doLink(String str, String str2) throws BuildException {
        File file = new File(str2);
        String str3 = "-s";
        if (this.overwrite) {
            String stringBuffer = new StringBuffer().append("-s").append("f").toString();
            str3 = stringBuffer;
            if (file.exists()) {
                try {
                    SYMLINK_UTILS.deleteSymbolicLink(file, this);
                    str3 = stringBuffer;
                } catch (FileNotFoundException e) {
                    log(new StringBuffer().append("Symlink disappeared before it was deleted: ").append(str2).toString());
                    str3 = stringBuffer;
                } catch (IOException e2) {
                    log(new StringBuffer().append("Unable to overwrite preexisting link or file: ").append(str2).toString(), e2, 2);
                    str3 = stringBuffer;
                }
            }
        }
        try {
            Execute.runCommand(this, new String[]{"ln", str3, str, str2});
        } catch (BuildException e3) {
            if (this.failonerror) {
                throw e3;
            }
            log(e3.getMessage(), e3, 2);
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v12, resolved type: java.lang.String[] */
    /* JADX DEBUG: Multi-variable search result rejected for r1v12, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r2v12, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r2v13, resolved type: java.lang.String */
    /* JADX DEBUG: Multi-variable search result rejected for r2v8, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r2v9, resolved type: java.lang.String */
    /* JADX WARN: Multi-variable type inference failed */
    private HashSet findLinks(Vector vector) {
        HashSet hashSet = new HashSet();
        int size = vector.size();
        for (int i = 0; i < size; i++) {
            FileSet fileSet = (FileSet) vector.get(i);
            DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(getProject());
            String[] strArr = {directoryScanner.getIncludedFiles(), directoryScanner.getIncludedDirectories()};
            File dir = fileSet.getDir(getProject());
            for (int i2 = 0; i2 < strArr.length; i2++) {
                for (int i3 = 0; i3 < strArr[i2].length; i3++) {
                    try {
                        File file = new File(dir, strArr[i2][i3]);
                        File parentFile = file.getParentFile();
                        String name = file.getName();
                        if (SYMLINK_UTILS.isSymbolicLink(parentFile, name)) {
                            hashSet.add(new File(parentFile.getCanonicalFile(), name));
                        }
                    } catch (IOException e) {
                        handleError(new StringBuffer().append("IOException: ").append(strArr[i2][i3]).append(" omitted").toString());
                    }
                }
            }
        }
        return hashSet;
    }

    private void handleError(String str) {
        if (this.failonerror) {
            throw new BuildException(str);
        }
        log(str);
    }

    private Properties loadLinks(Vector vector) {
        Throwable th;
        BufferedInputStream bufferedInputStream;
        Properties properties = new Properties();
        int size = vector.size();
        for (int i = 0; i < size; i++) {
            FileSet fileSet = (FileSet) vector.elementAt(i);
            DirectoryScanner directoryScanner = new DirectoryScanner();
            fileSet.setupDirectoryScanner(directoryScanner, getProject());
            directoryScanner.setFollowSymlinks(false);
            directoryScanner.scan();
            String[] includedFiles = directoryScanner.getIncludedFiles();
            File dir = fileSet.getDir(getProject());
            for (int i2 = 0; i2 < includedFiles.length; i2++) {
                File file = new File(dir, includedFiles[i2]);
                File parentFile = file.getParentFile();
                Properties properties2 = new Properties();
                BufferedInputStream bufferedInputStream2 = null;
                try {
                    try {
                        bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } catch (FileNotFoundException e) {
                    bufferedInputStream = null;
                } catch (IOException e2) {
                    bufferedInputStream = null;
                }
                try {
                    properties2.load(bufferedInputStream);
                    File canonicalFile = parentFile.getCanonicalFile();
                    FileUtils.close(bufferedInputStream);
                    properties2.list(new PrintStream(new LogOutputStream((Task) this, 2)));
                    for (String str : properties2.keySet()) {
                        properties.put(new File(canonicalFile, str).getAbsolutePath(), properties2.getProperty(str));
                    }
                } catch (FileNotFoundException e3) {
                    BufferedInputStream bufferedInputStream3 = bufferedInputStream;
                    BufferedInputStream bufferedInputStream4 = bufferedInputStream;
                    handleError(new StringBuffer().append("Unable to find ").append(includedFiles[i2]).append("; skipping it.").toString());
                    FileUtils.close(bufferedInputStream);
                } catch (IOException e4) {
                    BufferedInputStream bufferedInputStream5 = bufferedInputStream;
                    BufferedInputStream bufferedInputStream6 = bufferedInputStream;
                    handleError(new StringBuffer().append("Unable to open ").append(includedFiles[i2]).append(" or its parent dir; skipping it.").toString());
                    FileUtils.close(bufferedInputStream);
                } catch (Throwable th3) {
                    th = th3;
                    bufferedInputStream2 = bufferedInputStream;
                    FileUtils.close(bufferedInputStream2);
                    throw th;
                }
            }
        }
        return properties;
    }

    private void setDefaults() {
        this.resource = null;
        this.link = null;
        this.linkFileName = null;
        this.failonerror = true;
        this.overwrite = false;
        setAction("single");
        this.fileSets.clear();
    }

    private void writePropertyFile(Properties properties, File file) throws BuildException {
        Throwable th;
        IOException e;
        BufferedOutputStream bufferedOutputStream;
        BufferedOutputStream bufferedOutputStream2;
        BufferedOutputStream bufferedOutputStream3 = null;
        try {
            try {
                bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(new File(file, this.linkFileName)));
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedOutputStream = null;
        }
        try {
            properties.store(bufferedOutputStream2, new StringBuffer().append("Symlinks from ").append(file).toString());
            FileUtils.close(bufferedOutputStream2);
        } catch (IOException e3) {
            e = e3;
            bufferedOutputStream = bufferedOutputStream2;
            BufferedOutputStream bufferedOutputStream4 = bufferedOutputStream;
            BufferedOutputStream bufferedOutputStream5 = bufferedOutputStream;
            throw new BuildException(e, getLocation());
        } catch (Throwable th3) {
            th = th3;
            bufferedOutputStream3 = bufferedOutputStream2;
            FileUtils.close(bufferedOutputStream3);
            throw th;
        }
    }

    public void addFileset(FileSet fileSet) {
        this.fileSets.addElement(fileSet);
    }

    public void delete() throws BuildException {
        try {
            try {
                if (this.link == null) {
                    handleError("Must define the link name for symlink!");
                    setDefaults();
                } else {
                    log(new StringBuffer().append("Removing symlink: ").append(this.link).toString());
                    SYMLINK_UTILS.deleteSymbolicLink(FILE_UTILS.resolveFile(new File("."), this.link), this);
                    setDefaults();
                }
            } catch (FileNotFoundException e) {
                handleError(e.toString());
                setDefaults();
            } catch (IOException e2) {
                handleError(e2.toString());
                setDefaults();
            }
        } catch (Throwable th) {
            setDefaults();
            throw th;
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        synchronized (this) {
            if (this.executing) {
                throw new BuildException("Infinite recursion detected in Symlink.execute()");
            }
            this.executing = true;
            DispatchUtils.execute(this);
            this.executing = false;
        }
    }

    @Override // org.apache.tools.ant.Task
    public void init() throws BuildException {
        super.init();
        setDefaults();
    }

    public void record() throws BuildException {
        try {
            if (this.fileSets.isEmpty()) {
                handleError("Fileset identifying links to record required");
            } else if (this.linkFileName == null) {
                handleError("Name of file to record links in required");
            } else {
                Hashtable hashtable = new Hashtable();
                Iterator it = findLinks(this.fileSets).iterator();
                while (it.hasNext()) {
                    File file = (File) it.next();
                    File parentFile = file.getParentFile();
                    Vector vector = (Vector) hashtable.get(parentFile);
                    Vector vector2 = vector;
                    if (vector == null) {
                        vector2 = new Vector();
                        hashtable.put(parentFile, vector2);
                    }
                    vector2.addElement(file);
                }
                for (File file2 : hashtable.keySet()) {
                    Vector vector3 = (Vector) hashtable.get(file2);
                    Properties properties = new Properties();
                    Iterator it2 = vector3.iterator();
                    while (it2.hasNext()) {
                        File file3 = (File) it2.next();
                        try {
                            properties.put(file3.getName(), file3.getCanonicalPath());
                        } catch (IOException e) {
                            handleError("Couldn't get canonical name of parent link");
                        }
                    }
                    writePropertyFile(properties, file2);
                }
            }
        } finally {
            setDefaults();
        }
    }

    public void recreate() throws BuildException {
        try {
            if (this.fileSets.isEmpty()) {
                handleError("File set identifying link file(s) required for action recreate");
                return;
            }
            Properties loadLinks = loadLinks(this.fileSets);
            for (String str : loadLinks.keySet()) {
                String property = loadLinks.getProperty(str);
                try {
                    File file = new File(str);
                    if (!SYMLINK_UTILS.isSymbolicLink(str)) {
                        doLink(property, str);
                    } else if (!file.getCanonicalPath().equals(new File(property).getCanonicalPath())) {
                        SYMLINK_UTILS.deleteSymbolicLink(file, this);
                        doLink(property, str);
                    }
                } catch (IOException e) {
                    handleError("IO exception while creating link");
                }
            }
        } finally {
            setDefaults();
        }
    }

    @Override // org.apache.tools.ant.dispatch.DispatchTask
    public void setAction(String str) {
        super.setAction(str);
    }

    public void setFailOnError(boolean z) {
        this.failonerror = z;
    }

    public void setLink(String str) {
        this.link = str;
    }

    public void setLinkfilename(String str) {
        this.linkFileName = str;
    }

    public void setOverwrite(boolean z) {
        this.overwrite = z;
    }

    public void setResource(String str) {
        this.resource = str;
    }

    public void single() throws BuildException {
        try {
            if (this.resource == null) {
                handleError("Must define the resource to symlink to!");
            } else if (this.link == null) {
                handleError("Must define the link name for symlink!");
            } else {
                doLink(this.resource, this.link);
            }
        } finally {
            setDefaults();
        }
    }
}
