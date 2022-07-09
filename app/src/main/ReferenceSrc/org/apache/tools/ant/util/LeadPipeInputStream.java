package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/util/LeadPipeInputStream.class */
public class LeadPipeInputStream extends PipedInputStream {
    private static final int BYTE_MASK = 255;
    private ProjectComponent managingPc;

    public LeadPipeInputStream() {
    }

    public LeadPipeInputStream(int i) {
        setBufferSize(i);
    }

    public LeadPipeInputStream(PipedOutputStream pipedOutputStream) throws IOException {
        super(pipedOutputStream);
    }

    public LeadPipeInputStream(PipedOutputStream pipedOutputStream, int i) throws IOException {
        super(pipedOutputStream);
        setBufferSize(i);
    }

    public void log(String str, int i) {
        if (this.managingPc != null) {
            this.managingPc.log(str, i);
        } else if (i > 1) {
            System.out.println(str);
        } else {
            System.err.println(str);
        }
    }

    @Override // java.io.PipedInputStream, java.io.InputStream
    public int read() throws IOException {
        int i;
        synchronized (this) {
            try {
                i = super.read();
            } catch (IOException e) {
                String message = e.getMessage();
                if ("write end dead".equalsIgnoreCase(message) || "pipe broken".equalsIgnoreCase(message)) {
                    i = -1;
                    if (((PipedInputStream) this).in > 0) {
                        i = -1;
                        if (((PipedInputStream) this).out < ((PipedInputStream) this).buffer.length) {
                            i = -1;
                            if (((PipedInputStream) this).out > ((PipedInputStream) this).in) {
                                byte[] bArr = ((PipedInputStream) this).buffer;
                                int i2 = ((PipedInputStream) this).out;
                                ((PipedInputStream) this).out = i2 + 1;
                                i = bArr[i2] & 255;
                            }
                        }
                    }
                } else {
                    log(new StringBuffer().append("error at LeadPipeInputStream.read():  ").append(message).toString(), 2);
                    i = -1;
                }
            }
        }
        return i;
    }

    public void setBufferSize(int i) {
        synchronized (this) {
            if (i > this.buffer.length) {
                byte[] bArr = new byte[i];
                if (this.in >= 0) {
                    if (this.in > this.out) {
                        System.arraycopy(this.buffer, this.out, bArr, this.out, this.in - this.out);
                    } else {
                        int length = this.buffer.length - this.out;
                        System.arraycopy(this.buffer, this.out, bArr, 0, length);
                        System.arraycopy(this.buffer, 0, bArr, length, this.in);
                        this.in += length;
                        this.out = 0;
                    }
                }
                this.buffer = bArr;
            }
        }
    }

    public void setManagingComponent(ProjectComponent projectComponent) {
        this.managingPc = projectComponent;
    }

    public void setManagingTask(Task task) {
        setManagingComponent(task);
    }
}
