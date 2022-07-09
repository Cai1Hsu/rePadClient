package org.apache.tools.ant.taskdefs;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import java.util.TimeZone;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tstamp.class */
public class Tstamp extends Task {
    private Vector customFormats = new Vector();
    private String prefix = "";

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tstamp$CustomFormat.class */
    public class CustomFormat {
        private String country;
        private String language;
        private String pattern;
        private String propertyName;
        private final Tstamp this$0;
        private TimeZone timeZone;
        private String variant;
        private int offset = 0;
        private int field = 5;

        public CustomFormat(Tstamp tstamp) {
            this.this$0 = tstamp;
        }

        public void execute(Project project, Date date, Location location) {
            if (this.propertyName == null) {
                throw new BuildException("property attribute must be provided", location);
            }
            if (this.pattern == null) {
                throw new BuildException("pattern attribute must be provided", location);
            }
            SimpleDateFormat simpleDateFormat = this.language == null ? new SimpleDateFormat(this.pattern) : this.variant == null ? new SimpleDateFormat(this.pattern, new Locale(this.language, this.country)) : new SimpleDateFormat(this.pattern, new Locale(this.language, this.country, this.variant));
            Date date2 = date;
            if (this.offset != 0) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);
                calendar.add(this.field, this.offset);
                date2 = calendar.getTime();
            }
            if (this.timeZone != null) {
                simpleDateFormat.setTimeZone(this.timeZone);
            }
            this.this$0.setProperty(this.propertyName, simpleDateFormat.format(date2));
        }

        public void setLocale(String str) {
            StringTokenizer stringTokenizer = new StringTokenizer(str, " \t\n\r\f,");
            try {
                this.language = stringTokenizer.nextToken();
                if (!stringTokenizer.hasMoreElements()) {
                    this.country = "";
                    return;
                }
                this.country = stringTokenizer.nextToken();
                if (!stringTokenizer.hasMoreElements()) {
                    return;
                }
                this.variant = stringTokenizer.nextToken();
                if (!stringTokenizer.hasMoreElements()) {
                    return;
                }
                throw new BuildException("bad locale format", this.this$0.getLocation());
            } catch (NoSuchElementException e) {
                throw new BuildException("bad locale format", e, this.this$0.getLocation());
            }
        }

        public void setOffset(int i) {
            this.offset = i;
        }

        public void setPattern(String str) {
            this.pattern = str;
        }

        public void setProperty(String str) {
            this.propertyName = str;
        }

        public void setTimezone(String str) {
            this.timeZone = TimeZone.getTimeZone(str);
        }

        public void setUnit(String str) {
            this.this$0.log("DEPRECATED - The setUnit(String) method has been deprecated. Use setUnit(Tstamp.Unit) instead.");
            Unit unit = new Unit();
            unit.setValue(str);
            this.field = unit.getCalendarField();
        }

        public void setUnit(Unit unit) {
            this.field = unit.getCalendarField();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Tstamp$Unit.class */
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
            return ((Integer) this.calendarFields.get(getValue().toLowerCase(Locale.ENGLISH))).intValue();
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return UNITS;
        }
    }

    public void setProperty(String str, String str2) {
        getProject().setNewProperty(new StringBuffer().append(this.prefix).append(str).toString(), str2);
    }

    public CustomFormat createFormat() {
        CustomFormat customFormat = new CustomFormat(this);
        this.customFormats.addElement(customFormat);
        return customFormat;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        try {
            Date date = new Date();
            Enumeration elements = this.customFormats.elements();
            while (elements.hasMoreElements()) {
                ((CustomFormat) elements.nextElement()).execute(getProject(), date, getLocation());
            }
            setProperty("DSTAMP", new SimpleDateFormat("yyyyMMdd").format(date));
            setProperty("TSTAMP", new SimpleDateFormat("HHmm").format(date));
            setProperty("TODAY", new SimpleDateFormat("MMMM d yyyy", Locale.US).format(date));
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    public void setPrefix(String str) {
        this.prefix = str;
        if (!this.prefix.endsWith(".")) {
            this.prefix = new StringBuffer().append(this.prefix).append(".").toString();
        }
    }
}
