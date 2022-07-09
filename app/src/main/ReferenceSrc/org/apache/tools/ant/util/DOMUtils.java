package org.apache.tools.ant.util;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: classes.jar:org/apache/tools/ant/util/DOMUtils.class */
public class DOMUtils {
    public static void appendCDATA(Element element, String str) {
        element.appendChild(element.getOwnerDocument().createCDATASection(str));
    }

    public static void appendCDATAElement(Element element, String str, String str2) {
        appendCDATA(createChildElement(element, str), str2);
    }

    public static void appendText(Element element, String str) {
        element.appendChild(element.getOwnerDocument().createTextNode(str));
    }

    public static void appendTextElement(Element element, String str, String str2) {
        appendText(createChildElement(element, str), str2);
    }

    public static Element createChildElement(Element element, String str) {
        Element createElement = element.getOwnerDocument().createElement(str);
        element.appendChild(createElement);
        return createElement;
    }

    public static Document newDocument() {
        return JAXPUtils.getDocumentBuilder().newDocument();
    }
}
