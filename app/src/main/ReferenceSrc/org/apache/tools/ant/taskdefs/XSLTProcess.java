package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.DynamicConfigurator;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.taskdefs.optional.TraXLiaison;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.XMLCatalog;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.ResourceUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess.class */
public class XSLTProcess extends MatchingTask implements XSLTLogger {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String PROCESSOR_TRAX = "trax";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private XSLTLiaison liaison;
    private String processor;
    private TraceConfiguration traceConfiguration;
    private File destDir = null;
    private File baseDir = null;
    private String xslFile = null;
    private Resource xslResource = null;
    private String targetExtension = ".html";
    private String fileNameParameter = null;
    private String fileDirParameter = null;
    private Vector params = new Vector();
    private File inFile = null;
    private File outFile = null;
    private Path classpath = null;
    private boolean stylesheetLoaded = false;
    private boolean force = false;
    private Vector outputProperties = new Vector();
    private XMLCatalog xmlCatalog = new XMLCatalog();
    private boolean performDirectoryScan = true;
    private Factory factory = null;
    private boolean reuseLoadedStylesheet = true;
    private AntClassLoader loader = null;
    private Mapper mapperElement = null;
    private Union resources = new Union();
    private boolean useImplicitFileset = true;
    private boolean suppressWarnings = false;
    private boolean failOnTransformationError = true;
    private boolean failOnError = true;
    private boolean failOnNoResources = true;
    private CommandlineJava.SysProperties sysProperties = new CommandlineJava.SysProperties();

    /* renamed from: org.apache.tools.ant.taskdefs.XSLTProcess$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$Factory.class */
    public static class Factory {
        private Vector attributes = new Vector();
        private String name;

        /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute.class */
        public static class Attribute implements DynamicConfigurator {
            private String name;
            private Object value;

            @Override // org.apache.tools.ant.DynamicElement
            public Object createDynamicElement(String str) throws BuildException {
                return null;
            }

            public String getName() {
                return this.name;
            }

            public Object getValue() {
                return this.value;
            }

            @Override // org.apache.tools.ant.DynamicAttribute
            public void setDynamicAttribute(String str, String str2) throws BuildException {
                if ("name".equalsIgnoreCase(str)) {
                    this.name = str2;
                } else if (!SizeSelector.SIZE_KEY.equalsIgnoreCase(str)) {
                    throw new BuildException(new StringBuffer().append("Unsupported attribute: ").append(str).toString());
                } else {
                    if ("true".equalsIgnoreCase(str2)) {
                        this.value = Boolean.TRUE;
                    } else if ("false".equalsIgnoreCase(str2)) {
                        this.value = Boolean.FALSE;
                    } else {
                        try {
                            this.value = new Integer(str2);
                        } catch (NumberFormatException e) {
                            this.value = str2;
                        }
                    }
                }
            }
        }

        public void addAttribute(Attribute attribute) {
            this.attributes.addElement(attribute);
        }

        public Enumeration getAttributes() {
            return this.attributes.elements();
        }

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty.class */
    public static class OutputProperty {
        private String name;
        private String value;

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

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$Param.class */
    public static class Param {
        private Object ifCond;
        private Project project;
        private Object unlessCond;
        private String name = null;
        private String expression = null;

        public String getExpression() throws BuildException {
            if (this.expression == null) {
                throw new BuildException("Expression attribute is missing.");
            }
            return this.expression;
        }

        public String getName() throws BuildException {
            if (this.name == null) {
                throw new BuildException("Name attribute is missing.");
            }
            return this.name;
        }

        public void setExpression(String str) {
            this.expression = str;
        }

        public void setIf(Object obj) {
            this.ifCond = obj;
        }

        public void setIf(String str) {
            setIf((Object) str);
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setProject(Project project) {
            this.project = project;
        }

        public void setUnless(Object obj) {
            this.unlessCond = obj;
        }

        public void setUnless(String str) {
            setUnless((Object) str);
        }

        public boolean shouldUse() {
            PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(this.project);
            return propertyHelper.testIfCondition(this.ifCond) && propertyHelper.testUnlessCondition(this.unlessCond);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper.class */
    private class StyleMapper implements FileNameMapper {
        private final XSLTProcess this$0;

        private StyleMapper(XSLTProcess xSLTProcess) {
            this.this$0 = xSLTProcess;
        }

        StyleMapper(XSLTProcess xSLTProcess, AnonymousClass1 anonymousClass1) {
            this(xSLTProcess);
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public String[] mapFileName(String str) {
            int lastIndexOf = str.lastIndexOf(46);
            String str2 = str;
            if (lastIndexOf > 0) {
                str2 = str.substring(0, lastIndexOf);
            }
            return new String[]{new StringBuffer().append(str2).append(this.this$0.targetExtension).toString()};
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setFrom(String str) {
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setTo(String str) {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration.class */
    public final class TraceConfiguration {
        private boolean elements;
        private boolean extension;
        private boolean generation;
        private boolean selection;
        private boolean templates;
        private final XSLTProcess this$0;

        public TraceConfiguration(XSLTProcess xSLTProcess) {
            this.this$0 = xSLTProcess;
        }

        public boolean getElements() {
            return this.elements;
        }

        public boolean getExtension() {
            return this.extension;
        }

        public boolean getGeneration() {
            return this.generation;
        }

        public OutputStream getOutputStream() {
            return new LogOutputStream(this.this$0);
        }

        public boolean getSelection() {
            return this.selection;
        }

        public boolean getTemplates() {
            return this.templates;
        }

        public void setElements(boolean z) {
            this.elements = z;
        }

        public void setExtension(boolean z) {
            this.extension = z;
        }

        public void setGeneration(boolean z) {
            this.generation = z;
        }

        public void setSelection(boolean z) {
            this.selection = z;
        }

        public void setTemplates(boolean z) {
            this.templates = z;
        }
    }

    private void checkDest() {
        if (this.destDir == null) {
            handleError("destdir attributes must be set!");
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void ensureDirectoryFor(File file) throws BuildException {
        File parentFile = file.getParentFile();
        if (parentFile.exists() || parentFile.mkdirs()) {
            return;
        }
        handleError(new StringBuffer().append("Unable to create directory: ").append(parentFile.getAbsolutePath()).toString());
    }

    private Class loadClass(String str) throws Exception {
        setupLoader();
        return this.loader == null ? Class.forName(str) : Class.forName(str, true, this.loader);
    }

    private void process(File file, File file2, Resource resource) throws BuildException {
        try {
            long lastModified = resource.getLastModified();
            log(new StringBuffer().append("In file ").append(file).append(" time: ").append(file.lastModified()).toString(), 4);
            log(new StringBuffer().append("Out file ").append(file2).append(" time: ").append(file2.lastModified()).toString(), 4);
            log(new StringBuffer().append("Style file ").append(this.xslFile).append(" time: ").append(lastModified).toString(), 4);
            if (this.force || file.lastModified() >= file2.lastModified() || lastModified >= file2.lastModified()) {
                ensureDirectoryFor(file2);
                log(new StringBuffer().append("Processing ").append(file).append(" to ").append(file2).toString(), 2);
                configureLiaison(resource);
                setLiaisonDynamicFileParameters(this.liaison, file);
                this.liaison.transform(file, file2);
            } else {
                log(new StringBuffer().append("Skipping input file ").append(file).append(" because it is older than output file ").append(file2).append(" and so is the stylesheet ").append(resource).toString(), 4);
            }
        } catch (Exception e) {
            log(new StringBuffer().append("Failed to process ").append(file).toString(), 2);
            if (file2 != null) {
                file2.delete();
            }
            handleTransformationError(e);
        }
    }

    private void process(File file, String str, File file2, Resource resource) throws BuildException {
        File file3;
        Exception e;
        try {
            long lastModified = resource.getLastModified();
            File file4 = new File(file, str);
            try {
                if (file4.isDirectory()) {
                    log(new StringBuffer().append("Skipping ").append(file4).append(" it is a directory.").toString(), 3);
                    return;
                }
                String[] mapFileName = (this.mapperElement != null ? this.mapperElement.getImplementation() : new StyleMapper(this, null)).mapFileName(str);
                if (mapFileName == null || mapFileName.length == 0) {
                    log(new StringBuffer().append("Skipping ").append(this.inFile).append(" it cannot get mapped to output.").toString(), 3);
                } else if (mapFileName == null || mapFileName.length > 1) {
                    log(new StringBuffer().append("Skipping ").append(this.inFile).append(" its mapping is ambiguos.").toString(), 3);
                } else {
                    file3 = new File(file2, mapFileName[0]);
                    try {
                        if (this.force || file4.lastModified() > file3.lastModified() || lastModified > file3.lastModified()) {
                            ensureDirectoryFor(file3);
                            log(new StringBuffer().append("Processing ").append(file4).append(" to ").append(file3).toString());
                            configureLiaison(resource);
                            setLiaisonDynamicFileParameters(this.liaison, file4);
                            this.liaison.transform(file4, file3);
                        }
                    } catch (Exception e2) {
                        e = e2;
                        log(new StringBuffer().append("Failed to process ").append(this.inFile).toString(), 2);
                        if (file3 != null) {
                            file3.delete();
                        }
                        handleTransformationError(e);
                    }
                }
            } catch (Exception e3) {
                e = e3;
                file3 = null;
            }
        } catch (Exception e4) {
            e = e4;
            file3 = null;
        }
    }

    private void processResources(Resource resource) {
        Class cls;
        Iterator it = this.resources.iterator();
        while (it.hasNext()) {
            Resource resource2 = (Resource) it.next();
            if (resource2.isExists()) {
                File file = this.baseDir;
                String name = resource2.getName();
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                FileProvider fileProvider = (FileProvider) resource2.as(cls);
                File file2 = file;
                String str = name;
                if (fileProvider != null) {
                    FileResource asFileResource = ResourceUtils.asFileResource(fileProvider);
                    File baseDir = asFileResource.getBaseDir();
                    file2 = baseDir;
                    str = name;
                    if (baseDir == null) {
                        str = asFileResource.getFile().getAbsolutePath();
                        file2 = baseDir;
                    }
                }
                process(file2, str, this.destDir, resource);
            }
        }
    }

    private void resolveProcessor(String str) throws Exception {
        if (str.equals(PROCESSOR_TRAX)) {
            this.liaison = new TraXLiaison();
        } else {
            this.liaison = (XSLTLiaison) loadClass(str).newInstance();
        }
    }

    private void setLiaisonDynamicFileParameters(XSLTLiaison xSLTLiaison, File file) throws Exception {
        if (this.fileNameParameter != null) {
            xSLTLiaison.addParam(this.fileNameParameter, file.getName());
        }
        if (this.fileDirParameter != null) {
            File file2 = new File(FileUtils.getRelativePath(this.baseDir, file));
            xSLTLiaison.addParam(this.fileDirParameter, file2.getParent() != null ? file2.getParent().replace('\\', '/') : ".");
        }
    }

    private void setupLoader() {
        if (this.classpath == null || this.loader != null) {
            return;
        }
        this.loader = getProject().createClassLoader(this.classpath);
        this.loader.setThreadContextLoader();
    }

    public void add(ResourceCollection resourceCollection) {
        this.resources.add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) throws BuildException {
        Mapper mapper = new Mapper(getProject());
        mapper.add(fileNameMapper);
        addMapper(mapper);
    }

    public void addConfiguredStyle(Resources resources) {
        if (resources.size() != 1) {
            handleError("The style element must be specified with exactly one nested resource.");
        } else {
            setXslResource((Resource) resources.iterator().next());
        }
    }

    public void addConfiguredXMLCatalog(XMLCatalog xMLCatalog) {
        this.xmlCatalog.addConfiguredXMLCatalog(xMLCatalog);
    }

    public void addMapper(Mapper mapper) {
        if (this.mapperElement != null) {
            handleError(Expand.ERROR_MULTIPLE_MAPPERS);
        } else {
            this.mapperElement = mapper;
        }
    }

    public void addSysproperty(Environment.Variable variable) {
        this.sysProperties.addVariable(variable);
    }

    public void addSyspropertyset(PropertySet propertySet) {
        this.sysProperties.addSyspropertyset(propertySet);
    }

    protected void configureLiaison(File file) throws BuildException {
        FileResource fileResource = new FileResource();
        fileResource.setProject(getProject());
        fileResource.setFile(file);
        configureLiaison(fileResource);
    }

    protected void configureLiaison(Resource resource) throws BuildException {
        Class cls;
        if (!this.stylesheetLoaded || !this.reuseLoadedStylesheet) {
            this.stylesheetLoaded = true;
            try {
                log(new StringBuffer().append("Loading stylesheet ").append(resource).toString(), 2);
                if (this.liaison instanceof XSLTLiaison2) {
                    ((XSLTLiaison2) this.liaison).configure(this);
                }
                if (this.liaison instanceof XSLTLiaison3) {
                    ((XSLTLiaison3) this.liaison).setStylesheet(resource);
                } else {
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    FileProvider fileProvider = (FileProvider) resource.as(cls);
                    if (fileProvider == null) {
                        handleError(new StringBuffer().append(this.liaison.getClass().toString()).append(" accepts the stylesheet only as a file").toString());
                        return;
                    }
                    this.liaison.setStylesheet(fileProvider.getFile());
                }
                Enumeration elements = this.params.elements();
                while (elements.hasMoreElements()) {
                    Param param = (Param) elements.nextElement();
                    if (param.shouldUse()) {
                        this.liaison.addParam(param.getName(), param.getExpression());
                    }
                }
            } catch (Exception e) {
                log(new StringBuffer().append("Failed to transform using stylesheet ").append(resource).toString(), 2);
                handleTransformationError(e);
            }
        }
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public Factory createFactory() throws BuildException {
        if (this.factory != null) {
            handleError("'factory' element must be unique");
        } else {
            this.factory = new Factory();
        }
        return this.factory;
    }

    public OutputProperty createOutputProperty() {
        OutputProperty outputProperty = new OutputProperty();
        this.outputProperties.addElement(outputProperty);
        return outputProperty;
    }

    public Param createParam() {
        Param param = new Param();
        this.params.addElement(param);
        return param;
    }

    public TraceConfiguration createTrace() {
        if (this.traceConfiguration != null) {
            throw new BuildException("can't have more than one trace configuration");
        }
        this.traceConfiguration = new TraceConfiguration(this);
        return this.traceConfiguration;
    }

    /* JADX DEBUG: Incorrect finally slice size: {[IGET, INVOKE] complete}, expected: {[IGET] complete} */
    /* JADX WARN: Finally extract failed */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        FileResource fileResource;
        if ("style".equals(getTaskType())) {
            log("Warning: the task name <style> is deprecated. Use <xslt> instead.", 1);
        }
        File file = this.baseDir;
        if (this.xslResource == null && this.xslFile == null) {
            handleError("specify the stylesheet either as a filename in style attribute or as a nested resource");
        } else if (this.xslResource != null && this.xslFile != null) {
            handleError(new StringBuffer().append("specify the stylesheet either as a filename in style attribute or as a nested resource").append(" but not as both").toString());
        } else if (this.inFile == null || this.inFile.exists()) {
            try {
                setupLoader();
                if (this.sysProperties.size() > 0) {
                    this.sysProperties.setSystem();
                }
                if (this.baseDir == null) {
                    this.baseDir = getProject().getBaseDir();
                }
                this.liaison = getLiaison();
                if (this.liaison instanceof XSLTLoggerAware) {
                    ((XSLTLoggerAware) this.liaison).setLogger(this);
                }
                log(new StringBuffer().append("Using ").append(this.liaison.getClass().toString()).toString(), 3);
                if (this.xslFile != null) {
                    File resolveFile = getProject().resolveFile(this.xslFile);
                    File file2 = resolveFile;
                    if (!resolveFile.exists()) {
                        File resolveFile2 = FILE_UTILS.resolveFile(this.baseDir, this.xslFile);
                        file2 = resolveFile;
                        if (resolveFile2.exists()) {
                            log("DEPRECATED - the 'style' attribute should be relative to the project's");
                            log("             basedir, not the tasks's basedir.");
                            file2 = resolveFile2;
                        }
                    }
                    FileResource fileResource2 = new FileResource();
                    fileResource2.setProject(getProject());
                    fileResource2.setFile(file2);
                    fileResource = fileResource2;
                } else {
                    fileResource = this.xslResource;
                }
                if (!fileResource.isExists()) {
                    handleError(new StringBuffer().append("stylesheet ").append(fileResource).append(" doesn't exist.").toString());
                    if (this.loader != null) {
                        this.loader.resetThreadContextLoader();
                        this.loader.cleanup();
                        this.loader = null;
                    }
                    if (this.sysProperties.size() > 0) {
                        this.sysProperties.restoreSystem();
                    }
                    this.liaison = null;
                    this.stylesheetLoaded = false;
                } else if (this.inFile == null || this.outFile == null) {
                    checkDest();
                    if (this.useImplicitFileset) {
                        DirectoryScanner directoryScanner = getDirectoryScanner(this.baseDir);
                        log(new StringBuffer().append("Transforming into ").append(this.destDir).toString(), 2);
                        for (String str : directoryScanner.getIncludedFiles()) {
                            process(this.baseDir, str, this.destDir, fileResource);
                        }
                        if (this.performDirectoryScan) {
                            String[] includedDirectories = directoryScanner.getIncludedDirectories();
                            for (int i = 0; i < includedDirectories.length; i++) {
                                for (String str2 : new File(this.baseDir, includedDirectories[i]).list()) {
                                    process(this.baseDir, new StringBuffer().append(includedDirectories[i]).append(File.separator).append(str2).toString(), this.destDir, fileResource);
                                }
                            }
                        }
                    } else if (this.resources.size() == 0) {
                        if (this.failOnNoResources) {
                            handleError("no resources specified");
                        }
                        if (this.loader != null) {
                            this.loader.resetThreadContextLoader();
                            this.loader.cleanup();
                            this.loader = null;
                        }
                        if (this.sysProperties.size() > 0) {
                            this.sysProperties.restoreSystem();
                        }
                        this.liaison = null;
                        this.stylesheetLoaded = false;
                    }
                    processResources(fileResource);
                    if (this.loader != null) {
                        this.loader.resetThreadContextLoader();
                        this.loader.cleanup();
                        this.loader = null;
                    }
                    if (this.sysProperties.size() > 0) {
                        this.sysProperties.restoreSystem();
                    }
                    this.liaison = null;
                    this.stylesheetLoaded = false;
                } else {
                    process(this.inFile, this.outFile, fileResource);
                    if (this.loader != null) {
                        this.loader.resetThreadContextLoader();
                        this.loader.cleanup();
                        this.loader = null;
                    }
                    if (this.sysProperties.size() > 0) {
                        this.sysProperties.restoreSystem();
                    }
                    this.liaison = null;
                    this.stylesheetLoaded = false;
                }
                this.baseDir = file;
            } catch (Throwable th) {
                if (this.loader != null) {
                    this.loader.resetThreadContextLoader();
                    this.loader.cleanup();
                    this.loader = null;
                }
                if (this.sysProperties.size() > 0) {
                    this.sysProperties.restoreSystem();
                }
                this.liaison = null;
                this.stylesheetLoaded = false;
                this.baseDir = file;
                throw th;
            }
        } else {
            handleError(new StringBuffer().append("input file ").append(this.inFile).append(" does not exist").toString());
        }
    }

    public Factory getFactory() {
        return this.factory;
    }

    protected XSLTLiaison getLiaison() {
        if (this.liaison == null) {
            if (this.processor != null) {
                try {
                    resolveProcessor(this.processor);
                } catch (Exception e) {
                    handleError(e);
                }
            } else {
                try {
                    resolveProcessor(PROCESSOR_TRAX);
                } catch (Throwable th) {
                    th.printStackTrace();
                    handleError(th);
                }
            }
        }
        return this.liaison;
    }

    public Enumeration getOutputProperties() {
        return this.outputProperties.elements();
    }

    public boolean getSuppressWarnings() {
        return this.suppressWarnings;
    }

    public TraceConfiguration getTraceConfiguration() {
        return this.traceConfiguration;
    }

    public XMLCatalog getXMLCatalog() {
        this.xmlCatalog.setProject(getProject());
        return this.xmlCatalog;
    }

    protected void handleError(String str) {
        if (this.failOnError) {
            throw new BuildException(str, getLocation());
        }
        log(str, 1);
    }

    protected void handleError(Throwable th) {
        if (this.failOnError) {
            throw new BuildException(th);
        }
        log(new StringBuffer().append("Caught an exception: ").append(th).toString(), 1);
    }

    protected void handleTransformationError(Exception exc) {
        if (!this.failOnError || !this.failOnTransformationError) {
            log(new StringBuffer().append("Caught an error during transformation: ").append(exc).toString(), 1);
            return;
        }
        throw new BuildException(exc);
    }

    @Override // org.apache.tools.ant.Task
    public void init() throws BuildException {
        super.init();
        this.xmlCatalog.setProject(getProject());
    }

    public void setBasedir(File file) {
        this.baseDir = file;
    }

    public void setClasspath(Path path) {
        createClasspath().append(path);
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setExtension(String str) {
        this.targetExtension = str;
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setFailOnNoResources(boolean z) {
        this.failOnNoResources = z;
    }

    public void setFailOnTransformationError(boolean z) {
        this.failOnTransformationError = z;
    }

    public void setFileDirParameter(String str) {
        this.fileDirParameter = str;
    }

    public void setFileNameParameter(String str) {
        this.fileNameParameter = str;
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setIn(File file) {
        this.inFile = file;
    }

    public void setOut(File file) {
        this.outFile = file;
    }

    public void setProcessor(String str) {
        this.processor = str;
    }

    public void setReloadStylesheet(boolean z) {
        this.reuseLoadedStylesheet = !z;
    }

    public void setScanIncludedDirectories(boolean z) {
        this.performDirectoryScan = z;
    }

    public void setStyle(String str) {
        this.xslFile = str;
    }

    public void setSuppressWarnings(boolean z) {
        this.suppressWarnings = z;
    }

    public void setUseImplicitFileset(boolean z) {
        this.useImplicitFileset = z;
    }

    public void setXslResource(Resource resource) {
        this.xslResource = resource;
    }
}
