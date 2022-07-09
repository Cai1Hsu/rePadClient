package org.apache.tools.ant;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.tools.ant.taskdefs.PreSetDef;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper.class */
public final class IntrospectionHelper {
    private static final String ELLIPSIS = "...";
    private static final int MAX_REPORT_NESTED_TEXT = 20;
    protected static final String NOT_SUPPORTED_CHILD_POSTFIX = "\" element.";
    protected static final String NOT_SUPPORTED_CHILD_PREFIX = " doesn't support the nested \"";
    static Class class$java$io$File;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Character;
    static Class class$java$lang$Class;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Object;
    static Class class$java$lang$Short;
    static Class class$java$lang$String;
    static Class class$org$apache$tools$ant$DynamicElement;
    static Class class$org$apache$tools$ant$DynamicElementNS;
    static Class class$org$apache$tools$ant$Location;
    static Class class$org$apache$tools$ant$Project;
    static Class class$org$apache$tools$ant$ProjectComponent;
    static Class class$org$apache$tools$ant$Task;
    static Class class$org$apache$tools$ant$TaskContainer;
    static Class class$org$apache$tools$ant$types$EnumeratedAttribute;
    static Class class$org$apache$tools$ant$types$Resource;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private final Method addText;
    private final Class bean;
    private static final Map HELPERS = new Hashtable();
    private static final Map PRIMITIVE_TYPE_MAP = new HashMap(8);
    private final Hashtable attributeTypes = new Hashtable();
    private final Hashtable attributeSetters = new Hashtable();
    private final Hashtable nestedTypes = new Hashtable();
    private final Hashtable nestedCreators = new Hashtable();
    private final List addTypeMethods = new ArrayList();

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$AddNestedCreator.class */
    private static class AddNestedCreator extends NestedCreator {
        static final int ADD = 1;
        static final int ADD_CONFIGURED = 2;
        private int behavior;
        private Constructor constructor;

        AddNestedCreator(Method method, Constructor constructor, int i) {
            super(method);
            this.constructor = constructor;
            this.behavior = i;
        }

        private void istore(Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, InstantiationException {
            getMethod().invoke(obj, obj2);
        }

        @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
        Object create(Project project, Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, InstantiationException {
            Object obj3 = obj2;
            if (obj2 == null) {
                obj3 = this.constructor.newInstance(this.constructor.getParameterTypes().length == 0 ? new Object[0] : new Object[]{project});
            }
            Object obj4 = obj3;
            if (obj3 instanceof PreSetDef.PreSetDefinition) {
                obj4 = ((PreSetDef.PreSetDefinition) obj3).createObject(project);
            }
            if (this.behavior == 1) {
                istore(obj, obj4);
            }
            return obj4;
        }

        @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
        boolean isPolyMorphic() {
            return true;
        }

        @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
        void store(Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, InstantiationException {
            if (this.behavior == 2) {
                istore(obj, obj2);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$AttributeSetter.class */
    private static abstract class AttributeSetter {
        private Method method;
        private Class type;

        protected AttributeSetter(Method method, Class cls) {
            this.method = method;
            this.type = cls;
        }

        abstract void set(Project project, Object obj, String str) throws InvocationTargetException, IllegalAccessException, BuildException;

        void setObject(Project project, Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, BuildException {
            if (this.type != null) {
                Class cls = this.type;
                if (this.type.isPrimitive()) {
                    if (obj2 == null) {
                        throw new BuildException(new StringBuffer().append("Attempt to set primitive ").append(IntrospectionHelper.getPropertyName(this.method.getName(), "set")).append(" to null on ").append(obj).toString());
                    }
                    cls = (Class) IntrospectionHelper.PRIMITIVE_TYPE_MAP.get(this.type);
                }
                if (obj2 == null || cls.isInstance(obj2)) {
                    this.method.invoke(obj, obj2);
                    return;
                }
            }
            set(project, obj, obj2.toString());
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$CreateNestedCreator.class */
    private static class CreateNestedCreator extends NestedCreator {
        CreateNestedCreator(Method method) {
            super(method);
        }

        @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
        Object create(Project project, Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException {
            return getMethod().invoke(obj, new Object[0]);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$Creator.class */
    public static final class Creator {
        private NestedCreator nestedCreator;
        private Object nestedObject;
        private Object parent;
        private String polyType;
        private Project project;

        private Creator(Project project, Object obj, NestedCreator nestedCreator) {
            this.project = project;
            this.parent = obj;
            this.nestedCreator = nestedCreator;
        }

        Creator(Project project, Object obj, NestedCreator nestedCreator, AnonymousClass1 anonymousClass1) {
            this(project, obj, nestedCreator);
        }

        public Object create() {
            if (this.polyType != null) {
                if (!this.nestedCreator.isPolyMorphic()) {
                    throw new BuildException("Not allowed to use the polymorphic form for this element");
                }
                this.nestedObject = ComponentHelper.getComponentHelper(this.project).createComponent(this.polyType);
                if (this.nestedObject == null) {
                    throw new BuildException(new StringBuffer().append("Unable to create object of type ").append(this.polyType).toString());
                }
            }
            try {
                this.nestedObject = this.nestedCreator.create(this.project, this.parent, this.nestedObject);
                if (this.project != null) {
                    this.project.setProjectReference(this.nestedObject);
                }
                return this.nestedObject;
            } catch (IllegalAccessException e) {
                throw new BuildException(e);
            } catch (IllegalArgumentException e2) {
                if (this.polyType != null) {
                    throw new BuildException(new StringBuffer().append("Invalid type used ").append(this.polyType).toString());
                }
                throw e2;
            } catch (InstantiationException e3) {
                throw new BuildException(e3);
            } catch (InvocationTargetException e4) {
                throw IntrospectionHelper.extractBuildException(e4);
            }
        }

        public Object getRealObject() {
            return this.nestedCreator.getRealObject();
        }

        public void setPolyType(String str) {
            this.polyType = str;
        }

        public void store() {
            try {
                this.nestedCreator.store(this.parent, this.nestedObject);
            } catch (IllegalAccessException e) {
                throw new BuildException(e);
            } catch (IllegalArgumentException e2) {
                if (this.polyType != null) {
                    throw new BuildException(new StringBuffer().append("Invalid type used ").append(this.polyType).toString());
                }
                throw e2;
            } catch (InstantiationException e3) {
                throw new BuildException(e3);
            } catch (InvocationTargetException e4) {
                throw IntrospectionHelper.extractBuildException(e4);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$MethodAndObject.class */
    private static class MethodAndObject {
        private Method method;
        private Object object;

        public MethodAndObject(Method method, Object obj) {
            this.method = method;
            this.object = obj;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/IntrospectionHelper$NestedCreator.class */
    private static abstract class NestedCreator {
        private Method method;

        protected NestedCreator(Method method) {
            this.method = method;
        }

        abstract Object create(Project project, Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, InstantiationException;

        Method getMethod() {
            return this.method;
        }

        Object getRealObject() {
            return null;
        }

        boolean isPolyMorphic() {
            return false;
        }

        void store(Object obj, Object obj2) throws InvocationTargetException, IllegalAccessException, InstantiationException {
        }
    }

    static {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class[] clsArr = {Boolean.TYPE, Byte.TYPE, Character.TYPE, Short.TYPE, Integer.TYPE, Long.TYPE, Float.TYPE, Double.TYPE};
        if (class$java$lang$Boolean == null) {
            cls = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls;
        } else {
            cls = class$java$lang$Boolean;
        }
        if (class$java$lang$Byte == null) {
            cls2 = class$("java.lang.Byte");
            class$java$lang$Byte = cls2;
        } else {
            cls2 = class$java$lang$Byte;
        }
        if (class$java$lang$Character == null) {
            cls3 = class$("java.lang.Character");
            class$java$lang$Character = cls3;
        } else {
            cls3 = class$java$lang$Character;
        }
        if (class$java$lang$Short == null) {
            cls4 = class$("java.lang.Short");
            class$java$lang$Short = cls4;
        } else {
            cls4 = class$java$lang$Short;
        }
        if (class$java$lang$Integer == null) {
            cls5 = class$("java.lang.Integer");
            class$java$lang$Integer = cls5;
        } else {
            cls5 = class$java$lang$Integer;
        }
        if (class$java$lang$Long == null) {
            cls6 = class$("java.lang.Long");
            class$java$lang$Long = cls6;
        } else {
            cls6 = class$java$lang$Long;
        }
        if (class$java$lang$Float == null) {
            cls7 = class$("java.lang.Float");
            class$java$lang$Float = cls7;
        } else {
            cls7 = class$java$lang$Float;
        }
        if (class$java$lang$Double == null) {
            cls8 = class$("java.lang.Double");
            class$java$lang$Double = cls8;
        } else {
            cls8 = class$java$lang$Double;
        }
        for (int i = 0; i < clsArr.length; i++) {
            PRIMITIVE_TYPE_MAP.put(clsArr[i], new Class[]{cls, cls2, cls3, cls4, cls5, cls6, cls7, cls8}[i]);
        }
    }

    private IntrospectionHelper(Class cls) {
        Class cls2;
        Method method;
        Class cls3;
        Class<?> cls4;
        Constructor<?> constructor;
        Class cls5;
        Class<?> cls6;
        Constructor<?> constructor2;
        Class cls7;
        Class cls8;
        Class cls9;
        Class cls10;
        Class cls11;
        Class cls12;
        this.bean = cls;
        Method[] methods = cls.getMethods();
        Method method2 = null;
        int i = 0;
        while (i < methods.length) {
            Method method3 = methods[i];
            String name = method3.getName();
            Class<?> returnType = method3.getReturnType();
            Class<?>[] parameterTypes = method3.getParameterTypes();
            if (parameterTypes.length != 1 || !Void.TYPE.equals(returnType) || (!"add".equals(name) && !"addConfigured".equals(name))) {
                if (class$org$apache$tools$ant$ProjectComponent == null) {
                    cls2 = class$("org.apache.tools.ant.ProjectComponent");
                    class$org$apache$tools$ant$ProjectComponent = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$ProjectComponent;
                }
                if (cls2.isAssignableFrom(cls) && parameterTypes.length == 1) {
                    method = method2;
                    if (isHiddenSetMethod(name, parameterTypes[0])) {
                    }
                }
                if (isContainer() && parameterTypes.length == 1 && "addTask".equals(name)) {
                    if (class$org$apache$tools$ant$Task == null) {
                        cls12 = class$("org.apache.tools.ant.Task");
                        class$org$apache$tools$ant$Task = cls12;
                    } else {
                        cls12 = class$org$apache$tools$ant$Task;
                    }
                    method = method2;
                    if (cls12.equals(parameterTypes[0])) {
                    }
                }
                if ("addText".equals(name) && Void.TYPE.equals(returnType) && parameterTypes.length == 1) {
                    if (class$java$lang$String == null) {
                        cls11 = class$("java.lang.String");
                        class$java$lang$String = cls11;
                    } else {
                        cls11 = class$java$lang$String;
                    }
                    if (cls11.equals(parameterTypes[0])) {
                        method = methods[i];
                    }
                }
                if (name.startsWith("set") && Void.TYPE.equals(returnType) && parameterTypes.length == 1 && !parameterTypes[0].isArray()) {
                    String propertyName = getPropertyName(name, "set");
                    AttributeSetter attributeSetter = (AttributeSetter) this.attributeSetters.get(propertyName);
                    if (attributeSetter != null) {
                        if (class$java$lang$String == null) {
                            cls7 = class$("java.lang.String");
                            class$java$lang$String = cls7;
                        } else {
                            cls7 = class$java$lang$String;
                        }
                        method = method2;
                        if (!cls7.equals(parameterTypes[0])) {
                            if (class$java$io$File == null) {
                                cls8 = class$("java.io.File");
                                class$java$io$File = cls8;
                            } else {
                                cls8 = class$java$io$File;
                            }
                            if (cls8.equals(parameterTypes[0])) {
                                if (class$org$apache$tools$ant$types$Resource == null) {
                                    cls9 = class$("org.apache.tools.ant.types.Resource");
                                    class$org$apache$tools$ant$types$Resource = cls9;
                                } else {
                                    cls9 = class$org$apache$tools$ant$types$Resource;
                                }
                                method = method2;
                                if (!cls9.equals(attributeSetter.type)) {
                                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                                        cls10 = class$("org.apache.tools.ant.types.resources.FileProvider");
                                        class$org$apache$tools$ant$types$resources$FileProvider = cls10;
                                    } else {
                                        cls10 = class$org$apache$tools$ant$types$resources$FileProvider;
                                    }
                                    method = method2;
                                    if (cls10.equals(attributeSetter.type)) {
                                    }
                                }
                            }
                        }
                    }
                    AttributeSetter createAttributeSetter = createAttributeSetter(method3, parameterTypes[0], propertyName);
                    method = method2;
                    if (createAttributeSetter != null) {
                        this.attributeTypes.put(propertyName, parameterTypes[0]);
                        this.attributeSetters.put(propertyName, createAttributeSetter);
                        method = method2;
                    }
                } else if (!name.startsWith("create") || returnType.isArray() || returnType.isPrimitive() || parameterTypes.length != 0) {
                    if (name.startsWith("addConfigured") && Void.TYPE.equals(returnType) && parameterTypes.length == 1) {
                        if (class$java$lang$String == null) {
                            cls5 = class$("java.lang.String");
                            class$java$lang$String = cls5;
                        } else {
                            cls5 = class$java$lang$String;
                        }
                        if (!cls5.equals(parameterTypes[0]) && !parameterTypes[0].isArray() && !parameterTypes[0].isPrimitive()) {
                            try {
                                constructor2 = parameterTypes[0].getConstructor(new Class[0]);
                            } catch (NoSuchMethodException e) {
                                Class<?> cls13 = parameterTypes[0];
                                if (class$org$apache$tools$ant$Project == null) {
                                    cls6 = class$("org.apache.tools.ant.Project");
                                    class$org$apache$tools$ant$Project = cls6;
                                } else {
                                    cls6 = class$org$apache$tools$ant$Project;
                                }
                                constructor2 = cls13.getConstructor(cls6);
                            }
                            try {
                                String propertyName2 = getPropertyName(name, "addConfigured");
                                this.nestedTypes.put(propertyName2, parameterTypes[0]);
                                this.nestedCreators.put(propertyName2, new AddNestedCreator(method3, constructor2, 2));
                                method = method2;
                            } catch (NoSuchMethodException e2) {
                                method = method2;
                            }
                        }
                    }
                    method = method2;
                    if (name.startsWith("add")) {
                        method = method2;
                        if (Void.TYPE.equals(returnType)) {
                            method = method2;
                            if (parameterTypes.length == 1) {
                                if (class$java$lang$String == null) {
                                    cls3 = class$("java.lang.String");
                                    class$java$lang$String = cls3;
                                } else {
                                    cls3 = class$java$lang$String;
                                }
                                method = method2;
                                if (!cls3.equals(parameterTypes[0])) {
                                    method = method2;
                                    if (!parameterTypes[0].isArray()) {
                                        method = method2;
                                        if (!parameterTypes[0].isPrimitive()) {
                                            try {
                                                constructor = parameterTypes[0].getConstructor(new Class[0]);
                                            } catch (NoSuchMethodException e3) {
                                                Class<?> cls14 = parameterTypes[0];
                                                if (class$org$apache$tools$ant$Project == null) {
                                                    cls4 = class$("org.apache.tools.ant.Project");
                                                    class$org$apache$tools$ant$Project = cls4;
                                                } else {
                                                    cls4 = class$org$apache$tools$ant$Project;
                                                }
                                                constructor = cls14.getConstructor(cls4);
                                            }
                                            try {
                                                String propertyName3 = getPropertyName(name, "add");
                                                method = method2;
                                                if (this.nestedTypes.get(propertyName3) == null) {
                                                    this.nestedTypes.put(propertyName3, parameterTypes[0]);
                                                    this.nestedCreators.put(propertyName3, new AddNestedCreator(method3, constructor, 1));
                                                    method = method2;
                                                }
                                            } catch (NoSuchMethodException e4) {
                                                method = method2;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    String propertyName4 = getPropertyName(name, "create");
                    method = method2;
                    if (this.nestedCreators.get(propertyName4) == null) {
                        this.nestedTypes.put(propertyName4, returnType);
                        this.nestedCreators.put(propertyName4, new CreateNestedCreator(method3));
                        method = method2;
                    }
                }
            } else {
                insertAddTypeMethod(method3);
                method = method2;
            }
            i++;
            method2 = method;
        }
        this.addText = method2;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static void clearCache() {
        HELPERS.clear();
    }

    private String condenseText(String str) {
        if (str.length() > 20) {
            int length = (20 - ELLIPSIS.length()) / 2;
            str = new StringBuffer(str).replace(length, str.length() - length, ELLIPSIS).toString();
        }
        return str;
    }

    private NestedCreator createAddTypeCreator(Project project, Object obj, String str) throws BuildException {
        NestedCreator nestedCreator = null;
        if (this.addTypeMethods.size() != 0) {
            ComponentHelper componentHelper = ComponentHelper.getComponentHelper(project);
            MethodAndObject createRestricted = createRestricted(componentHelper, str, this.addTypeMethods);
            MethodAndObject createTopLevel = createTopLevel(componentHelper, str, this.addTypeMethods);
            if (createRestricted != null || createTopLevel != null) {
                if (createRestricted != null && createTopLevel != null) {
                    throw new BuildException(new StringBuffer().append("ambiguous: type and component definitions for ").append(str).toString());
                }
                MethodAndObject methodAndObject = createRestricted != null ? createRestricted : createTopLevel;
                Object obj2 = methodAndObject.object;
                if (methodAndObject.object instanceof PreSetDef.PreSetDefinition) {
                    obj2 = ((PreSetDef.PreSetDefinition) methodAndObject.object).createObject(project);
                }
                nestedCreator = new NestedCreator(this, methodAndObject.method, obj2, methodAndObject.object) { // from class: org.apache.tools.ant.IntrospectionHelper.13
                    private final IntrospectionHelper this$0;
                    private final Object val$nestedObject;
                    private final Object val$realObject;

                    {
                        this.this$0 = this;
                        this.val$realObject = obj2;
                        this.val$nestedObject = r7;
                    }

                    @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
                    Object create(Project project2, Object obj3, Object obj4) throws InvocationTargetException, IllegalAccessException {
                        if (!getMethod().getName().endsWith("Configured")) {
                            getMethod().invoke(obj3, this.val$realObject);
                        }
                        return this.val$nestedObject;
                    }

                    @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
                    Object getRealObject() {
                        return this.val$realObject;
                    }

                    @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
                    void store(Object obj3, Object obj4) throws InvocationTargetException, IllegalAccessException, InstantiationException {
                        if (getMethod().getName().endsWith("Configured")) {
                            getMethod().invoke(obj3, this.val$realObject);
                        }
                    }
                };
            }
        }
        return nestedCreator;
    }

    private AttributeSetter createAttributeSetter(Method method, Class cls, String str) {
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        AttributeSetter attributeSetter;
        Class cls9;
        Class cls10;
        Class cls11;
        Class<?> cls12;
        Constructor constructor;
        boolean z;
        Class<?> cls13;
        Class<?> cls14;
        Class cls15 = PRIMITIVE_TYPE_MAP.containsKey(cls) ? (Class) PRIMITIVE_TYPE_MAP.get(cls) : cls;
        if (class$java$lang$Object == null) {
            cls2 = class$("java.lang.Object");
            class$java$lang$Object = cls2;
        } else {
            cls2 = class$java$lang$Object;
        }
        if (cls2 == cls15) {
            attributeSetter = new AttributeSetter(this, method, cls) { // from class: org.apache.tools.ant.IntrospectionHelper.2
                private final IntrospectionHelper this$0;

                {
                    this.this$0 = this;
                }

                @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException {
                    throw new BuildException("Internal ant problem - this should not get called");
                }
            };
        } else {
            if (class$java$lang$String == null) {
                cls3 = class$("java.lang.String");
                class$java$lang$String = cls3;
            } else {
                cls3 = class$java$lang$String;
            }
            if (cls3.equals(cls15)) {
                attributeSetter = new AttributeSetter(this, method, cls, method) { // from class: org.apache.tools.ant.IntrospectionHelper.3
                    private final IntrospectionHelper this$0;
                    private final Method val$m;

                    {
                        this.this$0 = this;
                        this.val$m = method;
                    }

                    @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                    public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException {
                        this.val$m.invoke(obj, str2);
                    }
                };
            } else {
                if (class$java$lang$Character == null) {
                    cls4 = class$("java.lang.Character");
                    class$java$lang$Character = cls4;
                } else {
                    cls4 = class$java$lang$Character;
                }
                if (cls4.equals(cls15)) {
                    attributeSetter = new AttributeSetter(this, method, cls, str, method) { // from class: org.apache.tools.ant.IntrospectionHelper.4
                        private final IntrospectionHelper this$0;
                        private final String val$attrName;
                        private final Method val$m;

                        {
                            this.this$0 = this;
                            this.val$attrName = str;
                            this.val$m = method;
                        }

                        @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                        public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException {
                            if (str2.length() == 0) {
                                throw new BuildException(new StringBuffer().append("The value \"\" is not a legal value for attribute \"").append(this.val$attrName).append("\"").toString());
                            }
                            this.val$m.invoke(obj, new Character(str2.charAt(0)));
                        }
                    };
                } else {
                    if (class$java$lang$Boolean == null) {
                        cls5 = class$("java.lang.Boolean");
                        class$java$lang$Boolean = cls5;
                    } else {
                        cls5 = class$java$lang$Boolean;
                    }
                    if (cls5.equals(cls15)) {
                        attributeSetter = new AttributeSetter(this, method, cls, method) { // from class: org.apache.tools.ant.IntrospectionHelper.5
                            private final IntrospectionHelper this$0;
                            private final Method val$m;

                            {
                                this.this$0 = this;
                                this.val$m = method;
                            }

                            @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                            public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException {
                                this.val$m.invoke(obj, Project.toBoolean(str2) ? Boolean.TRUE : Boolean.FALSE);
                            }
                        };
                    } else {
                        if (class$java$lang$Class == null) {
                            cls6 = class$("java.lang.Class");
                            class$java$lang$Class = cls6;
                        } else {
                            cls6 = class$java$lang$Class;
                        }
                        if (cls6.equals(cls15)) {
                            attributeSetter = new AttributeSetter(this, method, cls, method) { // from class: org.apache.tools.ant.IntrospectionHelper.6
                                private final IntrospectionHelper this$0;
                                private final Method val$m;

                                {
                                    this.this$0 = this;
                                    this.val$m = method;
                                }

                                @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException, BuildException {
                                    try {
                                        this.val$m.invoke(obj, Class.forName(str2));
                                    } catch (ClassNotFoundException e) {
                                        throw new BuildException(e);
                                    }
                                }
                            };
                        } else {
                            if (class$java$io$File == null) {
                                cls7 = class$("java.io.File");
                                class$java$io$File = cls7;
                            } else {
                                cls7 = class$java$io$File;
                            }
                            if (cls7.equals(cls15)) {
                                attributeSetter = new AttributeSetter(this, method, cls, method) { // from class: org.apache.tools.ant.IntrospectionHelper.7
                                    private final IntrospectionHelper this$0;
                                    private final Method val$m;

                                    {
                                        this.this$0 = this;
                                        this.val$m = method;
                                    }

                                    @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                    public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException {
                                        this.val$m.invoke(obj, project.resolveFile(str2));
                                    }
                                };
                            } else {
                                if (class$org$apache$tools$ant$types$Resource == null) {
                                    cls8 = class$("org.apache.tools.ant.types.Resource");
                                    class$org$apache$tools$ant$types$Resource = cls8;
                                } else {
                                    cls8 = class$org$apache$tools$ant$types$Resource;
                                }
                                if (!cls8.equals(cls15)) {
                                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                                        cls9 = class$("org.apache.tools.ant.types.resources.FileProvider");
                                        class$org$apache$tools$ant$types$resources$FileProvider = cls9;
                                    } else {
                                        cls9 = class$org$apache$tools$ant$types$resources$FileProvider;
                                    }
                                    if (!cls9.equals(cls15)) {
                                        if (class$org$apache$tools$ant$types$EnumeratedAttribute == null) {
                                            cls10 = class$("org.apache.tools.ant.types.EnumeratedAttribute");
                                            class$org$apache$tools$ant$types$EnumeratedAttribute = cls10;
                                        } else {
                                            cls10 = class$org$apache$tools$ant$types$EnumeratedAttribute;
                                        }
                                        if (cls10.isAssignableFrom(cls15)) {
                                            attributeSetter = new AttributeSetter(this, method, cls, cls15, method) { // from class: org.apache.tools.ant.IntrospectionHelper.9
                                                private final IntrospectionHelper this$0;
                                                private final Method val$m;
                                                private final Class val$reflectedArg;

                                                {
                                                    this.this$0 = this;
                                                    this.val$reflectedArg = cls15;
                                                    this.val$m = method;
                                                }

                                                @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                                public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException, BuildException {
                                                    try {
                                                        EnumeratedAttribute enumeratedAttribute = (EnumeratedAttribute) this.val$reflectedArg.newInstance();
                                                        enumeratedAttribute.setValue(str2);
                                                        this.val$m.invoke(obj, enumeratedAttribute);
                                                    } catch (InstantiationException e) {
                                                        throw new BuildException(e);
                                                    }
                                                }
                                            };
                                        } else {
                                            AttributeSetter enumSetter = getEnumSetter(cls15, method, cls);
                                            if (enumSetter != null) {
                                                attributeSetter = enumSetter;
                                            } else {
                                                if (class$java$lang$Long == null) {
                                                    cls11 = class$("java.lang.Long");
                                                    class$java$lang$Long = cls11;
                                                } else {
                                                    cls11 = class$java$lang$Long;
                                                }
                                                if (cls11.equals(cls15)) {
                                                    attributeSetter = new AttributeSetter(this, method, cls, method, str) { // from class: org.apache.tools.ant.IntrospectionHelper.10
                                                        private final IntrospectionHelper this$0;
                                                        private final String val$attrName;
                                                        private final Method val$m;

                                                        {
                                                            this.this$0 = this;
                                                            this.val$m = method;
                                                            this.val$attrName = str;
                                                        }

                                                        @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                                        public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException, BuildException {
                                                            try {
                                                                this.val$m.invoke(obj, new Long(StringUtils.parseHumanSizes(str2)));
                                                            } catch (IllegalAccessException e) {
                                                                throw e;
                                                            } catch (NumberFormatException e2) {
                                                                throw new BuildException(new StringBuffer().append("Can't assign non-numeric value '").append(str2).append("' to").append(" attribute ").append(this.val$attrName).toString());
                                                            } catch (InvocationTargetException e3) {
                                                                throw e3;
                                                            } catch (Exception e4) {
                                                                throw new BuildException(e4);
                                                            }
                                                        }
                                                    };
                                                } else {
                                                    try {
                                                        if (class$org$apache$tools$ant$Project == null) {
                                                            cls13 = class$("org.apache.tools.ant.Project");
                                                            class$org$apache$tools$ant$Project = cls13;
                                                        } else {
                                                            cls13 = class$org$apache$tools$ant$Project;
                                                        }
                                                        if (class$java$lang$String == null) {
                                                            cls14 = class$("java.lang.String");
                                                            class$java$lang$String = cls14;
                                                        } else {
                                                            cls14 = class$java$lang$String;
                                                        }
                                                        constructor = cls15.getConstructor(cls13, cls14);
                                                        z = true;
                                                    } catch (NoSuchMethodException e) {
                                                        try {
                                                            if (class$java$lang$String == null) {
                                                                cls12 = class$("java.lang.String");
                                                                class$java$lang$String = cls12;
                                                            } else {
                                                                cls12 = class$java$lang$String;
                                                            }
                                                            constructor = cls15.getConstructor(cls12);
                                                            z = false;
                                                        } catch (NoSuchMethodException e2) {
                                                            attributeSetter = null;
                                                        }
                                                    }
                                                    attributeSetter = new AttributeSetter(this, method, cls, z, constructor, method, str) { // from class: org.apache.tools.ant.IntrospectionHelper.11
                                                        private final IntrospectionHelper this$0;
                                                        private final String val$attrName;
                                                        private final Constructor val$finalConstructor;
                                                        private final boolean val$finalIncludeProject;
                                                        private final Method val$m;

                                                        {
                                                            this.this$0 = this;
                                                            this.val$finalIncludeProject = z;
                                                            this.val$finalConstructor = constructor;
                                                            this.val$m = method;
                                                            this.val$attrName = str;
                                                        }

                                                        @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                                        public void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException, BuildException {
                                                            Object[] objArr;
                                                            try {
                                                                if (this.val$finalIncludeProject) {
                                                                    objArr = new Object[2];
                                                                    objArr[0] = project;
                                                                    objArr[1] = str2;
                                                                } else {
                                                                    objArr = new Object[1];
                                                                    objArr[0] = str2;
                                                                }
                                                                Object newInstance = this.val$finalConstructor.newInstance(objArr);
                                                                if (project != null) {
                                                                    project.setProjectReference(newInstance);
                                                                }
                                                                this.val$m.invoke(obj, newInstance);
                                                            } catch (InstantiationException e3) {
                                                                throw new BuildException(e3);
                                                            } catch (InvocationTargetException e4) {
                                                                Throwable cause = e4.getCause();
                                                                if (!(cause instanceof IllegalArgumentException)) {
                                                                    throw e4;
                                                                }
                                                                throw new BuildException(new StringBuffer().append("Can't assign value '").append(str2).append("' to attribute ").append(this.val$attrName).append(", reason: ").append(cause.getClass()).append(" with message '").append(cause.getMessage()).append("'").toString());
                                                            }
                                                        }
                                                    };
                                                }
                                            }
                                        }
                                    }
                                }
                                attributeSetter = new AttributeSetter(this, method, cls, method) { // from class: org.apache.tools.ant.IntrospectionHelper.8
                                    private final IntrospectionHelper this$0;
                                    private final Method val$m;

                                    {
                                        this.this$0 = this;
                                        this.val$m = method;
                                    }

                                    @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
                                    void set(Project project, Object obj, String str2) throws InvocationTargetException, IllegalAccessException, BuildException {
                                        this.val$m.invoke(obj, new FileResource(project, project.resolveFile(str2)));
                                    }
                                };
                            }
                        }
                    }
                }
            }
        }
        return attributeSetter;
    }

    private Object createDynamicElement(Object obj, String str, String str2, String str3) {
        Object obj2 = null;
        if (obj instanceof DynamicElementNS) {
            obj2 = ((DynamicElementNS) obj).createDynamicElement(str, str2, str3);
        }
        Object obj3 = obj2;
        if (obj2 == null) {
            obj3 = obj2;
            if (obj instanceof DynamicElement) {
                obj3 = ((DynamicElement) obj).createDynamicElement(str2.toLowerCase(Locale.ENGLISH));
            }
        }
        return obj3;
    }

    private MethodAndObject createRestricted(ComponentHelper componentHelper, String str, List list) {
        MethodAndObject methodAndObject;
        Project project = componentHelper.getProject();
        AntTypeDefinition findRestrictedDefinition = findRestrictedDefinition(componentHelper, str, list);
        if (findRestrictedDefinition == null) {
            methodAndObject = null;
        } else {
            Method findMatchingMethod = findMatchingMethod(findRestrictedDefinition.getExposedClass(project), list);
            if (findMatchingMethod == null) {
                throw new BuildException(new StringBuffer().append("Ant Internal Error - contract mismatch for ").append(str).toString());
            }
            Object create = findRestrictedDefinition.create(project);
            if (create == null) {
                throw new BuildException(new StringBuffer().append("Failed to create object ").append(str).append(" of type ").append(findRestrictedDefinition.getTypeClass(project)).toString());
            }
            methodAndObject = new MethodAndObject(findMatchingMethod, create);
        }
        return methodAndObject;
    }

    private MethodAndObject createTopLevel(ComponentHelper componentHelper, String str, List list) {
        Method findMatchingMethod;
        MethodAndObject methodAndObject = null;
        Class componentClass = componentHelper.getComponentClass(str);
        if (componentClass != null && (findMatchingMethod = findMatchingMethod(componentClass, this.addTypeMethods)) != null) {
            methodAndObject = new MethodAndObject(findMatchingMethod, componentHelper.createComponent(str));
        }
        return methodAndObject;
    }

    public static BuildException extractBuildException(InvocationTargetException invocationTargetException) {
        Throwable targetException = invocationTargetException.getTargetException();
        return targetException instanceof BuildException ? (BuildException) targetException : new BuildException(targetException);
    }

    private Method findMatchingMethod(Class cls, List list) {
        Method method;
        if (cls != null) {
            Class<?> cls2 = null;
            Method method2 = null;
            int size = list.size();
            int i = 0;
            while (true) {
                method = method2;
                if (i >= size) {
                    break;
                }
                Method method3 = (Method) list.get(i);
                Class<?> cls3 = method3.getParameterTypes()[0];
                Class<?> cls4 = cls2;
                Method method4 = method2;
                if (cls3.isAssignableFrom(cls)) {
                    if (cls2 == null) {
                        cls4 = cls3;
                        method4 = method3;
                    } else {
                        cls4 = cls2;
                        method4 = method2;
                        if (!cls3.isAssignableFrom(cls2)) {
                            throw new BuildException(new StringBuffer().append("ambiguous: types ").append(cls2.getName()).append(" and ").append(cls3.getName()).append(" match ").append(cls.getName()).toString());
                        }
                    }
                }
                i++;
                cls2 = cls4;
                method2 = method4;
            }
        } else {
            method = null;
        }
        return method;
    }

    private AntTypeDefinition findRestrictedDefinition(ComponentHelper componentHelper, String str, List list) {
        AntTypeDefinition antTypeDefinition;
        Class cls;
        AntTypeDefinition antTypeDefinition2 = null;
        Class cls2 = null;
        List restrictedDefinitions = componentHelper.getRestrictedDefinitions(str);
        if (restrictedDefinitions == null) {
            antTypeDefinition = null;
        } else {
            synchronized (restrictedDefinitions) {
                int size = restrictedDefinitions.size();
                int i = 0;
                while (i < size) {
                    AntTypeDefinition antTypeDefinition3 = (AntTypeDefinition) restrictedDefinitions.get(i);
                    Class exposedClass = antTypeDefinition3.getExposedClass(componentHelper.getProject());
                    if (exposedClass == null) {
                        cls = cls2;
                    } else {
                        cls = cls2;
                        if (findMatchingMethod(exposedClass, list) == null) {
                            continue;
                        } else if (cls2 != null) {
                            throw new BuildException(new StringBuffer().append("ambiguous: restricted definitions for ").append(str).append(" ").append(cls2).append(" and ").append(exposedClass).toString());
                        } else {
                            cls = exposedClass;
                            antTypeDefinition2 = antTypeDefinition3;
                        }
                    }
                    i++;
                    cls2 = cls;
                }
            }
            antTypeDefinition = antTypeDefinition2;
        }
        return antTypeDefinition;
    }

    private String getElementName(Project project, Object obj) {
        return project.getElementName(obj);
    }

    private AttributeSetter getEnumSetter(Class cls, Method method, Class cls2) {
        Class<?> cls3 = null;
        try {
            cls3 = Class.forName("java.lang.Enum");
        } catch (ClassNotFoundException e) {
        }
        return (cls3 == null || !cls3.isAssignableFrom(cls)) ? null : new AttributeSetter(this, method, cls2, method, cls) { // from class: org.apache.tools.ant.IntrospectionHelper.12
            private final IntrospectionHelper this$0;
            private final Method val$m;
            private final Class val$reflectedArg;

            {
                this.this$0 = this;
                this.val$m = method;
                this.val$reflectedArg = cls;
            }

            @Override // org.apache.tools.ant.IntrospectionHelper.AttributeSetter
            public void set(Project project, Object obj, String str) throws InvocationTargetException, IllegalAccessException, BuildException {
                Class<?> cls4;
                try {
                    Method method2 = this.val$m;
                    Class cls5 = this.val$reflectedArg;
                    if (IntrospectionHelper.class$java$lang$String == null) {
                        cls4 = IntrospectionHelper.class$("java.lang.String");
                        IntrospectionHelper.class$java$lang$String = cls4;
                    } else {
                        cls4 = IntrospectionHelper.class$java$lang$String;
                    }
                    method2.invoke(obj, cls5.getMethod("valueOf", cls4).invoke(null, str));
                } catch (InvocationTargetException e2) {
                    if (!(e2.getTargetException() instanceof IllegalArgumentException)) {
                        throw IntrospectionHelper.extractBuildException(e2);
                    }
                    throw new BuildException(new StringBuffer().append("'").append(str).append("' is not a permitted value for ").append(this.val$reflectedArg.getName()).toString());
                } catch (Exception e3) {
                    throw new BuildException(e3);
                }
            }
        };
    }

    public static IntrospectionHelper getHelper(Class cls) {
        IntrospectionHelper helper;
        synchronized (IntrospectionHelper.class) {
            try {
                helper = getHelper(null, cls);
            } catch (Throwable th) {
                throw th;
            }
        }
        return helper;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x001b, code lost:
        if (r0.bean != r5) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static IntrospectionHelper getHelper(Project project, Class cls) {
        IntrospectionHelper introspectionHelper;
        IntrospectionHelper introspectionHelper2 = (IntrospectionHelper) HELPERS.get(cls.getName());
        if (introspectionHelper2 != null) {
            introspectionHelper = introspectionHelper2;
        }
        IntrospectionHelper introspectionHelper3 = new IntrospectionHelper(cls);
        introspectionHelper = introspectionHelper3;
        if (project != null) {
            HELPERS.put(cls.getName(), introspectionHelper3);
            introspectionHelper = introspectionHelper3;
        }
        return introspectionHelper;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0048, code lost:
        if (r14.length() == 0) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0085, code lost:
        if ((r9 instanceof org.apache.tools.ant.DynamicElement) != false) goto L22;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private NestedCreator getNestedCreator(Project project, String str, Object obj, String str2, UnknownElement unknownElement) throws BuildException {
        NestedCreator nestedCreator;
        String extractUriFromComponentName = ProjectHelper.extractUriFromComponentName(str2);
        String extractNameFromComponentName = ProjectHelper.extractNameFromComponentName(str2);
        String str3 = extractUriFromComponentName;
        if (extractUriFromComponentName.equals(ProjectHelper.ANT_CORE_URI)) {
            str3 = "";
        }
        String str4 = str;
        if (str.equals(ProjectHelper.ANT_CORE_URI)) {
            str4 = "";
        }
        if (!str3.equals(str4)) {
            nestedCreator = null;
        }
        nestedCreator = (NestedCreator) this.nestedCreators.get(extractNameFromComponentName.toLowerCase(Locale.ENGLISH));
        NestedCreator nestedCreator2 = nestedCreator;
        if (nestedCreator == null) {
            nestedCreator2 = createAddTypeCreator(project, obj, str2);
        }
        NestedCreator nestedCreator3 = nestedCreator2;
        if (nestedCreator2 == null) {
            if (!(obj instanceof DynamicElementNS)) {
                nestedCreator3 = nestedCreator2;
            }
            Object createDynamicElement = createDynamicElement(obj, unknownElement == null ? "" : unknownElement.getNamespace(), extractNameFromComponentName, unknownElement == null ? extractNameFromComponentName : unknownElement.getQName());
            nestedCreator3 = nestedCreator2;
            if (createDynamicElement != null) {
                nestedCreator3 = new NestedCreator(this, null, createDynamicElement) { // from class: org.apache.tools.ant.IntrospectionHelper.1
                    private final IntrospectionHelper this$0;
                    private final Object val$nestedElement;

                    {
                        this.this$0 = this;
                        this.val$nestedElement = createDynamicElement;
                    }

                    @Override // org.apache.tools.ant.IntrospectionHelper.NestedCreator
                    Object create(Project project2, Object obj2, Object obj3) {
                        return this.val$nestedElement;
                    }
                };
            }
        }
        if (nestedCreator3 == null) {
            throwNotSupported(project, obj, str2);
        }
        return nestedCreator3;
    }

    public static String getPropertyName(String str, String str2) {
        return str.substring(str2.length()).toLowerCase(Locale.ENGLISH);
    }

    private void insertAddTypeMethod(Method method) {
        Class<?> cls = method.getParameterTypes()[0];
        int size = this.addTypeMethods.size();
        for (int i = 0; i < size; i++) {
            Method method2 = (Method) this.addTypeMethods.get(i);
            if (method2.getParameterTypes()[0].equals(cls)) {
                if (!method.getName().equals("addConfigured")) {
                    return;
                }
                this.addTypeMethods.set(i, method);
                return;
            } else if (method2.getParameterTypes()[0].isAssignableFrom(cls)) {
                this.addTypeMethods.add(i, method);
                return;
            }
        }
        this.addTypeMethods.add(method);
    }

    private boolean isHiddenSetMethod(String str, Class cls) {
        boolean z;
        Class cls2;
        Class cls3;
        if ("setLocation".equals(str)) {
            if (class$org$apache$tools$ant$Location == null) {
                cls3 = class$("org.apache.tools.ant.Location");
                class$org$apache$tools$ant$Location = cls3;
            } else {
                cls3 = class$org$apache$tools$ant$Location;
            }
            if (cls3.equals(cls)) {
                z = true;
                return z;
            }
        }
        if ("setTaskType".equals(str)) {
            if (class$java$lang$String == null) {
                cls2 = class$("java.lang.String");
                class$java$lang$String = cls2;
            } else {
                cls2 = class$java$lang$String;
            }
            if (cls2.equals(cls)) {
                z = true;
                return z;
            }
        }
        z = false;
        return z;
    }

    public void addText(Project project, Object obj, String str) throws BuildException {
        if (this.addText == null) {
            String trim = str.trim();
            if (trim.length() != 0) {
                throw new BuildException(new StringBuffer().append(project.getElementName(obj)).append(" doesn't support nested text data (\"").append(condenseText(trim)).append("\").").toString());
            }
            return;
        }
        try {
            this.addText.invoke(obj, str);
        } catch (IllegalAccessException e) {
            throw new BuildException(e);
        } catch (InvocationTargetException e2) {
            throw extractBuildException(e2);
        }
    }

    public Object createElement(Project project, Object obj, String str) throws BuildException {
        try {
            Object create = getNestedCreator(project, "", obj, str, null).create(project, obj, null);
            if (project != null) {
                project.setProjectReference(create);
            }
            return create;
        } catch (IllegalAccessException e) {
            throw new BuildException(e);
        } catch (InstantiationException e2) {
            throw new BuildException(e2);
        } catch (InvocationTargetException e3) {
            throw extractBuildException(e3);
        }
    }

    public Method getAddTextMethod() throws BuildException {
        if (!supportsCharacters()) {
            throw new BuildException(new StringBuffer().append("Class ").append(this.bean.getName()).append(" doesn't support nested text data.").toString());
        }
        return this.addText;
    }

    public Map getAttributeMap() {
        return this.attributeTypes.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(this.attributeTypes);
    }

    public Method getAttributeMethod(String str) throws BuildException {
        Object obj = this.attributeSetters.get(str);
        if (obj == null) {
            throw new UnsupportedAttributeException(new StringBuffer().append("Class ").append(this.bean.getName()).append(" doesn't support the \"").append(str).append("\" attribute.").toString(), str);
        }
        return ((AttributeSetter) obj).method;
    }

    public Class getAttributeType(String str) throws BuildException {
        Class cls = (Class) this.attributeTypes.get(str);
        if (cls == null) {
            throw new UnsupportedAttributeException(new StringBuffer().append("Class ").append(this.bean.getName()).append(" doesn't support the \"").append(str).append("\" attribute.").toString(), str);
        }
        return cls;
    }

    public Enumeration getAttributes() {
        return this.attributeSetters.keys();
    }

    public Creator getElementCreator(Project project, String str, Object obj, String str2, UnknownElement unknownElement) {
        return new Creator(project, obj, getNestedCreator(project, str, obj, str2, unknownElement), null);
    }

    public Method getElementMethod(String str) throws BuildException {
        Object obj = this.nestedCreators.get(str);
        if (obj == null) {
            throw new UnsupportedElementException(new StringBuffer().append("Class ").append(this.bean.getName()).append(NOT_SUPPORTED_CHILD_PREFIX).append(str).append(NOT_SUPPORTED_CHILD_POSTFIX).toString(), str);
        }
        return ((NestedCreator) obj).method;
    }

    public Class getElementType(String str) throws BuildException {
        Class cls = (Class) this.nestedTypes.get(str);
        if (cls == null) {
            throw new UnsupportedElementException(new StringBuffer().append("Class ").append(this.bean.getName()).append(NOT_SUPPORTED_CHILD_PREFIX).append(str).append(NOT_SUPPORTED_CHILD_POSTFIX).toString(), str);
        }
        return cls;
    }

    public List getExtensionPoints() {
        return this.addTypeMethods.isEmpty() ? Collections.EMPTY_LIST : Collections.unmodifiableList(this.addTypeMethods);
    }

    public Map getNestedElementMap() {
        return this.nestedTypes.isEmpty() ? Collections.EMPTY_MAP : Collections.unmodifiableMap(this.nestedTypes);
    }

    public Enumeration getNestedElements() {
        return this.nestedTypes.keys();
    }

    public boolean isContainer() {
        Class cls;
        if (class$org$apache$tools$ant$TaskContainer == null) {
            cls = class$("org.apache.tools.ant.TaskContainer");
            class$org$apache$tools$ant$TaskContainer = cls;
        } else {
            cls = class$org$apache$tools$ant$TaskContainer;
        }
        return cls.isAssignableFrom(this.bean);
    }

    public boolean isDynamic() {
        Class cls;
        boolean z;
        Class cls2;
        if (class$org$apache$tools$ant$DynamicElement == null) {
            cls = class$("org.apache.tools.ant.DynamicElement");
            class$org$apache$tools$ant$DynamicElement = cls;
        } else {
            cls = class$org$apache$tools$ant$DynamicElement;
        }
        if (!cls.isAssignableFrom(this.bean)) {
            if (class$org$apache$tools$ant$DynamicElementNS == null) {
                cls2 = class$("org.apache.tools.ant.DynamicElementNS");
                class$org$apache$tools$ant$DynamicElementNS = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$DynamicElementNS;
            }
            if (!cls2.isAssignableFrom(this.bean)) {
                z = false;
                return z;
            }
        }
        z = true;
        return z;
    }

    public void setAttribute(Project project, Object obj, String str, Object obj2) throws BuildException {
        AttributeSetter attributeSetter = (AttributeSetter) this.attributeSetters.get(str.toLowerCase(Locale.ENGLISH));
        if (attributeSetter != null || obj2 == null) {
            try {
                attributeSetter.setObject(project, obj, obj2);
            } catch (IllegalAccessException e) {
                throw new BuildException(e);
            } catch (InvocationTargetException e2) {
                throw extractBuildException(e2);
            }
        } else if (obj instanceof DynamicAttributeNS) {
            DynamicAttributeNS dynamicAttributeNS = (DynamicAttributeNS) obj;
            String extractUriFromComponentName = ProjectHelper.extractUriFromComponentName(ProjectHelper.extractUriFromComponentName(str));
            String extractNameFromComponentName = ProjectHelper.extractNameFromComponentName(str);
            dynamicAttributeNS.setDynamicAttribute(extractUriFromComponentName, extractNameFromComponentName, "".equals(extractUriFromComponentName) ? extractNameFromComponentName : new StringBuffer().append(extractUriFromComponentName).append(":").append(extractNameFromComponentName).toString(), obj2.toString());
        } else if (obj instanceof DynamicAttribute) {
            ((DynamicAttribute) obj).setDynamicAttribute(str.toLowerCase(Locale.ENGLISH), obj2.toString());
        } else if (str.indexOf(58) >= 0) {
        } else {
            throw new UnsupportedAttributeException(new StringBuffer().append(getElementName(project, obj)).append(" doesn't support the \"").append(str).append("\" attribute.").toString(), str);
        }
    }

    public void setAttribute(Project project, Object obj, String str, String str2) throws BuildException {
        setAttribute(project, obj, str, (Object) str2);
    }

    public void storeElement(Project project, Object obj, Object obj2, String str) throws BuildException {
        NestedCreator nestedCreator;
        if (str == null || (nestedCreator = (NestedCreator) this.nestedCreators.get(str.toLowerCase(Locale.ENGLISH))) == null) {
            return;
        }
        try {
            nestedCreator.store(obj, obj2);
        } catch (IllegalAccessException e) {
            throw new BuildException(e);
        } catch (InstantiationException e2) {
            throw new BuildException(e2);
        } catch (InvocationTargetException e3) {
            throw extractBuildException(e3);
        }
    }

    public boolean supportsCharacters() {
        return this.addText != null;
    }

    public boolean supportsNestedElement(String str) {
        return supportsNestedElement("", str);
    }

    public boolean supportsNestedElement(String str, String str2) {
        return (isDynamic() || this.addTypeMethods.size() > 0) ? true : supportsReflectElement(str, str2);
    }

    public boolean supportsNestedElement(String str, String str2, Project project, Object obj) {
        boolean z;
        if (this.addTypeMethods.size() <= 0 || createAddTypeCreator(project, obj, str2) == null) {
            z = true;
            if (!isDynamic()) {
                z = true;
                if (!supportsReflectElement(str, str2)) {
                    z = false;
                }
            }
        } else {
            z = true;
        }
        return z;
    }

    public boolean supportsReflectElement(String str, String str2) {
        boolean equals;
        if (!this.nestedCreators.containsKey(ProjectHelper.extractNameFromComponentName(str2).toLowerCase(Locale.ENGLISH))) {
            equals = false;
        } else {
            String extractUriFromComponentName = ProjectHelper.extractUriFromComponentName(str2);
            String str3 = extractUriFromComponentName;
            if (extractUriFromComponentName.equals(ProjectHelper.ANT_CORE_URI)) {
                str3 = "";
            }
            if ("".equals(str3)) {
                equals = true;
            } else {
                String str4 = str;
                if (str.equals(ProjectHelper.ANT_CORE_URI)) {
                    str4 = "";
                }
                equals = str3.equals(str4);
            }
        }
        return equals;
    }

    public void throwNotSupported(Project project, Object obj, String str) {
        throw new UnsupportedElementException(new StringBuffer().append(project.getElementName(obj)).append(NOT_SUPPORTED_CHILD_PREFIX).append(str).append(NOT_SUPPORTED_CHILD_POSTFIX).toString(), str);
    }
}
