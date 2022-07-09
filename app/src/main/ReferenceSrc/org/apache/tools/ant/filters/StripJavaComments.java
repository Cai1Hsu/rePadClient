package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;

/* loaded from: classes.jar:org/apache/tools/ant/filters/StripJavaComments.class */
public final class StripJavaComments extends BaseFilterReader implements ChainableReader {
    private int readAheadCh = -1;
    private boolean inString = false;
    private boolean quoted = false;

    public StripJavaComments() {
    }

    public StripJavaComments(Reader reader) {
        super(reader);
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        return new StripJavaComments(reader);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        int i;
        int i2;
        boolean z = true;
        if (this.readAheadCh != -1) {
            i = this.readAheadCh;
            this.readAheadCh = -1;
        } else {
            int read = this.in.read();
            if (read == 34 && !this.quoted) {
                if (this.inString) {
                    z = false;
                }
                this.inString = z;
                this.quoted = false;
                i = read;
            } else if (read == 92) {
                this.quoted = !this.quoted;
                i = read;
            } else {
                this.quoted = false;
                i = read;
                if (!this.inString) {
                    i = read;
                    if (read == 47) {
                        int read2 = this.in.read();
                        if (read2 == 47) {
                            while (true) {
                                i = read2;
                                if (read2 == 10) {
                                    break;
                                }
                                i = read2;
                                if (read2 == -1) {
                                    break;
                                }
                                i = read2;
                                if (read2 == 13) {
                                    break;
                                }
                                read2 = this.in.read();
                            }
                        } else if (read2 == 42) {
                            while (true) {
                                i = read2;
                                if (read2 == -1) {
                                    break;
                                }
                                int read3 = this.in.read();
                                read2 = read3;
                                if (read3 == 42) {
                                    int read4 = this.in.read();
                                    while (true) {
                                        i2 = read4;
                                        if (i2 != 42) {
                                            break;
                                        }
                                        read4 = this.in.read();
                                    }
                                    read2 = i2;
                                    if (i2 == 47) {
                                        i = read();
                                        break;
                                    }
                                }
                            }
                        } else {
                            this.readAheadCh = read2;
                            i = 47;
                        }
                    }
                }
            }
        }
        return i;
    }
}
