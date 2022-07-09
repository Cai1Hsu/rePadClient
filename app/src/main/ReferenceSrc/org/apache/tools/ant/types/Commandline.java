package org.apache.tools.ant.types;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/Commandline.class */
public class Commandline implements Cloneable {
    private Vector arguments = new Vector();
    private String executable = null;
    private static final boolean IS_WIN_9X = Os.isFamily(Os.FAMILY_9X);
    protected static final String DISCLAIMER = new StringBuffer().append(StringUtils.LINE_SEP).append("The ' characters around the executable and arguments are").append(StringUtils.LINE_SEP).append("not part of the command.").append(StringUtils.LINE_SEP).toString();

    /* loaded from: classes.jar:org/apache/tools/ant/types/Commandline$Argument.class */
    public static class Argument extends ProjectComponent {
        private String[] parts;
        private String prefix = "";
        private String suffix = "";

        public String[] getParts() {
            String[] strArr;
            if (this.parts != null && this.parts.length != 0 && (this.prefix.length() != 0 || this.suffix.length() != 0)) {
                String[] strArr2 = new String[this.parts.length];
                int i = 0;
                while (true) {
                    strArr = strArr2;
                    if (i >= strArr2.length) {
                        break;
                    }
                    strArr2[i] = new StringBuffer().append(this.prefix).append(this.parts[i]).append(this.suffix).toString();
                    i++;
                }
            } else {
                strArr = this.parts;
            }
            return strArr;
        }

        public void setFile(File file) {
            this.parts = new String[]{file.getAbsolutePath()};
        }

        public void setLine(String str) {
            if (str == null) {
                return;
            }
            this.parts = Commandline.translateCommandline(str);
        }

        public void setPath(Path path) {
            this.parts = new String[]{path.toString()};
        }

        public void setPathref(Reference reference) {
            Path path = new Path(getProject());
            path.setRefid(reference);
            this.parts = new String[]{path.toString()};
        }

        public void setPrefix(String str) {
            if (str == null) {
                str = "";
            }
            this.prefix = str;
        }

        public void setSuffix(String str) {
            if (str == null) {
                str = "";
            }
            this.suffix = str;
        }

        public void setValue(String str) {
            this.parts = new String[]{str};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/Commandline$Marker.class */
    public class Marker {
        private int position;
        private final Commandline this$0;
        private int realPos = -1;
        private String prefix = "";
        private String suffix = "";

        Marker(Commandline commandline, int i) {
            this.this$0 = commandline;
            this.position = i;
        }

        public int getPosition() {
            if (this.realPos == -1) {
                this.realPos = this.this$0.executable == null ? 0 : 1;
                for (int i = 0; i < this.position; i++) {
                    this.realPos += ((Argument) this.this$0.arguments.elementAt(i)).getParts().length;
                }
            }
            return this.realPos;
        }

        public String getPrefix() {
            return this.prefix;
        }

        public String getSuffix() {
            return this.suffix;
        }

        public void setPrefix(String str) {
            if (str == null) {
                str = "";
            }
            this.prefix = str;
        }

        public void setSuffix(String str) {
            if (str == null) {
                str = "";
            }
            this.suffix = str;
        }
    }

    public Commandline() {
    }

    public Commandline(String str) {
        String[] translateCommandline = translateCommandline(str);
        if (translateCommandline == null || translateCommandline.length <= 0) {
            return;
        }
        setExecutable(translateCommandline[0]);
        for (int i = 1; i < translateCommandline.length; i++) {
            createArgument().setValue(translateCommandline[i]);
        }
    }

    public static String describeArguments(Commandline commandline) {
        return describeArguments(commandline.getArguments());
    }

    public static String describeArguments(String[] strArr) {
        return describeArguments(strArr, 0);
    }

    protected static String describeArguments(String[] strArr, int i) {
        String str;
        if (strArr == null || strArr.length <= i) {
            str = "";
        } else {
            StringBuffer stringBuffer = new StringBuffer("argument");
            if (strArr.length > i) {
                stringBuffer.append("s");
            }
            stringBuffer.append(":").append(StringUtils.LINE_SEP);
            while (i < strArr.length) {
                stringBuffer.append("'").append(strArr[i]).append("'").append(StringUtils.LINE_SEP);
                i++;
            }
            stringBuffer.append(DISCLAIMER);
            str = stringBuffer.toString();
        }
        return str;
    }

    public static String describeCommand(Commandline commandline) {
        return describeCommand(commandline.getCommandline());
    }

    public static String describeCommand(String[] strArr) {
        String str;
        if (strArr == null || strArr.length == 0) {
            str = "";
        } else {
            StringBuffer stringBuffer = new StringBuffer("Executing '");
            stringBuffer.append(strArr[0]);
            stringBuffer.append("'");
            if (strArr.length > 1) {
                stringBuffer.append(" with ");
                stringBuffer.append(describeArguments(strArr, 1));
            } else {
                stringBuffer.append(DISCLAIMER);
            }
            str = stringBuffer.toString();
        }
        return str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x005e, code lost:
        if (r4.indexOf(59) != (-1)) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String quoteArgument(String str) {
        String stringBuffer;
        if (str.indexOf("\"") <= -1) {
            if (str.indexOf("'") <= -1 && str.indexOf(" ") <= -1) {
                stringBuffer = str;
                if (IS_WIN_9X) {
                    stringBuffer = str;
                }
            }
            stringBuffer = new StringBuffer().append('\"').append(str).append('\"').toString();
        } else if (str.indexOf("'") > -1) {
            throw new BuildException("Can't handle single and double quotes in same argument");
        } else {
            stringBuffer = new StringBuffer().append('\'').append(str).append('\'').toString();
        }
        return stringBuffer;
    }

    public static String toString(String[] strArr) {
        String str;
        if (strArr == null || strArr.length == 0) {
            str = "";
        } else {
            StringBuffer stringBuffer = new StringBuffer();
            for (int i = 0; i < strArr.length; i++) {
                if (i > 0) {
                    stringBuffer.append(' ');
                }
                stringBuffer.append(quoteArgument(strArr[i]));
            }
            str = stringBuffer.toString();
        }
        return str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00df, code lost:
        if (r10.length() != 0) goto L35;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String[] translateCommandline(String str) {
        String[] strArr;
        StringBuffer stringBuffer;
        boolean z;
        if (str == null || str.length() == 0) {
            strArr = new String[0];
        } else {
            boolean z2 = false;
            StringTokenizer stringTokenizer = new StringTokenizer(str, "\"' ", true);
            Vector vector = new Vector();
            StringBuffer stringBuffer2 = new StringBuffer();
            boolean z3 = false;
            while (stringTokenizer.hasMoreTokens()) {
                String nextToken = stringTokenizer.nextToken();
                switch (z2) {
                    case true:
                        if (!"'".equals(nextToken)) {
                            stringBuffer2.append(nextToken);
                            break;
                        } else {
                            z3 = true;
                            z2 = false;
                            break;
                        }
                    case true:
                        if (!"\"".equals(nextToken)) {
                            stringBuffer2.append(nextToken);
                            break;
                        } else {
                            z3 = true;
                            z2 = false;
                            break;
                        }
                    default:
                        if ("'".equals(nextToken)) {
                            z = true;
                            stringBuffer = stringBuffer2;
                        } else if ("\"".equals(nextToken)) {
                            z = true;
                            stringBuffer = stringBuffer2;
                        } else if (" ".equals(nextToken)) {
                            if (!z3) {
                                stringBuffer = stringBuffer2;
                                z = z2;
                                break;
                            }
                            vector.addElement(stringBuffer2.toString());
                            stringBuffer = new StringBuffer();
                            z = z2;
                        } else {
                            stringBuffer2.append(nextToken);
                            stringBuffer = stringBuffer2;
                            z = z2;
                        }
                        z3 = false;
                        stringBuffer2 = stringBuffer;
                        z2 = z;
                        break;
                }
            }
            if (z3 || stringBuffer2.length() != 0) {
                vector.addElement(stringBuffer2.toString());
            }
            if (z2 || z2) {
                throw new BuildException(new StringBuffer().append("unbalanced quotes in ").append(str).toString());
            }
            strArr = new String[vector.size()];
            vector.copyInto(strArr);
        }
        return strArr;
    }

    public void addArguments(String[] strArr) {
        for (String str : strArr) {
            createArgument().setValue(str);
        }
    }

    public void addArgumentsToList(ListIterator listIterator) {
        int size = this.arguments.size();
        for (int i = 0; i < size; i++) {
            String[] parts = ((Argument) this.arguments.elementAt(i)).getParts();
            if (parts != null) {
                for (String str : parts) {
                    listIterator.add(str);
                }
            }
        }
    }

    public void addCommandToList(ListIterator listIterator) {
        if (this.executable != null) {
            listIterator.add(this.executable);
        }
        addArgumentsToList(listIterator);
    }

    public void clear() {
        this.executable = null;
        this.arguments.removeAllElements();
    }

    public void clearArgs() {
        this.arguments.removeAllElements();
    }

    public Object clone() {
        try {
            Commandline commandline = (Commandline) super.clone();
            commandline.arguments = (Vector) this.arguments.clone();
            return commandline;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    public Argument createArgument() {
        return createArgument(false);
    }

    public Argument createArgument(boolean z) {
        Argument argument = new Argument();
        if (z) {
            this.arguments.insertElementAt(argument, 0);
        } else {
            this.arguments.addElement(argument);
        }
        return argument;
    }

    public Marker createMarker() {
        return new Marker(this, this.arguments.size());
    }

    public String describeArguments() {
        return describeArguments(this);
    }

    public String describeCommand() {
        return describeCommand(this);
    }

    public String[] getArguments() {
        ArrayList arrayList = new ArrayList(this.arguments.size() * 2);
        addArgumentsToList(arrayList.listIterator());
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String[] getCommandline() {
        LinkedList linkedList = new LinkedList();
        addCommandToList(linkedList.listIterator());
        return (String[]) linkedList.toArray(new String[linkedList.size()]);
    }

    public String getExecutable() {
        return this.executable;
    }

    public Iterator iterator() {
        return this.arguments.iterator();
    }

    public void setExecutable(String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        this.executable = str.replace('/', File.separatorChar).replace('\\', File.separatorChar);
    }

    public int size() {
        return getCommandline().length;
    }

    public String toString() {
        return toString(getCommandline());
    }
}
