package org.apache.tools.ant;

import java.io.Serializable;
import org.apache.tools.ant.util.FileUtils;
import org.xml.sax.Locator;

/* loaded from: classes.jar:org/apache/tools/ant/Location.class */
public class Location implements Serializable {
    private final int columnNumber;
    private final String fileName;
    private final int lineNumber;
    public static final Location UNKNOWN_LOCATION = new Location();
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();

    private Location() {
        this(null, 0, 0);
    }

    public Location(String str) {
        this(str, 0, 0);
    }

    public Location(String str, int i, int i2) {
        if (str == null || !str.startsWith("file:")) {
            this.fileName = str;
        } else {
            this.fileName = FILE_UTILS.fromURI(str);
        }
        this.lineNumber = i;
        this.columnNumber = i2;
    }

    public Location(Locator locator) {
        this(locator.getSystemId(), locator.getLineNumber(), locator.getColumnNumber());
    }

    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else {
            z = false;
            if (obj != null) {
                z = false;
                if (obj.getClass() == getClass()) {
                    z = toString().equals(obj.toString());
                }
            }
        }
        return z;
    }

    public int getColumnNumber() {
        return this.columnNumber;
    }

    public String getFileName() {
        return this.fileName;
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public int hashCode() {
        return toString().hashCode();
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (this.fileName != null) {
            stringBuffer.append(this.fileName);
            if (this.lineNumber != 0) {
                stringBuffer.append(":");
                stringBuffer.append(this.lineNumber);
            }
            stringBuffer.append(": ");
        }
        return stringBuffer.toString();
    }
}
