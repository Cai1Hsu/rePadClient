package org.apache.tools.ant.property;

import java.text.ParsePosition;
import java.util.Collection;
import java.util.Iterator;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/property/ParseProperties.class */
public class ParseProperties implements ParseNextProperty {
    private final Collection expanders;
    private final GetProperty getProperty;
    private final Project project;

    public ParseProperties(Project project, Collection collection, GetProperty getProperty) {
        this.project = project;
        this.expanders = collection;
        this.getProperty = getProperty;
    }

    private Object getProperty(String str) {
        return this.getProperty.getProperty(str);
    }

    private String parsePropertyName(String str, ParsePosition parsePosition) {
        String str2;
        Iterator it = this.expanders.iterator();
        while (true) {
            if (!it.hasNext()) {
                str2 = null;
                break;
            }
            String parsePropertyName = ((PropertyExpander) it.next()).parsePropertyName(str, parsePosition, this);
            if (parsePropertyName != null) {
                str2 = parsePropertyName;
                break;
            }
        }
        return str2;
    }

    public boolean containsProperties(String str) {
        boolean z;
        if (str == null) {
            z = false;
        } else {
            int length = str.length();
            ParsePosition parsePosition = new ParsePosition(0);
            while (true) {
                z = false;
                if (parsePosition.getIndex() >= length) {
                    break;
                } else if (parsePropertyName(str, parsePosition) != null) {
                    z = true;
                    break;
                } else {
                    parsePosition.setIndex(parsePosition.getIndex() + 1);
                }
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.property.ParseNextProperty
    public Project getProject() {
        return this.project;
    }

    @Override // org.apache.tools.ant.property.ParseNextProperty
    public Object parseNextProperty(String str, ParsePosition parsePosition) {
        String parsePropertyName;
        String str2 = null;
        int index = parsePosition.getIndex();
        if (index <= str.length() && (parsePropertyName = parsePropertyName(str, parsePosition)) != null) {
            Object property = getProperty(parsePropertyName);
            str2 = property;
            if (property == null) {
                if (this.project != null) {
                    this.project.log(new StringBuffer().append("Property \"").append(parsePropertyName).append("\" has not been set").toString(), 3);
                }
                str2 = str.substring(index, parsePosition.getIndex());
            }
        }
        return str2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0037, code lost:
        if (r0.getIndex() < r0) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object parseProperties(String str) {
        String str2;
        if (str == null || "".equals(str)) {
            str2 = str;
        } else {
            int length = str.length();
            ParsePosition parsePosition = new ParsePosition(0);
            Object parseNextProperty = parseNextProperty(str, parsePosition);
            if (parseNextProperty != null) {
                str2 = parseNextProperty;
            }
            StringBuffer stringBuffer = new StringBuffer(length * 2);
            if (parseNextProperty == null) {
                stringBuffer.append(str.charAt(parsePosition.getIndex()));
                parsePosition.setIndex(parsePosition.getIndex() + 1);
            } else {
                stringBuffer.append(parseNextProperty);
            }
            while (parsePosition.getIndex() < length) {
                Object parseNextProperty2 = parseNextProperty(str, parsePosition);
                if (parseNextProperty2 == null) {
                    stringBuffer.append(str.charAt(parsePosition.getIndex()));
                    parsePosition.setIndex(parsePosition.getIndex() + 1);
                } else {
                    stringBuffer.append(parseNextProperty2);
                }
            }
            str2 = stringBuffer.toString();
        }
        return str2;
    }
}
