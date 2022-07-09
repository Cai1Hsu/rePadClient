package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.util.UnicodeUtil;

/* loaded from: classes.jar:org/apache/tools/ant/filters/EscapeUnicode.class */
public class EscapeUnicode extends BaseParamFilterReader implements ChainableReader {
    private StringBuffer unicodeBuf = new StringBuffer();

    public EscapeUnicode() {
    }

    public EscapeUnicode(Reader reader) {
        super(reader);
    }

    private void initialize() {
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public final Reader chain(Reader reader) {
        EscapeUnicode escapeUnicode = new EscapeUnicode(reader);
        escapeUnicode.setInitialized(true);
        return escapeUnicode;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public final int read() throws IOException {
        char charAt;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.unicodeBuf.length() == 0) {
            int read = this.in.read();
            charAt = read;
            if (read != -1) {
                char c = (char) read;
                charAt = read;
                if (c >= 128) {
                    this.unicodeBuf = UnicodeUtil.EscapeUnicode(c);
                    charAt = '\\';
                }
            }
        } else {
            charAt = this.unicodeBuf.charAt(0);
            this.unicodeBuf.deleteCharAt(0);
        }
        return charAt;
    }
}
