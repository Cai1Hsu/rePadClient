package org.apache.tools.ant;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Stack;
import org.apache.tools.ant.launch.Launcher;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Typedef;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/ComponentHelper.class */
public class ComponentHelper {
    private static final String ANT_PROPERTY_TASK = "property";
    private static final String BUILD_SYSCLASSPATH_ONLY = "only";
    public static final String COMPONENT_HELPER_REFERENCE = "ant.ComponentHelper";
    private static final String ERROR_NO_TASK_LIST_LOAD = "Can't load default task list";
    private static final String ERROR_NO_TYPE_LIST_LOAD = "Can't load default type list";
    static Class class$org$apache$tools$ant$ComponentHelper;
    static Class class$org$apache$tools$ant$Task;
    static Class class$org$apache$tools$ant$TaskAdapter;
    static Class class$org$apache$tools$ant$taskdefs$Property;
    private static Properties[] defaultDefinitions = new Properties[2];
    private AntTypeTable antTypeTable;
    private ComponentHelper next;
    private Project project;
    private Map restrictedDefinitions = new HashMap();
    private final Hashtable taskClassDefinitions = new Hashtable();
    private boolean rebuildTaskClassDefinitions = true;
    private final Hashtable typeClassDefinitions = new Hashtable();
    private boolean rebuildTypeClassDefinitions = true;
    private final HashSet checkedNamespaces = new HashSet();
    private Stack antLibStack = new Stack();
    private String antLibCurrentUri = null;

    /* loaded from: classes.jar:org/apache/tools/ant/ComponentHelper$AntTypeTable.class */
    private static class AntTypeTable extends Hashtable {
        private static final long serialVersionUID = -3060442320477772028L;
        private Project project;

        AntTypeTable(Project project) {
            this.project = project;
        }

        @Override // java.util.Hashtable
        public boolean contains(Object obj) {
            boolean z;
            synchronized (this) {
                z = false;
                boolean z2 = false;
                if (obj instanceof Class) {
                    Iterator it = values().iterator();
                    while (true) {
                        z = z2;
                        if (!it.hasNext()) {
                            break;
                        }
                        z = z2;
                        if (z2) {
                            break;
                        }
                        z2 = ((AntTypeDefinition) it.next()).getExposedClass(this.project) == obj;
                    }
                }
            }
            return z;
        }

        @Override // java.util.Hashtable, java.util.Map
        public boolean containsValue(Object obj) {
            return contains(obj);
        }

        public List findMatches(String str) {
            ArrayList arrayList;
            synchronized (this) {
                arrayList = new ArrayList();
                for (AntTypeDefinition antTypeDefinition : values()) {
                    if (antTypeDefinition.getName().startsWith(str)) {
                        arrayList.add(antTypeDefinition);
                    }
                }
            }
            return arrayList;
        }

        @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
        public Object get(Object obj) {
            return getTypeClass((String) obj);
        }

        AntTypeDefinition getDefinition(String str) {
            return (AntTypeDefinition) super.get(str);
        }

        Class getExposedClass(String str) {
            AntTypeDefinition definition = getDefinition(str);
            return definition == null ? null : definition.getExposedClass(this.project);
        }

        Class getTypeClass(String str) {
            AntTypeDefinition definition = getDefinition(str);
            return definition == null ? null : definition.getTypeClass(this.project);
        }
    }

    protected ComponentHelper() {
    }

    private void checkNamespace(String str) {
        synchronized (this) {
            String extractUriFromComponentName = ProjectHelper.extractUriFromComponentName(str);
            String str2 = extractUriFromComponentName;
            if ("".equals(extractUriFromComponentName)) {
                str2 = ProjectHelper.ANT_CORE_URI;
            }
            if (str2.startsWith("antlib:") && !this.checkedNamespaces.contains(str2)) {
                this.checkedNamespaces.add(str2);
                if (this.antTypeTable.size() == 0) {
                    initDefaultDefinitions();
                }
                Typedef typedef = new Typedef();
                typedef.setProject(this.project);
                typedef.init();
                typedef.setURI(str2);
                typedef.setTaskName(str2);
                typedef.setResource(Definer.makeResourceFromURI(str2));
                typedef.setOnError(new Definer.OnError(Definer.OnError.POLICY_IGNORE));
                typedef.execute();
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Task createNewTask(String str) throws BuildException {
        Class cls;
        Class<?> componentClass = getComponentClass(str);
        Task task = null;
        if (componentClass != null) {
            if (class$org$apache$tools$ant$Task == null) {
                cls = class$("org.apache.tools.ant.Task");
                class$org$apache$tools$ant$Task = cls;
            } else {
                cls = class$org$apache$tools$ant$Task;
            }
            if (!cls.isAssignableFrom(componentClass)) {
                task = null;
            } else {
                Object createComponent = createComponent(str);
                task = null;
                if (createComponent != null) {
                    if (!(createComponent instanceof Task)) {
                        throw new BuildException(new StringBuffer().append("Expected a Task from '").append(str).append("' but got an instance of ").append(createComponent.getClass().getName()).append(" instead").toString());
                    }
                    task = (Task) createComponent;
                    task.setTaskType(str);
                    task.setTaskName(str);
                    this.project.log(new StringBuffer().append("   +Task: ").append(str).toString(), 4);
                }
            }
        }
        return task;
    }

    private Set getCheckedNamespace() {
        Set set;
        synchronized (this) {
            set = (Set) this.checkedNamespaces.clone();
        }
        return set;
    }

    private ClassLoader getClassLoader(ClassLoader classLoader) {
        String property = this.project.getProperty(MagicNames.BUILD_SYSCLASSPATH);
        ClassLoader classLoader2 = classLoader;
        if (this.project.getCoreLoader() != null) {
            classLoader2 = classLoader;
            if (!BUILD_SYSCLASSPATH_ONLY.equals(property)) {
                classLoader2 = this.project.getCoreLoader();
            }
        }
        return classLoader2;
    }

    public static ComponentHelper getComponentHelper(Project project) {
        ComponentHelper componentHelper;
        if (project == null) {
            componentHelper = null;
        } else {
            ComponentHelper componentHelper2 = (ComponentHelper) project.getReference(COMPONENT_HELPER_REFERENCE);
            componentHelper = componentHelper2;
            if (componentHelper2 == null) {
                componentHelper = new ComponentHelper();
                componentHelper.setProject(project);
                project.addReference(COMPONENT_HELPER_REFERENCE, componentHelper);
            }
        }
        return componentHelper;
    }

    private static Properties getDefaultDefinitions(boolean z) throws BuildException {
        Properties properties;
        Class cls;
        synchronized (ComponentHelper.class) {
            char c = z ? (char) 1 : (char) 0;
            try {
                if (defaultDefinitions[c] == null) {
                    String str = z ? MagicNames.TYPEDEFS_PROPERTIES_RESOURCE : MagicNames.TASKDEF_PROPERTIES_RESOURCE;
                    String str2 = z ? ERROR_NO_TYPE_LIST_LOAD : ERROR_NO_TASK_LIST_LOAD;
                    try {
                        if (class$org$apache$tools$ant$ComponentHelper == null) {
                            cls = class$("org.apache.tools.ant.ComponentHelper");
                            class$org$apache$tools$ant$ComponentHelper = cls;
                        } else {
                            cls = class$org$apache$tools$ant$ComponentHelper;
                        }
                        InputStream resourceAsStream = cls.getResourceAsStream(str);
                        if (resourceAsStream == null) {
                            throw new BuildException(str2);
                        }
                        Properties properties2 = new Properties();
                        properties2.load(resourceAsStream);
                        defaultDefinitions[c] = properties2;
                        FileUtils.close(resourceAsStream);
                    } catch (IOException e) {
                        throw new BuildException(str2, e);
                    }
                }
                properties = defaultDefinitions[c];
            } catch (Throwable th) {
                throw th;
            }
        }
        return properties;
    }

    public static String getElementName(Project project, Object obj, boolean z) {
        Project project2 = project;
        if (project == null) {
            project2 = Project.getProject(obj);
        }
        return project2 == null ? getUnmappedElementName(obj.getClass(), z) : getComponentHelper(project2).getElementName(obj, z);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:? -> B:30:0x0072). Please submit an issue!!! */
    private Map getRestrictedDefinition() {
        ArrayList arrayList;
        HashMap hashMap = new HashMap();
        synchronized (this.restrictedDefinitions) {
            for (Map.Entry entry : this.restrictedDefinitions.entrySet()) {
                List list = (List) entry.getValue();
                synchronized (list) {
                    try {
                        arrayList = new ArrayList(list);
                        try {
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                }
                hashMap.put(entry.getKey(), arrayList);
            }
        }
        return hashMap;
    }

    private static String getUnmappedElementName(Class cls, boolean z) {
        String cls2;
        if (z) {
            String name = cls.getName();
            cls2 = name.substring(name.lastIndexOf(46) + 1);
        } else {
            cls2 = cls.toString();
        }
        return cls2;
    }

    private void initTasks() {
        Class cls;
        Class cls2;
        ClassLoader classLoader = getClassLoader(null);
        Properties defaultDefinitions2 = getDefaultDefinitions(false);
        Enumeration<?> propertyNames = defaultDefinitions2.propertyNames();
        while (propertyNames.hasMoreElements()) {
            String str = (String) propertyNames.nextElement();
            String property = defaultDefinitions2.getProperty(str);
            AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
            antTypeDefinition.setName(str);
            antTypeDefinition.setClassName(property);
            antTypeDefinition.setClassLoader(classLoader);
            if (class$org$apache$tools$ant$Task == null) {
                cls = class$("org.apache.tools.ant.Task");
                class$org$apache$tools$ant$Task = cls;
            } else {
                cls = class$org$apache$tools$ant$Task;
            }
            antTypeDefinition.setAdaptToClass(cls);
            if (class$org$apache$tools$ant$TaskAdapter == null) {
                cls2 = class$("org.apache.tools.ant.TaskAdapter");
                class$org$apache$tools$ant$TaskAdapter = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$TaskAdapter;
            }
            antTypeDefinition.setAdapterClass(cls2);
            this.antTypeTable.put(str, antTypeDefinition);
        }
    }

    private void initTypes() {
        ClassLoader classLoader = getClassLoader(null);
        Properties defaultDefinitions2 = getDefaultDefinitions(true);
        Enumeration<?> propertyNames = defaultDefinitions2.propertyNames();
        while (propertyNames.hasMoreElements()) {
            String str = (String) propertyNames.nextElement();
            String property = defaultDefinitions2.getProperty(str);
            AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
            antTypeDefinition.setName(str);
            antTypeDefinition.setClassName(property);
            antTypeDefinition.setClassLoader(classLoader);
            this.antTypeTable.put(str, antTypeDefinition);
        }
    }

    private void printClassNotFound(PrintWriter printWriter, String str, boolean z, String str2) {
        printWriter.println(new StringBuffer().append("Cause: the class ").append(str).append(" was not found.").toString());
        if (z) {
            printWriter.println("        This looks like one of Ant's optional components.");
            printWriter.println("Action: Check that the appropriate optional JAR exists in");
            printWriter.println(str2);
            return;
        }
        printWriter.println("Action: Check that the component has been correctly declared");
        printWriter.println("        and that the implementing JAR is in one of:");
        printWriter.println(str2);
    }

    private void printNotLoadDependentClass(PrintWriter printWriter, boolean z, NoClassDefFoundError noClassDefFoundError, String str) {
        printWriter.println(new StringBuffer().append("Cause: Could not load a dependent class ").append(noClassDefFoundError.getMessage()).toString());
        if (z) {
            printWriter.println("       It is not enough to have Ant's optional JARs");
            printWriter.println("       you need the JAR files that the optional tasks depend upon.");
            printWriter.println("       Ant's optional task dependencies are listed in the manual.");
        } else {
            printWriter.println("       This class may be in a separate JAR that is not installed.");
        }
        printWriter.println("Action: Determine what extra JAR files are needed, and place them in one of:");
        printWriter.println(str);
    }

    private void printUnknownDefinition(PrintWriter printWriter, String str, String str2) {
        boolean z = str.indexOf("antlib:") == 0;
        String extractUriFromComponentName = ProjectHelper.extractUriFromComponentName(str);
        printWriter.println("Cause: The name is undefined.");
        printWriter.println("Action: Check the spelling.");
        printWriter.println("Action: Check that any custom tasks/types have been declared.");
        printWriter.println("Action: Check that any <presetdef>/<macrodef> declarations have taken place.");
        if (extractUriFromComponentName.length() > 0) {
            List<AntTypeDefinition> findMatches = this.antTypeTable.findMatches(extractUriFromComponentName);
            if (findMatches.size() > 0) {
                printWriter.println();
                printWriter.println(new StringBuffer().append("The definitions in the namespace ").append(extractUriFromComponentName).append(" are:").toString());
                for (AntTypeDefinition antTypeDefinition : findMatches) {
                    printWriter.println(new StringBuffer().append("    ").append(ProjectHelper.extractNameFromComponentName(antTypeDefinition.getName())).toString());
                }
                return;
            }
            printWriter.println("No types or tasks have been defined in this namespace yet");
            if (!z) {
                return;
            }
            printWriter.println();
            printWriter.println("This appears to be an antlib declaration. ");
            printWriter.println("Action: Check that the implementing library exists in one of:");
            printWriter.println(str2);
        }
    }

    private boolean sameDefinition(AntTypeDefinition antTypeDefinition, AntTypeDefinition antTypeDefinition2) {
        boolean z;
        boolean validDefinition = validDefinition(antTypeDefinition);
        if (validDefinition == validDefinition(antTypeDefinition2)) {
            z = true;
            if (validDefinition) {
                if (antTypeDefinition.sameDefinition(antTypeDefinition2, this.project)) {
                    z = true;
                }
            }
            return z;
        }
        z = false;
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x010b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void updateDataTypeDefinition(AntTypeDefinition antTypeDefinition) {
        boolean z;
        Class cls;
        String name = antTypeDefinition.getName();
        synchronized (this.antTypeTable) {
            this.rebuildTaskClassDefinitions = true;
            this.rebuildTypeClassDefinitions = true;
            AntTypeDefinition definition = this.antTypeTable.getDefinition(name);
            if (definition != null) {
                if (sameDefinition(antTypeDefinition, definition)) {
                    return;
                }
                Class<?> exposedClass = this.antTypeTable.getExposedClass(name);
                if (exposedClass != null) {
                    if (class$org$apache$tools$ant$Task == null) {
                        cls = class$("org.apache.tools.ant.Task");
                        class$org$apache$tools$ant$Task = cls;
                    } else {
                        cls = class$org$apache$tools$ant$Task;
                    }
                    if (cls.isAssignableFrom(exposedClass)) {
                        z = true;
                        Project project = this.project;
                        String stringBuffer = new StringBuffer().append("Trying to override old definition of ").append(!z ? "task " : "datatype ").append(name).toString();
                        int i = 1;
                        if (antTypeDefinition.similarDefinition(definition, this.project)) {
                            i = 3;
                        }
                        project.log(stringBuffer, i);
                    }
                }
                z = false;
                Project project2 = this.project;
                String stringBuffer2 = new StringBuffer().append("Trying to override old definition of ").append(!z ? "task " : "datatype ").append(name).toString();
                int i2 = 1;
                if (antTypeDefinition.similarDefinition(definition, this.project)) {
                }
                project2.log(stringBuffer2, i2);
            }
            this.project.log(new StringBuffer().append(" +Datatype ").append(name).append(" ").append(antTypeDefinition.getClassName()).toString(), 4);
            this.antTypeTable.put(name, antTypeDefinition);
        }
    }

    private void updateRestrictedDefinition(AntTypeDefinition antTypeDefinition) {
        Throwable th;
        String name = antTypeDefinition.getName();
        synchronized (this.restrictedDefinitions) {
            try {
                List list = (List) this.restrictedDefinitions.get(name);
                List list2 = list;
                if (list == null) {
                    list2 = new ArrayList();
                    try {
                        this.restrictedDefinitions.put(name, list2);
                    } catch (Throwable th2) {
                        th = th2;
                        throw list2;
                    }
                }
                synchronized (list2) {
                    try {
                        Iterator it = list2.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                if (((AntTypeDefinition) it.next()).getClassName().equals(antTypeDefinition.getClassName())) {
                                    it.remove();
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                        list2.add(antTypeDefinition);
                    } finally {
                        List list3 = list2;
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    private boolean validDefinition(AntTypeDefinition antTypeDefinition) {
        return (antTypeDefinition.getTypeClass(this.project) == null || antTypeDefinition.getExposedClass(this.project) == null) ? false : true;
    }

    public void addDataTypeDefinition(String str, Class cls) {
        AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
        antTypeDefinition.setName(str);
        antTypeDefinition.setClass(cls);
        updateDataTypeDefinition(antTypeDefinition);
        this.project.log(new StringBuffer().append(" +User datatype: ").append(str).append("     ").append(cls.getName()).toString(), 4);
    }

    public void addDataTypeDefinition(AntTypeDefinition antTypeDefinition) {
        if (!antTypeDefinition.isRestrict()) {
            updateDataTypeDefinition(antTypeDefinition);
        } else {
            updateRestrictedDefinition(antTypeDefinition);
        }
    }

    public void addTaskDefinition(String str, Class cls) {
        Class cls2;
        Class cls3;
        checkTaskClass(cls);
        AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
        antTypeDefinition.setName(str);
        antTypeDefinition.setClassLoader(cls.getClassLoader());
        antTypeDefinition.setClass(cls);
        if (class$org$apache$tools$ant$TaskAdapter == null) {
            cls2 = class$("org.apache.tools.ant.TaskAdapter");
            class$org$apache$tools$ant$TaskAdapter = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$TaskAdapter;
        }
        antTypeDefinition.setAdapterClass(cls2);
        antTypeDefinition.setClassName(cls.getName());
        if (class$org$apache$tools$ant$Task == null) {
            cls3 = class$("org.apache.tools.ant.Task");
            class$org$apache$tools$ant$Task = cls3;
        } else {
            cls3 = class$org$apache$tools$ant$Task;
        }
        antTypeDefinition.setAdaptToClass(cls3);
        updateDataTypeDefinition(antTypeDefinition);
    }

    public void checkTaskClass(Class cls) throws BuildException {
        Class cls2;
        if (!Modifier.isPublic(cls.getModifiers())) {
            String stringBuffer = new StringBuffer().append(cls).append(" is not public").toString();
            this.project.log(stringBuffer, 0);
            throw new BuildException(stringBuffer);
        } else if (Modifier.isAbstract(cls.getModifiers())) {
            String stringBuffer2 = new StringBuffer().append(cls).append(" is abstract").toString();
            this.project.log(stringBuffer2, 0);
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
                TaskAdapter.checkTaskClass(cls, this.project);
            } catch (NoSuchMethodException e) {
                String stringBuffer3 = new StringBuffer().append("No public no-arg constructor in ").append(cls).toString();
                this.project.log(stringBuffer3, 0);
                throw new BuildException(stringBuffer3);
            }
        }
    }

    public Object createComponent(String str) {
        AntTypeDefinition definition = getDefinition(str);
        return definition == null ? null : definition.create(this.project);
    }

    public Object createComponent(UnknownElement unknownElement, String str, String str2) throws BuildException {
        Object createComponent = createComponent(str2);
        if (createComponent instanceof Task) {
            Task task = (Task) createComponent;
            task.setLocation(unknownElement.getLocation());
            task.setTaskType(str2);
            task.setTaskName(unknownElement.getTaskName());
            task.setOwningTarget(unknownElement.getOwningTarget());
            task.init();
        }
        return createComponent;
    }

    public Object createDataType(String str) throws BuildException {
        return createComponent(str);
    }

    public Task createTask(String str) throws BuildException {
        Class cls;
        Task createNewTask = createNewTask(str);
        Task task = createNewTask;
        if (createNewTask == null) {
            task = createNewTask;
            if (str.equals("property")) {
                if (class$org$apache$tools$ant$taskdefs$Property == null) {
                    cls = class$("org.apache.tools.ant.taskdefs.Property");
                    class$org$apache$tools$ant$taskdefs$Property = cls;
                } else {
                    cls = class$org$apache$tools$ant$taskdefs$Property;
                }
                addTaskDefinition("property", cls);
                task = createNewTask(str);
            }
        }
        return task;
    }

    public String diagnoseCreationFailure(String str, String str2) {
        String stringBuffer;
        boolean z;
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        printWriter.println(new StringBuffer().append("Problem: failed to create ").append(str2).append(" ").append(str).toString());
        boolean z2 = false;
        File file = new File(System.getProperty("user.home"), Launcher.USER_LIBDIR);
        boolean z3 = false;
        String property = System.getProperty(MagicNames.ANT_HOME);
        if (property != null) {
            stringBuffer = new File(property, "lib").getAbsolutePath();
        } else {
            z3 = true;
            stringBuffer = new StringBuffer().append("ANT_HOME").append(File.separatorChar).append("lib").toString();
        }
        StringBuffer stringBuffer2 = new StringBuffer();
        stringBuffer2.append("        -");
        stringBuffer2.append(stringBuffer);
        stringBuffer2.append('\n');
        if (z3) {
            stringBuffer2.append("        -");
            stringBuffer2.append("the IDE Ant configuration dialogs");
        } else {
            stringBuffer2.append("        -");
            stringBuffer2.append(file);
            stringBuffer2.append('\n');
            stringBuffer2.append("        -");
            stringBuffer2.append("a directory added on the command line with the -lib argument");
        }
        String stringBuffer3 = stringBuffer2.toString();
        AntTypeDefinition definition = getDefinition(str);
        if (definition == null) {
            printUnknownDefinition(printWriter, str, stringBuffer3);
        } else {
            String className = definition.getClassName();
            boolean startsWith = className.startsWith("org.apache.tools.ant.");
            boolean startsWith2 = className.startsWith("org.apache.tools.ant.taskdefs.optional") | className.startsWith("org.apache.tools.ant.types.optional");
            Class cls = null;
            try {
                cls = definition.innerGetTypeClass();
                z = false;
            } catch (ClassNotFoundException e) {
                boolean z4 = false;
                if (!startsWith2) {
                    z4 = true;
                }
                printClassNotFound(printWriter, className, startsWith2, stringBuffer3);
                z2 = z4;
                z = true;
            } catch (NoClassDefFoundError e2) {
                z = true;
                printNotLoadDependentClass(printWriter, startsWith2, e2, stringBuffer3);
            }
            boolean z5 = z;
            boolean z6 = false;
            if (cls != null) {
                try {
                    definition.innerCreateAndSet(cls, this.project);
                    printWriter.println("The component could be instantiated.");
                    z6 = false;
                    z5 = z;
                } catch (IllegalAccessException e3) {
                    z6 = true;
                    printWriter.println(new StringBuffer().append("Cause: The constructor for ").append(className).append(" is private and cannot be invoked.").toString());
                    z5 = z;
                } catch (InstantiationException e4) {
                    z6 = true;
                    printWriter.println(new StringBuffer().append("Cause: The class ").append(className).append(" is abstract and cannot be instantiated.").toString());
                    z5 = z;
                } catch (NoClassDefFoundError e5) {
                    z5 = true;
                    printWriter.println(new StringBuffer().append("Cause:  A class needed by class ").append(className).append(" cannot be found: ").toString());
                    printWriter.println(new StringBuffer().append("       ").append(e5.getMessage()).toString());
                    printWriter.println("Action: Determine what extra JAR files are needed, and place them in:");
                    printWriter.println(stringBuffer3);
                    z6 = false;
                } catch (NoSuchMethodException e6) {
                    z6 = true;
                    printWriter.println(new StringBuffer().append("Cause: The class ").append(className).append(" has no compatible constructor.").toString());
                    z5 = z;
                } catch (InvocationTargetException e7) {
                    z6 = true;
                    Throwable targetException = e7.getTargetException();
                    printWriter.println("Cause: The constructor threw the exception");
                    printWriter.println(targetException.toString());
                    targetException.printStackTrace(printWriter);
                    z5 = z;
                }
            }
            printWriter.println();
            printWriter.println("Do not panic, this is a common problem.");
            if (z2) {
                printWriter.println("It may just be a typographical error in the build file or the task/type declaration.");
            }
            if (z5) {
                printWriter.println("The commonest cause is a missing JAR.");
            }
            if (z6) {
                printWriter.println("This is quite a low level problem, which may need consultation with the author of the task.");
                if (startsWith) {
                    printWriter.println("This may be the Ant team. Please file a defect or contact the developer team.");
                } else {
                    printWriter.println("This does not appear to be a task bundled with Ant.");
                    printWriter.println(new StringBuffer().append("Please take it up with the supplier of the third-party ").append(str2).append(".").toString());
                    printWriter.println("If you have written it yourself, you probably have a bug to fix.");
                }
            } else {
                printWriter.println();
                printWriter.println("This is not a bug; it is a configuration problem");
            }
        }
        printWriter.flush();
        printWriter.close();
        return stringWriter.toString();
    }

    public void enterAntLib(String str) {
        this.antLibCurrentUri = str;
        this.antLibStack.push(str);
    }

    public void exitAntLib() {
        this.antLibStack.pop();
        this.antLibCurrentUri = this.antLibStack.size() == 0 ? null : (String) this.antLibStack.peek();
    }

    public Hashtable getAntTypeTable() {
        return this.antTypeTable;
    }

    public Class getComponentClass(String str) {
        AntTypeDefinition definition = getDefinition(str);
        return definition == null ? null : definition.getExposedClass(this.project);
    }

    public String getCurrentAntlibUri() {
        return this.antLibCurrentUri;
    }

    public Hashtable getDataTypeDefinitions() {
        Class cls;
        synchronized (this.typeClassDefinitions) {
            synchronized (this.antTypeTable) {
                if (this.rebuildTypeClassDefinitions) {
                    this.typeClassDefinitions.clear();
                    for (String str : this.antTypeTable.keySet()) {
                        Class<?> exposedClass = this.antTypeTable.getExposedClass(str);
                        if (exposedClass != null) {
                            if (class$org$apache$tools$ant$Task == null) {
                                cls = class$("org.apache.tools.ant.Task");
                                class$org$apache$tools$ant$Task = cls;
                            } else {
                                cls = class$org$apache$tools$ant$Task;
                            }
                            if (!cls.isAssignableFrom(exposedClass)) {
                                this.typeClassDefinitions.put(str, this.antTypeTable.getTypeClass(str));
                            }
                        }
                    }
                    this.rebuildTypeClassDefinitions = false;
                }
            }
        }
        return this.typeClassDefinitions;
    }

    public AntTypeDefinition getDefinition(String str) {
        checkNamespace(str);
        return this.antTypeTable.getDefinition(str);
    }

    public String getElementName(Object obj) {
        return getElementName(obj, false);
    }

    public String getElementName(Object obj, boolean z) {
        String unmappedElementName;
        Class cls = obj.getClass();
        String name = cls.getName();
        synchronized (this.antTypeTable) {
            Iterator it = this.antTypeTable.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    unmappedElementName = getUnmappedElementName(obj.getClass(), z);
                    break;
                }
                AntTypeDefinition antTypeDefinition = (AntTypeDefinition) it.next();
                if (name.equals(antTypeDefinition.getClassName()) && cls == antTypeDefinition.getExposedClass(this.project)) {
                    unmappedElementName = antTypeDefinition.getName();
                    if (!z) {
                        unmappedElementName = new StringBuffer().append("The <").append(unmappedElementName).append("> type").toString();
                    }
                }
            }
        }
        return unmappedElementName;
    }

    public ComponentHelper getNext() {
        return this.next;
    }

    public Project getProject() {
        return this.project;
    }

    public List getRestrictedDefinitions(String str) {
        List list;
        synchronized (this.restrictedDefinitions) {
            list = (List) this.restrictedDefinitions.get(str);
        }
        return list;
    }

    public Hashtable getTaskDefinitions() {
        Class cls;
        synchronized (this.taskClassDefinitions) {
            synchronized (this.antTypeTable) {
                if (this.rebuildTaskClassDefinitions) {
                    this.taskClassDefinitions.clear();
                    for (String str : this.antTypeTable.keySet()) {
                        Class<?> exposedClass = this.antTypeTable.getExposedClass(str);
                        if (exposedClass != null) {
                            if (class$org$apache$tools$ant$Task == null) {
                                cls = class$("org.apache.tools.ant.Task");
                                class$org$apache$tools$ant$Task = cls;
                            } else {
                                cls = class$org$apache$tools$ant$Task;
                            }
                            if (cls.isAssignableFrom(exposedClass)) {
                                this.taskClassDefinitions.put(str, this.antTypeTable.getTypeClass(str));
                            }
                        }
                    }
                    this.rebuildTaskClassDefinitions = false;
                }
            }
        }
        return this.taskClassDefinitions;
    }

    public void initDefaultDefinitions() {
        initTasks();
        initTypes();
    }

    public void initSubProject(ComponentHelper componentHelper) {
        AntTypeTable antTypeTable = (AntTypeTable) componentHelper.antTypeTable.clone();
        synchronized (this.antTypeTable) {
            for (AntTypeDefinition antTypeDefinition : antTypeTable.values()) {
                this.antTypeTable.put(antTypeDefinition.getName(), antTypeDefinition);
            }
        }
        Set checkedNamespace = componentHelper.getCheckedNamespace();
        synchronized (this) {
            this.checkedNamespaces.addAll(checkedNamespace);
        }
        Map restrictedDefinition = componentHelper.getRestrictedDefinition();
        synchronized (this.restrictedDefinitions) {
            this.restrictedDefinitions.putAll(restrictedDefinition);
        }
    }

    public void setNext(ComponentHelper componentHelper) {
        this.next = componentHelper;
    }

    public void setProject(Project project) {
        this.project = project;
        this.antTypeTable = new AntTypeTable(project);
    }
}
