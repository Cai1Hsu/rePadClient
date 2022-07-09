package org.apache.tools.ant.types.resources;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/JavaConstantResource.class */
public class JavaConstantResource extends AbstractClasspathResource {
    @Override // org.apache.tools.ant.types.resources.AbstractClasspathResource
    protected InputStream openInputStream(ClassLoader classLoader) throws IOException {
        String name = getName();
        int lastIndexOf = name.lastIndexOf(46);
        if (lastIndexOf < 0) {
            throw new IOException(new StringBuffer().append("No class name in ").append(name).toString());
        }
        String substring = name.substring(0, lastIndexOf);
        String substring2 = name.substring(lastIndexOf + 1, name.length());
        try {
            return new ByteArrayInputStream((classLoader != null ? Class.forName(substring, true, classLoader) : Class.forName(substring)).getField(substring2).get(null).toString().getBytes("UTF-8"));
        } catch (ClassNotFoundException e) {
            throw new IOException(new StringBuffer().append("Class not found:").append(substring).toString());
        } catch (IllegalAccessException e2) {
            throw new IOException(new StringBuffer().append("Illegal access to :").append(substring2).append(" in ").append(substring).toString());
        } catch (NoSuchFieldException e3) {
            throw new IOException(new StringBuffer().append("Field not found:").append(substring2).append(" in ").append(substring).toString());
        } catch (NullPointerException e4) {
            throw new IOException(new StringBuffer().append("Not a static field: ").append(substring2).append(" in ").append(substring).toString());
        }
    }
}
