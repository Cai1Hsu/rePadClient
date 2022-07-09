package org.apache.tools.ant.util;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.BuildException;
import org.xml.sax.Parser;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/* loaded from: classes.jar:org/apache/tools/ant/util/JAXPUtils.class */
public class JAXPUtils {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static SAXParserFactory parserFactory = null;
    private static SAXParserFactory nsParserFactory = null;
    private static DocumentBuilderFactory builderFactory = null;

    private static BuildException convertToBuildException(SAXException sAXException) {
        Exception exception = sAXException.getException();
        return exception != null ? new BuildException(exception) : new BuildException(sAXException);
    }

    public static DocumentBuilder getDocumentBuilder() throws BuildException {
        try {
            return getDocumentBuilderFactory().newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            throw new BuildException(e);
        }
    }

    private static DocumentBuilderFactory getDocumentBuilderFactory() throws BuildException {
        DocumentBuilderFactory documentBuilderFactory;
        synchronized (JAXPUtils.class) {
            try {
                if (builderFactory == null) {
                    try {
                        builderFactory = DocumentBuilderFactory.newInstance();
                    } catch (FactoryConfigurationError e) {
                        throw new BuildException(new StringBuffer().append("Document builder factory has not been configured correctly: ").append(e.getMessage()).toString(), e);
                    }
                }
                documentBuilderFactory = builderFactory;
            } finally {
            }
        }
        return documentBuilderFactory;
    }

    public static SAXParserFactory getNSParserFactory() throws BuildException {
        SAXParserFactory sAXParserFactory;
        synchronized (JAXPUtils.class) {
            try {
                if (nsParserFactory == null) {
                    nsParserFactory = newParserFactory();
                    nsParserFactory.setNamespaceAware(true);
                }
                sAXParserFactory = nsParserFactory;
            } finally {
            }
        }
        return sAXParserFactory;
    }

    public static XMLReader getNamespaceXMLReader() throws BuildException {
        try {
            return newSAXParser(getNSParserFactory()).getXMLReader();
        } catch (SAXException e) {
            throw convertToBuildException(e);
        }
    }

    public static Parser getParser() throws BuildException {
        try {
            return newSAXParser(getParserFactory()).getParser();
        } catch (SAXException e) {
            throw convertToBuildException(e);
        }
    }

    public static SAXParserFactory getParserFactory() throws BuildException {
        SAXParserFactory sAXParserFactory;
        synchronized (JAXPUtils.class) {
            try {
                if (parserFactory == null) {
                    parserFactory = newParserFactory();
                }
                sAXParserFactory = parserFactory;
            } finally {
            }
        }
        return sAXParserFactory;
    }

    public static String getSystemId(File file) {
        return FILE_UTILS.toURI(file.getAbsolutePath());
    }

    public static XMLReader getXMLReader() throws BuildException {
        try {
            return newSAXParser(getParserFactory()).getXMLReader();
        } catch (SAXException e) {
            throw convertToBuildException(e);
        }
    }

    public static SAXParserFactory newParserFactory() throws BuildException {
        try {
            return SAXParserFactory.newInstance();
        } catch (FactoryConfigurationError e) {
            throw new BuildException(new StringBuffer().append("XML parser factory has not been configured correctly: ").append(e.getMessage()).toString(), e);
        }
    }

    private static SAXParser newSAXParser(SAXParserFactory sAXParserFactory) throws BuildException {
        try {
            return sAXParserFactory.newSAXParser();
        } catch (ParserConfigurationException e) {
            throw new BuildException(new StringBuffer().append("Cannot create parser for the given configuration: ").append(e.getMessage()).toString(), e);
        } catch (SAXException e2) {
            throw convertToBuildException(e2);
        }
    }
}
