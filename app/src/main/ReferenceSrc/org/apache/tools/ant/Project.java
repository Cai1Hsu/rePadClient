package org.apache.tools.ant;

import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;
import java.util.Stack;
import java.util.Vector;
import java.util.WeakHashMap;
import org.apache.tools.ant.input.DefaultInputHandler;
import org.apache.tools.ant.input.InputHandler;
import org.apache.tools.ant.launch.Locator;
import org.apache.tools.ant.types.Description;
import org.apache.tools.ant.types.FilterSet;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceFactory;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/Project.class */
public class Project implements ResourceFactory {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String JAVA_1_0 = "1.0";
    public static final String JAVA_1_1 = "1.1";
    public static final String JAVA_1_2 = "1.2";
    public static final String JAVA_1_3 = "1.3";
    public static final String JAVA_1_4 = "1.4";
    public static final int MSG_DEBUG = 4;
    public static final int MSG_ERR = 0;
    public static final int MSG_INFO = 2;
    public static final int MSG_VERBOSE = 3;
    public static final int MSG_WARN = 1;
    public static final String TOKEN_END = "@";
    public static final String TOKEN_START = "@";
    private static final String VISITED = "VISITED";
    private static final String VISITING = "VISITING";
    static Class class$org$apache$tools$ant$Project;
    static Class class$org$apache$tools$ant$Task;
    static Class class$org$apache$tools$ant$helper$DefaultExecutor;
    private File baseDir;
    private String defaultTarget;
    private String description;
    private InputHandler inputHandler;
    private String name;
    private Hashtable references = new AntRefTable();
    private HashMap idReferences = new HashMap();
    private Project parentIdProject = null;
    private Hashtable targets = new Hashtable();
    private FilterSet globalFilterSet = new FilterSet();
    private FilterSetCollection globalFilters = new FilterSetCollection(this.globalFilterSet);
    private final Object listenersLock = new Object();
    private volatile BuildListener[] listeners = new BuildListener[0];
    private final ThreadLocal isLoggingMessage = new ThreadLocal(this) { // from class: org.apache.tools.ant.Project.1
        private final Project this$0;

        {
            this.this$0 = this;
        }

        @Override // java.lang.ThreadLocal
        protected Object initialValue() {
            return Boolean.FALSE;
        }
    };
    private ClassLoader coreLoader = null;
    private final Map threadTasks = Collections.synchronizedMap(new WeakHashMap());
    private final Map threadGroupTasks = Collections.synchronizedMap(new WeakHashMap());
    private InputStream defaultInputStream = null;
    private boolean keepGoingMode = false;

    /* loaded from: classes.jar:org/apache/tools/ant/Project$AntRefTable.class */
    private static class AntRefTable extends Hashtable {
        AntRefTable() {
        }

        public Object getReal(Object obj) {
            return super.get(obj);
        }

        @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
        public Object get(Object obj) {
            Object real = getReal(obj);
            Object obj2 = real;
            if (real instanceof UnknownElement) {
                UnknownElement unknownElement = (UnknownElement) real;
                unknownElement.maybeConfigure();
                obj2 = unknownElement.getRealThing();
            }
            return obj2;
        }
    }

    public Project() {
        this.globalFilterSet.setProject(this);
        this.inputHandler = null;
        this.inputHandler = new DefaultInputHandler();
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void fireMessageLoggedEvent(BuildEvent buildEvent, String str, int i) {
        String str2 = str;
        if (str == null) {
            str2 = String.valueOf(str);
        }
        if (str2.endsWith(StringUtils.LINE_SEP)) {
            buildEvent.setMessage(str2.substring(0, str2.length() - StringUtils.LINE_SEP.length()), i);
        } else {
            buildEvent.setMessage(str2, i);
        }
        if (this.isLoggingMessage.get() != Boolean.FALSE) {
            return;
        }
        try {
            this.isLoggingMessage.set(Boolean.TRUE);
            for (BuildListener buildListener : this.listeners) {
                buildListener.messageLogged(buildEvent);
            }
        } finally {
            this.isLoggingMessage.set(Boolean.FALSE);
        }
    }

    public static String getJavaVersion() {
        return JavaEnvUtils.getJavaVersion();
    }

    public static Project getProject(Object obj) {
        Project project;
        Class<?> cls;
        if (obj instanceof ProjectComponent) {
            project = ((ProjectComponent) obj).getProject();
        } else {
            try {
                Method method = obj.getClass().getMethod("getProject", null);
                if (class$org$apache$tools$ant$Project == null) {
                    cls = class$("org.apache.tools.ant.Project");
                    class$org$apache$tools$ant$Project = cls;
                } else {
                    cls = class$org$apache$tools$ant$Project;
                }
                if (cls == method.getReturnType()) {
                    project = (Project) method.invoke(obj, null);
                }
            } catch (Exception e) {
            }
            project = null;
        }
        return project;
    }

    private static BuildException makeCircularException(String str, Stack stack) {
        String str2;
        StringBuffer stringBuffer = new StringBuffer("Circular dependency: ");
        stringBuffer.append(str);
        do {
            str2 = (String) stack.pop();
            stringBuffer.append(" <- ");
            stringBuffer.append(str2);
        } while (!str2.equals(str));
        return new BuildException(new String(stringBuffer));
    }

    private void setAntLib() {
        Class cls;
        if (class$org$apache$tools$ant$Project == null) {
            cls = class$("org.apache.tools.ant.Project");
            class$org$apache$tools$ant$Project = cls;
        } else {
            cls = class$org$apache$tools$ant$Project;
        }
        File classSource = Locator.getClassSource(cls);
        if (classSource != null) {
            setPropertyInternal(MagicNames.ANT_LIB, classSource.getAbsolutePath());
        }
    }

    private void setPropertyInternal(String str, String str2) {
        PropertyHelper.getPropertyHelper(this).setProperty(str, (Object) str2, false);
    }

    public static boolean toBoolean(String str) {
        return "on".equalsIgnoreCase(str) || "true".equalsIgnoreCase(str) || "yes".equalsIgnoreCase(str);
    }

    public static String translatePath(String str) {
        return FileUtils.translatePath(str);
    }

    private void tsort(String str, Hashtable hashtable, Hashtable hashtable2, Stack stack, Vector vector) throws BuildException {
        hashtable2.put(str, VISITING);
        stack.push(str);
        Target target = (Target) hashtable.get(str);
        if (target == null) {
            StringBuffer stringBuffer = new StringBuffer("Target \"");
            stringBuffer.append(str);
            stringBuffer.append("\" does not exist in the project \"");
            stringBuffer.append(this.name);
            stringBuffer.append("\". ");
            stack.pop();
            if (!stack.empty()) {
                stringBuffer.append("It is used from target \"");
                stringBuffer.append((String) stack.peek());
                stringBuffer.append("\".");
            }
            throw new BuildException(new String(stringBuffer));
        }
        Enumeration dependencies = target.getDependencies();
        while (dependencies.hasMoreElements()) {
            String str2 = (String) dependencies.nextElement();
            String str3 = (String) hashtable2.get(str2);
            if (str3 == null) {
                tsort(str2, hashtable, hashtable2, stack, vector);
            } else if (str3 == VISITING) {
                throw makeCircularException(str2, stack);
            }
        }
        String str4 = (String) stack.pop();
        if (str != str4) {
            throw new RuntimeException(new StringBuffer().append("Unexpected internal error: expected to pop ").append(str).append(" but got ").append(str4).toString());
        }
        hashtable2.put(str, VISITED);
        vector.addElement(target);
    }

    public void addBuildListener(BuildListener buildListener) {
        synchronized (this.listenersLock) {
            for (int i = 0; i < this.listeners.length; i++) {
                if (this.listeners[i] == buildListener) {
                    return;
                }
            }
            BuildListener[] buildListenerArr = new BuildListener[this.listeners.length + 1];
            System.arraycopy(this.listeners, 0, buildListenerArr, 0, this.listeners.length);
            buildListenerArr[this.listeners.length] = buildListener;
            this.listeners = buildListenerArr;
        }
    }

    public void addDataTypeDefinition(String str, Class cls) {
        ComponentHelper.getComponentHelper(this).addDataTypeDefinition(str, cls);
    }

    public void addFilter(String str, String str2) {
        if (str == null) {
            return;
        }
        this.globalFilterSet.addFilter(new FilterSet.Filter(str, str2));
    }

    public void addIdReference(String str, Object obj) {
        this.idReferences.put(str, obj);
    }

    public void addOrReplaceTarget(String str, Target target) {
        log(new StringBuffer().append(" +Target: ").append(str).toString(), 4);
        target.setProject(this);
        this.targets.put(str, target);
    }

    public void addOrReplaceTarget(Target target) {
        addOrReplaceTarget(target.getName(), target);
    }

    public void addReference(String str, Object obj) {
        Object real = ((AntRefTable) this.references).getReal(str);
        if (real == obj) {
            return;
        }
        if (real != null && !(real instanceof UnknownElement)) {
            log(new StringBuffer().append("Overriding previous definition of reference to ").append(str).toString(), 3);
        }
        log(new StringBuffer().append("Adding reference: ").append(str).toString(), 4);
        this.references.put(str, obj);
    }

    public void addTarget(String str, Target target) throws BuildException {
        if (this.targets.get(str) != null) {
            throw new BuildException(new StringBuffer().append("Duplicate target: `").append(str).append("'").toString());
        }
        addOrReplaceTarget(str, target);
    }

    public void addTarget(Target target) throws BuildException {
        addTarget(target.getName(), target);
    }

    public void addTaskDefinition(String str, Class cls) throws BuildException {
        ComponentHelper.getComponentHelper(this).addTaskDefinition(str, cls);
    }

    public void checkTaskClass(Class cls) throws BuildException {
        Class cls2;
        ComponentHelper.getComponentHelper(this).checkTaskClass(cls);
        if (!Modifier.isPublic(cls.getModifiers())) {
            String stringBuffer = new StringBuffer().append(cls).append(" is not public").toString();
            log(stringBuffer, 0);
            throw new BuildException(stringBuffer);
        } else if (Modifier.isAbstract(cls.getModifiers())) {
            String stringBuffer2 = new StringBuffer().append(cls).append(" is abstract").toString();
            log(stringBuffer2, 0);
            throw new BuildException(stringBuffer2);
        } else {
            try {
                cls.getConstructor(null);
                if (class$org$apache$tools$ant$Task == null) {
                    cls2 = class$("org.apache.tools.ant.Task");
                    class$org$apache$tools$ant$Task = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$Task;
                }
                if (cls2.isAssignableFrom(cls)) {
                    return;
                }
                TaskAdapter.checkTaskClass(cls, this);
            } catch (LinkageError e) {
                String stringBuffer3 = new StringBuffer().append("Could not load ").append(cls).append(": ").append(e).toString();
                log(stringBuffer3, 0);
                throw new BuildException(stringBuffer3, e);
            } catch (NoSuchMethodException e2) {
                String stringBuffer4 = new StringBuffer().append("No public no-arg constructor in ").append(cls).toString();
                log(stringBuffer4, 0);
                throw new BuildException(stringBuffer4);
            }
        }
    }

    public void copyFile(File file, File file2) throws IOException {
        FILE_UTILS.copyFile(file, file2);
    }

    public void copyFile(File file, File file2, boolean z) throws IOException {
        FILE_UTILS.copyFile(file, file2, z ? this.globalFilters : null);
    }

    public void copyFile(File file, File file2, boolean z, boolean z2) throws IOException {
        FILE_UTILS.copyFile(file, file2, z ? this.globalFilters : null, z2);
    }

    public void copyFile(File file, File file2, boolean z, boolean z2, boolean z3) throws IOException {
        FILE_UTILS.copyFile(file, file2, z ? this.globalFilters : null, z2, z3);
    }

    public void copyFile(String str, String str2) throws IOException {
        FILE_UTILS.copyFile(str, str2);
    }

    public void copyFile(String str, String str2, boolean z) throws IOException {
        FILE_UTILS.copyFile(str, str2, z ? this.globalFilters : null);
    }

    public void copyFile(String str, String str2, boolean z, boolean z2) throws IOException {
        FILE_UTILS.copyFile(str, str2, z ? this.globalFilters : null, z2);
    }

    public void copyFile(String str, String str2, boolean z, boolean z2, boolean z3) throws IOException {
        FILE_UTILS.copyFile(str, str2, z ? this.globalFilters : null, z2, z3);
    }

    public void copyInheritedProperties(Project project) {
        PropertyHelper.getPropertyHelper(this).copyInheritedProperties(project);
    }

    public void copyUserProperties(Project project) {
        PropertyHelper.getPropertyHelper(this).copyUserProperties(project);
    }

    public AntClassLoader createClassLoader(ClassLoader classLoader, Path path) {
        return AntClassLoader.newAntClassLoader(classLoader, this, path, true);
    }

    public AntClassLoader createClassLoader(Path path) {
        return AntClassLoader.newAntClassLoader(getClass().getClassLoader(), this, path, true);
    }

    public Object createDataType(String str) throws BuildException {
        return ComponentHelper.getComponentHelper(this).createDataType(str);
    }

    public Project createSubProject() {
        Project project;
        try {
            project = (Project) getClass().newInstance();
        } catch (Exception e) {
            project = new Project();
        }
        initSubProject(project);
        return project;
    }

    public Task createTask(String str) throws BuildException {
        return ComponentHelper.getComponentHelper(this).createTask(str);
    }

    public int defaultInput(byte[] bArr, int i, int i2) throws IOException {
        if (this.defaultInputStream != null) {
            System.out.flush();
            return this.defaultInputStream.read(bArr, i, i2);
        }
        throw new EOFException("No input provided for project");
    }

    public void demuxFlush(String str, boolean z) {
        Task threadTask = getThreadTask(Thread.currentThread());
        if (threadTask == null) {
            fireMessageLogged(this, str, z ? 0 : 2);
        } else if (z) {
            threadTask.handleErrorFlush(str);
        } else {
            threadTask.handleFlush(str);
        }
    }

    public int demuxInput(byte[] bArr, int i, int i2) throws IOException {
        Task threadTask = getThreadTask(Thread.currentThread());
        return threadTask == null ? defaultInput(bArr, i, i2) : threadTask.handleInput(bArr, i, i2);
    }

    public void demuxOutput(String str, boolean z) {
        Task threadTask = getThreadTask(Thread.currentThread());
        if (threadTask == null) {
            log(str, z ? 1 : 2);
        } else if (z) {
            threadTask.handleErrorOutput(str);
        } else {
            threadTask.handleOutput(str);
        }
    }

    public void executeSortedTargets(Vector vector) throws BuildException {
        boolean z;
        HashSet hashSet = new HashSet();
        Enumeration elements = vector.elements();
        BuildException buildException = null;
        while (elements.hasMoreElements()) {
            Target target = (Target) elements.nextElement();
            Enumeration dependencies = target.getDependencies();
            while (true) {
                z = true;
                if (!dependencies.hasMoreElements()) {
                    break;
                }
                String str = (String) dependencies.nextElement();
                if (!hashSet.contains(str)) {
                    z = false;
                    log(target, new StringBuffer().append("Cannot execute '").append(target.getName()).append("' - '").append(str).append("' failed or was not executed.").toString(), 0);
                    break;
                }
            }
            if (z) {
                Throwable e = null;
                try {
                    target.performTasks();
                    hashSet.add(target.getName());
                } catch (RuntimeException e2) {
                    e = e2;
                    if (!this.keepGoingMode) {
                        throw e;
                    }
                } catch (Throwable th) {
                    e = th;
                    if (!this.keepGoingMode) {
                        throw new BuildException(e);
                    }
                }
                if (e != null) {
                    if (e instanceof BuildException) {
                        log(target, new StringBuffer().append("Target '").append(target.getName()).append("' failed with message '").append(e.getMessage()).append("'.").toString(), 0);
                        if (buildException == null) {
                            buildException = (BuildException) e;
                        }
                    } else {
                        log(target, new StringBuffer().append("Target '").append(target.getName()).append("' failed with message '").append(e.getMessage()).append("'.").toString(), 0);
                        e.printStackTrace(System.err);
                        if (buildException == null) {
                            buildException = new BuildException(e);
                        }
                    }
                }
            }
        }
        if (buildException != null) {
            throw buildException;
        }
    }

    public void executeTarget(String str) throws BuildException {
        if (str == null) {
            throw new BuildException("No target specified");
        }
        executeSortedTargets(topoSort(str, this.targets, false));
    }

    public void executeTargets(Vector vector) throws BuildException {
        setUserProperty(MagicNames.PROJECT_INVOKED_TARGETS, CollectionUtils.flattenToString(vector));
        getExecutor().executeTargets(this, (String[]) vector.toArray(new String[vector.size()]));
    }

    public void fireBuildFinished(Throwable th) {
        BuildEvent buildEvent = new BuildEvent(this);
        buildEvent.setException(th);
        for (BuildListener buildListener : this.listeners) {
            buildListener.buildFinished(buildEvent);
        }
        IntrospectionHelper.clearCache();
    }

    public void fireBuildStarted() {
        BuildEvent buildEvent = new BuildEvent(this);
        for (BuildListener buildListener : this.listeners) {
            buildListener.buildStarted(buildEvent);
        }
    }

    protected void fireMessageLogged(Project project, String str, int i) {
        fireMessageLogged(project, str, (Throwable) null, i);
    }

    protected void fireMessageLogged(Project project, String str, Throwable th, int i) {
        BuildEvent buildEvent = new BuildEvent(project);
        buildEvent.setException(th);
        fireMessageLoggedEvent(buildEvent, str, i);
    }

    protected void fireMessageLogged(Target target, String str, int i) {
        fireMessageLogged(target, str, (Throwable) null, i);
    }

    protected void fireMessageLogged(Target target, String str, Throwable th, int i) {
        BuildEvent buildEvent = new BuildEvent(target);
        buildEvent.setException(th);
        fireMessageLoggedEvent(buildEvent, str, i);
    }

    protected void fireMessageLogged(Task task, String str, int i) {
        fireMessageLogged(task, str, (Throwable) null, i);
    }

    protected void fireMessageLogged(Task task, String str, Throwable th, int i) {
        BuildEvent buildEvent = new BuildEvent(task);
        buildEvent.setException(th);
        fireMessageLoggedEvent(buildEvent, str, i);
    }

    public void fireSubBuildFinished(Throwable th) {
        BuildEvent buildEvent = new BuildEvent(this);
        buildEvent.setException(th);
        BuildListener[] buildListenerArr = this.listeners;
        for (int i = 0; i < buildListenerArr.length; i++) {
            if (buildListenerArr[i] instanceof SubBuildListener) {
                ((SubBuildListener) buildListenerArr[i]).subBuildFinished(buildEvent);
            }
        }
    }

    public void fireSubBuildStarted() {
        BuildEvent buildEvent = new BuildEvent(this);
        BuildListener[] buildListenerArr = this.listeners;
        for (int i = 0; i < buildListenerArr.length; i++) {
            if (buildListenerArr[i] instanceof SubBuildListener) {
                ((SubBuildListener) buildListenerArr[i]).subBuildStarted(buildEvent);
            }
        }
    }

    protected void fireTargetFinished(Target target, Throwable th) {
        BuildEvent buildEvent = new BuildEvent(target);
        buildEvent.setException(th);
        for (BuildListener buildListener : this.listeners) {
            buildListener.targetFinished(buildEvent);
        }
    }

    protected void fireTargetStarted(Target target) {
        BuildEvent buildEvent = new BuildEvent(target);
        for (BuildListener buildListener : this.listeners) {
            buildListener.targetStarted(buildEvent);
        }
    }

    protected void fireTaskFinished(Task task, Throwable th) {
        registerThreadTask(Thread.currentThread(), null);
        System.out.flush();
        System.err.flush();
        BuildEvent buildEvent = new BuildEvent(task);
        buildEvent.setException(th);
        for (BuildListener buildListener : this.listeners) {
            buildListener.taskFinished(buildEvent);
        }
    }

    protected void fireTaskStarted(Task task) {
        registerThreadTask(Thread.currentThread(), task);
        BuildEvent buildEvent = new BuildEvent(task);
        for (BuildListener buildListener : this.listeners) {
            buildListener.taskStarted(buildEvent);
        }
    }

    public File getBaseDir() {
        if (this.baseDir == null) {
            try {
                setBasedir(".");
            } catch (BuildException e) {
                e.printStackTrace();
            }
        }
        return this.baseDir;
    }

    public Vector getBuildListeners() {
        Vector vector;
        synchronized (this.listenersLock) {
            vector = new Vector(this.listeners.length);
            for (int i = 0; i < this.listeners.length; i++) {
                vector.add(this.listeners[i]);
            }
        }
        return vector;
    }

    public Map getCopyOfDataTypeDefinitions() {
        return new HashMap(getDataTypeDefinitions());
    }

    public Map getCopyOfReferences() {
        return new HashMap(this.references);
    }

    public Map getCopyOfTargets() {
        return new HashMap(this.targets);
    }

    public Map getCopyOfTaskDefinitions() {
        return new HashMap(getTaskDefinitions());
    }

    public ClassLoader getCoreLoader() {
        return this.coreLoader;
    }

    public Hashtable getDataTypeDefinitions() {
        return ComponentHelper.getComponentHelper(this).getDataTypeDefinitions();
    }

    public InputStream getDefaultInputStream() {
        return this.defaultInputStream;
    }

    public String getDefaultTarget() {
        return this.defaultTarget;
    }

    public String getDescription() {
        if (this.description == null) {
            this.description = Description.getDescription(this);
        }
        return this.description;
    }

    public String getElementName(Object obj) {
        return ComponentHelper.getComponentHelper(this).getElementName(obj);
    }

    public Executor getExecutor() {
        Class cls;
        Object reference = getReference(MagicNames.ANT_EXECUTOR_REFERENCE);
        Object obj = reference;
        if (reference == null) {
            String property = getProperty(MagicNames.ANT_EXECUTOR_CLASSNAME);
            String str = property;
            if (property == null) {
                if (class$org$apache$tools$ant$helper$DefaultExecutor == null) {
                    cls = class$("org.apache.tools.ant.helper.DefaultExecutor");
                    class$org$apache$tools$ant$helper$DefaultExecutor = cls;
                } else {
                    cls = class$org$apache$tools$ant$helper$DefaultExecutor;
                }
                str = cls.getName();
            }
            log(new StringBuffer().append("Attempting to create object of type ").append(str).toString(), 4);
            try {
                reference = Class.forName(str, true, this.coreLoader).newInstance();
            } catch (ClassNotFoundException e) {
                try {
                    reference = Class.forName(str).newInstance();
                } catch (Exception e2) {
                    log(e2.toString(), 0);
                }
            } catch (Exception e3) {
                log(e3.toString(), 0);
            }
            if (reference == null) {
                throw new BuildException("Unable to obtain a Target Executor instance.");
            }
            setExecutor((Executor) reference);
            obj = reference;
        }
        return (Executor) obj;
    }

    public Hashtable getFilters() {
        return this.globalFilterSet.getFilterHash();
    }

    public FilterSet getGlobalFilterSet() {
        return this.globalFilterSet;
    }

    public Hashtable getInheritedProperties() {
        return PropertyHelper.getPropertyHelper(this).getInheritedProperties();
    }

    public InputHandler getInputHandler() {
        return this.inputHandler;
    }

    public String getName() {
        return this.name;
    }

    public Hashtable getProperties() {
        return PropertyHelper.getPropertyHelper(this).getProperties();
    }

    public String getProperty(String str) {
        Object property = PropertyHelper.getPropertyHelper(this).getProperty(str);
        return property == null ? null : String.valueOf(property);
    }

    public Object getReference(String str) {
        Object obj = this.references.get(str);
        if (obj == null && !str.equals(MagicNames.REFID_PROPERTY_HELPER)) {
            try {
                if (PropertyHelper.getPropertyHelper(this).containsProperties(str)) {
                    log(new StringBuffer().append("Unresolvable reference ").append(str).append(" might be a misuse of property expansion syntax.").toString(), 1);
                }
            } catch (Exception e) {
            }
        }
        return obj;
    }

    public Hashtable getReferences() {
        return this.references;
    }

    @Override // org.apache.tools.ant.types.ResourceFactory
    public Resource getResource(String str) {
        return new FileResource(getBaseDir(), str);
    }

    public Hashtable getTargets() {
        return this.targets;
    }

    public Hashtable getTaskDefinitions() {
        return ComponentHelper.getComponentHelper(this).getTaskDefinitions();
    }

    public Task getThreadTask(Thread thread) {
        Task task;
        synchronized (this.threadTasks) {
            Task task2 = (Task) this.threadTasks.get(thread);
            task = task2;
            if (task2 == null) {
                ThreadGroup threadGroup = thread.getThreadGroup();
                Task task3 = task2;
                ThreadGroup threadGroup2 = threadGroup;
                while (true) {
                    task = task3;
                    if (task3 != null) {
                        break;
                    }
                    task = task3;
                    if (threadGroup2 == null) {
                        break;
                    }
                    task3 = (Task) this.threadGroupTasks.get(threadGroup2);
                    threadGroup2 = threadGroup2.getParent();
                }
            }
        }
        return task;
    }

    public Hashtable getUserProperties() {
        return PropertyHelper.getPropertyHelper(this).getUserProperties();
    }

    public String getUserProperty(String str) {
        return (String) PropertyHelper.getPropertyHelper(this).getUserProperty(str);
    }

    public boolean hasReference(String str) {
        return this.references.containsKey(str);
    }

    public void inheritIDReferences(Project project) {
        this.parentIdProject = project;
    }

    public void init() throws BuildException {
        initProperties();
        ComponentHelper.getComponentHelper(this).initDefaultDefinitions();
    }

    public void initProperties() throws BuildException {
        setJavaVersionProperty();
        setSystemProperties();
        setPropertyInternal(MagicNames.ANT_VERSION, Main.getAntVersion());
        setAntLib();
    }

    public void initSubProject(Project project) {
        ComponentHelper.getComponentHelper(project).initSubProject(ComponentHelper.getComponentHelper(this));
        project.setDefaultInputStream(getDefaultInputStream());
        project.setKeepGoingMode(isKeepGoingMode());
        project.setExecutor(getExecutor().getSubProjectExecutor());
    }

    public boolean isKeepGoingMode() {
        return this.keepGoingMode;
    }

    public void log(String str) {
        log(str, 2);
    }

    public void log(String str, int i) {
        log(str, (Throwable) null, i);
    }

    public void log(String str, Throwable th, int i) {
        fireMessageLogged(this, str, th, i);
    }

    public void log(Target target, String str, int i) {
        log(target, str, (Throwable) null, i);
    }

    public void log(Target target, String str, Throwable th, int i) {
        fireMessageLogged(target, str, th, i);
    }

    public void log(Task task, String str, int i) {
        fireMessageLogged(task, str, (Throwable) null, i);
    }

    public void log(Task task, String str, Throwable th, int i) {
        fireMessageLogged(task, str, th, i);
    }

    public void registerThreadTask(Thread thread, Task task) {
        synchronized (this.threadTasks) {
            if (task != null) {
                this.threadTasks.put(thread, task);
                this.threadGroupTasks.put(thread.getThreadGroup(), task);
            } else {
                this.threadTasks.remove(thread);
                this.threadGroupTasks.remove(thread.getThreadGroup());
            }
        }
    }

    public void removeBuildListener(BuildListener buildListener) {
        synchronized (this.listenersLock) {
            int i = 0;
            while (true) {
                if (i >= this.listeners.length) {
                    break;
                } else if (this.listeners[i] == buildListener) {
                    BuildListener[] buildListenerArr = new BuildListener[this.listeners.length - 1];
                    System.arraycopy(this.listeners, 0, buildListenerArr, 0, i);
                    System.arraycopy(this.listeners, i + 1, buildListenerArr, i, (this.listeners.length - i) - 1);
                    this.listeners = buildListenerArr;
                    break;
                } else {
                    i++;
                }
            }
        }
    }

    public String replaceProperties(String str) throws BuildException {
        return PropertyHelper.getPropertyHelper(this).replaceProperties(null, str, null);
    }

    public File resolveFile(String str) {
        return FILE_UTILS.resolveFile(this.baseDir, str);
    }

    public File resolveFile(String str, File file) {
        return FILE_UTILS.resolveFile(file, str);
    }

    public void setBaseDir(File file) throws BuildException {
        File normalize = FILE_UTILS.normalize(file.getAbsolutePath());
        if (!normalize.exists()) {
            throw new BuildException(new StringBuffer().append("Basedir ").append(normalize.getAbsolutePath()).append(" does not exist").toString());
        }
        if (!normalize.isDirectory()) {
            throw new BuildException(new StringBuffer().append("Basedir ").append(normalize.getAbsolutePath()).append(" is not a directory").toString());
        }
        this.baseDir = normalize;
        setPropertyInternal(MagicNames.PROJECT_BASEDIR, this.baseDir.getPath());
        log(new StringBuffer().append("Project base dir set to: ").append(this.baseDir).toString(), 3);
    }

    public void setBasedir(String str) throws BuildException {
        setBaseDir(new File(str));
    }

    public void setCoreLoader(ClassLoader classLoader) {
        this.coreLoader = classLoader;
    }

    public void setDefault(String str) {
        if (str != null) {
            setUserProperty(MagicNames.PROJECT_DEFAULT_TARGET, str);
        }
        this.defaultTarget = str;
    }

    public void setDefaultInputStream(InputStream inputStream) {
        this.defaultInputStream = inputStream;
    }

    public void setDefaultTarget(String str) {
        setDefault(str);
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setExecutor(Executor executor) {
        addReference(MagicNames.ANT_EXECUTOR_REFERENCE, executor);
    }

    public void setFileLastModified(File file, long j) throws BuildException {
        FILE_UTILS.setFileLastModified(file, j);
        log(new StringBuffer().append("Setting modification time for ").append(file).toString(), 3);
    }

    public void setInheritedProperty(String str, String str2) {
        PropertyHelper.getPropertyHelper(this).setInheritedProperty(str, str2);
    }

    public void setInputHandler(InputHandler inputHandler) {
        this.inputHandler = inputHandler;
    }

    public void setJavaVersionProperty() throws BuildException {
        String javaVersion = JavaEnvUtils.getJavaVersion();
        setPropertyInternal(MagicNames.ANT_JAVA_VERSION, javaVersion);
        if (!JavaEnvUtils.isAtLeastJavaVersion("1.4")) {
            throw new BuildException("Ant cannot work on Java prior to 1.4");
        }
        log(new StringBuffer().append("Detected Java version: ").append(javaVersion).append(" in: ").append(System.getProperty("java.home")).toString(), 3);
        log(new StringBuffer().append("Detected OS: ").append(System.getProperty("os.name")).toString(), 3);
    }

    public void setKeepGoingMode(boolean z) {
        this.keepGoingMode = z;
    }

    public void setName(String str) {
        setUserProperty(MagicNames.PROJECT_NAME, str);
        this.name = str;
    }

    public void setNewProperty(String str, String str2) {
        PropertyHelper.getPropertyHelper(this).setNewProperty(str, str2);
    }

    public final void setProjectReference(Object obj) {
        Class<?> cls;
        if (obj instanceof ProjectComponent) {
            ((ProjectComponent) obj).setProject(this);
            return;
        }
        try {
            Class<?> cls2 = obj.getClass();
            if (class$org$apache$tools$ant$Project == null) {
                cls = class$("org.apache.tools.ant.Project");
                class$org$apache$tools$ant$Project = cls;
            } else {
                cls = class$org$apache$tools$ant$Project;
            }
            Method method = cls2.getMethod("setProject", cls);
            if (method == null) {
                return;
            }
            method.invoke(obj, this);
        } catch (Throwable th) {
        }
    }

    public void setProperty(String str, String str2) {
        PropertyHelper.getPropertyHelper(this).setProperty(str, (Object) str2, true);
    }

    public void setSystemProperties() {
        Properties properties = System.getProperties();
        Enumeration<?> propertyNames = properties.propertyNames();
        while (propertyNames.hasMoreElements()) {
            String str = (String) propertyNames.nextElement();
            String property = properties.getProperty(str);
            if (property != null) {
                setPropertyInternal(str, property);
            }
        }
    }

    public void setUserProperty(String str, String str2) {
        PropertyHelper.getPropertyHelper(this).setUserProperty(str, str2);
    }

    public final Vector topoSort(String str, Hashtable hashtable) throws BuildException {
        return topoSort(new String[]{str}, hashtable, true);
    }

    public final Vector topoSort(String str, Hashtable hashtable, boolean z) throws BuildException {
        return topoSort(new String[]{str}, hashtable, z);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.util.Vector] */
    /* JADX WARN: Type inference failed for: r7v0, types: [org.apache.tools.ant.Project] */
    public final Vector topoSort(String[] strArr, Hashtable hashtable, boolean z) throws BuildException {
        VectorSet vectorSet = new VectorSet();
        Hashtable hashtable2 = new Hashtable();
        Stack stack = new Stack();
        for (int i = 0; i < strArr.length; i++) {
            String str = (String) hashtable2.get(strArr[i]);
            if (str == null) {
                tsort(strArr[i], hashtable, hashtable2, stack, vectorSet);
            } else if (str == VISITING) {
                throw new RuntimeException(new StringBuffer().append("Unexpected node in visiting state: ").append(strArr[i]).toString());
            }
        }
        StringBuffer stringBuffer = new StringBuffer("Build sequence for target(s)");
        int i2 = 0;
        while (i2 < strArr.length) {
            stringBuffer.append(i2 == 0 ? " `" : ", `").append(strArr[i2]).append('\'');
            i2++;
        }
        stringBuffer.append(new StringBuffer().append(" is ").append(vectorSet).toString());
        log(stringBuffer.toString(), 3);
        VectorSet vector = z ? vectorSet : new Vector(vectorSet);
        Enumeration keys = hashtable.keys();
        while (keys.hasMoreElements()) {
            String str2 = (String) keys.nextElement();
            String str3 = (String) hashtable2.get(str2);
            if (str3 == null) {
                tsort(str2, hashtable, hashtable2, stack, vector);
            } else if (str3 == VISITING) {
                throw new RuntimeException(new StringBuffer().append("Unexpected node in visiting state: ").append(str2).toString());
            }
        }
        log(new StringBuffer().append("Complete build sequence is ").append(vector).toString(), 3);
        return vectorSet;
    }
}
