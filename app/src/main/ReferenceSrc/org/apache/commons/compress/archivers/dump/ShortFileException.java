package org.apache.commons.compress.archivers.dump;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/ShortFileException.class */
public class ShortFileException extends DumpArchiveException {
    private static final long serialVersionUID = 1;

    public ShortFileException() {
        super("unexpected EOF");
    }
}
