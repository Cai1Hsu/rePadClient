package org.apache.tools.ant.filters.util;

import java.io.FilterReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.filters.BaseFilterReader;
import org.apache.tools.ant.filters.ChainableReader;
import org.apache.tools.ant.types.AntFilterReader;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.Parameterizable;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/filters/util/ChainReaderHelper.class */
public final class ChainReaderHelper {
    private static final int DEFAULT_BUFFER_SIZE = 8192;
    static Class class$java$io$FilterReader;
    static Class class$java$io$Reader;
    static Class class$org$apache$tools$ant$types$Parameterizable;
    public Reader primaryReader;
    public int bufferSize = 8192;
    public Vector filterChains = new Vector();
    private Project project = null;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static void cleanUpClassLoaders(List list) {
        Iterator it = list.iterator();
        while (it.hasNext()) {
            ((AntClassLoader) it.next()).cleanup();
        }
    }

    private Reader expandReader(AntFilterReader antFilterReader, Reader reader, List list) {
        Reader reader2;
        Class<?> cls;
        Class cls2;
        boolean z;
        Class cls3;
        Class<?> cls4;
        String className = antFilterReader.getClassName();
        Path classpath = antFilterReader.getClasspath();
        Project project = antFilterReader.getProject();
        if (className != null) {
            try {
                if (classpath == null) {
                    cls = Class.forName(className);
                } else {
                    AntClassLoader createClassLoader = project.createClassLoader(classpath);
                    list.add(createClassLoader);
                    cls = Class.forName(className, true, createClassLoader);
                }
                if (cls != null) {
                    if (class$java$io$FilterReader == null) {
                        cls2 = class$("java.io.FilterReader");
                        class$java$io$FilterReader = cls2;
                    } else {
                        cls2 = class$java$io$FilterReader;
                    }
                    if (!cls2.isAssignableFrom(cls)) {
                        throw new BuildException(new StringBuffer().append(className).append(" does not extend").append(" java.io.FilterReader").toString());
                    }
                    Constructor<?>[] constructors = cls.getConstructors();
                    int i = 0;
                    while (true) {
                        z = false;
                        if (i >= constructors.length) {
                            break;
                        }
                        Class<?>[] parameterTypes = constructors[i].getParameterTypes();
                        if (parameterTypes.length == 1) {
                            Class<?> cls5 = parameterTypes[0];
                            if (class$java$io$Reader == null) {
                                cls4 = class$("java.io.Reader");
                                class$java$io$Reader = cls4;
                            } else {
                                cls4 = class$java$io$Reader;
                            }
                            if (cls5.isAssignableFrom(cls4)) {
                                z = true;
                                break;
                            }
                        }
                        i++;
                    }
                    if (!z) {
                        throw new BuildException(new StringBuffer().append(className).append(" does not define").append(" a public constructor").append(" that takes in a Reader").append(" as its single argument.").toString());
                    }
                    Reader reader3 = (Reader) constructors[i].newInstance(reader);
                    setProjectOnObject(reader3);
                    if (class$org$apache$tools$ant$types$Parameterizable == null) {
                        cls3 = class$("org.apache.tools.ant.types.Parameterizable");
                        class$org$apache$tools$ant$types$Parameterizable = cls3;
                    } else {
                        cls3 = class$org$apache$tools$ant$types$Parameterizable;
                    }
                    reader2 = reader3;
                    if (cls3.isAssignableFrom(cls)) {
                        ((Parameterizable) reader3).setParameters(antFilterReader.getParams());
                        reader2 = reader3;
                    }
                    return reader2;
                }
            } catch (ClassNotFoundException e) {
                throw new BuildException(e);
            } catch (IllegalAccessException e2) {
                throw new BuildException(e2);
            } catch (InstantiationException e3) {
                throw new BuildException(e3);
            } catch (InvocationTargetException e4) {
                throw new BuildException(e4);
            }
        }
        reader2 = reader;
        return reader2;
    }

    private void setProjectOnObject(Object obj) {
        if (this.project == null) {
            return;
        }
        if (obj instanceof BaseFilterReader) {
            ((BaseFilterReader) obj).setProject(this.project);
        } else {
            this.project.setProjectReference(obj);
        }
    }

    /* JADX DEBUG: Incorrect finally slice size: {[CONST, MOVE] complete}, expected: {[CONST] complete} */
    /* JADX WARN: Finally extract failed */
    public Reader getAssembledReader() throws BuildException {
        Reader reader;
        if (this.primaryReader == null) {
            throw new BuildException("primaryReader must not be null.");
        }
        Reader reader2 = this.primaryReader;
        int size = this.filterChains.size();
        Vector vector = new Vector();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < size; i++) {
            Vector filterReaders = ((FilterChain) this.filterChains.elementAt(i)).getFilterReaders();
            int size2 = filterReaders.size();
            for (int i2 = 0; i2 < size2; i2++) {
                vector.addElement(filterReaders.elementAt(i2));
            }
        }
        int size3 = vector.size();
        Reader reader3 = reader2;
        if (size3 > 0) {
            int i3 = 0;
            while (i3 < size3) {
                try {
                    Object elementAt = vector.elementAt(i3);
                    if (elementAt instanceof AntFilterReader) {
                        reader = expandReader((AntFilterReader) vector.elementAt(i3), reader2, arrayList);
                    } else {
                        reader = reader2;
                        if (elementAt instanceof ChainableReader) {
                            setProjectOnObject(elementAt);
                            reader = ((ChainableReader) elementAt).chain(reader2);
                            setProjectOnObject(reader);
                        }
                    }
                    i3++;
                    reader2 = reader;
                } catch (Throwable th) {
                    if (0 == 0 && arrayList.size() > 0) {
                        cleanUpClassLoaders(arrayList);
                    }
                    throw th;
                }
            }
            reader3 = reader2;
            if (1 == 0) {
                reader3 = reader2;
                if (arrayList.size() > 0) {
                    cleanUpClassLoaders(arrayList);
                    reader3 = reader2;
                }
            }
        }
        Reader reader4 = reader3;
        if (arrayList.size() != 0) {
            reader4 = new FilterReader(this, reader3, arrayList) { // from class: org.apache.tools.ant.filters.util.ChainReaderHelper.1
                private final ChainReaderHelper this$0;
                private final ArrayList val$classLoadersToCleanUp;

                {
                    this.this$0 = this;
                    this.val$classLoadersToCleanUp = arrayList;
                }

                @Override // java.io.FilterReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
                public void close() throws IOException {
                    FileUtils.close(this.in);
                    ChainReaderHelper.cleanUpClassLoaders(this.val$classLoadersToCleanUp);
                }

                protected void finalize() throws Throwable {
                    try {
                        close();
                    } finally {
                        super.finalize();
                    }
                }
            };
        }
        return reader4;
    }

    public Project getProject() {
        return this.project;
    }

    public String readFully(Reader reader) throws IOException {
        return FileUtils.readFully(reader, this.bufferSize);
    }

    public void setBufferSize(int i) {
        this.bufferSize = i;
    }

    public void setFilterChains(Vector vector) {
        this.filterChains = vector;
    }

    public void setPrimaryReader(Reader reader) {
        this.primaryReader = reader;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
