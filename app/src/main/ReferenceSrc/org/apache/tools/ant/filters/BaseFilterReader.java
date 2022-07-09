package org.apache.tools.ant.filters;

import java.io.FilterReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/filters/BaseFilterReader.class */
public abstract class BaseFilterReader extends FilterReader {
    private static final int BUFFER_SIZE = 8192;
    private boolean initialized = false;
    private Project project = null;

    public BaseFilterReader() {
        super(new StringReader(""));
        FileUtils.close(this);
    }

    public BaseFilterReader(Reader reader) {
        super(reader);
    }

    protected final boolean getInitialized() {
        return this.initialized;
    }

    protected final Project getProject() {
        return this.project;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public final int read(char[] cArr, int i, int i2) throws IOException {
        int i3;
        int read;
        int i4 = 0;
        while (true) {
            if (i4 >= i2) {
                i3 = i2;
                break;
            }
            if (read() == -1) {
                i3 = i4;
                if (i4 == 0) {
                    i3 = -1;
                }
            } else {
                cArr[i + i4] = (char) read;
                i4++;
            }
        }
        return i3;
    }

    protected final String readFully() throws IOException {
        return FileUtils.readFully(this.in, 8192);
    }

    protected final String readLine() throws IOException {
        String stringBuffer;
        int read = this.in.read();
        if (read == -1) {
            stringBuffer = null;
        } else {
            StringBuffer stringBuffer2 = new StringBuffer();
            while (read != -1) {
                stringBuffer2.append((char) read);
                if (read == 10) {
                    break;
                }
                read = this.in.read();
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    protected final void setInitialized(boolean z) {
        this.initialized = z;
    }

    public final void setProject(Project project) {
        this.project = project;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public final long skip(long j) throws IOException, IllegalArgumentException {
        if (j < 0) {
            throw new IllegalArgumentException("skip value is negative");
        }
        long j2 = 0;
        while (true) {
            long j3 = j2;
            if (j3 >= j) {
                break;
            } else if (read() == -1) {
                j = j3;
                break;
            } else {
                j2 = j3 + 1;
            }
        }
        return j;
    }
}
