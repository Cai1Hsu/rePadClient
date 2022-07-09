package org.xmlpull.mxp1;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import org.apache.http.cookie.ClientCookie;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/xmlpull/mxp1/MXParser.class */
public class MXParser implements XmlPullParser {
    protected static final String FEATURE_NAMES_INTERNED = "http://xmlpull.org/v1/doc/features.html#names-interned";
    protected static final String FEATURE_XML_ROUNDTRIP = "http://xmlpull.org/v1/doc/features.html#xml-roundtrip";
    protected static final int LOOKUP_MAX = 1024;
    protected static final char LOOKUP_MAX_CHAR = 1024;
    protected static final String PROPERTY_LOCATION = "http://xmlpull.org/v1/doc/properties.html#location";
    protected static final String PROPERTY_XMLDECL_CONTENT = "http://xmlpull.org/v1/doc/properties.html#xmldecl-content";
    protected static final String PROPERTY_XMLDECL_STANDALONE = "http://xmlpull.org/v1/doc/properties.html#xmldecl-standalone";
    protected static final String PROPERTY_XMLDECL_VERSION = "http://xmlpull.org/v1/doc/properties.html#xmldecl-version";
    protected static final int READ_CHUNK_SIZE = 8192;
    private static final boolean TRACE_SIZING = false;
    protected static final String XMLNS_URI = "http://www.w3.org/2000/xmlns/";
    protected static final String XML_URI = "http://www.w3.org/XML/1998/namespace";
    protected boolean allStringsInterned;
    protected int attributeCount;
    protected String[] attributeName;
    protected int[] attributeNameHash;
    protected String[] attributePrefix;
    protected String[] attributeUri;
    protected String[] attributeValue;
    protected char[] buf;
    protected int bufAbsoluteStart;
    protected int bufEnd;
    protected int bufLoadFactor = 95;
    protected int bufSoftLimit;
    protected int bufStart;
    protected char[] charRefOneCharBuf;
    protected int columnNumber;
    protected int depth;
    protected String[] elName;
    protected int[] elNamespaceCount;
    protected String[] elPrefix;
    protected char[][] elRawName;
    protected int[] elRawNameEnd;
    protected int[] elRawNameLine;
    protected String[] elUri;
    protected boolean emptyElementTag;
    protected int entityEnd;
    protected String[] entityName;
    protected char[][] entityNameBuf;
    protected int[] entityNameHash;
    protected String entityRefName;
    protected String[] entityReplacement;
    protected char[][] entityReplacementBuf;
    protected int eventType;
    protected String inputEncoding;
    protected InputStream inputStream;
    protected int lineNumber;
    protected String location;
    protected int namespaceEnd;
    protected String[] namespacePrefix;
    protected int[] namespacePrefixHash;
    protected String[] namespaceUri;
    protected boolean pastEndTag;
    protected char[] pc;
    protected int pcEnd;
    protected int pcStart;
    protected int pos;
    protected int posEnd;
    protected int posStart;
    protected boolean preventBufferCompaction;
    protected boolean processNamespaces;
    protected boolean reachedEnd;
    protected Reader reader;
    protected boolean roundtripSupported;
    protected boolean seenAmpersand;
    protected boolean seenDocdecl;
    protected boolean seenEndTag;
    protected boolean seenMarkup;
    protected boolean seenRoot;
    protected boolean seenStartTag;
    protected String text;
    protected boolean tokenize;
    protected boolean usePC;
    protected String xmlDeclContent;
    protected Boolean xmlDeclStandalone;
    protected String xmlDeclVersion;
    protected static final char[] VERSION = ClientCookie.VERSION_ATTR.toCharArray();
    protected static final char[] NCODING = "ncoding".toCharArray();
    protected static final char[] TANDALONE = "tandalone".toCharArray();
    protected static final char[] YES = "yes".toCharArray();
    protected static final char[] NO = "no".toCharArray();
    protected static boolean[] lookupNameStartChar = new boolean[1024];
    protected static boolean[] lookupNameChar = new boolean[1024];

    static {
        setNameStart(':');
        char c = 'A';
        while (true) {
            char c2 = c;
            if (c2 > 'Z') {
                break;
            }
            setNameStart(c2);
            c = (char) (c2 + 1);
        }
        setNameStart('_');
        char c3 = 'a';
        while (true) {
            char c4 = c3;
            if (c4 > 'z') {
                break;
            }
            setNameStart(c4);
            c3 = (char) (c4 + 1);
        }
        char c5 = 192;
        while (true) {
            char c6 = c5;
            if (c6 > 767) {
                break;
            }
            setNameStart(c6);
            c5 = (char) (c6 + 1);
        }
        char c7 = 880;
        while (true) {
            char c8 = c7;
            if (c8 > 893) {
                break;
            }
            setNameStart(c8);
            c7 = (char) (c8 + 1);
        }
        char c9 = 895;
        while (true) {
            char c10 = c9;
            if (c10 >= 1024) {
                break;
            }
            setNameStart(c10);
            c9 = (char) (c10 + 1);
        }
        setName('-');
        setName('.');
        char c11 = '0';
        while (true) {
            char c12 = c11;
            if (c12 > '9') {
                break;
            }
            setName(c12);
            c11 = (char) (c12 + 1);
        }
        setName((char) 183);
        char c13 = 768;
        while (true) {
            char c14 = c13;
            if (c14 <= 879) {
                setName(c14);
                c13 = (char) (c14 + 1);
            } else {
                return;
            }
        }
    }

    public MXParser() {
        this.buf = new char[Runtime.getRuntime().freeMemory() > 1000000 ? 8192 : 256];
        this.bufSoftLimit = (this.bufLoadFactor * this.buf.length) / 100;
        this.pc = new char[Runtime.getRuntime().freeMemory() > 1000000 ? 8192 : 64];
        this.charRefOneCharBuf = new char[1];
    }

    protected static final int fastHash(char[] cArr, int i, int i2) {
        int i3;
        if (i2 == 0) {
            i3 = 0;
        } else {
            int i4 = (cArr[i] << 7) + cArr[(i + i2) - 1];
            int i5 = i4;
            if (i2 > 16) {
                i5 = (i4 << 7) + cArr[(i2 / 4) + i];
            }
            i3 = i5;
            if (i2 > 8) {
                i3 = (i5 << 7) + cArr[(i2 / 2) + i];
            }
        }
        return i3;
    }

    private static int findFragment(int i, char[] cArr, int i2, int i3) {
        int i4;
        if (i2 >= i) {
            int i5 = i2;
            if (i3 - i2 > 65) {
                i5 = i3 - 10;
            }
            int i6 = i5 + 1;
            while (true) {
                int i7 = i6 - 1;
                i4 = i7;
                if (i7 <= i) {
                    break;
                }
                i4 = i7;
                if (i3 - i7 > 65) {
                    break;
                }
                i6 = i7;
                if (cArr[i7] == '<') {
                    i6 = i7;
                    if (i5 - i7 > 10) {
                        i4 = i7;
                        break;
                    }
                }
            }
        } else {
            int i8 = i;
            if (i > i3) {
                i8 = i3;
            }
            i4 = i8;
        }
        return i4;
    }

    private static final void setName(char c) {
        lookupNameChar[c] = true;
    }

    private static final void setNameStart(char c) {
        lookupNameStartChar[c] = true;
        setName(c);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void defineEntityReplacementText(String str, String str2) throws XmlPullParserException {
        ensureEntityCapacity();
        this.entityName[this.entityEnd] = newString(str.toCharArray(), 0, str.length());
        this.entityNameBuf[this.entityEnd] = str.toCharArray();
        this.entityReplacement[this.entityEnd] = str2;
        this.entityReplacementBuf[this.entityEnd] = str2.toCharArray();
        if (!this.allStringsInterned) {
            this.entityNameHash[this.entityEnd] = fastHash(this.entityNameBuf[this.entityEnd], 0, this.entityNameBuf[this.entityEnd].length);
        }
        this.entityEnd++;
    }

    protected void ensureAttributesCapacity(int i) {
        int length = this.attributeName != null ? this.attributeName.length : 0;
        if (i >= length) {
            int i2 = i > 7 ? i * 2 : 8;
            boolean z = length > 0;
            String[] strArr = new String[i2];
            if (z) {
                System.arraycopy(this.attributeName, 0, strArr, 0, length);
            }
            this.attributeName = strArr;
            String[] strArr2 = new String[i2];
            if (z) {
                System.arraycopy(this.attributePrefix, 0, strArr2, 0, length);
            }
            this.attributePrefix = strArr2;
            String[] strArr3 = new String[i2];
            if (z) {
                System.arraycopy(this.attributeUri, 0, strArr3, 0, length);
            }
            this.attributeUri = strArr3;
            String[] strArr4 = new String[i2];
            if (z) {
                System.arraycopy(this.attributeValue, 0, strArr4, 0, length);
            }
            this.attributeValue = strArr4;
            if (this.allStringsInterned) {
                return;
            }
            int[] iArr = new int[i2];
            if (z) {
                System.arraycopy(this.attributeNameHash, 0, iArr, 0, length);
            }
            this.attributeNameHash = iArr;
        }
    }

    /* JADX WARN: Type inference failed for: r0v39, types: [java.lang.Object, char[], char[][]] */
    protected void ensureElementsCapacity() {
        int length = this.elName != null ? this.elName.length : 0;
        if (this.depth + 1 >= length) {
            int i = (this.depth >= 7 ? this.depth * 2 : 8) + 2;
            boolean z = length > 0;
            String[] strArr = new String[i];
            if (z) {
                System.arraycopy(this.elName, 0, strArr, 0, length);
            }
            this.elName = strArr;
            String[] strArr2 = new String[i];
            if (z) {
                System.arraycopy(this.elPrefix, 0, strArr2, 0, length);
            }
            this.elPrefix = strArr2;
            String[] strArr3 = new String[i];
            if (z) {
                System.arraycopy(this.elUri, 0, strArr3, 0, length);
            }
            this.elUri = strArr3;
            int[] iArr = new int[i];
            if (z) {
                System.arraycopy(this.elNamespaceCount, 0, iArr, 0, length);
            } else {
                iArr[0] = 0;
            }
            this.elNamespaceCount = iArr;
            int[] iArr2 = new int[i];
            if (z) {
                System.arraycopy(this.elRawNameEnd, 0, iArr2, 0, length);
            }
            this.elRawNameEnd = iArr2;
            int[] iArr3 = new int[i];
            if (z) {
                System.arraycopy(this.elRawNameLine, 0, iArr3, 0, length);
            }
            this.elRawNameLine = iArr3;
            ?? r0 = new char[i];
            if (z) {
                System.arraycopy(this.elRawName, 0, r0, 0, length);
            }
            this.elRawName = r0;
        }
    }

    /* JADX WARN: Type inference failed for: r0v11, types: [java.lang.Object, char[], char[][]] */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.Object, char[], char[][]] */
    protected void ensureEntityCapacity() {
        if (this.entityEnd >= (this.entityReplacementBuf != null ? this.entityReplacementBuf.length : 0)) {
            int i = this.entityEnd > 7 ? this.entityEnd * 2 : 8;
            String[] strArr = new String[i];
            ?? r0 = new char[i];
            String[] strArr2 = new String[i];
            ?? r02 = new char[i];
            if (this.entityName != null) {
                System.arraycopy(this.entityName, 0, strArr, 0, this.entityEnd);
                System.arraycopy(this.entityNameBuf, 0, r0, 0, this.entityEnd);
                System.arraycopy(this.entityReplacement, 0, strArr2, 0, this.entityEnd);
                System.arraycopy(this.entityReplacementBuf, 0, r02, 0, this.entityEnd);
            }
            this.entityName = strArr;
            this.entityNameBuf = r0;
            this.entityReplacement = strArr2;
            this.entityReplacementBuf = r02;
            if (this.allStringsInterned) {
                return;
            }
            int[] iArr = new int[i];
            if (this.entityNameHash != null) {
                System.arraycopy(this.entityNameHash, 0, iArr, 0, this.entityEnd);
            }
            this.entityNameHash = iArr;
        }
    }

    protected void ensureNamespacesCapacity(int i) {
        if (i >= (this.namespacePrefix != null ? this.namespacePrefix.length : 0)) {
            int i2 = i > 7 ? i * 2 : 8;
            String[] strArr = new String[i2];
            String[] strArr2 = new String[i2];
            if (this.namespacePrefix != null) {
                System.arraycopy(this.namespacePrefix, 0, strArr, 0, this.namespaceEnd);
                System.arraycopy(this.namespaceUri, 0, strArr2, 0, this.namespaceEnd);
            }
            this.namespacePrefix = strArr;
            this.namespaceUri = strArr2;
            if (this.allStringsInterned) {
                return;
            }
            int[] iArr = new int[i2];
            if (this.namespacePrefixHash != null) {
                System.arraycopy(this.namespacePrefixHash, 0, iArr, 0, this.namespaceEnd);
            }
            this.namespacePrefixHash = iArr;
        }
    }

    protected void ensurePC(int i) {
        char[] cArr = new char[i > 8192 ? i * 2 : 16384];
        System.arraycopy(this.pc, 0, cArr, 0, this.pcEnd);
        this.pc = cArr;
    }

    protected void fillBuf() throws IOException, XmlPullParserException {
        boolean z;
        boolean z2;
        if (this.reader == null) {
            throw new XmlPullParserException("reader must be set before parsing is started");
        }
        if (this.bufEnd > this.bufSoftLimit) {
            boolean z3 = this.bufStart > this.bufSoftLimit;
            if (this.preventBufferCompaction) {
                z = false;
                z2 = true;
            } else {
                z = z3;
                z2 = false;
                if (!z3) {
                    if (this.bufStart < this.buf.length / 2) {
                        z2 = true;
                        z = z3;
                    } else {
                        z = true;
                        z2 = false;
                    }
                }
            }
            if (z) {
                System.arraycopy(this.buf, this.bufStart, this.buf, 0, this.bufEnd - this.bufStart);
            } else if (!z2) {
                throw new XmlPullParserException("internal error in fillBuffer()");
            } else {
                char[] cArr = new char[this.buf.length * 2];
                System.arraycopy(this.buf, this.bufStart, cArr, 0, this.bufEnd - this.bufStart);
                this.buf = cArr;
                if (this.bufLoadFactor > 0) {
                    this.bufSoftLimit = (int) ((this.bufLoadFactor * this.buf.length) / 100);
                }
            }
            this.bufEnd -= this.bufStart;
            this.pos -= this.bufStart;
            this.posStart -= this.bufStart;
            this.posEnd -= this.bufStart;
            this.bufAbsoluteStart += this.bufStart;
            this.bufStart = 0;
        }
        int read = this.reader.read(this.buf, this.bufEnd, this.buf.length - this.bufEnd > 8192 ? 8192 : this.buf.length - this.bufEnd);
        if (read <= 0) {
            if (read != -1) {
                throw new IOException(new StringBuffer().append("error reading input, returned ").append(read).toString());
            } else {
                if (this.bufAbsoluteStart == 0 && this.pos == 0) {
                    throw new EOFException("input contained no data");
                }
                if (this.seenRoot && this.depth == 0) {
                    this.reachedEnd = true;
                    return;
                }
                StringBuffer stringBuffer = new StringBuffer();
                if (this.depth > 0) {
                    stringBuffer.append(" - expected end tag");
                    if (this.depth > 1) {
                        stringBuffer.append("s");
                    }
                    stringBuffer.append(" ");
                    for (int i = this.depth; i > 0; i--) {
                        stringBuffer.append("</").append(new String(this.elRawName[i], 0, this.elRawNameEnd[i])).append('>');
                    }
                    stringBuffer.append(" to close");
                    for (int i2 = this.depth; i2 > 0; i2--) {
                        if (i2 != this.depth) {
                            stringBuffer.append(" and");
                        }
                        stringBuffer.append(new StringBuffer().append(" start tag <").append(new String(this.elRawName[i2], 0, this.elRawNameEnd[i2])).append(">").toString());
                        stringBuffer.append(new StringBuffer().append(" from line ").append(this.elRawNameLine[i2]).toString());
                    }
                    stringBuffer.append(", parser stopped on");
                }
                throw new EOFException(new StringBuffer().append("no more data available").append(stringBuffer.toString()).append(getPositionDescription()).toString());
            }
        }
        this.bufEnd += read;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getAttributeCount() {
        return this.eventType != 2 ? -1 : this.attributeCount;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeName(int i) {
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (i >= 0 && i < this.attributeCount) {
            return this.attributeName[i];
        }
        throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeNamespace(int i) {
        String str;
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (!this.processNamespaces) {
            str = "";
        } else if (i < 0 || i >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
        } else {
            str = this.attributeUri[i];
        }
        return str;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributePrefix(int i) {
        String str;
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (!this.processNamespaces) {
            str = null;
        } else if (i < 0 || i >= this.attributeCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
        } else {
            str = this.attributePrefix[i];
        }
        return str;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeType(int i) {
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (i >= 0 && i < this.attributeCount) {
            return "CDATA";
        }
        throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeValue(int i) {
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (i >= 0 && i < this.attributeCount) {
            return this.attributeValue[i];
        }
        throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getAttributeValue(String str, String str2) {
        String str3;
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("only START_TAG can have attributes").append(getPositionDescription()).toString());
        }
        if (str2 == null) {
            throw new IllegalArgumentException("attribute name can not be null");
        }
        if (this.processNamespaces) {
            String str4 = str;
            if (str == null) {
                str4 = "";
            }
            for (int i = 0; i < this.attributeCount; i++) {
                if ((str4 == this.attributeUri[i] || str4.equals(this.attributeUri[i])) && str2.equals(this.attributeName[i])) {
                    str3 = this.attributeValue[i];
                    break;
                }
            }
            str3 = null;
        } else {
            String str5 = str;
            if (str != null) {
                str5 = str;
                if (str.length() == 0) {
                    str5 = null;
                }
            }
            if (str5 != null) {
                throw new IllegalArgumentException("when namespaces processing is disabled attribute namespace must be null");
            }
            for (int i2 = 0; i2 < this.attributeCount; i2++) {
                if (str2.equals(this.attributeName[i2])) {
                    str3 = this.attributeValue[i2];
                    break;
                }
            }
            str3 = null;
        }
        return str3;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getColumnNumber() {
        return this.columnNumber;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getDepth() {
        return this.depth;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getEventType() throws XmlPullParserException {
        return this.eventType;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean getFeature(String str) {
        boolean z;
        if (str == null) {
            throw new IllegalArgumentException("feature name should not be null");
        }
        if (XmlPullParser.FEATURE_PROCESS_NAMESPACES.equals(str)) {
            z = this.processNamespaces;
        } else {
            z = false;
            if (!FEATURE_NAMES_INTERNED.equals(str)) {
                z = false;
                if (!XmlPullParser.FEATURE_PROCESS_DOCDECL.equals(str)) {
                    z = false;
                    if (FEATURE_XML_ROUNDTRIP.equals(str)) {
                        z = this.roundtripSupported;
                    }
                }
            }
        }
        return z;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getInputEncoding() {
        return this.inputEncoding;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getLineNumber() {
        return this.lineNumber;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getName() {
        String str;
        if (this.eventType == 2) {
            str = this.elName[this.depth];
        } else if (this.eventType == 3) {
            str = this.elName[this.depth];
        } else if (this.eventType == 6) {
            if (this.entityRefName == null) {
                this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
            }
            str = this.entityRefName;
        } else {
            str = null;
        }
        return str;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespace() {
        return this.eventType == 2 ? this.processNamespaces ? this.elUri[this.depth] : "" : this.eventType == 3 ? this.processNamespaces ? this.elUri[this.depth] : "" : null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespace(String str) {
        String str2;
        if (str != null) {
            int i = this.namespaceEnd - 1;
            while (true) {
                if (i >= 0) {
                    if (str.equals(this.namespacePrefix[i])) {
                        str2 = this.namespaceUri[i];
                        break;
                    }
                    i--;
                } else if ("xml".equals(str)) {
                    str2 = XML_URI;
                } else if ("xmlns".equals(str)) {
                    str2 = XMLNS_URI;
                }
            }
            str2 = null;
        } else {
            for (int i2 = this.namespaceEnd - 1; i2 >= 0; i2--) {
                if (this.namespacePrefix[i2] == null) {
                    str2 = this.namespaceUri[i2];
                    break;
                }
            }
            str2 = null;
        }
        return str2;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int getNamespaceCount(int i) throws XmlPullParserException {
        int i2;
        if (!this.processNamespaces || i == 0) {
            i2 = 0;
        } else if (i < 0 || i > this.depth) {
            throw new IllegalArgumentException(new StringBuffer().append("allowed namespace depth 0..").append(this.depth).append(" not ").append(i).toString());
        } else {
            i2 = this.elNamespaceCount[i];
        }
        return i2;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespacePrefix(int i) throws XmlPullParserException {
        if (i < this.namespaceEnd) {
            return this.namespacePrefix[i];
        }
        throw new XmlPullParserException(new StringBuffer().append("position ").append(i).append(" exceeded number of available namespaces ").append(this.namespaceEnd).toString());
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getNamespaceUri(int i) throws XmlPullParserException {
        if (i < this.namespaceEnd) {
            return this.namespaceUri[i];
        }
        throw new XmlPullParserException(new StringBuffer().append("position ").append(i).append(" exceeded number of available namespaces ").append(this.namespaceEnd).toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0045, code lost:
        if (r0 > 0) goto L11;
     */
    @Override // org.xmlpull.v1.XmlPullParser
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getPositionDescription() {
        String str = null;
        String str2 = null;
        if (this.posStart <= this.pos) {
            int findFragment = findFragment(0, this.buf, this.posStart, this.pos);
            if (findFragment < this.pos) {
                str2 = new String(this.buf, findFragment, this.pos - findFragment);
            }
            if (this.bufAbsoluteStart <= 0) {
                str = str2;
            }
            str = new StringBuffer().append("...").append(str2).toString();
        }
        return new StringBuffer().append(" ").append(XmlPullParser.TYPES[this.eventType]).append(str != null ? new StringBuffer().append(" seen ").append(printable(str)).append("...").toString() : "").append(" ").append(this.location != null ? this.location : "").append("@").append(getLineNumber()).append(":").append(getColumnNumber()).toString();
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getPrefix() {
        return this.eventType == 2 ? this.elPrefix[this.depth] : this.eventType == 3 ? this.elPrefix[this.depth] : null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public Object getProperty(String str) {
        if (str == null) {
            throw new IllegalArgumentException("property name should not be null");
        }
        return PROPERTY_XMLDECL_VERSION.equals(str) ? this.xmlDeclVersion : PROPERTY_XMLDECL_STANDALONE.equals(str) ? this.xmlDeclStandalone : PROPERTY_XMLDECL_CONTENT.equals(str) ? this.xmlDeclContent : PROPERTY_LOCATION.equals(str) ? this.location : null;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String getText() {
        String str;
        if (this.eventType == 0 || this.eventType == 1) {
            str = null;
        } else if (this.eventType == 6) {
            str = this.text;
        } else {
            if (this.text == null) {
                if (!this.usePC || this.eventType == 2 || this.eventType == 3) {
                    this.text = new String(this.buf, this.posStart, this.posEnd - this.posStart);
                } else {
                    this.text = new String(this.pc, this.pcStart, this.pcEnd - this.pcStart);
                }
            }
            str = this.text;
        }
        return str;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public char[] getTextCharacters(int[] iArr) {
        char[] cArr;
        if (this.eventType == 4) {
            if (this.usePC) {
                iArr[0] = this.pcStart;
                iArr[1] = this.pcEnd - this.pcStart;
                cArr = this.pc;
            } else {
                iArr[0] = this.posStart;
                iArr[1] = this.posEnd - this.posStart;
                cArr = this.buf;
            }
        } else if (this.eventType == 2 || this.eventType == 3 || this.eventType == 5 || this.eventType == 9 || this.eventType == 6 || this.eventType == 8 || this.eventType == 7 || this.eventType == 10) {
            iArr[0] = this.posStart;
            iArr[1] = this.posEnd - this.posStart;
            cArr = this.buf;
        } else if (this.eventType != 0 && this.eventType != 1) {
            throw new IllegalArgumentException(new StringBuffer().append("unknown text eventType: ").append(this.eventType).toString());
        } else {
            iArr[1] = -1;
            iArr[0] = -1;
            cArr = null;
        }
        return cArr;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isAttributeDefault(int i) {
        if (this.eventType != 2) {
            throw new IndexOutOfBoundsException("only START_TAG can have attributes");
        }
        if (i >= 0 && i < this.attributeCount) {
            return false;
        }
        throw new IndexOutOfBoundsException(new StringBuffer().append("attribute position must be 0..").append(this.attributeCount - 1).append(" and not ").append(i).toString());
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isEmptyElementTag() throws XmlPullParserException {
        if (this.eventType != 2) {
            throw new XmlPullParserException("parser must be on START_TAG to check for empty element", this, null);
        }
        return this.emptyElementTag;
    }

    protected boolean isNameChar(char c) {
        return (c < 1024 && lookupNameChar[c]) || (c >= 1024 && c <= 8231) || ((c >= 8234 && c <= 8591) || (c >= 10240 && c <= 65519));
    }

    protected boolean isNameStartChar(char c) {
        return (c < 1024 && lookupNameStartChar[c]) || (c >= 1024 && c <= 8231) || ((c >= 8234 && c <= 8591) || (c >= 10240 && c <= 65519));
    }

    protected boolean isS(char c) {
        return c == ' ' || c == '\n' || c == '\r' || c == '\t';
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public boolean isWhitespace() throws XmlPullParserException {
        boolean z;
        if (this.eventType != 4 && this.eventType != 5) {
            z = true;
            if (this.eventType != 7) {
                throw new XmlPullParserException("no content available to check for white spaces");
            }
        } else if (this.usePC) {
            int i = this.pcStart;
            while (true) {
                z = true;
                if (i >= this.pcEnd) {
                    break;
                } else if (!isS(this.pc[i])) {
                    z = false;
                    break;
                } else {
                    i++;
                }
            }
        } else {
            int i2 = this.posStart;
            while (true) {
                z = true;
                if (i2 >= this.posEnd) {
                    break;
                } else if (!isS(this.buf[i2])) {
                    z = false;
                    break;
                } else {
                    i2++;
                }
            }
        }
        return z;
    }

    protected void joinPC() {
        int i = this.posEnd - this.posStart;
        int i2 = this.pcEnd + i + 1;
        if (i2 >= this.pc.length) {
            ensurePC(i2);
        }
        System.arraycopy(this.buf, this.posStart, this.pc, this.pcEnd, i);
        this.pcEnd += i;
        this.usePC = true;
    }

    protected char[] lookuEntityReplacement(int i) throws XmlPullParserException, IOException {
        char[] cArr;
        if (!this.allStringsInterned) {
            int fastHash = fastHash(this.buf, this.posStart, this.posEnd - this.posStart);
            for (int i2 = this.entityEnd - 1; i2 >= 0; i2--) {
                if (fastHash == this.entityNameHash[i2] && i == this.entityNameBuf[i2].length) {
                    char[] cArr2 = this.entityNameBuf[i2];
                    for (int i3 = 0; i3 < i; i3++) {
                        if (this.buf[this.posStart + i3] != cArr2[i3]) {
                            break;
                        }
                    }
                    if (this.tokenize) {
                        this.text = this.entityReplacement[i2];
                    }
                    cArr = this.entityReplacementBuf[i2];
                }
            }
            cArr = null;
        } else {
            this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
            for (int i4 = this.entityEnd - 1; i4 >= 0; i4--) {
                if (this.entityRefName == this.entityName[i4]) {
                    if (this.tokenize) {
                        this.text = this.entityReplacement[i4];
                    }
                    cArr = this.entityReplacementBuf[i4];
                }
            }
            cArr = null;
        }
        return cArr;
    }

    protected char more() throws IOException, XmlPullParserException {
        char c;
        if (this.pos >= this.bufEnd) {
            fillBuf();
            if (this.reachedEnd) {
                c = 65535;
                return c;
            }
        }
        char[] cArr = this.buf;
        int i = this.pos;
        this.pos = i + 1;
        char c2 = cArr[i];
        if (c2 == '\n') {
            this.lineNumber++;
            this.columnNumber = 1;
            c = c2;
        } else {
            this.columnNumber++;
            c = c2;
        }
        return c;
    }

    protected String newString(char[] cArr, int i, int i2) {
        return new String(cArr, i, i2);
    }

    protected String newStringIntern(char[] cArr, int i, int i2) {
        return new String(cArr, i, i2).intern();
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int next() throws XmlPullParserException, IOException {
        this.tokenize = false;
        return nextImpl();
    }

    protected int nextImpl() throws XmlPullParserException, IOException {
        int parseEpilog;
        char more;
        boolean z;
        boolean z2;
        char more2;
        this.text = null;
        this.pcStart = 0;
        this.pcEnd = 0;
        this.usePC = false;
        this.bufStart = this.posEnd;
        if (this.pastEndTag) {
            this.pastEndTag = false;
            this.depth--;
            this.namespaceEnd = this.elNamespaceCount[this.depth];
        }
        if (this.emptyElementTag) {
            this.emptyElementTag = false;
            this.pastEndTag = true;
            parseEpilog = 3;
            this.eventType = 3;
        } else if (this.depth <= 0) {
            parseEpilog = this.seenRoot ? parseEpilog() : parseProlog();
        } else if (this.seenStartTag) {
            this.seenStartTag = false;
            parseEpilog = parseStartTag();
            this.eventType = parseEpilog;
        } else if (this.seenEndTag) {
            this.seenEndTag = false;
            parseEpilog = parseEndTag();
            this.eventType = parseEpilog;
        } else {
            if (this.seenMarkup) {
                this.seenMarkup = false;
                more = '<';
            } else if (this.seenAmpersand) {
                this.seenAmpersand = false;
                more = '&';
            } else {
                more = more();
            }
            this.posStart = this.pos - 1;
            boolean z3 = false;
            boolean z4 = false;
            while (true) {
                boolean z5 = z4;
                if (more == '<') {
                    if (z3 && this.tokenize) {
                        this.seenMarkup = true;
                        parseEpilog = 4;
                        this.eventType = 4;
                        break;
                    }
                    char more3 = more();
                    if (more3 == '/') {
                        if (this.tokenize || !z3) {
                            parseEpilog = parseEndTag();
                            this.eventType = parseEpilog;
                        } else {
                            this.seenEndTag = true;
                            parseEpilog = 4;
                            this.eventType = 4;
                        }
                    } else if (more3 == '!') {
                        char more4 = more();
                        if (more4 == '-') {
                            parseComment();
                            if (this.tokenize) {
                                parseEpilog = 9;
                                this.eventType = 9;
                                break;
                            }
                            if (this.usePC || !z3) {
                                this.posStart = this.pos;
                                z = z5;
                            } else {
                                z = true;
                            }
                            more = more();
                            z4 = z;
                        } else if (more4 != '[') {
                            throw new XmlPullParserException(new StringBuffer().append("unexpected character in markup ").append(printable(more4)).toString(), this, null);
                        } else {
                            parseCDSect(z3);
                            if (this.tokenize) {
                                parseEpilog = 5;
                                this.eventType = 5;
                                break;
                            }
                            z = z5;
                            if (this.posEnd - this.posStart > 0) {
                                z3 = true;
                                z = z5;
                                if (!this.usePC) {
                                    z = true;
                                    z3 = true;
                                }
                            }
                            more = more();
                            z4 = z;
                        }
                    } else if (more3 == '?') {
                        parsePI();
                        if (this.tokenize) {
                            parseEpilog = 8;
                            this.eventType = 8;
                            break;
                        }
                        if (this.usePC || !z3) {
                            this.posStart = this.pos;
                            z = z5;
                        } else {
                            z = true;
                        }
                        more = more();
                        z4 = z;
                    } else if (!isNameStartChar(more3)) {
                        throw new XmlPullParserException(new StringBuffer().append("unexpected character in markup ").append(printable(more3)).toString(), this, null);
                    } else {
                        if (this.tokenize || !z3) {
                            parseEpilog = parseStartTag();
                            this.eventType = parseEpilog;
                        } else {
                            this.seenStartTag = true;
                            parseEpilog = 4;
                            this.eventType = 4;
                        }
                    }
                } else if (more != '&') {
                    boolean z6 = z5;
                    if (z5) {
                        joinPC();
                        z6 = false;
                    }
                    z3 = true;
                    boolean z7 = false;
                    boolean z8 = !this.tokenize || !this.roundtripSupported;
                    boolean z9 = false;
                    boolean z10 = false;
                    char c = more;
                    do {
                        if (c == ']') {
                            if (z9) {
                                z10 = true;
                                z2 = z9;
                            } else {
                                z2 = true;
                            }
                        } else if (z10 && c == '>') {
                            throw new XmlPullParserException("characters ]]> are not allowed in content", this, null);
                        } else {
                            z2 = z9;
                            if (z9) {
                                z2 = false;
                                z10 = false;
                            }
                        }
                        boolean z11 = z7;
                        if (z8) {
                            if (c == '\r') {
                                z11 = true;
                                this.posEnd = this.pos - 1;
                                if (!this.usePC) {
                                    if (this.posEnd > this.posStart) {
                                        joinPC();
                                    } else {
                                        this.usePC = true;
                                        this.pcEnd = 0;
                                        this.pcStart = 0;
                                    }
                                }
                                if (this.pcEnd >= this.pc.length) {
                                    ensurePC(this.pcEnd);
                                }
                                char[] cArr = this.pc;
                                int i = this.pcEnd;
                                this.pcEnd = i + 1;
                                cArr[i] = (char) 10;
                            } else if (c == '\n') {
                                if (!z7 && this.usePC) {
                                    if (this.pcEnd >= this.pc.length) {
                                        ensurePC(this.pcEnd);
                                    }
                                    char[] cArr2 = this.pc;
                                    int i2 = this.pcEnd;
                                    this.pcEnd = i2 + 1;
                                    cArr2[i2] = (char) 10;
                                }
                                z11 = false;
                            } else {
                                if (this.usePC) {
                                    if (this.pcEnd >= this.pc.length) {
                                        ensurePC(this.pcEnd);
                                    }
                                    char[] cArr3 = this.pc;
                                    int i3 = this.pcEnd;
                                    this.pcEnd = i3 + 1;
                                    cArr3[i3] = c;
                                }
                                z11 = false;
                            }
                        }
                        more2 = more();
                        if (more2 == '<') {
                            break;
                        }
                        c = more2;
                        z7 = z11;
                        z9 = z2;
                    } while (more2 != '&');
                    this.posEnd = this.pos - 1;
                    more = more2;
                    z4 = z6;
                } else if (this.tokenize && z3) {
                    this.seenAmpersand = true;
                    parseEpilog = 4;
                    this.eventType = 4;
                    break;
                } else {
                    int i4 = this.posStart;
                    int i5 = this.bufAbsoluteStart;
                    int i6 = this.posEnd;
                    int i7 = this.bufAbsoluteStart;
                    char[] parseEntityRef = parseEntityRef();
                    if (this.tokenize) {
                        parseEpilog = 6;
                        this.eventType = 6;
                        break;
                    } else if (parseEntityRef == null) {
                        if (this.entityRefName == null) {
                            this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
                        }
                        throw new XmlPullParserException(new StringBuffer().append("could not resolve entity named '").append(printable(this.entityRefName)).append("'").toString(), this, null);
                    } else {
                        this.posStart = (i4 + i5) - this.bufAbsoluteStart;
                        this.posEnd = (i6 + i7) - this.bufAbsoluteStart;
                        z = z5;
                        if (!this.usePC) {
                            if (z3) {
                                joinPC();
                                z = false;
                            } else {
                                this.usePC = true;
                                this.pcEnd = 0;
                                this.pcStart = 0;
                                z = z5;
                            }
                        }
                        for (char c2 : parseEntityRef) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr4 = this.pc;
                            int i8 = this.pcEnd;
                            this.pcEnd = i8 + 1;
                            cArr4[i8] = c2;
                        }
                        z3 = true;
                        more = more();
                        z4 = z;
                    }
                }
            }
        }
        return parseEpilog;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int nextTag() throws XmlPullParserException, IOException {
        next();
        if (this.eventType == 4 && isWhitespace()) {
            next();
        }
        if (this.eventType == 2 || this.eventType == 3) {
            return this.eventType;
        }
        throw new XmlPullParserException(new StringBuffer().append("expected START_TAG or END_TAG not ").append(XmlPullParser.TYPES[getEventType()]).toString(), this, null);
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public String nextText() throws XmlPullParserException, IOException {
        String str;
        if (getEventType() != 2) {
            throw new XmlPullParserException("parser must be on START_TAG to read next text", this, null);
        }
        int next = next();
        if (next == 4) {
            str = getText();
            if (next() != 3) {
                throw new XmlPullParserException(new StringBuffer().append("TEXT must be immediately followed by END_TAG and not ").append(XmlPullParser.TYPES[getEventType()]).toString(), this, null);
            }
        } else if (next != 3) {
            throw new XmlPullParserException("parser must be on START_TAG or TEXT to read text", this, null);
        } else {
            str = "";
        }
        return str;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public int nextToken() throws XmlPullParserException, IOException {
        this.tokenize = true;
        return nextImpl();
    }

    protected char parseAttribute() throws XmlPullParserException, IOException {
        char c;
        boolean z;
        char c2;
        String newString;
        int i = this.posStart;
        int i2 = this.bufAbsoluteStart;
        int i3 = (this.pos - 1) + this.bufAbsoluteStart;
        int i4 = -1;
        char c3 = this.buf[this.pos - 1];
        if (c3 != ':' || !this.processNamespaces) {
            boolean z2 = this.processNamespaces && c3 == 'x';
            int i5 = 0;
            char more = more();
            while (isNameChar(more)) {
                int i6 = i4;
                boolean z3 = z2;
                int i7 = i5;
                if (this.processNamespaces) {
                    boolean z4 = z2;
                    int i8 = i5;
                    if (z2) {
                        z4 = z2;
                        i8 = i5;
                        if (i5 < 5) {
                            int i9 = i5 + 1;
                            if (i9 == 1) {
                                z4 = z2;
                                i8 = i9;
                                if (more != 'm') {
                                    z4 = false;
                                    i8 = i9;
                                }
                            } else if (i9 == 2) {
                                z4 = z2;
                                i8 = i9;
                                if (more != 'l') {
                                    z4 = false;
                                    i8 = i9;
                                }
                            } else if (i9 == 3) {
                                z4 = z2;
                                i8 = i9;
                                if (more != 'n') {
                                    z4 = false;
                                    i8 = i9;
                                }
                            } else if (i9 == 4) {
                                z4 = z2;
                                i8 = i9;
                                if (more != 's') {
                                    z4 = false;
                                    i8 = i9;
                                }
                            } else {
                                z4 = z2;
                                i8 = i9;
                                if (i9 == 5) {
                                    z4 = z2;
                                    i8 = i9;
                                    if (more != ':') {
                                        throw new XmlPullParserException("after xmlns in attribute name must be colonwhen namespaces are enabled", this, null);
                                    }
                                }
                            }
                        }
                    }
                    i6 = i4;
                    z3 = z4;
                    i7 = i8;
                    if (more != ':') {
                        continue;
                    } else if (i4 != -1) {
                        throw new XmlPullParserException("only one colon is allowed in attribute name when namespaces are enabled", this, null);
                    } else {
                        i6 = (this.pos - 1) + this.bufAbsoluteStart;
                        i7 = i8;
                        z3 = z4;
                    }
                }
                more = more();
                i4 = i6;
                z2 = z3;
                i5 = i7;
            }
            ensureAttributesCapacity(this.attributeCount);
            String str = null;
            if (this.processNamespaces) {
                if (i5 < 4) {
                    z2 = false;
                }
                if (z2) {
                    c = more;
                    z = z2;
                    if (i4 != -1) {
                        int i10 = (this.pos - 2) - (i4 - this.bufAbsoluteStart);
                        if (i10 == 0) {
                            throw new XmlPullParserException("namespace prefix is required after xmlns:  when namespaces are enabled", this, null);
                        }
                        str = newString(this.buf, (i4 - this.bufAbsoluteStart) + 1, i10);
                        z = z2;
                        c = more;
                    }
                } else {
                    if (i4 != -1) {
                        this.attributePrefix[this.attributeCount] = newString(this.buf, i3 - this.bufAbsoluteStart, i4 - i3);
                        int i11 = this.pos;
                        int i12 = this.bufAbsoluteStart;
                        String[] strArr = this.attributeName;
                        int i13 = this.attributeCount;
                        newString = newString(this.buf, (i4 - this.bufAbsoluteStart) + 1, (i11 - 2) - (i4 - i12));
                        strArr[i13] = newString;
                    } else {
                        this.attributePrefix[this.attributeCount] = null;
                        String[] strArr2 = this.attributeName;
                        int i14 = this.attributeCount;
                        newString = newString(this.buf, i3 - this.bufAbsoluteStart, (this.pos - 1) - (i3 - this.bufAbsoluteStart));
                        strArr2[i14] = newString;
                    }
                    c = more;
                    str = newString;
                    z = z2;
                    if (!this.allStringsInterned) {
                        this.attributeNameHash[this.attributeCount] = newString.hashCode();
                        c = more;
                        str = newString;
                        z = z2;
                    }
                }
            } else {
                String[] strArr3 = this.attributeName;
                int i15 = this.attributeCount;
                String newString2 = newString(this.buf, i3 - this.bufAbsoluteStart, (this.pos - 1) - (i3 - this.bufAbsoluteStart));
                strArr3[i15] = newString2;
                c = more;
                str = newString2;
                z = z2;
                if (!this.allStringsInterned) {
                    this.attributeNameHash[this.attributeCount] = newString2.hashCode();
                    c = more;
                    str = newString2;
                    z = z2;
                }
            }
            while (isS(c)) {
                c = more();
            }
            if (c != '=') {
                throw new XmlPullParserException("expected = after attribute name", this, null);
            }
            char more2 = more();
            while (true) {
                c2 = more2;
                if (!isS(c2)) {
                    break;
                }
                more2 = more();
            }
            if (c2 != '\"' && c2 != '\'') {
                throw new XmlPullParserException(new StringBuffer().append("attribute value must start with quotation or apostrophe not ").append(printable(c2)).toString(), this, null);
            }
            boolean z5 = false;
            this.usePC = false;
            this.pcStart = this.pcEnd;
            this.posStart = this.pos;
            while (true) {
                char more3 = more();
                if (more3 == c2) {
                    if (!this.processNamespaces || !z) {
                        if (!this.usePC) {
                            this.attributeValue[this.attributeCount] = new String(this.buf, this.posStart, (this.pos - 1) - this.posStart);
                        } else {
                            this.attributeValue[this.attributeCount] = new String(this.pc, this.pcStart, this.pcEnd - this.pcStart);
                        }
                        this.attributeCount++;
                    } else {
                        String newStringIntern = !this.usePC ? newStringIntern(this.buf, this.posStart, (this.pos - 1) - this.posStart) : newStringIntern(this.pc, this.pcStart, this.pcEnd - this.pcStart);
                        ensureNamespacesCapacity(this.namespaceEnd);
                        int i16 = -1;
                        if (i4 == -1) {
                            this.namespacePrefix[this.namespaceEnd] = null;
                            if (!this.allStringsInterned) {
                                i16 = -1;
                                this.namespacePrefixHash[this.namespaceEnd] = -1;
                            }
                        } else if (newStringIntern.length() == 0) {
                            throw new XmlPullParserException("non-default namespace can not be declared to be empty string", this, null);
                        } else {
                            this.namespacePrefix[this.namespaceEnd] = str;
                            if (!this.allStringsInterned) {
                                int[] iArr = this.namespacePrefixHash;
                                int i17 = this.namespaceEnd;
                                i16 = str.hashCode();
                                iArr[i17] = i16;
                            }
                        }
                        this.namespaceUri[this.namespaceEnd] = newStringIntern;
                        int i18 = this.elNamespaceCount[this.depth - 1];
                        for (int i19 = this.namespaceEnd - 1; i19 >= i18; i19--) {
                            if (((this.allStringsInterned || str == null) && this.namespacePrefix[i19] == str) || (!this.allStringsInterned && str != null && this.namespacePrefixHash[i19] == i16 && str.equals(this.namespacePrefix[i19]))) {
                                throw new XmlPullParserException(new StringBuffer().append("duplicated namespace declaration for ").append(str == null ? "default" : new StringBuffer().append("'").append(str).append("'").toString()).append(" prefix").toString(), this, null);
                            }
                        }
                        this.namespaceEnd++;
                    }
                    this.posStart = (i + i2) - this.bufAbsoluteStart;
                    return more3;
                } else if (more3 == '<') {
                    throw new XmlPullParserException("markup not allowed inside attribute value - illegal < ", this, null);
                } else {
                    if (more3 == '&') {
                        this.posEnd = this.pos - 1;
                        if (!this.usePC) {
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcEnd = 0;
                                this.pcStart = 0;
                            }
                        }
                        char[] parseEntityRef = parseEntityRef();
                        if (parseEntityRef == null) {
                            if (this.entityRefName == null) {
                                this.entityRefName = newString(this.buf, this.posStart, this.posEnd - this.posStart);
                            }
                            throw new XmlPullParserException(new StringBuffer().append("could not resolve entity named '").append(printable(this.entityRefName)).append("'").toString(), this, null);
                        }
                        for (char c4 : parseEntityRef) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr = this.pc;
                            int i20 = this.pcEnd;
                            this.pcEnd = i20 + 1;
                            cArr[i20] = c4;
                        }
                    } else if (more3 == '\t' || more3 == '\n' || more3 == '\r') {
                        if (!this.usePC) {
                            this.posEnd = this.pos - 1;
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcStart = 0;
                                this.pcEnd = 0;
                            }
                        }
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        if (more3 != '\n' || !z5) {
                            char[] cArr2 = this.pc;
                            int i21 = this.pcEnd;
                            this.pcEnd = i21 + 1;
                            cArr2[i21] = (char) 32;
                        }
                    } else if (this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr3 = this.pc;
                        int i22 = this.pcEnd;
                        this.pcEnd = i22 + 1;
                        cArr3[i22] = more3;
                    }
                    z5 = more3 == '\r';
                }
            }
        } else {
            throw new XmlPullParserException("when namespaces processing enabled colon can not be at attribute name start", this, null);
        }
    }

    protected void parseCDSect(boolean z) throws XmlPullParserException, IOException {
        boolean z2;
        boolean z3;
        boolean z4 = false;
        if (more() != 'C') {
            throw new XmlPullParserException("expected <[CDATA[ for comment start", this, null);
        }
        if (more() != 'D') {
            throw new XmlPullParserException("expected <[CDATA[ for comment start", this, null);
        }
        if (more() != 'A') {
            throw new XmlPullParserException("expected <[CDATA[ for comment start", this, null);
        }
        if (more() != 'T') {
            throw new XmlPullParserException("expected <[CDATA[ for comment start", this, null);
        }
        if (more() != 'A') {
            throw new XmlPullParserException("expected <[CDATA[ for comment start", this, null);
        }
        if (more() != '[') {
            throw new XmlPullParserException("expected <![CDATA[ for comment start", this, null);
        }
        int i = this.pos + this.bufAbsoluteStart;
        int i2 = this.lineNumber;
        int i3 = this.columnNumber;
        if (!this.tokenize || !this.roundtripSupported) {
            z4 = true;
        }
        if (z4 && z) {
            try {
                if (!this.usePC) {
                    if (this.posEnd > this.posStart) {
                        joinPC();
                    } else {
                        this.usePC = true;
                        this.pcEnd = 0;
                        this.pcStart = 0;
                    }
                }
            } catch (EOFException e) {
                throw new XmlPullParserException(new StringBuffer().append("CDATA section started on line ").append(i2).append(" and column ").append(i3).append(" was not closed").toString(), this, e);
            }
        }
        boolean z5 = false;
        boolean z6 = false;
        boolean z7 = false;
        while (true) {
            char more = more();
            if (more == ']') {
                if (!z5) {
                    z2 = true;
                    z3 = z6;
                } else {
                    z3 = true;
                    z2 = z5;
                }
            } else if (more != '>') {
                z2 = z5;
                z3 = z6;
                if (z5) {
                    z2 = false;
                    z3 = z6;
                }
            } else if (z5 && z6) {
                break;
            } else {
                z3 = false;
                z2 = false;
            }
            z5 = z2;
            z6 = z3;
            if (z4) {
                if (more == '\r') {
                    z7 = true;
                    this.posStart = i - this.bufAbsoluteStart;
                    this.posEnd = this.pos - 1;
                    if (!this.usePC) {
                        if (this.posEnd > this.posStart) {
                            joinPC();
                        } else {
                            this.usePC = true;
                            this.pcEnd = 0;
                            this.pcStart = 0;
                        }
                    }
                    if (this.pcEnd >= this.pc.length) {
                        ensurePC(this.pcEnd);
                    }
                    char[] cArr = this.pc;
                    int i4 = this.pcEnd;
                    this.pcEnd = i4 + 1;
                    cArr[i4] = (char) 10;
                    z5 = z2;
                    z6 = z3;
                } else if (more == '\n') {
                    if (!z7 && this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr2 = this.pc;
                        int i5 = this.pcEnd;
                        this.pcEnd = i5 + 1;
                        cArr2[i5] = (char) 10;
                    }
                    z7 = false;
                    z5 = z2;
                    z6 = z3;
                } else {
                    if (this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr3 = this.pc;
                        int i6 = this.pcEnd;
                        this.pcEnd = i6 + 1;
                        cArr3[i6] = more;
                    }
                    z7 = false;
                    z5 = z2;
                    z6 = z3;
                }
            }
        }
        if (z4 && this.usePC) {
            this.pcEnd -= 2;
        }
        this.posStart = i - this.bufAbsoluteStart;
        this.posEnd = this.pos - 3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0087, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("in comment after two dashes (--) next character must be > not ").append(printable(r0)).toString(), r6, null);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected void parseComment() throws XmlPullParserException, IOException {
        boolean z;
        boolean z2;
        boolean z3 = true;
        if (more() != '-') {
            throw new XmlPullParserException("expected <!-- for comment start", this, null);
        }
        if (this.tokenize) {
            this.posStart = this.pos;
        }
        int i = this.lineNumber;
        int i2 = this.columnNumber;
        try {
            if (!this.tokenize || this.roundtripSupported) {
                z3 = false;
            }
            boolean z4 = false;
            boolean z5 = false;
            boolean z6 = false;
            while (true) {
                char more = more();
                if (z6 && more != '>') {
                    break;
                }
                if (more == '-') {
                    if (!z5) {
                        z = true;
                        z2 = z6;
                    } else {
                        z2 = true;
                        z = false;
                    }
                } else if (more != '>') {
                    z = false;
                    z2 = z6;
                } else if (z6) {
                    if (!this.tokenize) {
                        return;
                    }
                    this.posEnd = this.pos - 3;
                    if (!this.usePC) {
                        return;
                    }
                    this.pcEnd -= 2;
                    return;
                } else {
                    z2 = false;
                    z = false;
                }
                z5 = z;
                z6 = z2;
                if (z3) {
                    if (more == '\r') {
                        z4 = true;
                        if (!this.usePC) {
                            this.posEnd = this.pos - 1;
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcEnd = 0;
                                this.pcStart = 0;
                            }
                        }
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr = this.pc;
                        int i3 = this.pcEnd;
                        this.pcEnd = i3 + 1;
                        cArr[i3] = (char) 10;
                        z5 = z;
                        z6 = z2;
                    } else if (more == '\n') {
                        if (!z4 && this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr2 = this.pc;
                            int i4 = this.pcEnd;
                            this.pcEnd = i4 + 1;
                            cArr2[i4] = (char) 10;
                        }
                        z4 = false;
                        z5 = z;
                        z6 = z2;
                    } else {
                        if (this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr3 = this.pc;
                            int i5 = this.pcEnd;
                            this.pcEnd = i5 + 1;
                            cArr3[i5] = more;
                        }
                        z4 = false;
                        z5 = z;
                        z6 = z2;
                    }
                }
            }
        } catch (EOFException e) {
            throw new XmlPullParserException(new StringBuffer().append("comment started on line ").append(i).append(" and column ").append(i2).append(" was not closed").toString(), this, e);
        }
    }

    protected void parseDocdecl() throws XmlPullParserException, IOException {
        if (more() != 'O') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        if (more() != 'C') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        if (more() != 'T') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        if (more() != 'Y') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        if (more() != 'P') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        if (more() != 'E') {
            throw new XmlPullParserException("expected <!DOCTYPE", this, null);
        }
        this.posStart = this.pos;
        int i = 0;
        boolean z = this.tokenize && !this.roundtripSupported;
        boolean z2 = false;
        while (true) {
            char more = more();
            int i2 = i;
            if (more == '[') {
                i2 = i + 1;
            }
            int i3 = i2;
            if (more == ']') {
                i3 = i2 - 1;
            }
            if (more == '>' && i3 == 0) {
                this.posEnd = this.pos - 1;
                return;
            }
            i = i3;
            if (z) {
                if (more == '\r') {
                    z2 = true;
                    if (!this.usePC) {
                        this.posEnd = this.pos - 1;
                        if (this.posEnd > this.posStart) {
                            joinPC();
                        } else {
                            this.usePC = true;
                            this.pcEnd = 0;
                            this.pcStart = 0;
                        }
                    }
                    if (this.pcEnd >= this.pc.length) {
                        ensurePC(this.pcEnd);
                    }
                    char[] cArr = this.pc;
                    int i4 = this.pcEnd;
                    this.pcEnd = i4 + 1;
                    cArr[i4] = (char) 10;
                    i = i3;
                } else if (more == '\n') {
                    if (!z2 && this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr2 = this.pc;
                        int i5 = this.pcEnd;
                        this.pcEnd = i5 + 1;
                        cArr2[i5] = (char) 10;
                    }
                    z2 = false;
                    i = i3;
                } else {
                    if (this.usePC) {
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr3 = this.pc;
                        int i6 = this.pcEnd;
                        this.pcEnd = i6 + 1;
                        cArr3[i6] = more;
                    }
                    z2 = false;
                    i = i3;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x017a, code lost:
        if (isS(r14) == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x017d, code lost:
        r14 = more();
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x018c, code lost:
        if (r14 == '>') goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x01c3, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("expected > to finish end tag not ").append(printable(r14)).append(" from line ").append(r7.elRawNameLine[r7.depth]).toString(), r7, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x01c4, code lost:
        r7.posEnd = r7.pos;
        r7.pastEndTag = true;
        r7.eventType = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x01d7, code lost:
        return 3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int parseEndTag() throws XmlPullParserException, IOException {
        char more;
        char more2 = more();
        if (!isNameStartChar(more2)) {
            throw new XmlPullParserException(new StringBuffer().append("expected name start and not ").append(printable(more2)).toString(), this, null);
        }
        this.posStart = this.pos - 3;
        int i = this.pos;
        int i2 = this.bufAbsoluteStart;
        do {
            more = more();
        } while (isNameChar(more));
        int i3 = ((i - 1) + i2) - this.bufAbsoluteStart;
        int i4 = (this.pos - 1) - i3;
        char[] cArr = this.elRawName[this.depth];
        if (this.elRawNameEnd[this.depth] != i4) {
            throw new XmlPullParserException(new StringBuffer().append("end tag name </").append(new String(this.buf, i3, i4)).append("> must match start tag name <").append(new String(cArr, 0, this.elRawNameEnd[this.depth])).append(">").append(" from line ").append(this.elRawNameLine[this.depth]).toString(), this, null);
        }
        int i5 = 0;
        while (true) {
            char c = more;
            if (i5 < i4) {
                int i6 = i3 + 1;
                if (this.buf[i3] != cArr[i5]) {
                    throw new XmlPullParserException(new StringBuffer().append("end tag name </").append(new String(this.buf, (i6 - i5) - 1, i4)).append("> must be the same as start tag <").append(new String(cArr, 0, i4)).append(">").append(" from line ").append(this.elRawNameLine[this.depth]).toString(), this, null);
                }
                i5++;
                i3 = i6;
            }
        }
    }

    protected char[] parseEntityRef() throws XmlPullParserException, IOException {
        char more;
        char[] cArr;
        char more2;
        this.entityRefName = null;
        this.posStart = this.pos;
        char more3 = more();
        if (more3 != '#') {
            if (!isNameStartChar(more3)) {
                throw new XmlPullParserException(new StringBuffer().append("entity reference names can not start with character '").append(printable(more3)).append("'").toString(), this, null);
            }
            do {
                more = more();
                if (more == ';') {
                    this.posEnd = this.pos - 1;
                    int i = this.posEnd - this.posStart;
                    if (i == 2 && this.buf[this.posStart] == 'l' && this.buf[this.posStart + 1] == 't') {
                        if (this.tokenize) {
                            this.text = "<";
                        }
                        this.charRefOneCharBuf[0] = (char) 60;
                        cArr = this.charRefOneCharBuf;
                    } else if (i == 3 && this.buf[this.posStart] == 'a' && this.buf[this.posStart + 1] == 'm' && this.buf[this.posStart + 2] == 'p') {
                        if (this.tokenize) {
                            this.text = "&";
                        }
                        this.charRefOneCharBuf[0] = (char) 38;
                        cArr = this.charRefOneCharBuf;
                    } else if (i == 2 && this.buf[this.posStart] == 'g' && this.buf[this.posStart + 1] == 't') {
                        if (this.tokenize) {
                            this.text = ">";
                        }
                        this.charRefOneCharBuf[0] = (char) 62;
                        cArr = this.charRefOneCharBuf;
                    } else if (i == 4 && this.buf[this.posStart] == 'a' && this.buf[this.posStart + 1] == 'p' && this.buf[this.posStart + 2] == 'o' && this.buf[this.posStart + 3] == 's') {
                        if (this.tokenize) {
                            this.text = "'";
                        }
                        this.charRefOneCharBuf[0] = (char) 39;
                        cArr = this.charRefOneCharBuf;
                    } else if (i == 4 && this.buf[this.posStart] == 'q' && this.buf[this.posStart + 1] == 'u' && this.buf[this.posStart + 2] == 'o' && this.buf[this.posStart + 3] == 't') {
                        if (this.tokenize) {
                            this.text = "\"";
                        }
                        this.charRefOneCharBuf[0] = (char) 34;
                        cArr = this.charRefOneCharBuf;
                    } else {
                        char[] lookuEntityReplacement = lookuEntityReplacement(i);
                        cArr = lookuEntityReplacement;
                        if (lookuEntityReplacement == null) {
                            if (this.tokenize) {
                                this.text = null;
                            }
                            cArr = null;
                        }
                    }
                }
            } while (isNameChar(more));
            throw new XmlPullParserException(new StringBuffer().append("entity reference name can not contain character ").append(printable(more)).append("'").toString(), this, null);
        }
        char c = 0;
        char more4 = more();
        char c2 = more4;
        if (more4 == 'x') {
            char c3 = 0;
            while (true) {
                c = c3;
                more2 = more();
                if (more2 >= '0' && more2 <= '9') {
                    c3 = (char) ((c * 16) + (more2 - '0'));
                } else if (more2 >= 'a' && more2 <= 'f') {
                    c3 = (char) ((c * 16) + (more2 - 'W'));
                } else if (more2 < 'A' || more2 > 'F') {
                    break;
                } else {
                    c3 = (char) ((c * 16) + (more2 - '7'));
                }
            }
            if (more2 != ';') {
                throw new XmlPullParserException(new StringBuffer().append("character reference (with hex value) may not contain ").append(printable(more2)).toString(), this, null);
            }
        } else {
            while (c2 >= '0' && c2 <= '9') {
                c = (char) ((c * '\n') + (c2 - '0'));
                c2 = more();
            }
            if (c2 != ';') {
                throw new XmlPullParserException(new StringBuffer().append("character reference (with decimal value) may not contain ").append(printable(c2)).toString(), this, null);
            }
        }
        this.posEnd = this.pos - 1;
        this.charRefOneCharBuf[0] = c;
        if (this.tokenize) {
            this.text = newString(this.charRefOneCharBuf, 0, 1);
        }
        cArr = this.charRefOneCharBuf;
        return cArr;
    }

    protected int parseEpilog() throws XmlPullParserException, IOException {
        int i;
        boolean z;
        if (this.eventType == 1) {
            throw new XmlPullParserException("already reached end of XML input", this, null);
        }
        if (this.reachedEnd) {
            this.eventType = 1;
            i = 1;
        } else {
            boolean z2 = false;
            boolean z3 = false;
            boolean z4 = false;
            if (this.tokenize) {
                z4 = false;
                if (!this.roundtripSupported) {
                    z4 = true;
                }
            }
            try {
                char more = this.seenMarkup ? this.buf[this.pos - 1] : more();
                this.seenMarkup = false;
                this.posStart = this.pos - 1;
                if (!this.reachedEnd) {
                    boolean z5 = false;
                    char c = more;
                    while (true) {
                        if (c != '<') {
                            boolean z6 = z3;
                            if (!isS(c)) {
                                boolean z7 = z3;
                                boolean z8 = z3;
                                boolean z9 = z3;
                                boolean z10 = z3;
                                throw new XmlPullParserException(new StringBuffer().append("in epilog non whitespace content is not allowed but got ").append(printable(c)).toString(), this, null);
                            }
                            z2 = true;
                            z = z5;
                            if (z4) {
                                if (c == '\r') {
                                    z = true;
                                    if (!this.usePC) {
                                        this.posEnd = this.pos - 1;
                                        if (this.posEnd > this.posStart) {
                                            joinPC();
                                        } else {
                                            this.usePC = true;
                                            this.pcEnd = 0;
                                            this.pcStart = 0;
                                        }
                                    }
                                    if (this.pcEnd >= this.pc.length) {
                                        ensurePC(this.pcEnd);
                                    }
                                    char[] cArr = this.pc;
                                    int i2 = this.pcEnd;
                                    this.pcEnd = i2 + 1;
                                    cArr[i2] = (char) 10;
                                    z2 = true;
                                } else if (c == '\n') {
                                    if (!z5 && this.usePC) {
                                        if (this.pcEnd >= this.pc.length) {
                                            ensurePC(this.pcEnd);
                                        }
                                        char[] cArr2 = this.pc;
                                        int i3 = this.pcEnd;
                                        this.pcEnd = i3 + 1;
                                        cArr2[i3] = (char) 10;
                                    }
                                    z = false;
                                    z2 = true;
                                } else {
                                    if (this.usePC) {
                                        if (this.pcEnd >= this.pc.length) {
                                            ensurePC(this.pcEnd);
                                        }
                                        char[] cArr3 = this.pc;
                                        int i4 = this.pcEnd;
                                        this.pcEnd = i4 + 1;
                                        cArr3[i4] = c;
                                    }
                                    z = false;
                                    z2 = true;
                                }
                            }
                        } else if (z3 && this.tokenize) {
                            boolean z11 = z3;
                            this.posEnd = this.pos - 1;
                            boolean z12 = z3;
                            this.seenMarkup = true;
                            boolean z13 = z3;
                            this.eventType = 7;
                            i = 7;
                            break;
                        } else {
                            char more2 = more();
                            boolean z14 = z3;
                            if (this.reachedEnd) {
                                z2 = z3;
                                break;
                            } else if (more2 == '?') {
                                parsePI();
                                boolean z15 = z3;
                                z2 = z3;
                                z = z5;
                                if (this.tokenize) {
                                    boolean z16 = z3;
                                    this.eventType = 8;
                                    i = 8;
                                    break;
                                }
                            } else if (more2 != '!') {
                                if (more2 == '/') {
                                    boolean z17 = z3;
                                    boolean z18 = z3;
                                    boolean z19 = z3;
                                    XmlPullParserException xmlPullParserException = new XmlPullParserException(new StringBuffer().append("end tag not allowed in epilog but got ").append(printable(more2)).toString(), this, null);
                                    boolean z20 = z3;
                                    throw xmlPullParserException;
                                }
                                boolean z21 = z3;
                                if (isNameStartChar(more2)) {
                                    boolean z22 = z3;
                                    boolean z23 = z3;
                                    boolean z24 = z3;
                                    boolean z25 = z3;
                                    XmlPullParserException xmlPullParserException2 = new XmlPullParserException(new StringBuffer().append("start tag not allowed in epilog but got ").append(printable(more2)).toString(), this, null);
                                    boolean z26 = z3;
                                    throw xmlPullParserException2;
                                }
                                boolean z27 = z3;
                                boolean z28 = z3;
                                boolean z29 = z3;
                                boolean z30 = z3;
                                XmlPullParserException xmlPullParserException3 = new XmlPullParserException(new StringBuffer().append("in epilog expected ignorable content and not ").append(printable(more2)).toString(), this, null);
                                boolean z31 = z3;
                                throw xmlPullParserException3;
                            } else {
                                char more3 = more();
                                z2 = z3;
                                if (this.reachedEnd) {
                                    break;
                                } else if (more3 == 'D') {
                                    parseDocdecl();
                                    boolean z32 = z3;
                                    z2 = z3;
                                    z = z5;
                                    if (this.tokenize) {
                                        boolean z33 = z3;
                                        this.eventType = 10;
                                        i = 10;
                                        break;
                                    }
                                } else if (more3 != '-') {
                                    boolean z34 = z3;
                                    boolean z35 = z3;
                                    boolean z36 = z3;
                                    XmlPullParserException xmlPullParserException4 = new XmlPullParserException(new StringBuffer().append("unexpected markup <!").append(printable(more3)).toString(), this, null);
                                    boolean z37 = z3;
                                    throw xmlPullParserException4;
                                } else {
                                    parseComment();
                                    boolean z38 = z3;
                                    z2 = z3;
                                    z = z5;
                                    if (this.tokenize) {
                                        boolean z39 = z3;
                                        this.eventType = 9;
                                        i = 9;
                                        break;
                                    }
                                }
                            }
                        }
                        c = more();
                        z3 = z2;
                        z5 = z;
                        if (this.reachedEnd) {
                            break;
                        }
                    }
                }
            } catch (EOFException e) {
                this.reachedEnd = true;
                z2 = false;
            }
            if (!this.reachedEnd) {
                throw new XmlPullParserException("internal error in parseEpilog");
            }
            if (!this.tokenize || !z2) {
                this.eventType = 1;
                i = 1;
            } else {
                this.posEnd = this.pos;
                this.eventType = 7;
                i = 7;
            }
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:72:0x01c6, code lost:
        if (r7.buf[r0] == 'X') goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01e4, code lost:
        if (r7.buf[r0 + 1] == 'M') goto L80;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected boolean parsePI() throws XmlPullParserException, IOException {
        int i;
        boolean z;
        if (this.tokenize) {
            this.posStart = this.pos;
        }
        int i2 = this.lineNumber;
        int i3 = this.columnNumber;
        int i4 = this.pos + this.bufAbsoluteStart;
        int i5 = -1;
        boolean z2 = this.tokenize && !this.roundtripSupported;
        boolean z3 = false;
        boolean z4 = false;
        try {
            char more = more();
            char c = more;
            if (isS(more)) {
                throw new XmlPullParserException("processing instruction PITarget must be exactly after <? and not white space character", this, null);
            }
            while (true) {
                if (c == '?') {
                    z4 = true;
                    i = i5;
                } else if (c != '>') {
                    int i6 = i5;
                    if (i5 == -1) {
                        i6 = i5;
                        if (isS(c)) {
                            int i7 = (this.pos - 1) + this.bufAbsoluteStart;
                            i6 = i7;
                            if (i7 - i4 == 3) {
                                if (this.buf[i4] != 'x') {
                                    i6 = i7;
                                }
                                if (this.buf[i4 + 1] != 'm') {
                                    i6 = i7;
                                }
                                if (this.buf[i4 + 2] == 'l') {
                                    break;
                                }
                                i6 = i7;
                                if (this.buf[i4 + 2] == 'L') {
                                    break;
                                }
                            }
                        }
                    }
                    i = i6;
                    z4 = false;
                } else if (z4) {
                    if (i5 == -1) {
                        int i8 = (this.pos - 2) + this.bufAbsoluteStart;
                    }
                    int i9 = this.bufAbsoluteStart;
                    int i10 = this.bufAbsoluteStart;
                    if (this.tokenize) {
                        this.posEnd = this.pos - 2;
                        if (z2) {
                            this.pcEnd--;
                        }
                    }
                    z = true;
                } else {
                    z4 = false;
                    i = i5;
                }
                boolean z5 = z3;
                if (z2) {
                    if (c == '\r') {
                        z5 = true;
                        if (!this.usePC) {
                            this.posEnd = this.pos - 1;
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcEnd = 0;
                                this.pcStart = 0;
                            }
                        }
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr = this.pc;
                        int i11 = this.pcEnd;
                        this.pcEnd = i11 + 1;
                        cArr[i11] = (char) 10;
                    } else if (c == '\n') {
                        if (!z3 && this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr2 = this.pc;
                            int i12 = this.pcEnd;
                            this.pcEnd = i12 + 1;
                            cArr2[i12] = (char) 10;
                        }
                        z5 = false;
                    } else {
                        if (this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr3 = this.pc;
                            int i13 = this.pcEnd;
                            this.pcEnd = i13 + 1;
                            cArr3[i13] = c;
                        }
                        z5 = false;
                    }
                }
                c = more();
                z3 = z5;
                i5 = i;
            }
            if (i4 > 3) {
                throw new XmlPullParserException("processing instruction can not have PITarget with reserveld xml name", this, null);
            }
            if (this.buf[i4] != 'x' && this.buf[i4 + 1] != 'm' && this.buf[i4 + 2] != 'l') {
                throw new XmlPullParserException("XMLDecl must have xml name in lowercase", this, null);
            }
            parseXmlDecl(c);
            if (this.tokenize) {
                this.posEnd = this.pos - 2;
            }
            int i14 = (i4 - this.bufAbsoluteStart) + 3;
            this.xmlDeclContent = newString(this.buf, i14, (this.pos - 2) - i14);
            z = false;
            return z;
        } catch (EOFException e) {
            throw new XmlPullParserException(new StringBuffer().append("processing instruction started on line ").append(i2).append(" and column ").append(i3).append(" was not closed").toString(), this, e);
        }
    }

    protected int parseProlog() throws XmlPullParserException, IOException {
        boolean z;
        boolean z2;
        int parseStartTag;
        char more = this.seenMarkup ? this.buf[this.pos - 1] : more();
        char c = more;
        if (this.eventType == 0) {
            if (more == 65534) {
                throw new XmlPullParserException("first character in input was UNICODE noncharacter (0xFFFE)- input requires int swapping", this, null);
            }
            c = more;
            if (more == 65279) {
                c = more();
            }
        }
        this.seenMarkup = false;
        boolean z3 = false;
        this.posStart = this.pos - 1;
        boolean z4 = this.tokenize && !this.roundtripSupported;
        boolean z5 = false;
        char c2 = c;
        while (true) {
            if (c2 == '<') {
                if (z3 && this.tokenize) {
                    this.posEnd = this.pos - 1;
                    this.seenMarkup = true;
                    parseStartTag = 7;
                    this.eventType = 7;
                    break;
                }
                char more2 = more();
                if (more2 == '?') {
                    if (parsePI()) {
                        z = z3;
                        z2 = z5;
                        if (this.tokenize) {
                            parseStartTag = 8;
                            this.eventType = 8;
                            break;
                        }
                    } else {
                        this.posStart = this.pos;
                        z = false;
                        z2 = z5;
                    }
                } else if (more2 == '!') {
                    char more3 = more();
                    if (more3 == 'D') {
                        if (this.seenDocdecl) {
                            throw new XmlPullParserException("only one docdecl allowed in XML document", this, null);
                        }
                        this.seenDocdecl = true;
                        parseDocdecl();
                        z = z3;
                        z2 = z5;
                        if (this.tokenize) {
                            this.eventType = 10;
                            parseStartTag = 10;
                            break;
                        }
                    } else if (more3 != '-') {
                        throw new XmlPullParserException(new StringBuffer().append("unexpected markup <!").append(printable(more3)).toString(), this, null);
                    } else {
                        parseComment();
                        z = z3;
                        z2 = z5;
                        if (this.tokenize) {
                            parseStartTag = 9;
                            this.eventType = 9;
                            break;
                        }
                    }
                } else if (more2 == '/') {
                    throw new XmlPullParserException(new StringBuffer().append("expected start tag name and not ").append(printable(more2)).toString(), this, null);
                } else {
                    if (!isNameStartChar(more2)) {
                        throw new XmlPullParserException(new StringBuffer().append("expected start tag name and not ").append(printable(more2)).toString(), this, null);
                    }
                    this.seenRoot = true;
                    parseStartTag = parseStartTag();
                }
            } else if (!isS(c2)) {
                throw new XmlPullParserException(new StringBuffer().append("only whitespace content allowed before start tag and not ").append(printable(c2)).toString(), this, null);
            } else {
                z = true;
                z2 = z5;
                if (z4) {
                    if (c2 == '\r') {
                        z2 = true;
                        if (!this.usePC) {
                            this.posEnd = this.pos - 1;
                            if (this.posEnd > this.posStart) {
                                joinPC();
                            } else {
                                this.usePC = true;
                                this.pcEnd = 0;
                                this.pcStart = 0;
                            }
                        }
                        if (this.pcEnd >= this.pc.length) {
                            ensurePC(this.pcEnd);
                        }
                        char[] cArr = this.pc;
                        int i = this.pcEnd;
                        this.pcEnd = i + 1;
                        cArr[i] = (char) 10;
                        z = true;
                    } else if (c2 == '\n') {
                        if (!z5 && this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr2 = this.pc;
                            int i2 = this.pcEnd;
                            this.pcEnd = i2 + 1;
                            cArr2[i2] = (char) 10;
                        }
                        z2 = false;
                        z = true;
                    } else {
                        if (this.usePC) {
                            if (this.pcEnd >= this.pc.length) {
                                ensurePC(this.pcEnd);
                            }
                            char[] cArr3 = this.pc;
                            int i3 = this.pcEnd;
                            this.pcEnd = i3 + 1;
                            cArr3[i3] = c2;
                        }
                        z2 = false;
                        z = true;
                    }
                }
            }
            c2 = more();
            z3 = z;
            z5 = z2;
        }
        return parseStartTag;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x03eb, code lost:
        r12 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x03f2, code lost:
        if (r12 >= r9.attributeCount) goto L152;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x03f5, code lost:
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x03f9, code lost:
        if (r11 >= r12) goto L155;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0400, code lost:
        if (r9.allStringsInterned == false) goto L110;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x0412, code lost:
        if (r9.attributeName[r11].equals(r9.attributeName[r12]) != false) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0419, code lost:
        if (r9.allStringsInterned != false) goto L156;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x0428, code lost:
        if (r9.attributeNameHash[r11] != r9.attributeNameHash[r12]) goto L157;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x043a, code lost:
        if (r9.attributeName[r11].equals(r9.attributeName[r12]) == false) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0476, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("duplicated attributes ").append(r9.attributeName[r11]).append(" and ").append(r9.attributeName[r12]).toString(), r9, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0477, code lost:
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x047d, code lost:
        r12 = r12 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x0483, code lost:
        r9.elNamespaceCount[r9.depth] = r9.namespaceEnd;
        r9.posEnd = r9.pos;
        r9.eventType = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x049e, code lost:
        return 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x01b9, code lost:
        if (r9.processNamespaces == false) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01bc, code lost:
        r0 = getNamespace(r14);
        r15 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x01ca, code lost:
        if (r0 != null) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x01cf, code lost:
        if (r14 != null) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x01d2, code lost:
        r15 = "";
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01d7, code lost:
        r9.elUri[r9.depth] = r15;
        r12 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x01e9, code lost:
        if (r12 >= r9.attributeCount) goto L141;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x01ec, code lost:
        r0 = r9.attributePrefix[r12];
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x01f6, code lost:
        if (r0 == null) goto L71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x01f9, code lost:
        r0 = getNamespace(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0203, code lost:
        if (r0 != null) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0224, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("could not determine namespace bound to attribute prefix ").append(r0).toString(), r9, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x02cf, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("could not determine namespace bound to element prefix ").append(r14).toString(), r9, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x02d0, code lost:
        r9.attributeUri[r12] = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x02d8, code lost:
        r12 = r12 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x02de, code lost:
        r9.attributeUri[r12] = "";
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x02ea, code lost:
        r12 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x02f1, code lost:
        if (r12 >= r9.attributeCount) goto L146;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x02f4, code lost:
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x02f8, code lost:
        if (r11 >= r12) goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0307, code lost:
        if (r9.attributeUri[r11] != r9.attributeUri[r12]) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x030e, code lost:
        if (r9.allStringsInterned == false) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0320, code lost:
        if (r9.attributeName[r11].equals(r9.attributeName[r12]) != false) goto L144;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0327, code lost:
        if (r9.allStringsInterned != false) goto L149;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0336, code lost:
        if (r9.attributeNameHash[r11] != r9.attributeNameHash[r12]) goto L150;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0348, code lost:
        if (r9.attributeName[r11].equals(r9.attributeName[r12]) == false) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x034b, code lost:
        r0 = r9.attributeName[r11];
        r14 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x035d, code lost:
        if (r9.attributeUri[r11] == null) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0360, code lost:
        r14 = new java.lang.StringBuffer().append(r9.attributeUri[r11]).append(":").append(r0).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0380, code lost:
        r0 = r9.attributeName[r12];
        r15 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0392, code lost:
        if (r9.attributeUri[r12] == null) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0395, code lost:
        r15 = new java.lang.StringBuffer().append(r9.attributeUri[r12]).append(":").append(r0).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x03de, code lost:
        throw new org.xmlpull.v1.XmlPullParserException(new java.lang.StringBuffer().append("duplicated attributes ").append(r14).append(" and ").append(r15).toString(), r9, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x03df, code lost:
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x03e5, code lost:
        r12 = r12 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int parseStartTag() throws XmlPullParserException, IOException {
        this.depth++;
        this.posStart = this.pos - 2;
        this.emptyElementTag = false;
        this.attributeCount = 0;
        int i = (this.pos - 1) + this.bufAbsoluteStart;
        int i2 = -1;
        if (this.buf[this.pos - 1] == ':') {
            i2 = -1;
            if (this.processNamespaces) {
                throw new XmlPullParserException("when namespaces processing enabled colon can not be at element name start", this, null);
            }
        }
        while (true) {
            char more = more();
            if (!isNameChar(more)) {
                ensureElementsCapacity();
                int i3 = (this.pos - 1) - (i - this.bufAbsoluteStart);
                if (this.elRawName[this.depth] == null || this.elRawName[this.depth].length < i3) {
                    this.elRawName[this.depth] = new char[i3 * 2];
                }
                System.arraycopy(this.buf, i - this.bufAbsoluteStart, this.elRawName[this.depth], 0, i3);
                this.elRawNameEnd[this.depth] = i3;
                this.elRawNameLine[this.depth] = this.lineNumber;
                String str = null;
                if (!this.processNamespaces) {
                    this.elName[this.depth] = newString(this.buf, i - this.bufAbsoluteStart, i3);
                } else if (i2 != -1) {
                    String[] strArr = this.elPrefix;
                    int i4 = this.depth;
                    str = newString(this.buf, i - this.bufAbsoluteStart, i2 - i);
                    strArr[i4] = str;
                    this.elName[this.depth] = newString(this.buf, (i2 + 1) - this.bufAbsoluteStart, (this.pos - 2) - (i2 - this.bufAbsoluteStart));
                } else {
                    str = null;
                    this.elPrefix[this.depth] = null;
                    this.elName[this.depth] = newString(this.buf, i - this.bufAbsoluteStart, i3);
                }
                while (true) {
                    if (!isS(more)) {
                        if (more == '>') {
                            break;
                        } else if (more == '/') {
                            if (this.emptyElementTag) {
                                throw new XmlPullParserException("repeated / in tag declaration", this, null);
                            }
                            this.emptyElementTag = true;
                            char more2 = more();
                            if (more2 != '>') {
                                throw new XmlPullParserException(new StringBuffer().append("expected > to end empty tag not ").append(printable(more2)).toString(), this, null);
                            }
                        } else if (!isNameStartChar(more)) {
                            throw new XmlPullParserException(new StringBuffer().append("start tag unexpected character ").append(printable(more)).toString(), this, null);
                        } else {
                            parseAttribute();
                            more = more();
                        }
                    } else {
                        more = more();
                    }
                }
            } else if (more == ':' && this.processNamespaces) {
                if (i2 != -1) {
                    throw new XmlPullParserException("only one colon is allowed in name of element when namespaces are enabled", this, null);
                }
                i2 = (this.pos - 1) + this.bufAbsoluteStart;
            }
        }
    }

    protected void parseXmlDecl(char c) throws XmlPullParserException, IOException {
        this.preventBufferCompaction = true;
        this.bufStart = 0;
        char skipS = skipS(requireInput(skipS(c), VERSION));
        if (skipS != '=') {
            throw new XmlPullParserException(new StringBuffer().append("expected equals sign (=) after version and not ").append(printable(skipS)).toString(), this, null);
        }
        char skipS2 = skipS(more());
        if (skipS2 != '\'' && skipS2 != '\"') {
            throw new XmlPullParserException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after version and not ").append(printable(skipS2)).toString(), this, null);
        }
        int i = this.pos;
        char more = more();
        while (true) {
            char c2 = more;
            if (c2 == skipS2) {
                parseXmlDeclWithVersion(i, this.pos - 1);
                this.preventBufferCompaction = false;
                return;
            } else if ((c2 < 'a' || c2 > 'z') && ((c2 < 'A' || c2 > 'Z') && !((c2 >= '0' && c2 <= '9') || c2 == '_' || c2 == '.' || c2 == ':' || c2 == '-'))) {
                throw new XmlPullParserException(new StringBuffer().append("<?xml version value expected to be in ([a-zA-Z0-9_.:] | '-') not ").append(printable(c2)).toString(), this, null);
            } else {
                more = more();
            }
        }
    }

    protected void parseXmlDeclWithVersion(int i, int i2) throws XmlPullParserException, IOException {
        char c;
        String str = this.inputEncoding;
        if (i2 - i == 3 && this.buf[i] == '1' && this.buf[i + 1] == '.' && this.buf[i + 2] == '0') {
            this.xmlDeclVersion = newString(this.buf, i, i2 - i);
            char skipS = skipS(more());
            char c2 = skipS;
            if (skipS == 'e') {
                char skipS2 = skipS(requireInput(more(), NCODING));
                if (skipS2 != '=') {
                    throw new XmlPullParserException(new StringBuffer().append("expected equals sign (=) after encoding and not ").append(printable(skipS2)).toString(), this, null);
                }
                char skipS3 = skipS(more());
                if (skipS3 != '\'' && skipS3 != '\"') {
                    throw new XmlPullParserException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after encoding and not ").append(printable(skipS3)).toString(), this, null);
                }
                int i3 = this.pos;
                char more = more();
                if ((more >= 'a' && more <= 'z') || (more >= 'A' && more <= 'Z')) {
                    char more2 = more();
                    while (true) {
                        char c3 = more2;
                        if (c3 == skipS3) {
                            this.inputEncoding = newString(this.buf, i3, (this.pos - 1) - i3);
                            c2 = more();
                            break;
                        } else if ((c3 < 'a' || c3 > 'z') && ((c3 < 'A' || c3 > 'Z') && !((c3 >= '0' && c3 <= '9') || c3 == '.' || c3 == '_' || c3 == '-'))) {
                            throw new XmlPullParserException(new StringBuffer().append("<?xml encoding value expected to be in ([A-Za-z0-9._] | '-') not ").append(printable(c3)).toString(), this, null);
                        } else {
                            more2 = more();
                        }
                    }
                } else {
                    throw new XmlPullParserException(new StringBuffer().append("<?xml encoding name expected to start with [A-Za-z] not ").append(printable(more)).toString(), this, null);
                }
            }
            char skipS4 = skipS(c2);
            char c4 = skipS4;
            if (skipS4 == 's') {
                char skipS5 = skipS(requireInput(more(), TANDALONE));
                if (skipS5 != '=') {
                    throw new XmlPullParserException(new StringBuffer().append("expected equals sign (=) after standalone and not ").append(printable(skipS5)).toString(), this, null);
                }
                char skipS6 = skipS(more());
                if (skipS6 != '\'' && skipS6 != '\"') {
                    throw new XmlPullParserException(new StringBuffer().append("expected apostrophe (') or quotation mark (\") after encoding and not ").append(printable(skipS6)).toString(), this, null);
                }
                int i4 = this.pos;
                char more3 = more();
                if (more3 == 'y') {
                    char requireInput = requireInput(more3, YES);
                    this.xmlDeclStandalone = new Boolean(true);
                    c = requireInput;
                } else if (more3 != 'n') {
                    throw new XmlPullParserException(new StringBuffer().append("expected 'yes' or 'no' after standalone and not ").append(printable(more3)).toString(), this, null);
                } else {
                    char requireInput2 = requireInput(more3, NO);
                    this.xmlDeclStandalone = new Boolean(false);
                    c = requireInput2;
                }
                if (c != skipS6) {
                    throw new XmlPullParserException(new StringBuffer().append("expected ").append(skipS6).append(" after standalone value not ").append(printable(c)).toString(), this, null);
                }
                c4 = more();
            }
            char skipS7 = skipS(c4);
            if (skipS7 != '?') {
                throw new XmlPullParserException(new StringBuffer().append("expected ?> as last part of <?xml not ").append(printable(skipS7)).toString(), this, null);
            }
            char more4 = more();
            if (more4 == '>') {
                return;
            }
            throw new XmlPullParserException(new StringBuffer().append("expected ?> as last part of <?xml not ").append(printable(more4)).toString(), this, null);
        }
        throw new XmlPullParserException(new StringBuffer().append("only 1.0 is supported as <?xml version not '").append(printable(new String(this.buf, i, i2 - i))).append("'").toString(), this, null);
    }

    protected String printable(char c) {
        return c == '\n' ? "\\n" : c == '\r' ? "\\r" : c == '\t' ? "\\t" : c == '\'' ? "\\'" : (c > 127 || c < ' ') ? new StringBuffer().append("\\u").append(Integer.toHexString(c)).toString() : new StringBuffer().append("").append(c).toString();
    }

    protected String printable(String str) {
        String stringBuffer;
        if (str == null) {
            stringBuffer = null;
        } else {
            int length = str.length();
            StringBuffer stringBuffer2 = new StringBuffer(length + 10);
            for (int i = 0; i < length; i++) {
                stringBuffer2.append(printable(str.charAt(i)));
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void require(int i, String str, String str2) throws XmlPullParserException, IOException {
        if (this.processNamespaces || str == null) {
            if (i == getEventType() && ((str == null || str.equals(getNamespace())) && (str2 == null || str2.equals(getName())))) {
                return;
            }
            throw new XmlPullParserException(new StringBuffer().append("expected event ").append(XmlPullParser.TYPES[i]).append(str2 != null ? new StringBuffer().append(" with name '").append(str2).append("'").toString() : "").append((str == null || str2 == null) ? "" : " and").append(str != null ? new StringBuffer().append(" with namespace '").append(str).append("'").toString() : "").append(" but got").append(i != getEventType() ? new StringBuffer().append(" ").append(XmlPullParser.TYPES[getEventType()]).toString() : "").append((str2 == null || getName() == null || str2.equals(getName())) ? "" : new StringBuffer().append(" name '").append(getName()).append("'").toString()).append((str == null || str2 == null || getName() == null || str2.equals(getName()) || getNamespace() == null || str.equals(getNamespace())) ? "" : " and").append((str == null || getNamespace() == null || str.equals(getNamespace())) ? "" : new StringBuffer().append(" namespace '").append(getNamespace()).append("'").toString()).append(" (position:").append(getPositionDescription()).append(")").toString());
        }
        throw new XmlPullParserException(new StringBuffer().append("processing namespaces must be enabled on parser (or factory) to have possible namespaces declared on elements").append(" (position:").append(getPositionDescription()).append(")").toString());
    }

    protected char requireInput(char c, char[] cArr) throws XmlPullParserException, IOException {
        char c2 = c;
        int i = 0;
        while (i < cArr.length) {
            if (c2 != cArr[i]) {
                throw new XmlPullParserException(new StringBuffer().append("expected ").append(printable(cArr[i])).append(" in ").append(new String(cArr)).append(" and not ").append(printable(c2)).toString(), this, null);
            }
            i++;
            c2 = more();
        }
        return c2;
    }

    protected char requireNextS() throws XmlPullParserException, IOException {
        char more = more();
        if (!isS(more)) {
            throw new XmlPullParserException(new StringBuffer().append("white space is required and not ").append(printable(more)).toString(), this, null);
        }
        return skipS(more);
    }

    protected void reset() {
        this.location = null;
        this.lineNumber = 1;
        this.columnNumber = 0;
        this.seenRoot = false;
        this.reachedEnd = false;
        this.eventType = 0;
        this.emptyElementTag = false;
        this.depth = 0;
        this.attributeCount = 0;
        this.namespaceEnd = 0;
        this.entityEnd = 0;
        this.reader = null;
        this.inputEncoding = null;
        this.preventBufferCompaction = false;
        this.bufAbsoluteStart = 0;
        this.bufStart = 0;
        this.bufEnd = 0;
        this.posEnd = 0;
        this.posStart = 0;
        this.pos = 0;
        this.pcStart = 0;
        this.pcEnd = 0;
        this.usePC = false;
        this.seenStartTag = false;
        this.seenEndTag = false;
        this.pastEndTag = false;
        this.seenAmpersand = false;
        this.seenMarkup = false;
        this.seenDocdecl = false;
        this.xmlDeclVersion = null;
        this.xmlDeclStandalone = null;
        this.xmlDeclContent = null;
        resetStringCache();
    }

    protected void resetStringCache() {
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setFeature(String str, boolean z) throws XmlPullParserException {
        if (str == null) {
            throw new IllegalArgumentException("feature name should not be null");
        }
        if (XmlPullParser.FEATURE_PROCESS_NAMESPACES.equals(str)) {
            if (this.eventType != 0) {
                throw new XmlPullParserException("namespace processing feature can only be changed before parsing", this, null);
            }
            this.processNamespaces = z;
        } else if (FEATURE_NAMES_INTERNED.equals(str)) {
            if (!z) {
                return;
            }
            throw new XmlPullParserException("interning names in this implementation is not supported");
        } else if (XmlPullParser.FEATURE_PROCESS_DOCDECL.equals(str)) {
            if (!z) {
                return;
            }
            throw new XmlPullParserException("processing DOCDECL is not supported");
        } else if (!FEATURE_XML_ROUNDTRIP.equals(str)) {
            throw new XmlPullParserException(new StringBuffer().append("unsupported feature ").append(str).toString());
        } else {
            this.roundtripSupported = z;
        }
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setInput(InputStream inputStream, String str) throws XmlPullParserException {
        if (inputStream == null) {
            throw new IllegalArgumentException("input stream can not be null");
        }
        this.inputStream = inputStream;
        try {
            setInput(str != null ? new InputStreamReader(inputStream, str) : new InputStreamReader(inputStream, "UTF-8"));
            this.inputEncoding = str;
        } catch (UnsupportedEncodingException e) {
            throw new XmlPullParserException(new StringBuffer().append("could not create reader for encoding ").append(str).append(" : ").append(e).toString(), this, e);
        }
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setInput(Reader reader) throws XmlPullParserException {
        reset();
        this.reader = reader;
    }

    @Override // org.xmlpull.v1.XmlPullParser
    public void setProperty(String str, Object obj) throws XmlPullParserException {
        if (PROPERTY_LOCATION.equals(str)) {
            this.location = (String) obj;
            return;
        }
        throw new XmlPullParserException(new StringBuffer().append("unsupported property: '").append(str).append("'").toString());
    }

    protected char skipS(char c) throws XmlPullParserException, IOException {
        while (true) {
            char c2 = c;
            if (isS(c2)) {
                c = more();
            } else {
                return c2;
            }
        }
    }

    public void skipSubTree() throws XmlPullParserException, IOException {
        require(2, null, null);
        int i = 1;
        while (i > 0) {
            int next = next();
            if (next == 3) {
                i--;
            } else if (next == 2) {
                i++;
            }
        }
    }
}
