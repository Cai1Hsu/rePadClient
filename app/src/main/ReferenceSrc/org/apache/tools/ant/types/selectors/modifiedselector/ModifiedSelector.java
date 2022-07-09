package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.File;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.BuildListener;
import org.apache.tools.ant.IntrospectionHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.types.selectors.BaseExtendSelector;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.ResourceUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector.class */
public class ModifiedSelector extends BaseExtendSelector implements BuildListener, ResourceSelector {
    private static final String ALGORITHM_PREFIX = "algorithm.";
    private static final String CACHE_PREFIX = "cache.";
    private static final String COMPARATOR_PREFIX = "comparator.";
    static Class class$java$util$Comparator;
    static Class class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm;
    static Class class$org$apache$tools$ant$types$selectors$modifiedselector$Cache;
    private String algorithmClass;
    private String cacheClass;
    private String comparatorClass;
    private CacheName cacheName = null;
    private AlgorithmName algoName = null;
    private ComparatorName compName = null;
    private boolean update = true;
    private boolean selectDirectories = true;
    private boolean selectResourcesWithoutInputStream = true;
    private boolean delayUpdate = true;
    private Comparator comparator = null;
    private Algorithm algorithm = null;
    private Cache cache = null;
    private int modified = 0;
    private boolean isConfigured = false;
    private Vector configParameter = new Vector();
    private Vector specialParameter = new Vector();
    private ClassLoader myClassLoader = null;
    private Path classpath = null;

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName.class */
    public static class AlgorithmName extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"hashvalue", "digest", "checksum"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName.class */
    public static class CacheName extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"propertyfile"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName.class */
    public static class ComparatorName extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"equal", "rule"};
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean isSelected(File file, String str, String str2) {
        boolean z;
        validate();
        File file2 = new File(file, str);
        if (file2.isDirectory()) {
            z = this.selectDirectories;
        } else {
            String valueOf = String.valueOf(this.cache.get(file2.getAbsolutePath()));
            String value = this.algorithm.getValue(file2);
            boolean z2 = this.comparator.compare(valueOf, value) != 0;
            z = z2;
            if (this.update) {
                z = z2;
                if (z2) {
                    this.cache.put(file2.getAbsolutePath(), value);
                    setModified(getModified() + 1);
                    z = z2;
                    if (!getDelayUpdate()) {
                        saveCache();
                        z = z2;
                    }
                }
            }
        }
        return z;
    }

    public void addClasspath(Path path) {
        if (this.classpath != null) {
            throw new BuildException("<classpath> can be set only once.");
        }
        this.classpath = path;
    }

    public void addParam(String str, Object obj) {
        Parameter parameter = new Parameter();
        parameter.setName(str);
        parameter.setValue(String.valueOf(obj));
        this.configParameter.add(parameter);
    }

    public void addParam(Parameter parameter) {
        this.configParameter.add(parameter);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        if (getDelayUpdate()) {
            saveCache();
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
    }

    public void configure() {
        File file;
        Class cls;
        Class cls2;
        Class cls3;
        if (this.isConfigured) {
            return;
        }
        this.isConfigured = true;
        Project project = getProject();
        if (project != null) {
            file = new File(project.getBaseDir(), "cache.properties");
            getProject().addBuildListener(this);
        } else {
            file = new File("cache.properties");
            setDelayUpdate(false);
        }
        PropertiesfileCache propertiesfileCache = new PropertiesfileCache(file);
        DigestAlgorithm digestAlgorithm = new DigestAlgorithm();
        EqualComparator equalComparator = new EqualComparator();
        Iterator it = this.configParameter.iterator();
        while (it.hasNext()) {
            Parameter parameter = (Parameter) it.next();
            if (parameter.getName().indexOf(".") > 0) {
                this.specialParameter.add(parameter);
            } else {
                useParameter(parameter);
            }
        }
        this.configParameter = new Vector();
        if (this.algoName != null) {
            if ("hashvalue".equals(this.algoName.getValue())) {
                this.algorithm = new HashvalueAlgorithm();
            } else if ("digest".equals(this.algoName.getValue())) {
                this.algorithm = new DigestAlgorithm();
            } else if ("checksum".equals(this.algoName.getValue())) {
                this.algorithm = new ChecksumAlgorithm();
            }
        } else if (this.algorithmClass != null) {
            String str = this.algorithmClass;
            if (class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm == null) {
                cls = class$("org.apache.tools.ant.types.selectors.modifiedselector.Algorithm");
                class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm = cls;
            } else {
                cls = class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm;
            }
            this.algorithm = (Algorithm) loadClass(str, "is not an Algorithm.", cls);
        } else {
            this.algorithm = digestAlgorithm;
        }
        if (this.cacheName != null) {
            if ("propertyfile".equals(this.cacheName.getValue())) {
                this.cache = new PropertiesfileCache();
            }
        } else if (this.cacheClass != null) {
            String str2 = this.cacheClass;
            if (class$org$apache$tools$ant$types$selectors$modifiedselector$Cache == null) {
                cls2 = class$("org.apache.tools.ant.types.selectors.modifiedselector.Cache");
                class$org$apache$tools$ant$types$selectors$modifiedselector$Cache = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$types$selectors$modifiedselector$Cache;
            }
            this.cache = (Cache) loadClass(str2, "is not a Cache.", cls2);
        } else {
            this.cache = propertiesfileCache;
        }
        if (this.compName != null) {
            if ("equal".equals(this.compName.getValue())) {
                this.comparator = new EqualComparator();
            } else if ("rule".equals(this.compName.getValue())) {
                throw new BuildException("RuleBasedCollator not yet supported.");
            }
        } else if (this.comparatorClass != null) {
            String str3 = this.comparatorClass;
            if (class$java$util$Comparator == null) {
                cls3 = class$("java.util.Comparator");
                class$java$util$Comparator = cls3;
            } else {
                cls3 = class$java$util$Comparator;
            }
            this.comparator = (Comparator) loadClass(str3, "is not a Comparator.", cls3);
        } else {
            this.comparator = equalComparator;
        }
        Iterator it2 = this.specialParameter.iterator();
        while (it2.hasNext()) {
            useParameter((Parameter) it2.next());
        }
        this.specialParameter = new Vector();
    }

    public Algorithm getAlgorithm() {
        return this.algorithm;
    }

    public Cache getCache() {
        return this.cache;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.lang.ClassLoader] */
    public ClassLoader getClassLoader() {
        if (this.myClassLoader == null) {
            this.myClassLoader = this.classpath == null ? getClass().getClassLoader() : getProject().createClassLoader(this.classpath);
        }
        return this.myClassLoader;
    }

    public Comparator getComparator() {
        return this.comparator;
    }

    public boolean getDelayUpdate() {
        return this.delayUpdate;
    }

    public int getModified() {
        return this.modified;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        return isSelected(file, str, file2.getAbsolutePath());
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z;
        if (resource.isFilesystemOnly()) {
            FileResource fileResource = (FileResource) resource;
            z = isSelected(fileResource.getBaseDir(), fileResource.getName(), fileResource.getFile());
        } else {
            try {
                File createTempFile = FileUtils.getFileUtils().createTempFile("modified-", ".tmp", null, true, false);
                ResourceUtils.copyResource(resource, new FileResource(createTempFile));
                z = isSelected(createTempFile.getParentFile(), createTempFile.getName(), resource.toLongString());
                createTempFile.delete();
            } catch (UnsupportedOperationException e) {
                log(new StringBuffer().append("The resource '").append(resource.getName()).append("' does not provide an InputStream, so it is not checked. ").append("Akkording to 'selres' attribute value it is ").append(this.selectResourcesWithoutInputStream ? "" : " not").append("selected.").toString(), 2);
                z = this.selectResourcesWithoutInputStream;
            } catch (Exception e2) {
                throw new BuildException(e2);
            }
        }
        return z;
    }

    protected Object loadClass(String str, String str2, Class cls) {
        try {
            ClassLoader classLoader = getClassLoader();
            Object newInstance = (classLoader != null ? classLoader.loadClass(str) : Class.forName(str)).newInstance();
            if (cls.isInstance(newInstance)) {
                return newInstance;
            }
            throw new BuildException(new StringBuffer().append("Specified class (").append(str).append(") ").append(str2).toString());
        } catch (ClassNotFoundException e) {
            throw new BuildException(new StringBuffer().append("Specified class (").append(str).append(") not found.").toString());
        } catch (Exception e2) {
            throw new BuildException(e2);
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
    }

    protected void saveCache() {
        if (getModified() > 0) {
            this.cache.save();
            setModified(0);
        }
    }

    public void setAlgorithm(AlgorithmName algorithmName) {
        this.algoName = algorithmName;
    }

    public void setAlgorithmClass(String str) {
        this.algorithmClass = str;
    }

    public void setCache(CacheName cacheName) {
        this.cacheName = cacheName;
    }

    public void setCacheClass(String str) {
        this.cacheClass = str;
    }

    public void setClassLoader(ClassLoader classLoader) {
        this.myClassLoader = classLoader;
    }

    public void setComparator(ComparatorName comparatorName) {
        this.compName = comparatorName;
    }

    public void setComparatorClass(String str) {
        this.comparatorClass = str;
    }

    public void setDelayUpdate(boolean z) {
        this.delayUpdate = z;
    }

    public void setModified(int i) {
        this.modified = i;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        if (parameterArr != null) {
            for (Parameter parameter : parameterArr) {
                this.configParameter.add(parameter);
            }
        }
    }

    public void setSeldirs(boolean z) {
        this.selectDirectories = z;
    }

    public void setSelres(boolean z) {
        this.selectResourcesWithoutInputStream = z;
    }

    public void setUpdate(boolean z) {
        this.update = z;
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
        if (getDelayUpdate()) {
            saveCache();
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
        if (getDelayUpdate()) {
            saveCache();
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{modifiedselector");
        stringBuffer.append(" update=").append(this.update);
        stringBuffer.append(" seldirs=").append(this.selectDirectories);
        stringBuffer.append(" cache=").append(this.cache);
        stringBuffer.append(" algorithm=").append(this.algorithm);
        stringBuffer.append(" comparator=").append(this.comparator);
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    protected void tryToSetAParameter(Object obj, String str, String str2) {
        Project project = getProject() != null ? getProject() : new Project();
        try {
            IntrospectionHelper.getHelper(project, obj.getClass()).setAttribute(project, obj, str, str2);
        } catch (BuildException e) {
        }
    }

    public void useParameter(Parameter parameter) {
        boolean z = true;
        String name = parameter.getName();
        String value = parameter.getValue();
        if ("cache".equals(name)) {
            CacheName cacheName = new CacheName();
            cacheName.setValue(value);
            setCache(cacheName);
        } else if ("algorithm".equals(name)) {
            AlgorithmName algorithmName = new AlgorithmName();
            algorithmName.setValue(value);
            setAlgorithm(algorithmName);
        } else if ("comparator".equals(name)) {
            ComparatorName comparatorName = new ComparatorName();
            comparatorName.setValue(value);
            setComparator(comparatorName);
        } else if ("update".equals(name)) {
            if (!"true".equalsIgnoreCase(value)) {
                z = false;
            }
            setUpdate(z);
        } else if ("delayupdate".equals(name)) {
            setDelayUpdate("true".equalsIgnoreCase(value));
        } else if ("seldirs".equals(name)) {
            setSeldirs("true".equalsIgnoreCase(value));
        } else if (name.startsWith(CACHE_PREFIX)) {
            tryToSetAParameter(this.cache, name.substring(CACHE_PREFIX.length()), value);
        } else if (name.startsWith(ALGORITHM_PREFIX)) {
            tryToSetAParameter(this.algorithm, name.substring(ALGORITHM_PREFIX.length()), value);
        } else if (name.startsWith(COMPARATOR_PREFIX)) {
            tryToSetAParameter(this.comparator, name.substring(COMPARATOR_PREFIX.length()), value);
        } else {
            setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
        }
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        configure();
        if (this.cache == null) {
            setError("Cache must be set.");
        } else if (this.algorithm == null) {
            setError("Algorithm must be set.");
        } else if (!this.cache.isValid()) {
            setError("Cache must be proper configured.");
        } else if (this.algorithm.isValid()) {
        } else {
            setError("Algorithm must be proper configured.");
        }
    }
}
