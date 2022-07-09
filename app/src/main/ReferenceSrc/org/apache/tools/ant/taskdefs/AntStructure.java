package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.IntrospectionHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AntStructure.class */
public class AntStructure extends Task {
    private static final String LINE_SEP = System.getProperty("line.separator");
    static Class class$java$lang$Boolean;
    static Class class$org$apache$tools$ant$TaskContainer;
    static Class class$org$apache$tools$ant$types$EnumeratedAttribute;
    static Class class$org$apache$tools$ant$types$Reference;
    private File output;
    private StructurePrinter printer = new DTDPrinter(null);

    /* renamed from: org.apache.tools.ant.taskdefs.AntStructure$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AntStructure$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AntStructure$DTDPrinter.class */
    private static class DTDPrinter implements StructurePrinter {
        private static final String BOOLEAN = "%boolean;";
        private static final String TASKS = "%tasks;";
        private static final String TYPES = "%types;";
        private Hashtable visited;

        private DTDPrinter() {
            this.visited = new Hashtable();
        }

        DTDPrinter(AnonymousClass1 anonymousClass1) {
            this();
        }

        public static final boolean areNmtokens(String[] strArr) {
            boolean z;
            int i = 0;
            while (true) {
                if (i >= strArr.length) {
                    z = true;
                    break;
                } else if (!isNmtoken(strArr[i])) {
                    z = false;
                    break;
                } else {
                    i++;
                }
            }
            return z;
        }

        public static final boolean isNmtoken(String str) {
            boolean z;
            int length = str.length();
            int i = 0;
            while (true) {
                if (i >= length) {
                    z = true;
                    break;
                }
                char charAt = str.charAt(i);
                if (!Character.isLetterOrDigit(charAt) && charAt != '.' && charAt != '-' && charAt != '_' && charAt != ':') {
                    z = false;
                    break;
                }
                i++;
            }
            return z;
        }

        private void printHead(PrintWriter printWriter, Enumeration enumeration, Enumeration enumeration2) {
            printWriter.println("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
            printWriter.println("<!ENTITY % boolean \"(true|false|on|off|yes|no)\">");
            printWriter.print("<!ENTITY % tasks \"");
            boolean z = true;
            while (enumeration.hasMoreElements()) {
                String str = (String) enumeration.nextElement();
                if (!z) {
                    printWriter.print(" | ");
                } else {
                    z = false;
                }
                printWriter.print(str);
            }
            printWriter.println("\">");
            printWriter.print("<!ENTITY % types \"");
            boolean z2 = true;
            while (enumeration2.hasMoreElements()) {
                String str2 = (String) enumeration2.nextElement();
                if (!z2) {
                    printWriter.print(" | ");
                } else {
                    z2 = false;
                }
                printWriter.print(str2);
            }
            printWriter.println("\">");
            printWriter.println("");
            printWriter.print("<!ELEMENT project (target | extension-point | ");
            printWriter.print(TASKS);
            printWriter.print(" | ");
            printWriter.print(TYPES);
            printWriter.println(")*>");
            printWriter.println("<!ATTLIST project");
            printWriter.println("          name    CDATA #IMPLIED");
            printWriter.println("          default CDATA #IMPLIED");
            printWriter.println("          basedir CDATA #IMPLIED>");
            printWriter.println("");
        }

        private void printTargetAttrs(PrintWriter printWriter, String str) {
            printWriter.print("<!ATTLIST ");
            printWriter.println(str);
            printWriter.println("          id                      ID    #IMPLIED");
            printWriter.println("          name                    CDATA #REQUIRED");
            printWriter.println("          if                      CDATA #IMPLIED");
            printWriter.println("          unless                  CDATA #IMPLIED");
            printWriter.println("          depends                 CDATA #IMPLIED");
            printWriter.println("          extensionOf             CDATA #IMPLIED");
            printWriter.println("          onMissingExtensionPoint CDATA #IMPLIED");
            printWriter.println("          description             CDATA #IMPLIED>");
            printWriter.println("");
        }

        @Override // org.apache.tools.ant.taskdefs.AntStructure.StructurePrinter
        public void printElementDecl(PrintWriter printWriter, Project project, String str, Class cls) {
            Class cls2;
            Class cls3;
            Class cls4;
            Class cls5;
            Class cls6;
            if (this.visited.containsKey(str)) {
                return;
            }
            this.visited.put(str, "");
            try {
                IntrospectionHelper helper = IntrospectionHelper.getHelper(project, cls);
                StringBuffer stringBuffer = new StringBuffer("<!ELEMENT ");
                stringBuffer.append(str).append(" ");
                if (AntStructure.class$org$apache$tools$ant$types$Reference == null) {
                    cls2 = AntStructure.class$("org.apache.tools.ant.types.Reference");
                    AntStructure.class$org$apache$tools$ant$types$Reference = cls2;
                } else {
                    cls2 = AntStructure.class$org$apache$tools$ant$types$Reference;
                }
                if (cls2.equals(cls)) {
                    stringBuffer.append("EMPTY>").append(AntStructure.LINE_SEP);
                    stringBuffer.append("<!ATTLIST ").append(str);
                    stringBuffer.append(AntStructure.LINE_SEP).append("          id ID #IMPLIED");
                    stringBuffer.append(AntStructure.LINE_SEP).append("          refid IDREF #IMPLIED");
                    stringBuffer.append(">").append(AntStructure.LINE_SEP);
                    printWriter.println(stringBuffer);
                    return;
                }
                Vector vector = new Vector();
                if (helper.supportsCharacters()) {
                    vector.addElement("#PCDATA");
                }
                if (AntStructure.class$org$apache$tools$ant$TaskContainer == null) {
                    cls3 = AntStructure.class$("org.apache.tools.ant.TaskContainer");
                    AntStructure.class$org$apache$tools$ant$TaskContainer = cls3;
                } else {
                    cls3 = AntStructure.class$org$apache$tools$ant$TaskContainer;
                }
                if (cls3.isAssignableFrom(cls)) {
                    vector.addElement(TASKS);
                }
                Enumeration nestedElements = helper.getNestedElements();
                while (nestedElements.hasMoreElements()) {
                    vector.addElement(nestedElements.nextElement());
                }
                if (vector.isEmpty()) {
                    stringBuffer.append("EMPTY");
                } else {
                    stringBuffer.append("(");
                    int size = vector.size();
                    for (int i = 0; i < size; i++) {
                        if (i != 0) {
                            stringBuffer.append(" | ");
                        }
                        stringBuffer.append(vector.elementAt(i));
                    }
                    stringBuffer.append(")");
                    if (size > 1 || !vector.elementAt(0).equals("#PCDATA")) {
                        stringBuffer.append("*");
                    }
                }
                stringBuffer.append(">");
                printWriter.println(stringBuffer);
                StringBuffer stringBuffer2 = new StringBuffer("<!ATTLIST ");
                stringBuffer2.append(str);
                stringBuffer2.append(AntStructure.LINE_SEP).append("          id ID #IMPLIED");
                Enumeration attributes = helper.getAttributes();
                while (attributes.hasMoreElements()) {
                    String str2 = (String) attributes.nextElement();
                    if (!"id".equals(str2)) {
                        stringBuffer2.append(AntStructure.LINE_SEP).append("          ").append(str2).append(" ");
                        Class<?> attributeType = helper.getAttributeType(str2);
                        if (AntStructure.class$java$lang$Boolean == null) {
                            cls4 = AntStructure.class$("java.lang.Boolean");
                            AntStructure.class$java$lang$Boolean = cls4;
                        } else {
                            cls4 = AntStructure.class$java$lang$Boolean;
                        }
                        if (attributeType.equals(cls4) || attributeType.equals(Boolean.TYPE)) {
                            stringBuffer2.append(BOOLEAN).append(" ");
                        } else {
                            if (AntStructure.class$org$apache$tools$ant$types$Reference == null) {
                                cls5 = AntStructure.class$("org.apache.tools.ant.types.Reference");
                                AntStructure.class$org$apache$tools$ant$types$Reference = cls5;
                            } else {
                                cls5 = AntStructure.class$org$apache$tools$ant$types$Reference;
                            }
                            if (cls5.isAssignableFrom(attributeType)) {
                                stringBuffer2.append("IDREF ");
                            } else {
                                if (AntStructure.class$org$apache$tools$ant$types$EnumeratedAttribute == null) {
                                    cls6 = AntStructure.class$("org.apache.tools.ant.types.EnumeratedAttribute");
                                    AntStructure.class$org$apache$tools$ant$types$EnumeratedAttribute = cls6;
                                } else {
                                    cls6 = AntStructure.class$org$apache$tools$ant$types$EnumeratedAttribute;
                                }
                                if (cls6.isAssignableFrom(attributeType)) {
                                    try {
                                        String[] values = ((EnumeratedAttribute) attributeType.newInstance()).getValues();
                                        if (values == null || values.length == 0 || !areNmtokens(values)) {
                                            stringBuffer2.append("CDATA ");
                                        } else {
                                            stringBuffer2.append("(");
                                            for (int i2 = 0; i2 < values.length; i2++) {
                                                if (i2 != 0) {
                                                    stringBuffer2.append(" | ");
                                                }
                                                stringBuffer2.append(values[i2]);
                                            }
                                            stringBuffer2.append(") ");
                                        }
                                    } catch (IllegalAccessException e) {
                                        stringBuffer2.append("CDATA ");
                                    } catch (InstantiationException e2) {
                                        stringBuffer2.append("CDATA ");
                                    }
                                } else if (attributeType.getSuperclass() == null || !attributeType.getSuperclass().getName().equals("java.lang.Enum")) {
                                    stringBuffer2.append("CDATA ");
                                } else {
                                    try {
                                        Object[] objArr = (Object[]) attributeType.getMethod("values", null).invoke(null, null);
                                        if (objArr.length == 0) {
                                            stringBuffer2.append("CDATA ");
                                        } else {
                                            stringBuffer2.append('(');
                                            for (int i3 = 0; i3 < objArr.length; i3++) {
                                                if (i3 != 0) {
                                                    stringBuffer2.append(" | ");
                                                }
                                                stringBuffer2.append(attributeType.getMethod("name", null).invoke(objArr[i3], null));
                                            }
                                            stringBuffer2.append(") ");
                                        }
                                    } catch (Exception e3) {
                                        stringBuffer2.append("CDATA ");
                                    }
                                }
                            }
                        }
                        stringBuffer2.append("#IMPLIED");
                    }
                }
                stringBuffer2.append(">").append(AntStructure.LINE_SEP);
                printWriter.println(stringBuffer2);
                int size2 = vector.size();
                for (int i4 = 0; i4 < size2; i4++) {
                    String str3 = (String) vector.elementAt(i4);
                    if (!"#PCDATA".equals(str3) && !TASKS.equals(str3) && !TYPES.equals(str3)) {
                        printElementDecl(printWriter, project, str3, helper.getElementType(str3));
                    }
                }
            } catch (Throwable th) {
            }
        }

        @Override // org.apache.tools.ant.taskdefs.AntStructure.StructurePrinter
        public void printHead(PrintWriter printWriter, Project project, Hashtable hashtable, Hashtable hashtable2) {
            printHead(printWriter, hashtable.keys(), hashtable2.keys());
        }

        @Override // org.apache.tools.ant.taskdefs.AntStructure.StructurePrinter
        public void printTail(PrintWriter printWriter) {
            this.visited.clear();
        }

        @Override // org.apache.tools.ant.taskdefs.AntStructure.StructurePrinter
        public void printTargetDecl(PrintWriter printWriter) {
            printWriter.print("<!ELEMENT target (");
            printWriter.print(TASKS);
            printWriter.print(" | ");
            printWriter.print(TYPES);
            printWriter.println(")*>");
            printWriter.println("");
            printTargetAttrs(printWriter, "target");
            printWriter.println("<!ELEMENT extension-point EMPTY>");
            printWriter.println("");
            printTargetAttrs(printWriter, "extension-point");
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AntStructure$StructurePrinter.class */
    public interface StructurePrinter {
        void printElementDecl(PrintWriter printWriter, Project project, String str, Class cls);

        void printHead(PrintWriter printWriter, Project project, Hashtable hashtable, Hashtable hashtable2);

        void printTail(PrintWriter printWriter);

        void printTargetDecl(PrintWriter printWriter);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void add(StructurePrinter structurePrinter) {
        this.printer = structurePrinter;
    }

    protected boolean areNmtokens(String[] strArr) {
        return DTDPrinter.areNmtokens(strArr);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        PrintWriter printWriter;
        PrintWriter printWriter2;
        if (this.output == null) {
            throw new BuildException("output attribute is required", getLocation());
        }
        PrintWriter printWriter3 = null;
        PrintWriter printWriter4 = null;
        try {
            try {
                try {
                    printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(this.output), "UTF8"));
                } catch (IOException e) {
                    PrintWriter printWriter5 = printWriter3;
                    PrintWriter printWriter6 = printWriter3;
                    PrintWriter printWriter7 = printWriter3;
                    printWriter4 = printWriter3;
                    throw new BuildException(new StringBuffer().append("Error writing ").append(this.output.getAbsolutePath()).toString(), e, getLocation());
                }
            } catch (UnsupportedEncodingException e2) {
                printWriter = new PrintWriter(new FileWriter(this.output));
            }
            PrintWriter printWriter8 = printWriter4;
            PrintWriter printWriter9 = printWriter4;
            PrintWriter printWriter10 = printWriter4;
            PrintWriter printWriter11 = printWriter4;
            PrintWriter printWriter12 = printWriter4;
            PrintWriter printWriter13 = printWriter4;
            this.printer.printHead(printWriter4, getProject(), new Hashtable(getProject().getTaskDefinitions()), new Hashtable(getProject().getDataTypeDefinitions()));
            PrintWriter printWriter14 = printWriter4;
            this.printer.printTargetDecl(printWriter4);
            PrintWriter printWriter15 = printWriter4;
            Iterator it = getProject().getCopyOfDataTypeDefinitions().keySet().iterator();
            while (true) {
                PrintWriter printWriter16 = printWriter4;
                if (!it.hasNext()) {
                    break;
                }
                PrintWriter printWriter17 = printWriter4;
                String str = (String) it.next();
                PrintWriter printWriter18 = printWriter4;
                this.printer.printElementDecl(printWriter4, getProject(), str, (Class) getProject().getDataTypeDefinitions().get(str));
            }
            Iterator it2 = getProject().getCopyOfTaskDefinitions().keySet().iterator();
            while (true) {
                PrintWriter printWriter19 = printWriter4;
                if (!it2.hasNext()) {
                    break;
                }
                PrintWriter printWriter20 = printWriter4;
                String str2 = (String) it2.next();
                PrintWriter printWriter21 = printWriter4;
                this.printer.printElementDecl(printWriter4, getProject(), str2, (Class) getProject().getTaskDefinitions().get(str2));
            }
            this.printer.printTail(printWriter4);
            PrintWriter printWriter22 = printWriter4;
            if (!printWriter4.checkError()) {
                if (printWriter2 == null) {
                    return;
                }
                return;
            }
            PrintWriter printWriter23 = printWriter4;
            PrintWriter printWriter24 = printWriter4;
            printWriter3 = printWriter4;
            printWriter4 = printWriter4;
            throw new IOException("Encountered an error writing Ant structure");
        } finally {
            if (printWriter4 != null) {
                printWriter4.close();
            }
        }
    }

    protected boolean isNmtoken(String str) {
        return DTDPrinter.isNmtoken(str);
    }

    public void setOutput(File file) {
        this.output = file;
    }
}
