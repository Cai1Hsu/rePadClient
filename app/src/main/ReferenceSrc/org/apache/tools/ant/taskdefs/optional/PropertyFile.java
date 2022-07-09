package org.apache.tools.ant.taskdefs.optional;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.LayoutPreservingProperties;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/PropertyFile.class */
public class PropertyFile extends Task {
    private String comment;
    private Vector entries = new Vector();
    private Properties properties;
    private File propertyfile;
    private boolean useJDKProperties;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/PropertyFile$Entry.class */
    public static class Entry {
        private static final String DEFAULT_DATE_VALUE = "now";
        private static final int DEFAULT_INT_VALUE = 0;
        private static final String DEFAULT_STRING_VALUE = "";
        private String key = null;
        private int type = 2;
        private int operation = 2;
        private String value = null;
        private String defaultValue = null;
        private String newValue = null;
        private String pattern = null;
        private int field = 5;

        /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation.class */
        public static class Operation extends EnumeratedAttribute {
            public static final int DECREMENT_OPER = 1;
            public static final int DELETE_OPER = 3;
            public static final int EQUALS_OPER = 2;
            public static final int INCREMENT_OPER = 0;

            public static int toOperation(String str) {
                return "+".equals(str) ? 0 : "-".equals(str) ? 1 : "del".equals(str) ? 3 : 2;
            }

            @Override // org.apache.tools.ant.types.EnumeratedAttribute
            public String[] getValues() {
                return new String[]{"+", "-", "=", "del"};
            }
        }

        /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type.class */
        public static class Type extends EnumeratedAttribute {
            public static final int DATE_TYPE = 1;
            public static final int INTEGER_TYPE = 0;
            public static final int STRING_TYPE = 2;

            public static int toType(String str) {
                return "int".equals(str) ? 0 : "date".equals(str) ? 1 : 2;
            }

            @Override // org.apache.tools.ant.types.EnumeratedAttribute
            public String[] getValues() {
                return new String[]{"int", "date", "string"};
            }
        }

        private void checkParameters() throws BuildException {
            if (this.type == 2 && this.operation == 1) {
                throw new BuildException(new StringBuffer().append("- is not supported for string properties (key:").append(this.key).append(")").toString());
            }
            if (this.value == null && this.defaultValue == null && this.operation != 3) {
                throw new BuildException(new StringBuffer().append("\"value\" and/or \"default\" attribute must be specified (key:").append(this.key).append(")").toString());
            }
            if (this.key == null) {
                throw new BuildException("key is mandatory");
            }
            if (this.type == 2 && this.pattern != null) {
                throw new BuildException(new StringBuffer().append("pattern is not supported for string properties (key:").append(this.key).append(")").toString());
            }
        }

        private void executeDate(String str) throws BuildException {
            Calendar calendar = Calendar.getInstance();
            if (this.pattern == null) {
                this.pattern = "yyyy/MM/dd HH:mm";
            }
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(this.pattern);
            String currentValue = getCurrentValue(str);
            String str2 = currentValue;
            if (currentValue == null) {
                str2 = DEFAULT_DATE_VALUE;
            }
            if (DEFAULT_DATE_VALUE.equals(str2)) {
                calendar.setTime(new Date());
            } else {
                try {
                    calendar.setTime(simpleDateFormat.parse(str2));
                } catch (ParseException e) {
                }
            }
            if (this.operation != 2) {
                try {
                    int parseInt = Integer.parseInt(this.value);
                    int i = parseInt;
                    if (this.operation == 1) {
                        i = parseInt * (-1);
                    }
                    calendar.add(this.field, i);
                } catch (NumberFormatException e2) {
                    throw new BuildException(new StringBuffer().append("Value not an integer on ").append(this.key).toString());
                }
            }
            this.newValue = simpleDateFormat.format(calendar.getTime());
        }

        private void executeInteger(String str) throws BuildException {
            int i = 0;
            int i2 = 0;
            DecimalFormat decimalFormat = this.pattern != null ? new DecimalFormat(this.pattern) : new DecimalFormat();
            try {
                String currentValue = getCurrentValue(str);
                i = currentValue != null ? decimalFormat.parse(currentValue).intValue() : 0;
            } catch (NumberFormatException e) {
            } catch (ParseException e2) {
            }
            if (this.operation == 2) {
                i2 = i;
            } else {
                int i3 = 1;
                if (this.value != null) {
                    try {
                        i3 = decimalFormat.parse(this.value).intValue();
                    } catch (NumberFormatException e3) {
                        i3 = 1;
                    } catch (ParseException e4) {
                        i3 = 1;
                    }
                }
                if (this.operation == 0) {
                    i2 = i + i3;
                } else if (this.operation == 1) {
                    i2 = i - i3;
                }
            }
            this.newValue = decimalFormat.format(i2);
        }

        private void executeString(String str) throws BuildException {
            String str2 = "";
            String currentValue = getCurrentValue(str);
            String str3 = currentValue;
            if (currentValue == null) {
                str3 = "";
            }
            if (this.operation == 2) {
                str2 = str3;
            } else if (this.operation == 0) {
                str2 = new StringBuffer().append(str3).append(this.value).toString();
            }
            this.newValue = str2;
        }

        private String getCurrentValue(String str) {
            String str2;
            if (this.operation == 2) {
                String str3 = null;
                if (this.value != null) {
                    str3 = null;
                    if (this.defaultValue == null) {
                        str3 = this.value;
                    }
                }
                String str4 = str3;
                if (this.value == null) {
                    str4 = str3;
                    if (this.defaultValue != null) {
                        str4 = str3;
                        if (str != null) {
                            str4 = str;
                        }
                    }
                }
                String str5 = str4;
                if (this.value == null) {
                    str5 = str4;
                    if (this.defaultValue != null) {
                        str5 = str4;
                        if (str == null) {
                            str5 = this.defaultValue;
                        }
                    }
                }
                String str6 = str5;
                if (this.value != null) {
                    str6 = str5;
                    if (this.defaultValue != null) {
                        str6 = str5;
                        if (str != null) {
                            str6 = this.value;
                        }
                    }
                }
                str2 = str6;
                if (this.value != null) {
                    str2 = str6;
                    if (this.defaultValue != null) {
                        str2 = str6;
                        if (str == null) {
                            str2 = this.defaultValue;
                        }
                    }
                }
            } else {
                str2 = str == null ? this.defaultValue : str;
            }
            return str2;
        }

        protected void executeOn(Properties properties) throws BuildException {
            checkParameters();
            if (this.operation == 3) {
                properties.remove(this.key);
                return;
            }
            String str = (String) properties.get(this.key);
            try {
                if (this.type == 0) {
                    executeInteger(str);
                } else if (this.type == 1) {
                    executeDate(str);
                } else if (this.type != 2) {
                    throw new BuildException(new StringBuffer().append("Unknown operation type: ").append(this.type).toString());
                } else {
                    executeString(str);
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
            if (this.newValue == null) {
                this.newValue = "";
            }
            properties.put(this.key, this.newValue);
        }

        public void setDefault(String str) {
            this.defaultValue = str;
        }

        public void setKey(String str) {
            this.key = str;
        }

        public void setOperation(Operation operation) {
            this.operation = Operation.toOperation(operation.getValue());
        }

        public void setPattern(String str) {
            this.pattern = str;
        }

        public void setType(Type type) {
            this.type = Type.toType(type.getValue());
        }

        public void setUnit(Unit unit) {
            this.field = unit.getCalendarField();
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/PropertyFile$Unit.class */
    public static class Unit extends EnumeratedAttribute {
        private static final String DAY = "day";
        private static final String HOUR = "hour";
        private static final String MILLISECOND = "millisecond";
        private static final String MINUTE = "minute";
        private static final String SECOND = "second";
        private static final String WEEK = "week";
        private Map calendarFields = new HashMap();
        private static final String MONTH = "month";
        private static final String YEAR = "year";
        private static final String[] UNITS = {"millisecond", "second", "minute", "hour", "day", "week", MONTH, YEAR};

        public Unit() {
            this.calendarFields.put("millisecond", new Integer(14));
            this.calendarFields.put("second", new Integer(13));
            this.calendarFields.put("minute", new Integer(12));
            this.calendarFields.put("hour", new Integer(11));
            this.calendarFields.put("day", new Integer(5));
            this.calendarFields.put("week", new Integer(3));
            this.calendarFields.put(MONTH, new Integer(2));
            this.calendarFields.put(YEAR, new Integer(1));
        }

        public int getCalendarField() {
            return ((Integer) this.calendarFields.get(getValue().toLowerCase())).intValue();
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return UNITS;
        }
    }

    private boolean checkParam(File file) {
        return file != null;
    }

    private void checkParameters() throws BuildException {
        if (!checkParam(this.propertyfile)) {
            throw new BuildException("file token must not be null.", getLocation());
        }
    }

    private void executeOperation() throws BuildException {
        Enumeration elements = this.entries.elements();
        while (elements.hasMoreElements()) {
            ((Entry) elements.nextElement()).executeOn(this.properties);
        }
    }

    private void readFile() throws BuildException {
        Throwable th;
        Throwable th2;
        FileInputStream fileInputStream;
        if (this.useJDKProperties) {
            this.properties = new Properties();
        } else {
            this.properties = new LayoutPreservingProperties();
        }
        try {
            if (this.propertyfile.exists()) {
                log(new StringBuffer().append("Updating property file: ").append(this.propertyfile.getAbsolutePath()).toString());
                FileInputStream fileInputStream2 = null;
                try {
                    fileInputStream = new FileInputStream(this.propertyfile);
                } catch (Throwable th3) {
                    th2 = th3;
                }
                try {
                    this.properties.load(new BufferedInputStream(fileInputStream));
                    if (fileInputStream == null) {
                        return;
                    }
                    fileInputStream.close();
                    return;
                } catch (Throwable th4) {
                    th2 = th4;
                    fileInputStream2 = fileInputStream;
                    if (fileInputStream2 != null) {
                        fileInputStream2.close();
                    }
                    throw th2;
                }
            }
            log(new StringBuffer().append("Creating new property file: ").append(this.propertyfile.getAbsolutePath()).toString());
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(this.propertyfile.getAbsolutePath());
                try {
                    fileOutputStream2.flush();
                    if (fileOutputStream2 == null) {
                        return;
                    }
                    fileOutputStream2.close();
                } catch (Throwable th5) {
                    th = th5;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th6) {
                th = th6;
            }
        } catch (IOException e) {
            throw new BuildException(e.toString());
        }
    }

    private void writeFile() throws BuildException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            this.properties.store(byteArrayOutputStream, this.comment);
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(this.propertyfile);
                try {
                    fileOutputStream.write(byteArrayOutputStream.toByteArray());
                    fileOutputStream.close();
                } catch (IOException e) {
                    FileUtils.getFileUtils().tryHardToDelete(this.propertyfile);
                    throw e;
                }
            } catch (IOException e2) {
                throw new BuildException(e2, getLocation());
            }
        } catch (IOException e3) {
            throw new BuildException(e3, getLocation());
        }
    }

    public Entry createEntry() {
        Entry entry = new Entry();
        this.entries.addElement(entry);
        return entry;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        checkParameters();
        readFile();
        executeOperation();
        writeFile();
    }

    public void setComment(String str) {
        this.comment = str;
    }

    public void setFile(File file) {
        this.propertyfile = file;
    }

    public void setJDKProperties(boolean z) {
        this.useJDKProperties = z;
    }
}
