package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.commons.io.IOUtils;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.DirSet;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.jivesoftware.smackx.packet.MessageEvent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc.class */
public class Javadoc extends Task {
    private static final FileUtils FILE_UTILS;
    private static final boolean JAVADOC_5;
    static final String[] SCOPE_ELEMENTS;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String noqualifier;
    private Commandline cmd = new Commandline();
    private boolean failOnError = false;
    private Path sourcePath = null;
    private File destDir = null;
    private Vector sourceFiles = new Vector();
    private Vector packageNames = new Vector();
    private Vector excludePackageNames = new Vector(1);
    private boolean author = true;
    private boolean version = true;
    private DocletInfo doclet = null;
    private Path classpath = null;
    private Path bootclasspath = null;
    private String group = null;
    private String packageList = null;
    private Vector links = new Vector();
    private Vector groups = new Vector();
    private Vector tags = new Vector();
    private boolean useDefaultExcludes = true;
    private Html doctitle = null;
    private Html header = null;
    private Html footer = null;
    private Html bottom = null;
    private boolean useExternalFile = false;
    private String source = null;
    private boolean linksource = false;
    private boolean breakiterator = false;
    private boolean includeNoSourcePackages = false;
    private String executable = null;
    private boolean docFilesSubDirs = false;
    private String excludeDocFilesSubDir = null;
    private ResourceCollectionContainer nestedSourceFiles = new ResourceCollectionContainer(this);
    private Vector packageSets = new Vector();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$AccessType.class */
    public static class AccessType extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"protected", "public", "package", "private"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$DocletInfo.class */
    public class DocletInfo extends ExtensionInfo {
        private Vector params = new Vector();
        private final Javadoc this$0;

        public DocletInfo(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public DocletParam createParam() {
            DocletParam docletParam = new DocletParam(this.this$0);
            this.params.addElement(docletParam);
            return docletParam;
        }

        public Enumeration getParams() {
            return this.params.elements();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$DocletParam.class */
    public class DocletParam {
        private String name;
        private final Javadoc this$0;
        private String value;

        public DocletParam(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public String getName() {
            return this.name;
        }

        public String getValue() {
            return this.value;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo.class */
    public static class ExtensionInfo extends ProjectComponent {
        private String name;
        private Path path;

        public Path createPath() {
            if (this.path == null) {
                this.path = new Path(getProject());
            }
            return this.path.createPath();
        }

        public String getName() {
            return this.name;
        }

        public Path getPath() {
            return this.path;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setPath(Path path) {
            if (this.path == null) {
                this.path = path;
            } else {
                this.path.append(path);
            }
        }

        public void setPathRef(Reference reference) {
            createPath().setRefid(reference);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$GroupArgument.class */
    public class GroupArgument {
        private Vector packages = new Vector();
        private final Javadoc this$0;
        private Html title;

        public GroupArgument(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public void addPackage(PackageName packageName) {
            this.packages.addElement(packageName);
        }

        public void addTitle(Html html) {
            this.title = html;
        }

        public String getPackages() {
            StringBuffer stringBuffer = new StringBuffer();
            int size = this.packages.size();
            for (int i = 0; i < size; i++) {
                if (i > 0) {
                    stringBuffer.append(":");
                }
                stringBuffer.append(this.packages.elementAt(i).toString());
            }
            return stringBuffer.toString();
        }

        public String getTitle() {
            return this.title != null ? this.title.getText() : null;
        }

        public void setPackages(String str) {
            StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
            while (stringTokenizer.hasMoreTokens()) {
                String nextToken = stringTokenizer.nextToken();
                PackageName packageName = new PackageName();
                packageName.setName(nextToken);
                addPackage(packageName);
            }
        }

        public void setTitle(String str) {
            Html html = new Html();
            html.addText(str);
            addTitle(html);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$Html.class */
    public static class Html {
        private StringBuffer text = new StringBuffer();

        public void addText(String str) {
            this.text.append(str);
        }

        public String getText() {
            return this.text.substring(0);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream.class */
    private class JavadocOutputStream extends LogOutputStream {
        private String queuedLine = null;
        private final Javadoc this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        JavadocOutputStream(Javadoc javadoc, int i) {
            super((Task) javadoc, i);
            this.this$0 = javadoc;
        }

        protected void logFlush() {
            if (this.queuedLine != null) {
                super.processLine(this.queuedLine, 3);
                this.queuedLine = null;
            }
        }

        @Override // org.apache.tools.ant.taskdefs.LogOutputStream
        protected void processLine(String str, int i) {
            if (i == 2 && str.startsWith("Generating ")) {
                if (this.queuedLine != null) {
                    super.processLine(this.queuedLine, 3);
                }
                this.queuedLine = str;
                return;
            }
            if (this.queuedLine != null) {
                if (str.startsWith("Building ")) {
                    super.processLine(this.queuedLine, 3);
                } else {
                    super.processLine(this.queuedLine, 2);
                }
                this.queuedLine = null;
            }
            super.processLine(str, i);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$LinkArgument.class */
    public class LinkArgument {
        private String href;
        private File packagelistLoc;
        private URL packagelistURL;
        private final Javadoc this$0;
        private boolean offline = false;
        private boolean resolveLink = false;

        public LinkArgument(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public String getHref() {
            return this.href;
        }

        public File getPackagelistLoc() {
            return this.packagelistLoc;
        }

        public URL getPackagelistURL() {
            return this.packagelistURL;
        }

        public boolean isLinkOffline() {
            return this.offline;
        }

        public void setHref(String str) {
            this.href = str;
        }

        public void setOffline(boolean z) {
            this.offline = z;
        }

        public void setPackagelistLoc(File file) {
            this.packagelistLoc = file;
        }

        public void setPackagelistURL(URL url) {
            this.packagelistURL = url;
        }

        public void setResolveLink(boolean z) {
            this.resolveLink = z;
        }

        public boolean shouldResolveLink() {
            return this.resolveLink;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$PackageName.class */
    public static class PackageName {
        private String name;

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str.trim();
        }

        public String toString() {
            return getName();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer.class */
    public class ResourceCollectionContainer {
        private ArrayList rcs = new ArrayList();
        private final Javadoc this$0;

        public ResourceCollectionContainer(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public Iterator iterator() {
            return this.rcs.iterator();
        }

        public void add(ResourceCollection resourceCollection) {
            this.rcs.add(resourceCollection);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$SourceFile.class */
    public static class SourceFile {
        private File file;

        public SourceFile() {
        }

        public SourceFile(File file) {
            this.file = file;
        }

        public File getFile() {
            return this.file;
        }

        public void setFile(File file) {
            this.file = file;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Javadoc$TagArgument.class */
    public class TagArgument extends FileSet {
        private final Javadoc this$0;
        private String name = null;
        private boolean enabled = true;
        private String scope = "a";

        public TagArgument(Javadoc javadoc) {
            this.this$0 = javadoc;
        }

        public String getParameter() throws BuildException {
            String stringBuffer;
            if (this.name == null || this.name.equals("")) {
                throw new BuildException("No name specified for custom tag.");
            }
            if (getDescription() != null) {
                stringBuffer = new StringBuffer().append(this.name).append(":").append(this.enabled ? "" : "X").append(this.scope).append(":").append(getDescription()).toString();
            } else if (!this.enabled || !"a".equals(this.scope)) {
                stringBuffer = new StringBuffer().append(this.name).append(":").append(this.enabled ? "" : "X").append(this.scope).toString();
            } else {
                stringBuffer = this.name;
            }
            return stringBuffer;
        }

        public void setEnabled(boolean z) {
            this.enabled = z;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setScope(String str) throws BuildException {
            String lowerCase = str.toLowerCase(Locale.ENGLISH);
            boolean[] zArr = new boolean[Javadoc.SCOPE_ELEMENTS.length];
            boolean z = false;
            boolean z2 = false;
            StringTokenizer stringTokenizer = new StringTokenizer(lowerCase, ",");
            while (stringTokenizer.hasMoreTokens()) {
                String trim = stringTokenizer.nextToken().trim();
                if (trim.equals("all")) {
                    if (z) {
                        getProject().log("Repeated tag scope element: all", 3);
                    }
                    z = true;
                } else {
                    int i = 0;
                    while (i < Javadoc.SCOPE_ELEMENTS.length && !trim.equals(Javadoc.SCOPE_ELEMENTS[i])) {
                        i++;
                    }
                    if (i == Javadoc.SCOPE_ELEMENTS.length) {
                        throw new BuildException(new StringBuffer().append("Unrecognised scope element: ").append(trim).toString());
                    }
                    if (zArr[i]) {
                        getProject().log(new StringBuffer().append("Repeated tag scope element: ").append(trim).toString(), 3);
                    }
                    zArr[i] = true;
                    z2 = true;
                }
            }
            if (!z2 || !z) {
                if (!z2 && !z) {
                    throw new BuildException("No scope elements specified in tag parameter.");
                }
                if (z) {
                    this.scope = "a";
                    return;
                }
                StringBuffer stringBuffer = new StringBuffer(zArr.length);
                for (int i2 = 0; i2 < zArr.length; i2++) {
                    if (zArr[i2]) {
                        stringBuffer.append(Javadoc.SCOPE_ELEMENTS[i2].charAt(0));
                    }
                }
                this.scope = stringBuffer.toString();
                return;
            }
            throw new BuildException("Mixture of \"all\" and other scope elements in tag parameter.");
        }
    }

    static {
        JAVADOC_5 = !JavaEnvUtils.isJavaVersion("1.4");
        FILE_UTILS = FileUtils.getFileUtils();
        SCOPE_ELEMENTS = new String[]{"overview", "packages", "types", "constructors", "methods", "fields"};
    }

    private void addArgIf(boolean z, String str) {
        if (z) {
            this.cmd.createArgument().setValue(str);
        }
    }

    private void addArgIfNotEmpty(String str, String str2) {
        if (str2 == null || str2.length() == 0) {
            log(new StringBuffer().append("Warning: Leaving out empty argument '").append(str).append("'").toString(), 1);
            return;
        }
        this.cmd.createArgument().setValue(str);
        this.cmd.createArgument().setValue(str2);
    }

    private void addSourceFiles(Vector vector) {
        Class cls;
        Iterator it = this.nestedSourceFiles.iterator();
        while (it.hasNext()) {
            ResourceCollection resourceCollection = (ResourceCollection) it.next();
            if (!resourceCollection.isFilesystemOnly()) {
                throw new BuildException("only file system based resources are supported by javadoc");
            }
            ResourceCollection<Resource> resourceCollection2 = resourceCollection;
            if (resourceCollection instanceof FileSet) {
                FileSet fileSet = (FileSet) resourceCollection;
                resourceCollection2 = resourceCollection;
                if (!fileSet.hasPatterns()) {
                    resourceCollection2 = resourceCollection;
                    if (!fileSet.hasSelectors()) {
                        FileSet fileSet2 = (FileSet) fileSet.clone();
                        fileSet2.createInclude().setName("**/*.java");
                        resourceCollection2 = fileSet2;
                        if (this.includeNoSourcePackages) {
                            fileSet2.createInclude().setName("**/package.html");
                            resourceCollection2 = fileSet2;
                        }
                    }
                }
            }
            for (Resource resource : resourceCollection2) {
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                vector.addElement(new SourceFile(((FileProvider) resource.as(cls)).getFile()));
            }
        }
    }

    private void checkPackageAndSourcePath() {
        if (this.packageList == null || this.sourcePath != null) {
            return;
        }
        throw new BuildException("sourcePath attribute must be set when specifying packagelist.");
    }

    private void checkPackages(Vector vector, Path path) {
        if (vector.size() == 0 || path.size() != 0) {
            return;
        }
        throw new BuildException("sourcePath attribute must be set when specifying package names.");
    }

    private void checkPackagesToDoc(Vector vector, Vector vector2) {
        if (this.packageList == null && vector.size() == 0 && vector2.size() == 0) {
            throw new BuildException("No source files and no packages have been specified.");
        }
    }

    private void checkTaskName() {
        if ("javadoc2".equals(getTaskType())) {
            log("Warning: the task name <javadoc2> is deprecated. Use <javadoc> instead.", 1);
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean containsWhitespace(String str) {
        boolean z;
        int length = str.length();
        int i = 0;
        while (true) {
            if (i >= length) {
                z = false;
                break;
            } else if (Character.isWhitespace(str.charAt(i))) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private void doBootPath(Commandline commandline) {
        Path path = new Path(getProject());
        if (this.bootclasspath != null) {
            path.append(this.bootclasspath);
        }
        Path concatSystemBootClasspath = path.concatSystemBootClasspath(Definer.OnError.POLICY_IGNORE);
        if (concatSystemBootClasspath.size() > 0) {
            commandline.createArgument().setValue("-bootclasspath");
            commandline.createArgument().setPath(concatSystemBootClasspath);
        }
    }

    private void doDocFilesSubDirs(Commandline commandline) {
        if (this.docFilesSubDirs) {
            commandline.createArgument().setValue("-docfilessubdirs");
            if (this.excludeDocFilesSubDir == null || this.excludeDocFilesSubDir.trim().length() <= 0) {
                return;
            }
            commandline.createArgument().setValue("-excludedocfilessubdir");
            commandline.createArgument().setValue(this.excludeDocFilesSubDir);
        }
    }

    private void doDoclet(Commandline commandline) {
        if (this.doclet != null) {
            if (this.doclet.getName() == null) {
                throw new BuildException("The doclet name must be specified.", getLocation());
            }
            commandline.createArgument().setValue("-doclet");
            commandline.createArgument().setValue(this.doclet.getName());
            if (this.doclet.getPath() != null) {
                Path concatSystemClasspath = this.doclet.getPath().concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
                if (concatSystemClasspath.size() != 0) {
                    commandline.createArgument().setValue("-docletpath");
                    commandline.createArgument().setPath(concatSystemClasspath);
                }
            }
            Enumeration params = this.doclet.getParams();
            while (params.hasMoreElements()) {
                DocletParam docletParam = (DocletParam) params.nextElement();
                if (docletParam.getName() == null) {
                    throw new BuildException("Doclet parameters must have a name");
                }
                commandline.createArgument().setValue(docletParam.getName());
                if (docletParam.getValue() != null) {
                    commandline.createArgument().setValue(docletParam.getValue());
                }
            }
        }
    }

    private void doGroup(Commandline commandline) {
        if (this.group != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(this.group, ",", false);
            while (stringTokenizer.hasMoreTokens()) {
                String trim = stringTokenizer.nextToken().trim();
                int indexOf = trim.indexOf(" ");
                if (indexOf > 0) {
                    String substring = trim.substring(0, indexOf);
                    String substring2 = trim.substring(indexOf + 1);
                    commandline.createArgument().setValue("-group");
                    commandline.createArgument().setValue(substring);
                    commandline.createArgument().setValue(substring2);
                }
            }
        }
    }

    private void doGroups(Commandline commandline) {
        if (this.groups.size() != 0) {
            Enumeration elements = this.groups.elements();
            while (elements.hasMoreElements()) {
                GroupArgument groupArgument = (GroupArgument) elements.nextElement();
                String title = groupArgument.getTitle();
                String packages = groupArgument.getPackages();
                if (title == null || packages == null) {
                    throw new BuildException("The title and packages must be specified for group elements.");
                }
                commandline.createArgument().setValue("-group");
                commandline.createArgument().setValue(expand(title));
                commandline.createArgument().setValue(packages);
            }
        }
    }

    private void doJava14(Commandline commandline) {
        Enumeration elements = this.tags.elements();
        while (elements.hasMoreElements()) {
            Object nextElement = elements.nextElement();
            if (nextElement instanceof TagArgument) {
                TagArgument tagArgument = (TagArgument) nextElement;
                File dir = tagArgument.getDir(getProject());
                if (dir == null) {
                    commandline.createArgument().setValue("-tag");
                    commandline.createArgument().setValue(tagArgument.getParameter());
                } else {
                    for (String str : tagArgument.getDirectoryScanner(getProject()).getIncludedFiles()) {
                        File file = new File(dir, str);
                        try {
                            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
                            while (true) {
                                String readLine = bufferedReader.readLine();
                                if (readLine != null) {
                                    commandline.createArgument().setValue("-tag");
                                    commandline.createArgument().setValue(readLine);
                                }
                            }
                            bufferedReader.close();
                        } catch (IOException e) {
                            throw new BuildException(new StringBuffer().append("Couldn't read  tag file from ").append(file.getAbsolutePath()).toString(), e);
                        }
                    }
                    continue;
                }
            } else {
                ExtensionInfo extensionInfo = (ExtensionInfo) nextElement;
                commandline.createArgument().setValue("-taglet");
                commandline.createArgument().setValue(extensionInfo.getName());
                if (extensionInfo.getPath() != null) {
                    Path concatSystemClasspath = extensionInfo.getPath().concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
                    if (concatSystemClasspath.size() != 0) {
                        commandline.createArgument().setValue("-tagletpath");
                        commandline.createArgument().setPath(concatSystemClasspath);
                    }
                }
            }
        }
        String property = this.source != null ? this.source : getProject().getProperty(MagicNames.BUILD_JAVAC_SOURCE);
        if (property != null) {
            commandline.createArgument().setValue("-source");
            commandline.createArgument().setValue(property);
        }
        if (this.linksource && this.doclet == null) {
            commandline.createArgument().setValue("-linksource");
        }
        if (this.noqualifier == null || this.doclet != null) {
            return;
        }
        commandline.createArgument().setValue("-noqualifier");
        commandline.createArgument().setValue(this.noqualifier);
    }

    private void doLinks(Commandline commandline) {
        if (this.links.size() != 0) {
            Enumeration elements = this.links.elements();
            while (elements.hasMoreElements()) {
                LinkArgument linkArgument = (LinkArgument) elements.nextElement();
                if (linkArgument.getHref() == null || linkArgument.getHref().length() == 0) {
                    log("No href was given for the link - skipping", 3);
                } else {
                    String str = null;
                    if (linkArgument.shouldResolveLink()) {
                        File resolveFile = getProject().resolveFile(linkArgument.getHref());
                        str = null;
                        if (resolveFile.exists()) {
                            try {
                                str = FILE_UTILS.getFileURL(resolveFile).toExternalForm();
                            } catch (MalformedURLException e) {
                                log(new StringBuffer().append("Warning: link location was invalid ").append(resolveFile).toString(), 1);
                                str = null;
                            }
                        }
                    }
                    String str2 = str;
                    if (str == null) {
                        try {
                            new URL(new URL("file://."), linkArgument.getHref());
                            str2 = linkArgument.getHref();
                        } catch (MalformedURLException e2) {
                            log(new StringBuffer().append("Link href \"").append(linkArgument.getHref()).append("\" is not a valid url - skipping link").toString(), 1);
                        }
                    }
                    if (linkArgument.isLinkOffline()) {
                        File packagelistLoc = linkArgument.getPackagelistLoc();
                        URL packagelistURL = linkArgument.getPackagelistURL();
                        if (packagelistLoc == null && packagelistURL == null) {
                            throw new BuildException(new StringBuffer().append("The package list location for link ").append(linkArgument.getHref()).append(" must be provided ").append("because the link is ").append(MessageEvent.OFFLINE).toString());
                        }
                        URL url = packagelistURL;
                        if (packagelistLoc != null) {
                            if (new File(packagelistLoc, "package-list").exists()) {
                                try {
                                    url = FILE_UTILS.getFileURL(packagelistLoc);
                                } catch (MalformedURLException e3) {
                                    log(new StringBuffer().append("Warning: Package list location was invalid ").append(packagelistLoc).toString(), 1);
                                    url = packagelistURL;
                                }
                            } else {
                                log(new StringBuffer().append("Warning: No package list was found at ").append(packagelistLoc).toString(), 3);
                                url = packagelistURL;
                            }
                        }
                        if (url != null) {
                            commandline.createArgument().setValue("-linkoffline");
                            commandline.createArgument().setValue(str2);
                            commandline.createArgument().setValue(url.toExternalForm());
                        }
                    } else {
                        commandline.createArgument().setValue("-link");
                        commandline.createArgument().setValue(str2);
                    }
                }
            }
        }
    }

    private void doSourceAndPackageNames(Commandline commandline, Vector vector, Vector vector2, boolean z, File file, BufferedWriter bufferedWriter) throws IOException {
        Enumeration elements = vector.elements();
        while (elements.hasMoreElements()) {
            String str = (String) elements.nextElement();
            if (z) {
                bufferedWriter.write(str);
                bufferedWriter.newLine();
            } else {
                commandline.createArgument().setValue(str);
            }
        }
        Enumeration elements2 = vector2.elements();
        while (elements2.hasMoreElements()) {
            String absolutePath = ((SourceFile) elements2.nextElement()).getFile().getAbsolutePath();
            if (z) {
                if (absolutePath.indexOf(" ") > -1) {
                    String str2 = absolutePath;
                    if (File.separatorChar == '\\') {
                        str2 = absolutePath.replace(File.separatorChar, '/');
                    }
                    bufferedWriter.write(new StringBuffer().append("\"").append(str2).append("\"").toString());
                } else {
                    bufferedWriter.write(absolutePath);
                }
                bufferedWriter.newLine();
            } else {
                commandline.createArgument().setValue(absolutePath);
            }
        }
    }

    private void doSourcePath(Commandline commandline, Path path) {
        if (path.size() > 0) {
            commandline.createArgument().setValue("-sourcepath");
            commandline.createArgument().setPath(path);
        }
    }

    private void generalJavadocArguments(Commandline commandline) {
        if (this.doctitle != null) {
            commandline.createArgument().setValue("-doctitle");
            commandline.createArgument().setValue(expand(this.doctitle.getText()));
        }
        if (this.header != null) {
            commandline.createArgument().setValue("-header");
            commandline.createArgument().setValue(expand(this.header.getText()));
        }
        if (this.footer != null) {
            commandline.createArgument().setValue("-footer");
            commandline.createArgument().setValue(expand(this.footer.getText()));
        }
        if (this.bottom != null) {
            commandline.createArgument().setValue("-bottom");
            commandline.createArgument().setValue(expand(this.bottom.getText()));
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject()).concatSystemClasspath("last");
        } else {
            this.classpath = this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
        }
        if (this.classpath.size() > 0) {
            commandline.createArgument().setValue("-classpath");
            commandline.createArgument().setPath(this.classpath);
        }
        if (this.version && this.doclet == null) {
            commandline.createArgument().setValue("-version");
        }
        if (this.author && this.doclet == null) {
            commandline.createArgument().setValue("-author");
        }
        if (this.doclet == null && this.destDir == null) {
            throw new BuildException("destdir attribute must be set!");
        }
    }

    private void parsePackages(Vector vector, Path path) {
        HashSet hashSet = new HashSet();
        Vector vector2 = (Vector) this.packageSets.clone();
        if (this.sourcePath != null) {
            PatternSet patternSet = new PatternSet();
            patternSet.setProject(getProject());
            if (this.packageNames.size() > 0) {
                Enumeration elements = this.packageNames.elements();
                while (elements.hasMoreElements()) {
                    String replace = ((PackageName) elements.nextElement()).getName().replace('.', '/');
                    String str = replace;
                    if (replace.endsWith("*")) {
                        str = new StringBuffer().append(replace).append("*").toString();
                    }
                    patternSet.createInclude().setName(str);
                }
            } else {
                patternSet.createInclude().setName(SelectorUtils.DEEP_TREE_MATCH);
            }
            Enumeration elements2 = this.excludePackageNames.elements();
            while (elements2.hasMoreElements()) {
                String replace2 = ((PackageName) elements2.nextElement()).getName().replace('.', '/');
                String str2 = replace2;
                if (replace2.endsWith("*")) {
                    str2 = new StringBuffer().append(replace2).append("*").toString();
                }
                patternSet.createExclude().setName(str2);
            }
            String[] list = this.sourcePath.list();
            for (int i = 0; i < list.length; i++) {
                File file = new File(list[i]);
                if (file.isDirectory()) {
                    DirSet dirSet = new DirSet();
                    dirSet.setProject(getProject());
                    dirSet.setDefaultexcludes(this.useDefaultExcludes);
                    dirSet.setDir(file);
                    dirSet.createPatternSet().addConfiguredPatternset(patternSet);
                    vector2.addElement(dirSet);
                } else {
                    log(new StringBuffer().append("Skipping ").append(list[i]).append(" since it is no directory.").toString(), 1);
                }
            }
        }
        Enumeration elements3 = vector2.elements();
        while (elements3.hasMoreElements()) {
            DirSet dirSet2 = (DirSet) elements3.nextElement();
            File dir = dirSet2.getDir(getProject());
            log(new StringBuffer().append("scanning ").append(dir).append(" for packages.").toString(), 4);
            String[] includedDirectories = dirSet2.getDirectoryScanner(getProject()).getIncludedDirectories();
            boolean z = false;
            int i2 = 0;
            while (i2 < includedDirectories.length) {
                boolean z2 = z;
                if (new File(dir, includedDirectories[i2]).list(new FilenameFilter(this) { // from class: org.apache.tools.ant.taskdefs.Javadoc.1
                    private final Javadoc this$0;

                    {
                        this.this$0 = this;
                    }

                    @Override // java.io.FilenameFilter
                    public boolean accept(File file2, String str3) {
                        return str3.endsWith(".java") || (this.this$0.includeNoSourcePackages && str3.equals("package.html"));
                    }
                }).length > 0) {
                    if ("".equals(includedDirectories[i2])) {
                        log(new StringBuffer().append(dir).append(" contains source files in the default package,").append(" you must specify them as source files").append(" not packages.").toString(), 1);
                        z2 = z;
                    } else {
                        String replace3 = includedDirectories[i2].replace(File.separatorChar, '.');
                        z2 = true;
                        if (!hashSet.contains(replace3)) {
                            hashSet.add(replace3);
                            vector.addElement(replace3);
                            z2 = true;
                        }
                    }
                }
                i2++;
                z = z2;
            }
            if (z) {
                path.createPathElement().setLocation(dir);
            } else {
                log(new StringBuffer().append(dir).append(" doesn't contain any packages, dropping it.").toString(), 3);
            }
        }
    }

    private String quoteString(String str) {
        if (containsWhitespace(str) || str.indexOf(39) != -1 || str.indexOf(34) != -1) {
            str = str.indexOf(39) == -1 ? quoteString(str, '\'') : quoteString(str, '\"');
        }
        return str;
    }

    private String quoteString(String str, char c) {
        boolean z;
        StringBuffer stringBuffer = new StringBuffer(str.length() * 2);
        stringBuffer.append(c);
        int length = str.length();
        boolean z2 = false;
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt == c) {
                stringBuffer.append('\\').append(charAt);
                z = false;
            } else {
                switch (charAt) {
                    case '\n':
                        if (!z2) {
                            stringBuffer.append("\\\n");
                        } else {
                            stringBuffer.append("\n");
                        }
                        z = false;
                        continue;
                    case '\r':
                        stringBuffer.append("\\\r");
                        z = true;
                        continue;
                    case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                        stringBuffer.append("\\\\");
                        z = false;
                        continue;
                    default:
                        stringBuffer.append(charAt);
                        z = false;
                        continue;
                }
            }
            z2 = z;
        }
        stringBuffer.append(c);
        return stringBuffer.toString();
    }

    private void writeExternalArgs(Commandline commandline) {
        BufferedWriter bufferedWriter;
        Throwable th;
        File file = null;
        BufferedWriter bufferedWriter2 = null;
        try {
            try {
                File createTempFile = FILE_UTILS.createTempFile("javadocOptions", "", null, true, true);
                String[] arguments = commandline.getArguments();
                commandline.clearArgs();
                commandline.createArgument().setValue(new StringBuffer().append("@").append(createTempFile.getAbsolutePath()).toString());
                file = createTempFile;
                BufferedWriter bufferedWriter3 = new BufferedWriter(new FileWriter(createTempFile.getAbsolutePath(), true));
                for (String str : arguments) {
                    try {
                        if (str.startsWith("-J-")) {
                            commandline.createArgument().setValue(str);
                        } else if (str.startsWith("-")) {
                            bufferedWriter3.write(str);
                            bufferedWriter3.write(" ");
                        } else {
                            bufferedWriter3.write(quoteString(str));
                            bufferedWriter3.newLine();
                        }
                    } catch (IOException e) {
                        bufferedWriter = bufferedWriter3;
                        file = createTempFile;
                        e = e;
                        if (file != null) {
                            file.delete();
                        }
                        BufferedWriter bufferedWriter4 = bufferedWriter;
                        BufferedWriter bufferedWriter5 = bufferedWriter;
                        BufferedWriter bufferedWriter6 = bufferedWriter;
                        throw new BuildException("Error creating or writing temporary file for javadoc options", e, getLocation());
                    } catch (Throwable th2) {
                        th = th2;
                        bufferedWriter2 = bufferedWriter3;
                        FileUtils.close(bufferedWriter2);
                        throw th;
                    }
                }
                bufferedWriter3.close();
                FileUtils.close(bufferedWriter3);
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedWriter = null;
        }
    }

    public void addBottom(Html html) {
        this.bottom = html;
    }

    public void addDoctitle(Html html) {
        this.doctitle = html;
    }

    public void addExcludePackage(PackageName packageName) {
        this.excludePackageNames.addElement(packageName);
    }

    public void addFileset(FileSet fileSet) {
        createSourceFiles().add(fileSet);
    }

    public void addFooter(Html html) {
        this.footer = html;
    }

    public void addHeader(Html html) {
        this.header = html;
    }

    public void addPackage(PackageName packageName) {
        this.packageNames.addElement(packageName);
    }

    public void addPackageset(DirSet dirSet) {
        this.packageSets.addElement(dirSet);
    }

    public void addSource(SourceFile sourceFile) {
        this.sourceFiles.addElement(sourceFile);
    }

    public void addTaglet(ExtensionInfo extensionInfo) {
        this.tags.addElement(extensionInfo);
    }

    public Commandline.Argument createArg() {
        return this.cmd.createArgument();
    }

    public Path createBootclasspath() {
        if (this.bootclasspath == null) {
            this.bootclasspath = new Path(getProject());
        }
        return this.bootclasspath.createPath();
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public DocletInfo createDoclet() {
        if (this.doclet == null) {
            this.doclet = new DocletInfo(this);
        }
        return this.doclet;
    }

    public GroupArgument createGroup() {
        GroupArgument groupArgument = new GroupArgument(this);
        this.groups.addElement(groupArgument);
        return groupArgument;
    }

    public LinkArgument createLink() {
        LinkArgument linkArgument = new LinkArgument(this);
        this.links.addElement(linkArgument);
        return linkArgument;
    }

    public ResourceCollectionContainer createSourceFiles() {
        return this.nestedSourceFiles;
    }

    public Path createSourcepath() {
        if (this.sourcePath == null) {
            this.sourcePath = new Path(getProject());
        }
        return this.sourcePath.createPath();
    }

    public TagArgument createTag() {
        TagArgument tagArgument = new TagArgument(this);
        this.tags.addElement(tagArgument);
        return tagArgument;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, CONST]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Incorrect finally slice size: {[MOVE] complete}, expected: {[MOVE, MOVE_EXCEPTION, INVOKE, INVOKE, MOVE_EXCEPTION, INVOKE, INVOKE, MOVE, INVOKE, MOVE_EXCEPTION, INVOKE, INVOKE, MOVE_EXCEPTION, INVOKE, INVOKE, IF] complete} */
    /* JADX WARN: Finally extract failed */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file;
        IOException e;
        File file2;
        BufferedWriter bufferedWriter;
        checkTaskName();
        Vector vector = new Vector();
        Path path = new Path(getProject());
        checkPackageAndSourcePath();
        if (this.sourcePath != null) {
            path.addExisting(this.sourcePath);
        }
        parsePackages(vector, path);
        checkPackages(vector, path);
        Vector vector2 = (Vector) this.sourceFiles.clone();
        addSourceFiles(vector2);
        checkPackagesToDoc(vector, vector2);
        log("Generating Javadoc", 2);
        Commandline commandline = (Commandline) this.cmd.clone();
        if (this.executable != null) {
            commandline.setExecutable(this.executable);
        } else {
            commandline.setExecutable(JavaEnvUtils.getJdkExecutable("javadoc"));
        }
        generalJavadocArguments(commandline);
        doSourcePath(commandline, path);
        doDoclet(commandline);
        doBootPath(commandline);
        doLinks(commandline);
        doGroup(commandline);
        doGroups(commandline);
        doDocFilesSubDirs(commandline);
        doJava14(commandline);
        if (this.breakiterator && (this.doclet == null || JAVADOC_5)) {
            commandline.createArgument().setValue("-breakiterator");
        }
        if (this.useExternalFile) {
            writeExternalArgs(commandline);
        }
        BufferedWriter bufferedWriter2 = null;
        BufferedWriter bufferedWriter3 = null;
        try {
            if (this.useExternalFile) {
                file2 = FILE_UTILS.createTempFile("javadoc", "", null, true, true);
                BufferedWriter bufferedWriter4 = null;
                file = file2;
                bufferedWriter2 = null;
                try {
                    try {
                        commandline.createArgument().setValue(new StringBuffer().append("@").append(file2.getAbsolutePath()).toString());
                        bufferedWriter = new BufferedWriter(new FileWriter(file2.getAbsolutePath(), true));
                    } catch (IOException e2) {
                        e = e2;
                        file.delete();
                        BufferedWriter bufferedWriter5 = bufferedWriter2;
                        BufferedWriter bufferedWriter6 = bufferedWriter2;
                        bufferedWriter4 = bufferedWriter2;
                        throw new BuildException("Error creating temporary file", e, getLocation());
                    }
                } catch (Throwable th) {
                    bufferedWriter3 = bufferedWriter4;
                    th = th;
                    FileUtils.close(bufferedWriter3);
                    throw th;
                }
            } else {
                file2 = null;
                bufferedWriter = null;
            }
            file = file2;
            bufferedWriter2 = bufferedWriter;
            doSourceAndPackageNames(commandline, vector, vector2, this.useExternalFile, file2, bufferedWriter);
            FileUtils.close(bufferedWriter);
            if (this.packageList != null) {
                commandline.createArgument().setValue(new StringBuffer().append("@").append(this.packageList).toString());
            }
            log(commandline.describeCommand(), 3);
            log("Javadoc execution", 2);
            JavadocOutputStream javadocOutputStream = new JavadocOutputStream(this, 2);
            JavadocOutputStream javadocOutputStream2 = new JavadocOutputStream(this, 1);
            Execute execute = new Execute(new PumpStreamHandler(javadocOutputStream, javadocOutputStream2));
            execute.setAntRun(getProject());
            execute.setWorkingDirectory(null);
            try {
                try {
                    execute.setCommandline(commandline.getCommandline());
                    int execute2 = execute.execute();
                    if (execute2 != 0 && this.failOnError) {
                        throw new BuildException(new StringBuffer().append("Javadoc returned ").append(execute2).toString(), getLocation());
                    }
                    if (file2 != null) {
                        file2.delete();
                    }
                    javadocOutputStream.logFlush();
                    javadocOutputStream2.logFlush();
                    try {
                        javadocOutputStream.close();
                        javadocOutputStream2.close();
                    } catch (IOException e3) {
                    }
                } catch (IOException e4) {
                    throw new BuildException(new StringBuffer().append("Javadoc failed: ").append(e4).toString(), e4, getLocation());
                }
            } catch (Throwable th2) {
                if (file2 != null) {
                    file2.delete();
                }
                javadocOutputStream.logFlush();
                javadocOutputStream2.logFlush();
                try {
                    javadocOutputStream.close();
                    javadocOutputStream2.close();
                } catch (IOException e5) {
                }
                throw th2;
            }
        } catch (IOException e6) {
            e = e6;
            file = null;
        } catch (Throwable th3) {
            th = th3;
            FileUtils.close(bufferedWriter3);
            throw th;
        }
    }

    protected String expand(String str) {
        return getProject().replaceProperties(str);
    }

    public void setAccess(AccessType accessType) {
        this.cmd.createArgument().setValue(new StringBuffer().append("-").append(accessType.getValue()).toString());
    }

    public void setAdditionalparam(String str) {
        this.cmd.createArgument().setLine(str);
    }

    public void setAuthor(boolean z) {
        this.author = z;
    }

    public void setBootClasspathRef(Reference reference) {
        createBootclasspath().setRefid(reference);
    }

    public void setBootclasspath(Path path) {
        if (this.bootclasspath == null) {
            this.bootclasspath = path;
        } else {
            this.bootclasspath.append(path);
        }
    }

    public void setBottom(String str) {
        Html html = new Html();
        html.addText(str);
        addBottom(html);
    }

    public void setBreakiterator(boolean z) {
        this.breakiterator = z;
    }

    public void setCharset(String str) {
        addArgIfNotEmpty("-charset", str);
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setDefaultexcludes(boolean z) {
        this.useDefaultExcludes = z;
    }

    public void setDestdir(File file) {
        this.destDir = file;
        this.cmd.createArgument().setValue("-d");
        this.cmd.createArgument().setFile(this.destDir);
    }

    public void setDocFilesSubDirs(boolean z) {
        this.docFilesSubDirs = z;
    }

    public void setDocencoding(String str) {
        this.cmd.createArgument().setValue("-docencoding");
        this.cmd.createArgument().setValue(str);
    }

    public void setDoclet(String str) {
        if (this.doclet == null) {
            this.doclet = new DocletInfo(this);
            this.doclet.setProject(getProject());
        }
        this.doclet.setName(str);
    }

    public void setDocletPath(Path path) {
        if (this.doclet == null) {
            this.doclet = new DocletInfo(this);
            this.doclet.setProject(getProject());
        }
        this.doclet.setPath(path);
    }

    public void setDocletPathRef(Reference reference) {
        if (this.doclet == null) {
            this.doclet = new DocletInfo(this);
            this.doclet.setProject(getProject());
        }
        this.doclet.createPath().setRefid(reference);
    }

    public void setDoctitle(String str) {
        Html html = new Html();
        html.addText(str);
        addDoctitle(html);
    }

    public void setEncoding(String str) {
        this.cmd.createArgument().setValue("-encoding");
        this.cmd.createArgument().setValue(str);
    }

    public void setExcludeDocFilesSubDir(String str) {
        this.excludeDocFilesSubDir = str;
    }

    public void setExcludePackageNames(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            PackageName packageName = new PackageName();
            packageName.setName(nextToken);
            addExcludePackage(packageName);
        }
    }

    public void setExecutable(String str) {
        this.executable = str;
    }

    public void setExtdirs(String str) {
        this.cmd.createArgument().setValue("-extdirs");
        this.cmd.createArgument().setValue(str);
    }

    public void setExtdirs(Path path) {
        this.cmd.createArgument().setValue("-extdirs");
        this.cmd.createArgument().setPath(path);
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public void setFooter(String str) {
        Html html = new Html();
        html.addText(str);
        addFooter(html);
    }

    public void setGroup(String str) {
        this.group = str;
    }

    public void setHeader(String str) {
        Html html = new Html();
        html.addText(str);
        addHeader(html);
    }

    public void setHelpfile(File file) {
        this.cmd.createArgument().setValue("-helpfile");
        this.cmd.createArgument().setFile(file);
    }

    public void setIncludeNoSourcePackages(boolean z) {
        this.includeNoSourcePackages = z;
    }

    public void setLink(String str) {
        createLink().setHref(str);
    }

    public void setLinkoffline(String str) {
        LinkArgument createLink = createLink();
        createLink.setOffline(true);
        if (str.trim().length() == 0) {
            throw new BuildException("The linkoffline attribute must include a URL and a package-list file location separated by a space");
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, " ", false);
        createLink.setHref(stringTokenizer.nextToken());
        if (!stringTokenizer.hasMoreTokens()) {
            throw new BuildException("The linkoffline attribute must include a URL and a package-list file location separated by a space");
        }
        createLink.setPackagelistLoc(getProject().resolveFile(stringTokenizer.nextToken()));
    }

    public void setLinksource(boolean z) {
        this.linksource = z;
    }

    public void setLocale(String str) {
        this.cmd.createArgument(true).setValue(str);
        this.cmd.createArgument(true).setValue("-locale");
    }

    public void setMaxmemory(String str) {
        this.cmd.createArgument().setValue(new StringBuffer().append("-J-Xmx").append(str).toString());
    }

    public void setNodeprecated(boolean z) {
        addArgIf(z, "-nodeprecated");
    }

    public void setNodeprecatedlist(boolean z) {
        addArgIf(z, "-nodeprecatedlist");
    }

    public void setNohelp(boolean z) {
        addArgIf(z, "-nohelp");
    }

    public void setNoindex(boolean z) {
        addArgIf(z, "-noindex");
    }

    public void setNonavbar(boolean z) {
        addArgIf(z, "-nonavbar");
    }

    public void setNoqualifier(String str) {
        this.noqualifier = str;
    }

    public void setNotree(boolean z) {
        addArgIf(z, "-notree");
    }

    public void setOld(boolean z) {
        log("Javadoc 1.4 doesn't support the -1.1 switch anymore", 1);
    }

    public void setOverview(File file) {
        this.cmd.createArgument().setValue("-overview");
        this.cmd.createArgument().setFile(file);
    }

    public void setPackage(boolean z) {
        addArgIf(z, "-package");
    }

    public void setPackageList(String str) {
        this.packageList = str;
    }

    public void setPackagenames(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            PackageName packageName = new PackageName();
            packageName.setName(nextToken);
            addPackage(packageName);
        }
    }

    public void setPrivate(boolean z) {
        addArgIf(z, "-private");
    }

    public void setProtected(boolean z) {
        addArgIf(z, "-protected");
    }

    public void setPublic(boolean z) {
        addArgIf(z, "-public");
    }

    public void setSerialwarn(boolean z) {
        addArgIf(z, "-serialwarn");
    }

    public void setSource(String str) {
        this.source = str;
    }

    public void setSourcefiles(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            SourceFile sourceFile = new SourceFile();
            sourceFile.setFile(getProject().resolveFile(nextToken.trim()));
            addSource(sourceFile);
        }
    }

    public void setSourcepath(Path path) {
        if (this.sourcePath == null) {
            this.sourcePath = path;
        } else {
            this.sourcePath.append(path);
        }
    }

    public void setSourcepathRef(Reference reference) {
        createSourcepath().setRefid(reference);
    }

    public void setSplitindex(boolean z) {
        addArgIf(z, "-splitindex");
    }

    public void setStylesheetfile(File file) {
        this.cmd.createArgument().setValue("-stylesheetfile");
        this.cmd.createArgument().setFile(file);
    }

    public void setUse(boolean z) {
        addArgIf(z, "-use");
    }

    public void setUseExternalFile(boolean z) {
        this.useExternalFile = z;
    }

    public void setVerbose(boolean z) {
        addArgIf(z, SOSCmd.FLAG_VERBOSE);
    }

    public void setVersion(boolean z) {
        this.version = z;
    }

    public void setWindowtitle(String str) {
        addArgIfNotEmpty("-windowtitle", str);
    }
}
