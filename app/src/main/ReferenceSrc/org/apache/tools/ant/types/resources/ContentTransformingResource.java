package org.apache.tools.ant.types.resources;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/ContentTransformingResource.class */
public abstract class ContentTransformingResource extends ResourceDecorator {
    private static final int BUFFER_SIZE = 8192;
    static Class class$org$apache$tools$ant$types$resources$Appendable;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;

    protected ContentTransformingResource() {
    }

    protected ContentTransformingResource(ResourceCollection resourceCollection) {
        super(resourceCollection);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public Object as(Class cls) {
        Class cls2;
        Class cls3;
        Appendable as;
        Class cls4;
        if (class$org$apache$tools$ant$types$resources$Appendable == null) {
            cls2 = class$("org.apache.tools.ant.types.resources.Appendable");
            class$org$apache$tools$ant$types$resources$Appendable = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$types$resources$Appendable;
        }
        if (cls2.isAssignableFrom(cls)) {
            as = null;
            if (isAppendSupported()) {
                Resource resource = getResource();
                if (class$org$apache$tools$ant$types$resources$Appendable == null) {
                    cls4 = class$("org.apache.tools.ant.types.resources.Appendable");
                    class$org$apache$tools$ant$types$resources$Appendable = cls4;
                } else {
                    cls4 = class$org$apache$tools$ant$types$resources$Appendable;
                }
                Appendable appendable = (Appendable) resource.as(cls4);
                as = null;
                if (appendable != null) {
                    as = new Appendable(this, appendable) { // from class: org.apache.tools.ant.types.resources.ContentTransformingResource.1
                        private final ContentTransformingResource this$0;
                        private final Appendable val$a;

                        {
                            this.this$0 = this;
                            this.val$a = appendable;
                        }

                        @Override // org.apache.tools.ant.types.resources.Appendable
                        public OutputStream getAppendOutputStream() throws IOException {
                            OutputStream appendOutputStream = this.val$a.getAppendOutputStream();
                            OutputStream outputStream = appendOutputStream;
                            if (appendOutputStream != null) {
                                outputStream = this.this$0.wrapStream(appendOutputStream);
                            }
                            return outputStream;
                        }
                    };
                }
            }
        } else {
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls3 = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls3;
            } else {
                cls3 = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            as = cls3.isAssignableFrom(cls) ? null : getResource().as(cls);
        }
        return as;
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        InputStream inputStream = getResource().getInputStream();
        InputStream inputStream2 = inputStream;
        if (inputStream != null) {
            inputStream2 = wrapStream(inputStream);
        }
        return inputStream2;
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        OutputStream outputStream = getResource().getOutputStream();
        OutputStream outputStream2 = outputStream;
        if (outputStream != null) {
            outputStream2 = wrapStream(outputStream);
        }
        return outputStream2;
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public long getSize() {
        long j;
        int i;
        if (isExists()) {
            long j2 = null;
            InputStream inputStream = null;
            try {
                try {
                    long inputStream2 = getInputStream();
                    byte[] bArr = new byte[8192];
                    int i2 = 0;
                    while (true) {
                        i = i2;
                        inputStream = inputStream2;
                        j2 = inputStream2;
                        int read = inputStream2.read(bArr, 0, bArr.length);
                        if (read <= 0) {
                            break;
                        }
                        i2 = i + read;
                    }
                    j2 = i;
                } catch (IOException e) {
                    InputStream inputStream3 = inputStream;
                    InputStream inputStream4 = inputStream;
                    InputStream inputStream5 = inputStream;
                    j2 = inputStream;
                    throw new BuildException(new StringBuffer().append("caught exception while reading ").append(getName()).toString(), e);
                }
            } finally {
                FileUtils.close(j2);
            }
        } else {
            j = 0;
        }
        return j;
    }

    protected boolean isAppendSupported() {
        return false;
    }

    protected abstract InputStream wrapStream(InputStream inputStream) throws IOException;

    protected abstract OutputStream wrapStream(OutputStream outputStream) throws IOException;
}
