package org.apache.commons.io.input;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.ByteOrderMark;

/* loaded from: classes.jar:org/apache/commons/io/input/XmlStreamReader.class */
public class XmlStreamReader extends Reader {
    private static final int BUFFER_SIZE = 4096;
    private static final String HTTP_EX_1 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], BOM must be NULL";
    private static final String HTTP_EX_2 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], encoding mismatch";
    private static final String HTTP_EX_3 = "Invalid encoding, CT-MIME [{0}] CT-Enc [{1}] BOM [{2}] XML guess [{3}] XML prolog [{4}], Invalid MIME";
    private static final String RAW_EX_1 = "Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] encoding mismatch";
    private static final String RAW_EX_2 = "Invalid encoding, BOM [{0}] XML guess [{1}] XML prolog [{2}] unknown BOM";
    private static final String US_ASCII = "US-ASCII";
    private static final String UTF_16 = "UTF-16";
    private static final String UTF_16BE = "UTF-16BE";
    private static final String UTF_16LE = "UTF-16LE";
    private static final String UTF_32 = "UTF-32";
    private static final String UTF_8 = "UTF-8";
    private final String defaultEncoding;
    private final String encoding;
    private final Reader reader;
    private static final ByteOrderMark[] BOMS = {ByteOrderMark.UTF_8, ByteOrderMark.UTF_16BE, ByteOrderMark.UTF_16LE, ByteOrderMark.UTF_32BE, ByteOrderMark.UTF_32LE};
    private static final String UTF_32BE = "UTF-32BE";
    private static final String UTF_32LE = "UTF-32LE";
    private static final String EBCDIC = "CP1047";
    private static final ByteOrderMark[] XML_GUESS_BYTES = {new ByteOrderMark("UTF-8", 60, 63, 120, 109), new ByteOrderMark("UTF-16BE", 0, 60, 0, 63), new ByteOrderMark("UTF-16LE", 60, 0, 63, 0), new ByteOrderMark(UTF_32BE, 0, 0, 0, 60, 0, 0, 0, 63, 0, 0, 0, 120, 0, 0, 0, 109), new ByteOrderMark(UTF_32LE, 60, 0, 0, 0, 63, 0, 0, 0, 120, 0, 0, 0, 109, 0, 0, 0), new ByteOrderMark(EBCDIC, 76, 111, 167, 148)};
    private static final Pattern CHARSET_PATTERN = Pattern.compile("charset=[\"']?([.[^; \"']]*)[\"']?");
    public static final Pattern ENCODING_PATTERN = Pattern.compile("<\\?xml.*encoding[\\s]*=[\\s]*((?:\".[^\"]*\")|(?:'.[^']*'))", 8);

    public XmlStreamReader(File file) throws IOException {
        this(new FileInputStream(file));
    }

    public XmlStreamReader(InputStream inputStream) throws IOException {
        this(inputStream, true);
    }

    public XmlStreamReader(InputStream inputStream, String str) throws IOException {
        this(inputStream, str, true);
    }

    public XmlStreamReader(InputStream inputStream, String str, boolean z) throws IOException {
        this(inputStream, str, z, null);
    }

    public XmlStreamReader(InputStream inputStream, String str, boolean z, String str2) throws IOException {
        this.defaultEncoding = str2;
        BOMInputStream bOMInputStream = new BOMInputStream(new BufferedInputStream(inputStream, 4096), false, BOMS);
        BOMInputStream bOMInputStream2 = new BOMInputStream(bOMInputStream, true, XML_GUESS_BYTES);
        this.encoding = doHttpStream(bOMInputStream, bOMInputStream2, str, z);
        this.reader = new InputStreamReader(bOMInputStream2, this.encoding);
    }

    public XmlStreamReader(InputStream inputStream, boolean z) throws IOException {
        this(inputStream, z, (String) null);
    }

    public XmlStreamReader(InputStream inputStream, boolean z, String str) throws IOException {
        this.defaultEncoding = str;
        BOMInputStream bOMInputStream = new BOMInputStream(new BufferedInputStream(inputStream, 4096), false, BOMS);
        BOMInputStream bOMInputStream2 = new BOMInputStream(bOMInputStream, true, XML_GUESS_BYTES);
        this.encoding = doRawStream(bOMInputStream, bOMInputStream2, z);
        this.reader = new InputStreamReader(bOMInputStream2, this.encoding);
    }

    public XmlStreamReader(URL url) throws IOException {
        this(url.openConnection(), (String) null);
    }

    public XmlStreamReader(URLConnection uRLConnection, String str) throws IOException {
        this.defaultEncoding = str;
        String contentType = uRLConnection.getContentType();
        BOMInputStream bOMInputStream = new BOMInputStream(new BufferedInputStream(uRLConnection.getInputStream(), 4096), false, BOMS);
        BOMInputStream bOMInputStream2 = new BOMInputStream(bOMInputStream, true, XML_GUESS_BYTES);
        if ((uRLConnection instanceof HttpURLConnection) || contentType != null) {
            this.encoding = doHttpStream(bOMInputStream, bOMInputStream2, contentType, true);
        } else {
            this.encoding = doRawStream(bOMInputStream, bOMInputStream2, true);
        }
        this.reader = new InputStreamReader(bOMInputStream2, this.encoding);
    }

    private String doHttpStream(BOMInputStream bOMInputStream, BOMInputStream bOMInputStream2, String str, boolean z) throws IOException {
        String doLenientDetection;
        String bOMCharsetName = bOMInputStream.getBOMCharsetName();
        String bOMCharsetName2 = bOMInputStream2.getBOMCharsetName();
        try {
            doLenientDetection = calculateHttpEncoding(str, bOMCharsetName, bOMCharsetName2, getXmlProlog(bOMInputStream2, bOMCharsetName2), z);
        } catch (XmlStreamReaderException e) {
            if (!z) {
                throw e;
            }
            doLenientDetection = doLenientDetection(str, e);
        }
        return doLenientDetection;
    }

    private String doLenientDetection(String str, XmlStreamReaderException xmlStreamReaderException) throws IOException {
        String str2;
        XmlStreamReaderException e = xmlStreamReaderException;
        if (str != null) {
            e = xmlStreamReaderException;
            if (str.startsWith("text/html")) {
                try {
                    str2 = calculateHttpEncoding("text/xml" + str.substring("text/html".length()), xmlStreamReaderException.getBomEncoding(), xmlStreamReaderException.getXmlGuessEncoding(), xmlStreamReaderException.getXmlEncoding(), true);
                } catch (XmlStreamReaderException e2) {
                    e = e2;
                }
                return str2;
            }
        }
        String xmlEncoding = e.getXmlEncoding();
        String str3 = xmlEncoding;
        if (xmlEncoding == null) {
            str3 = e.getContentTypeEncoding();
        }
        str2 = str3;
        if (str3 == null) {
            str2 = this.defaultEncoding == null ? "UTF-8" : this.defaultEncoding;
        }
        return str2;
    }

    private String doRawStream(BOMInputStream bOMInputStream, BOMInputStream bOMInputStream2, boolean z) throws IOException {
        String doLenientDetection;
        String bOMCharsetName = bOMInputStream.getBOMCharsetName();
        String bOMCharsetName2 = bOMInputStream2.getBOMCharsetName();
        try {
            doLenientDetection = calculateRawEncoding(bOMCharsetName, bOMCharsetName2, getXmlProlog(bOMInputStream2, bOMCharsetName2));
        } catch (XmlStreamReaderException e) {
            if (!z) {
                throw e;
            }
            doLenientDetection = doLenientDetection(null, e);
        }
        return doLenientDetection;
    }

    static String getContentTypeEncoding(String str) {
        String str2 = null;
        if (str != null) {
            int indexOf = str.indexOf(";");
            str2 = null;
            if (indexOf > -1) {
                Matcher matcher = CHARSET_PATTERN.matcher(str.substring(indexOf + 1));
                String group = matcher.find() ? matcher.group(1) : null;
                str2 = group != null ? group.toUpperCase(Locale.US) : null;
            }
        }
        return str2;
    }

    static String getContentTypeMime(String str) {
        String str2 = null;
        if (str != null) {
            int indexOf = str.indexOf(";");
            if (indexOf >= 0) {
                str = str.substring(0, indexOf);
            }
            str2 = str.trim();
        }
        return str2;
    }

    private static String getXmlProlog(InputStream inputStream, String str) throws IOException {
        String str2 = null;
        if (str != null) {
            byte[] bArr = new byte[4096];
            inputStream.mark(4096);
            int i = 0;
            int i2 = 4096;
            int read = inputStream.read(bArr, 0, 4096);
            int i3 = -1;
            String str3 = null;
            while (read != -1 && i3 == -1 && i < 4096) {
                i += read;
                i2 -= read;
                read = inputStream.read(bArr, i, i2);
                str3 = new String(bArr, 0, i, str);
                i3 = str3.indexOf(62);
            }
            if (i3 == -1) {
                if (read != -1) {
                    throw new IOException("XML prolog or ROOT element not found on first " + i + " bytes");
                }
                throw new IOException("Unexpected end of XML stream");
            }
            str2 = null;
            if (i > 0) {
                inputStream.reset();
                BufferedReader bufferedReader = new BufferedReader(new StringReader(str3.substring(0, i3 + 1)));
                StringBuffer stringBuffer = new StringBuffer();
                String readLine = bufferedReader.readLine();
                while (true) {
                    String str4 = readLine;
                    if (str4 == null) {
                        break;
                    }
                    stringBuffer.append(str4);
                    readLine = bufferedReader.readLine();
                }
                Matcher matcher = ENCODING_PATTERN.matcher(stringBuffer);
                str2 = null;
                if (matcher.find()) {
                    String upperCase = matcher.group(1).toUpperCase();
                    str2 = upperCase.substring(1, upperCase.length() - 1);
                }
            }
        }
        return str2;
    }

    static boolean isAppXml(String str) {
        return str != null && (str.equals("application/xml") || str.equals("application/xml-dtd") || str.equals("application/xml-external-parsed-entity") || (str.startsWith("application/") && str.endsWith("+xml")));
    }

    static boolean isTextXml(String str) {
        return str != null && (str.equals("text/xml") || str.equals("text/xml-external-parsed-entity") || (str.startsWith("text/") && str.endsWith("+xml")));
    }

    String calculateHttpEncoding(String str, String str2, String str3, String str4, boolean z) throws IOException {
        String str5;
        if (!z || str4 == null) {
            String contentTypeMime = getContentTypeMime(str);
            String contentTypeEncoding = getContentTypeEncoding(str);
            boolean isAppXml = isAppXml(contentTypeMime);
            boolean isTextXml = isTextXml(contentTypeMime);
            if (!isAppXml && !isTextXml) {
                throw new XmlStreamReaderException(MessageFormat.format(HTTP_EX_3, contentTypeMime, contentTypeEncoding, str2, str3, str4), contentTypeMime, contentTypeEncoding, str2, str3, str4);
            }
            if (contentTypeEncoding == null) {
                str5 = isAppXml ? calculateRawEncoding(str2, str3, str4) : this.defaultEncoding == null ? "US-ASCII" : this.defaultEncoding;
            } else if (contentTypeEncoding.equals("UTF-16BE") || contentTypeEncoding.equals("UTF-16LE")) {
                str5 = contentTypeEncoding;
                if (str2 != null) {
                    throw new XmlStreamReaderException(MessageFormat.format(HTTP_EX_1, contentTypeMime, contentTypeEncoding, str2, str3, str4), contentTypeMime, contentTypeEncoding, str2, str3, str4);
                }
            } else if (contentTypeEncoding.equals("UTF-16")) {
                if (str2 == null || !str2.startsWith("UTF-16")) {
                    throw new XmlStreamReaderException(MessageFormat.format(HTTP_EX_2, contentTypeMime, contentTypeEncoding, str2, str3, str4), contentTypeMime, contentTypeEncoding, str2, str3, str4);
                }
                str5 = str2;
            } else if (contentTypeEncoding.equals(UTF_32BE) || contentTypeEncoding.equals(UTF_32LE)) {
                str5 = contentTypeEncoding;
                if (str2 != null) {
                    throw new XmlStreamReaderException(MessageFormat.format(HTTP_EX_1, contentTypeMime, contentTypeEncoding, str2, str3, str4), contentTypeMime, contentTypeEncoding, str2, str3, str4);
                }
            } else {
                str5 = contentTypeEncoding;
                if (contentTypeEncoding.equals(UTF_32)) {
                    if (str2 == null || !str2.startsWith(UTF_32)) {
                        throw new XmlStreamReaderException(MessageFormat.format(HTTP_EX_2, contentTypeMime, contentTypeEncoding, str2, str3, str4), contentTypeMime, contentTypeEncoding, str2, str3, str4);
                    }
                    str5 = str2;
                }
            }
        } else {
            str5 = str4;
        }
        return str5;
    }

    String calculateRawEncoding(String str, String str2, String str3) throws IOException {
        String str4;
        if (str == null) {
            if (str2 == null || str3 == null) {
                str4 = this.defaultEncoding == null ? "UTF-8" : this.defaultEncoding;
            } else {
                str4 = (!str3.equals("UTF-16") || (!str2.equals("UTF-16BE") && !str2.equals("UTF-16LE"))) ? str3 : str2;
            }
        } else if (str.equals("UTF-8")) {
            if (str2 != null && !str2.equals("UTF-8")) {
                throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
            }
            str4 = str;
            if (str3 != null) {
                str4 = str;
                if (!str3.equals("UTF-8")) {
                    throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
                }
            }
        } else if (str.equals("UTF-16BE") || str.equals("UTF-16LE")) {
            if (str2 != null && !str2.equals(str)) {
                throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
            }
            str4 = str;
            if (str3 != null) {
                str4 = str;
                if (!str3.equals("UTF-16")) {
                    str4 = str;
                    if (!str3.equals(str)) {
                        throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
                    }
                }
            }
        } else if (!str.equals(UTF_32BE) && !str.equals(UTF_32LE)) {
            throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_2, str, str2, str3), str, str2, str3);
        } else {
            if (str2 != null && !str2.equals(str)) {
                throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
            }
            str4 = str;
            if (str3 != null) {
                str4 = str;
                if (!str3.equals(UTF_32)) {
                    str4 = str;
                    if (!str3.equals(str)) {
                        throw new XmlStreamReaderException(MessageFormat.format(RAW_EX_1, str, str2, str3), str, str2, str3);
                    }
                }
            }
        }
        return str4;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }

    public String getDefaultEncoding() {
        return this.defaultEncoding;
    }

    public String getEncoding() {
        return this.encoding;
    }

    @Override // java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        return this.reader.read(cArr, i, i2);
    }
}
