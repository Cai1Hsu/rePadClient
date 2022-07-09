package org.apache.tools.ant.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PushbackReader;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

/* loaded from: classes.jar:org/apache/tools/ant/util/LayoutPreservingProperties.class */
public class LayoutPreservingProperties extends Properties {
    private boolean removeComments;
    private String LS = StringUtils.LINE_SEP;
    private ArrayList logicalLines = new ArrayList();
    private HashMap keyedPairLines = new HashMap();

    /* loaded from: classes.jar:org/apache/tools/ant/util/LayoutPreservingProperties$Blank.class */
    private static class Blank extends LogicalLine {
        public Blank() {
            super("");
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/LayoutPreservingProperties$Comment.class */
    private class Comment extends LogicalLine {
        private final LayoutPreservingProperties this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Comment(LayoutPreservingProperties layoutPreservingProperties, String str) {
            super(str);
            this.this$0 = layoutPreservingProperties;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine.class */
    private static abstract class LogicalLine {
        private String text;

        public LogicalLine(String str) {
            this.text = str;
        }

        public void setText(String str) {
            this.text = str;
        }

        public String toString() {
            return this.text;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/LayoutPreservingProperties$Pair.class */
    private static class Pair extends LogicalLine implements Cloneable {
        private boolean added;
        private String name;
        private String value;

        public Pair(String str) {
            super(str);
            parsePair(str);
        }

        public Pair(String str, String str2) {
            this(new StringBuffer().append(str).append("=").append(str2).toString());
        }

        private int findFirstSeparator(String str) {
            return indexOfAny(str.replaceAll("\\\\\\\\", "__").replaceAll("\\\\=", "__").replaceAll("\\\\:", "__").replaceAll("\\\\ ", "__").replaceAll("\\\\t", "__"), " :=\t");
        }

        private int indexOfAny(String str, String str2) {
            int i;
            if (str == null || str2 == null) {
                i = -1;
            } else {
                int length = str.length() + 1;
                int i2 = 0;
                while (i2 < str2.length()) {
                    int indexOf = str.indexOf(str2.charAt(i2));
                    int i3 = length;
                    if (indexOf != -1) {
                        i3 = length;
                        if (indexOf < length) {
                            i3 = indexOf;
                        }
                    }
                    i2++;
                    length = i3;
                }
                i = length;
                if (length == str.length() + 1) {
                    i = -1;
                }
            }
            return i;
        }

        private void parsePair(String str) {
            int findFirstSeparator = findFirstSeparator(str);
            if (findFirstSeparator == -1) {
                this.name = str;
                this.value = null;
            } else {
                this.name = str.substring(0, findFirstSeparator);
                this.value = str.substring(findFirstSeparator + 1, str.length());
            }
            this.name = stripStart(this.name, " \t\f");
        }

        private String stripStart(String str, String str2) {
            String substring;
            if (str == null) {
                substring = null;
            } else {
                int i = 0;
                while (i < str.length() && str2.indexOf(str.charAt(i)) != -1) {
                    i++;
                }
                substring = i == str.length() ? "" : str.substring(i);
            }
            return substring;
        }

        public Object clone() {
            Object obj = null;
            try {
                obj = super.clone();
            } catch (CloneNotSupportedException e) {
                e.printStackTrace();
            }
            return obj;
        }

        public String getName() {
            return this.name;
        }

        public String getValue() {
            return this.value;
        }

        public boolean isNew() {
            return this.added;
        }

        public void setNew(boolean z) {
            this.added = z;
        }

        public void setValue(String str) {
            this.value = str;
            setText(new StringBuffer().append(this.name).append("=").append(str).toString());
        }
    }

    public LayoutPreservingProperties() {
    }

    public LayoutPreservingProperties(Properties properties) {
        super(properties);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x004a, code lost:
        if (r10 != false) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String escape(String str, boolean z) {
        String stringBuffer;
        boolean z2;
        if (str == null) {
            stringBuffer = null;
        } else {
            char[] cArr = new char[str.length()];
            str.getChars(0, str.length(), cArr, 0);
            StringBuffer stringBuffer2 = new StringBuffer(str.length());
            boolean z3 = true;
            int i = 0;
            while (i < cArr.length) {
                char c = cArr[i];
                if (c == ' ') {
                    if (!z) {
                        z2 = z3;
                    }
                    stringBuffer2.append("\\");
                    z2 = z3;
                } else {
                    z2 = false;
                }
                int indexOf = "\t\f\r\n\\:=#!".indexOf(c);
                if (indexOf != -1) {
                    stringBuffer2.append("\\").append("tfrn\\:=#!".substring(indexOf, indexOf + 1));
                } else if (c < ' ' || c > '~') {
                    stringBuffer2.append(escapeUnicode(c));
                } else {
                    stringBuffer2.append(c);
                }
                i++;
                z3 = z2;
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    private String escapeName(String str) {
        return escape(str, true);
    }

    private String escapeUnicode(char c) {
        return new StringBuffer().append("\\").append((Object) UnicodeUtil.EscapeUnicode(c)).toString();
    }

    private String escapeValue(String str) {
        return escape(str, false);
    }

    private void innerSetProperty(String str, String str2) {
        String escapeValue = escapeValue(str2);
        if (this.keyedPairLines.containsKey(str)) {
            ((Pair) this.logicalLines.get(((Integer) this.keyedPairLines.get(str)).intValue())).setValue(escapeValue);
            return;
        }
        String escapeName = escapeName(str);
        Pair pair = new Pair(escapeName, escapeValue);
        pair.setNew(true);
        this.keyedPairLines.put(escapeName, new Integer(this.logicalLines.size()));
        this.logicalLines.add(pair);
    }

    private String readFirstLine(PushbackReader pushbackReader) throws IOException {
        StringBuffer stringBuffer = new StringBuffer(80);
        int read = pushbackReader.read();
        boolean z = false;
        this.LS = StringUtils.LINE_SEP;
        while (true) {
            if (read >= 0) {
                if (z && read != 10) {
                    pushbackReader.unread(read);
                    break;
                }
                if (read == 13) {
                    this.LS = "\r";
                    z = true;
                } else if (read == 10) {
                    this.LS = z ? "\r\n" : "\n";
                } else {
                    stringBuffer.append((char) read);
                }
                read = pushbackReader.read();
            } else {
                break;
            }
        }
        return stringBuffer.toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v42, types: [org.apache.tools.ant.util.LayoutPreservingProperties$Blank] */
    /* JADX WARN: Type inference failed for: r0v47, types: [org.apache.tools.ant.util.LayoutPreservingProperties$Comment] */
    /* JADX WARN: Type inference failed for: r7v0, types: [org.apache.tools.ant.util.LayoutPreservingProperties] */
    private String readLines(InputStream inputStream) throws IOException {
        Pair pair;
        PushbackReader pushbackReader = new PushbackReader(new InputStreamReader(inputStream, "ISO-8859-1"), 1);
        if (this.logicalLines.size() > 0) {
            this.logicalLines.add(new Blank());
        }
        String readFirstLine = readFirstLine(pushbackReader);
        BufferedReader bufferedReader = new BufferedReader(pushbackReader);
        boolean z = false;
        boolean z2 = false;
        StringBuffer stringBuffer = new StringBuffer();
        StringBuffer stringBuffer2 = new StringBuffer();
        while (readFirstLine != null) {
            stringBuffer.append(readFirstLine).append(this.LS);
            if (z) {
                readFirstLine = new StringBuffer().append("\n").append(readFirstLine).toString();
            } else {
                z2 = readFirstLine.matches("^( |\t|\f)*(#|!).*");
            }
            if (!z2) {
                z = requiresContinuation(readFirstLine);
            }
            stringBuffer2.append(readFirstLine);
            if (!z) {
                if (z2) {
                    pair = new Comment(this, stringBuffer2.toString());
                } else if (stringBuffer2.toString().trim().length() == 0) {
                    pair = new Blank();
                } else {
                    pair = new Pair(stringBuffer2.toString());
                    String unescape = unescape(pair.getName());
                    if (this.keyedPairLines.containsKey(unescape)) {
                        remove(unescape);
                    }
                    this.keyedPairLines.put(unescape, new Integer(this.logicalLines.size()));
                }
                this.logicalLines.add(pair);
                stringBuffer2.setLength(0);
            }
            readFirstLine = bufferedReader.readLine();
        }
        return stringBuffer.toString();
    }

    private void removeCommentsEndingAt(int i) {
        int i2 = i - 1;
        int i3 = i2;
        while (i3 > 0 && (this.logicalLines.get(i3) instanceof Blank)) {
            i3--;
        }
        int i4 = i3;
        if (!(this.logicalLines.get(i3) instanceof Comment)) {
            return;
        }
        while (i4 >= 0 && (this.logicalLines.get(i4) instanceof Comment)) {
            i4--;
        }
        for (int i5 = i4 + 1; i5 <= i2; i5++) {
            this.logicalLines.set(i5, null);
        }
    }

    private boolean requiresContinuation(String str) {
        boolean z = true;
        char[] charArray = str.toCharArray();
        int length = charArray.length - 1;
        while (length > 0 && charArray[length] == '\\') {
            length--;
        }
        if (((charArray.length - length) - 1) % 2 != 1) {
            z = false;
        }
        return z;
    }

    private String unescape(String str) {
        char c;
        char[] cArr = new char[str.length() + 1];
        str.getChars(0, str.length(), cArr, 0);
        cArr[str.length()] = (char) 10;
        StringBuffer stringBuffer = new StringBuffer(str.length());
        int i = 0;
        while (i < cArr.length && (c = cArr[i]) != '\n') {
            if (c == '\\') {
                i++;
                char c2 = cArr[i];
                if (c2 == 'n') {
                    stringBuffer.append('\n');
                } else if (c2 == 'r') {
                    stringBuffer.append('\r');
                } else if (c2 == 'f') {
                    stringBuffer.append('\f');
                } else if (c2 == 't') {
                    stringBuffer.append('\t');
                } else if (c2 == 'u') {
                    i += 4;
                    stringBuffer.append(unescapeUnicode(cArr, i + 1));
                } else {
                    stringBuffer.append(c2);
                }
            } else {
                stringBuffer.append(c);
            }
            i++;
        }
        return stringBuffer.toString();
    }

    private char unescapeUnicode(char[] cArr, int i) {
        return (char) Integer.parseInt(new String(cArr, i, 4), 16);
    }

    @Override // java.util.Hashtable, java.util.Map
    public void clear() {
        super.clear();
        this.keyedPairLines.clear();
        this.logicalLines.clear();
    }

    @Override // java.util.Hashtable
    public Object clone() {
        LayoutPreservingProperties layoutPreservingProperties = (LayoutPreservingProperties) super.clone();
        layoutPreservingProperties.keyedPairLines = (HashMap) this.keyedPairLines.clone();
        layoutPreservingProperties.logicalLines = (ArrayList) this.logicalLines.clone();
        int size = layoutPreservingProperties.logicalLines.size();
        for (int i = 0; i < size; i++) {
            LogicalLine logicalLine = (LogicalLine) layoutPreservingProperties.logicalLines.get(i);
            if (logicalLine instanceof Pair) {
                layoutPreservingProperties.logicalLines.set(i, ((Pair) logicalLine).clone());
            }
        }
        return layoutPreservingProperties;
    }

    public boolean isRemoveComments() {
        return this.removeComments;
    }

    public void listLines(PrintStream printStream) {
        printStream.println("-- logical lines --");
        Iterator it = this.logicalLines.iterator();
        while (it.hasNext()) {
            LogicalLine logicalLine = (LogicalLine) it.next();
            if (logicalLine instanceof Blank) {
                printStream.println(new StringBuffer().append("blank:   \"").append(logicalLine).append("\"").toString());
            } else if (logicalLine instanceof Comment) {
                printStream.println(new StringBuffer().append("comment: \"").append(logicalLine).append("\"").toString());
            } else if (logicalLine instanceof Pair) {
                printStream.println(new StringBuffer().append("pair:    \"").append(logicalLine).append("\"").toString());
            }
        }
    }

    @Override // java.util.Properties
    public void load(InputStream inputStream) throws IOException {
        super.load(new ByteArrayInputStream(readLines(inputStream).getBytes("ISO-8859-1")));
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object put(Object obj, Object obj2) throws NullPointerException {
        Object put = super.put(obj, obj2);
        innerSetProperty(obj.toString(), obj2.toString());
        return put;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public Object remove(Object obj) {
        Object remove = super.remove(obj);
        Integer num = (Integer) this.keyedPairLines.remove(obj);
        if (num != null) {
            if (this.removeComments) {
                removeCommentsEndingAt(num.intValue());
            }
            this.logicalLines.set(num.intValue(), null);
        }
        return remove;
    }

    public void saveAs(File file) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        store(fileOutputStream, (String) null);
        fileOutputStream.close();
    }

    @Override // java.util.Properties
    public Object setProperty(String str, String str2) throws NullPointerException {
        Object property = super.setProperty(str, str2);
        innerSetProperty(str, str2);
        return property;
    }

    public void setRemoveComments(boolean z) {
        this.removeComments = z;
    }

    @Override // java.util.Properties
    public void store(OutputStream outputStream, String str) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream, "ISO-8859-1");
        int size = this.logicalLines.size();
        int i = 0;
        if (str != null) {
            outputStreamWriter.write(new StringBuffer().append("#").append(str).append(this.LS).toString());
            i = 0;
            if (size > 0) {
                i = 0;
                if (this.logicalLines.get(0) instanceof Comment) {
                    i = 0;
                    if (str.equals(this.logicalLines.get(0).toString().substring(1))) {
                        i = 1;
                    }
                }
            }
        }
        int i2 = i;
        if (size > i) {
            i2 = i;
            if (this.logicalLines.get(i) instanceof Comment) {
                try {
                    DateUtils.parseDateFromHeader(this.logicalLines.get(i).toString().substring(1));
                    i2 = i + 1;
                } catch (ParseException e) {
                    i2 = i;
                }
            }
        }
        outputStreamWriter.write(new StringBuffer().append("#").append(DateUtils.getDateForHeader()).append(this.LS).toString());
        boolean z = false;
        for (LogicalLine logicalLine : this.logicalLines.subList(i2, size)) {
            if (logicalLine instanceof Pair) {
                boolean z2 = z;
                if (((Pair) logicalLine).isNew()) {
                    z2 = z;
                    if (!z) {
                        outputStreamWriter.write(this.LS);
                        z2 = true;
                    }
                }
                outputStreamWriter.write(new StringBuffer().append(logicalLine.toString()).append(this.LS).toString());
                z = z2;
            } else if (logicalLine != null) {
                outputStreamWriter.write(new StringBuffer().append(logicalLine.toString()).append(this.LS).toString());
            }
        }
        outputStreamWriter.close();
    }
}
