package org.apache.tools.ant.property;

import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;

/* loaded from: classes.jar:org/apache/tools/ant/property/LocalProperties.class */
public class LocalProperties extends InheritableThreadLocal implements PropertyHelper.PropertyEvaluator, PropertyHelper.PropertySetter {
    private LocalProperties() {
    }

    private LocalPropertyStack current() {
        return (LocalPropertyStack) get();
    }

    public static LocalProperties get(Project project) {
        LocalProperties localProperties;
        synchronized (LocalProperties.class) {
            try {
                LocalProperties localProperties2 = (LocalProperties) project.getReference(MagicNames.REFID_LOCAL_PROPERTIES);
                localProperties = localProperties2;
                if (localProperties2 == null) {
                    localProperties = new LocalProperties();
                    project.addReference(MagicNames.REFID_LOCAL_PROPERTIES, localProperties);
                    PropertyHelper.getPropertyHelper(project).add(localProperties);
                }
            } finally {
            }
        }
        return localProperties;
    }

    public void addLocal(String str) {
        current().addLocal(str);
    }

    public void copy() {
        set(current().copy());
    }

    public void enterScope() {
        current().enterScope();
    }

    @Override // org.apache.tools.ant.PropertyHelper.PropertyEvaluator
    public Object evaluate(String str, PropertyHelper propertyHelper) {
        return current().evaluate(str, propertyHelper);
    }

    public void exitScope() {
        current().exitScope();
    }

    @Override // java.lang.ThreadLocal
    protected Object initialValue() {
        LocalPropertyStack localPropertyStack;
        synchronized (this) {
            localPropertyStack = new LocalPropertyStack();
        }
        return localPropertyStack;
    }

    @Override // org.apache.tools.ant.PropertyHelper.PropertySetter
    public boolean set(String str, Object obj, PropertyHelper propertyHelper) {
        return current().set(str, obj, propertyHelper);
    }

    @Override // org.apache.tools.ant.PropertyHelper.PropertySetter
    public boolean setNew(String str, Object obj, PropertyHelper propertyHelper) {
        return current().setNew(str, obj, propertyHelper);
    }
}
