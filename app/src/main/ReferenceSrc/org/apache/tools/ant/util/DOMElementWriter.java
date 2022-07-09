package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.w3c.dom.Attr;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

/* loaded from: classes.jar:org/apache/tools/ant/util/DOMElementWriter.class */
public class DOMElementWriter {
    private static final int HEX = 16;
    private static final String NS = "ns";
    private static final String[] WS_ENTITIES = new String[5];
    private static String lSep;
    protected String[] knownEntities;
    private XmlNamespacePolicy namespacePolicy;
    private int nextPrefix;
    private HashMap nsPrefixMap;
    private HashMap nsURIByElement;
    private boolean xmlDeclaration;

    /* loaded from: classes.jar:org/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy.class */
    public static class XmlNamespacePolicy {
        public static final XmlNamespacePolicy IGNORE = new XmlNamespacePolicy(false, false);
        public static final XmlNamespacePolicy ONLY_QUALIFY_ELEMENTS = new XmlNamespacePolicy(true, false);
        public static final XmlNamespacePolicy QUALIFY_ALL = new XmlNamespacePolicy(true, true);
        private boolean qualifyAttributes;
        private boolean qualifyElements;

        public XmlNamespacePolicy(boolean z, boolean z2) {
            this.qualifyElements = z;
            this.qualifyAttributes = z2;
        }
    }

    static {
        for (int i = 9; i < 14; i++) {
            WS_ENTITIES[i - 9] = new StringBuffer().append("&#x").append(Integer.toHexString(i)).append(";").toString();
        }
        lSep = System.getProperty("line.separator");
    }

    public DOMElementWriter() {
        this.xmlDeclaration = true;
        this.namespacePolicy = XmlNamespacePolicy.IGNORE;
        this.nsPrefixMap = new HashMap();
        this.nextPrefix = 0;
        this.nsURIByElement = new HashMap();
        this.knownEntities = new String[]{"gt", "amp", "lt", "apos", "quot"};
    }

    public DOMElementWriter(boolean z) {
        this(z, XmlNamespacePolicy.IGNORE);
    }

    public DOMElementWriter(boolean z, XmlNamespacePolicy xmlNamespacePolicy) {
        this.xmlDeclaration = true;
        this.namespacePolicy = XmlNamespacePolicy.IGNORE;
        this.nsPrefixMap = new HashMap();
        this.nextPrefix = 0;
        this.nsURIByElement = new HashMap();
        this.knownEntities = new String[]{"gt", "amp", "lt", "apos", "quot"};
        this.xmlDeclaration = z;
        this.namespacePolicy = xmlNamespacePolicy;
    }

    private void addNSDefinition(Element element, String str) {
        ArrayList arrayList = (ArrayList) this.nsURIByElement.get(element);
        ArrayList arrayList2 = arrayList;
        if (arrayList == null) {
            arrayList2 = new ArrayList();
            this.nsURIByElement.put(element, arrayList2);
        }
        arrayList2.add(str);
    }

    private String encode(String str, boolean z) {
        int length = str.length();
        StringBuffer stringBuffer = new StringBuffer(length);
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            switch (charAt) {
                case '\t':
                case '\n':
                case '\r':
                    if (z) {
                        stringBuffer.append(WS_ENTITIES[charAt - '\t']);
                        break;
                    } else {
                        stringBuffer.append(charAt);
                        break;
                    }
                case '\"':
                    stringBuffer.append("&quot;");
                    break;
                case '&':
                    stringBuffer.append("&amp;");
                    break;
                case '\'':
                    stringBuffer.append("&apos;");
                    break;
                case '<':
                    stringBuffer.append("&lt;");
                    break;
                case '>':
                    stringBuffer.append("&gt;");
                    break;
                default:
                    if (isLegalCharacter(charAt)) {
                        stringBuffer.append(charAt);
                        break;
                    } else {
                        break;
                    }
            }
        }
        return stringBuffer.substring(0);
    }

    private static String getNamespaceURI(Node node) {
        String namespaceURI = node.getNamespaceURI();
        String str = namespaceURI;
        if (namespaceURI == null) {
            str = "";
        }
        return str;
    }

    private void removeNSDefinitions(Element element) {
        ArrayList arrayList = (ArrayList) this.nsURIByElement.get(element);
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                this.nsPrefixMap.remove(it.next());
            }
            this.nsURIByElement.remove(element);
        }
    }

    public void closeElement(Element element, Writer writer, int i, String str, boolean z) throws IOException {
        if (z) {
            for (int i2 = 0; i2 < i; i2++) {
                writer.write(str);
            }
        }
        writer.write("</");
        if (this.namespacePolicy.qualifyElements) {
            String str2 = (String) this.nsPrefixMap.get(getNamespaceURI(element));
            if (str2 != null && !"".equals(str2)) {
                writer.write(str2);
                writer.write(":");
            }
            removeNSDefinitions(element);
        }
        writer.write(element.getTagName());
        writer.write(">");
        writer.write(lSep);
        writer.flush();
    }

    public String encode(String str) {
        return encode(str, false);
    }

    public String encodeAttributeValue(String str) {
        return encode(str, true);
    }

    public String encodedata(String str) {
        int length = str.length();
        StringBuffer stringBuffer = new StringBuffer(length);
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (isLegalCharacter(charAt)) {
                stringBuffer.append(charAt);
            }
        }
        return StringUtils.replace(stringBuffer.substring(0), "]]>", "]]]]><![CDATA[>");
    }

    public boolean isLegalCharacter(char c) {
        boolean z;
        if (c == '\t' || c == '\n' || c == '\r') {
            z = true;
        } else {
            z = false;
            if (c >= ' ') {
                if (c <= 55295) {
                    z = true;
                } else {
                    z = false;
                    if (c >= 57344) {
                        z = false;
                        if (c <= 65533) {
                            z = true;
                        }
                    }
                }
            }
        }
        return z;
    }

    public boolean isReference(String str) {
        boolean z;
        if (str.charAt(0) == '&' && str.endsWith(";")) {
            if (str.charAt(1) != '#') {
                String substring = str.substring(1, str.length() - 1);
                int i = 0;
                while (true) {
                    if (i >= this.knownEntities.length) {
                        z = false;
                        break;
                    }
                    z = true;
                    if (substring.equals(this.knownEntities[i])) {
                        break;
                    }
                    i++;
                }
            } else if (str.charAt(2) == 'x') {
                try {
                    Integer.parseInt(str.substring(3, str.length() - 1), 16);
                    z = true;
                } catch (NumberFormatException e) {
                    z = false;
                }
            } else {
                try {
                    Integer.parseInt(str.substring(2, str.length() - 1));
                    z = true;
                } catch (NumberFormatException e2) {
                    z = false;
                }
            }
        } else {
            z = false;
        }
        return z;
    }

    public void openElement(Element element, Writer writer, int i, String str) throws IOException {
        openElement(element, writer, i, str, true);
    }

    public void openElement(Element element, Writer writer, int i, String str, boolean z) throws IOException {
        for (int i2 = 0; i2 < i; i2++) {
            writer.write(str);
        }
        writer.write("<");
        if (this.namespacePolicy.qualifyElements) {
            String namespaceURI = getNamespaceURI(element);
            String str2 = (String) this.nsPrefixMap.get(namespaceURI);
            String str3 = str2;
            if (str2 == null) {
                if (this.nsPrefixMap.isEmpty()) {
                    str3 = "";
                } else {
                    StringBuffer append = new StringBuffer().append(NS);
                    int i3 = this.nextPrefix;
                    this.nextPrefix = i3 + 1;
                    str3 = append.append(i3).toString();
                }
                this.nsPrefixMap.put(namespaceURI, str3);
                addNSDefinition(element, namespaceURI);
            }
            if (!"".equals(str3)) {
                writer.write(str3);
                writer.write(":");
            }
        }
        writer.write(element.getTagName());
        NamedNodeMap attributes = element.getAttributes();
        for (int i4 = 0; i4 < attributes.getLength(); i4++) {
            Attr attr = (Attr) attributes.item(i4);
            writer.write(" ");
            if (this.namespacePolicy.qualifyAttributes) {
                String namespaceURI2 = getNamespaceURI(attr);
                String str4 = (String) this.nsPrefixMap.get(namespaceURI2);
                String str5 = str4;
                if (str4 == null) {
                    StringBuffer append2 = new StringBuffer().append(NS);
                    int i5 = this.nextPrefix;
                    this.nextPrefix = i5 + 1;
                    str5 = append2.append(i5).toString();
                    this.nsPrefixMap.put(namespaceURI2, str5);
                    addNSDefinition(element, namespaceURI2);
                }
                writer.write(str5);
                writer.write(":");
            }
            writer.write(attr.getName());
            writer.write("=\"");
            writer.write(encodeAttributeValue(attr.getValue()));
            writer.write("\"");
        }
        ArrayList arrayList = (ArrayList) this.nsURIByElement.get(element);
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String str6 = (String) it.next();
                String str7 = (String) this.nsPrefixMap.get(str6);
                writer.write(" xmlns");
                if (!"".equals(str7)) {
                    writer.write(":");
                    writer.write(str7);
                }
                writer.write("=\"");
                writer.write(str6);
                writer.write("\"");
            }
        }
        if (z) {
            writer.write(">");
            return;
        }
        removeNSDefinitions(element);
        writer.write(" />");
        writer.write(lSep);
        writer.flush();
    }

    public void write(Element element, OutputStream outputStream) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream, "UTF8");
        writeXMLDeclaration(outputStreamWriter);
        write(element, outputStreamWriter, 0, "  ");
        outputStreamWriter.flush();
    }

    public void write(Element element, Writer writer, int i, String str) throws IOException {
        NodeList childNodes = element.getChildNodes();
        boolean z = childNodes.getLength() > 0;
        boolean z2 = false;
        openElement(element, writer, i, str, z);
        if (z) {
            int i2 = 0;
            while (i2 < childNodes.getLength()) {
                Node item = childNodes.item(i2);
                boolean z3 = z2;
                switch (item.getNodeType()) {
                    case 1:
                        z3 = true;
                        if (i2 == 0) {
                            writer.write(lSep);
                        }
                        write((Element) item, writer, i + 1, str);
                        break;
                    case 2:
                    case 6:
                        break;
                    case 3:
                        writer.write(encode(item.getNodeValue()));
                        z3 = z2;
                        break;
                    case 4:
                        writer.write("<![CDATA[");
                        writer.write(encodedata(((Text) item).getData()));
                        writer.write("]]>");
                        z3 = z2;
                        break;
                    case 5:
                        writer.write(38);
                        writer.write(item.getNodeName());
                        writer.write(59);
                        z3 = z2;
                        break;
                    case 7:
                        writer.write("<?");
                        writer.write(item.getNodeName());
                        String nodeValue = item.getNodeValue();
                        if (nodeValue != null && nodeValue.length() > 0) {
                            writer.write(32);
                            writer.write(nodeValue);
                        }
                        writer.write("?>");
                        z3 = z2;
                        break;
                    case 8:
                        writer.write("<!--");
                        writer.write(encode(item.getNodeValue()));
                        writer.write("-->");
                        z3 = z2;
                        break;
                    default:
                        z3 = z2;
                        break;
                }
                i2++;
                z2 = z3;
            }
            closeElement(element, writer, i, str, z2);
        }
    }

    public void writeXMLDeclaration(Writer writer) throws IOException {
        if (this.xmlDeclaration) {
            writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        }
    }
}
