package org.apache.tools.ant.types;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/EnumeratedAttribute.class */
public abstract class EnumeratedAttribute {
    static Class class$org$apache$tools$ant$types$EnumeratedAttribute;
    private int index = -1;
    protected String value;

    protected EnumeratedAttribute() {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static EnumeratedAttribute getInstance(Class cls, String str) throws BuildException {
        Class cls2;
        if (class$org$apache$tools$ant$types$EnumeratedAttribute == null) {
            cls2 = class$("org.apache.tools.ant.types.EnumeratedAttribute");
            class$org$apache$tools$ant$types$EnumeratedAttribute = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$types$EnumeratedAttribute;
        }
        if (!cls2.isAssignableFrom(cls)) {
            throw new BuildException("You have to provide a subclass from EnumeratedAttribut as clazz-parameter.");
        }
        try {
            EnumeratedAttribute enumeratedAttribute = (EnumeratedAttribute) cls.newInstance();
            enumeratedAttribute.setValue(str);
            return enumeratedAttribute;
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    public final boolean containsValue(String str) {
        return indexOfValue(str) != -1;
    }

    public final int getIndex() {
        return this.index;
    }

    public final String getValue() {
        return this.value;
    }

    public abstract String[] getValues();

    public final int indexOfValue(String str) {
        int i;
        String[] values = getValues();
        if (values != null && str != null) {
            int i2 = 0;
            while (true) {
                if (i2 >= values.length) {
                    i = -1;
                    break;
                }
                i = i2;
                if (str.equals(values[i2])) {
                    break;
                }
                i2++;
            }
        } else {
            i = -1;
        }
        return i;
    }

    public final void setValue(String str) throws BuildException {
        int indexOfValue = indexOfValue(str);
        if (indexOfValue == -1) {
            throw new BuildException(new StringBuffer().append(str).append(" is not a legal value for this attribute").toString());
        }
        this.index = indexOfValue;
        this.value = str;
    }

    public String toString() {
        return getValue();
    }
}
