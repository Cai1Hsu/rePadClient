package org.apache.tools.ant.taskdefs.cvslib;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.TimeZone;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.DOMElementWriter;
import org.apache.tools.ant.util.DOMUtils;
import org.apache.tools.ant.util.DateUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter.class */
public class ChangeLogWriter {
    private static final SimpleDateFormat OUTPUT_DATE = new SimpleDateFormat(DateUtils.ISO8601_DATE_PATTERN);
    private static final SimpleDateFormat OUTPUT_TIME = new SimpleDateFormat("HH:mm");
    private static final DOMElementWriter DOM_WRITER = new DOMElementWriter();

    static {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        OUTPUT_DATE.setTimeZone(timeZone);
        OUTPUT_TIME.setTimeZone(timeZone);
    }

    private void printEntry(Document document, PrintWriter printWriter, CVSEntry cVSEntry) throws IOException {
        Element createElement = document.createElement("entry");
        DOMUtils.appendTextElement(createElement, "date", OUTPUT_DATE.format(cVSEntry.getDate()));
        DOMUtils.appendTextElement(createElement, "time", OUTPUT_TIME.format(cVSEntry.getDate()));
        DOMUtils.appendCDATAElement(createElement, "author", cVSEntry.getAuthor());
        Enumeration elements = cVSEntry.getFiles().elements();
        while (elements.hasMoreElements()) {
            RCSFile rCSFile = (RCSFile) elements.nextElement();
            Element createChildElement = DOMUtils.createChildElement(createElement, "file");
            DOMUtils.appendCDATAElement(createChildElement, "name", rCSFile.getName());
            DOMUtils.appendTextElement(createChildElement, "revision", rCSFile.getRevision());
            String previousRevision = rCSFile.getPreviousRevision();
            if (previousRevision != null) {
                DOMUtils.appendTextElement(createChildElement, "prevrevision", previousRevision);
            }
        }
        DOMUtils.appendCDATAElement(createElement, "msg", cVSEntry.getComment());
        DOM_WRITER.write(createElement, printWriter, 1, "\t");
    }

    public void printChangeLog(PrintWriter printWriter, CVSEntry[] cVSEntryArr) {
        try {
            printWriter.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            Document newDocument = DOMUtils.newDocument();
            Element createElement = newDocument.createElement("changelog");
            DOM_WRITER.openElement(createElement, printWriter, 0, "\t");
            printWriter.println();
            for (CVSEntry cVSEntry : cVSEntryArr) {
                printEntry(newDocument, printWriter, cVSEntry);
            }
            DOM_WRITER.closeElement(createElement, printWriter, 0, "\t", true);
            printWriter.flush();
            printWriter.close();
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }
}
