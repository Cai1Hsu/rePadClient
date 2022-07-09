package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.TimeComparison;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/DateSelector.class */
public class DateSelector extends BaseExtendSelector {
    public static final String CHECKDIRS_KEY = "checkdirs";
    public static final String DATETIME_KEY = "datetime";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    public static final String GRANULARITY_KEY = "granularity";
    public static final String MILLIS_KEY = "millis";
    public static final String PATTERN_KEY = "pattern";
    public static final String WHEN_KEY = "when";
    private long granularity;
    private String pattern;
    private long millis = -1;
    private String dateTime = null;
    private boolean includeDirs = false;
    private TimeComparison when = TimeComparison.EQUAL;

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/DateSelector$TimeComparisons.class */
    public static class TimeComparisons extends TimeComparison {
    }

    public DateSelector() {
        this.granularity = 0L;
        this.granularity = FILE_UTILS.getFileTimestampGranularity();
    }

    public long getMillis() {
        if (this.dateTime != null) {
            validate();
        }
        return this.millis;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        validate();
        return (file2.isDirectory() && !this.includeDirs) || this.when.evaluate(file2.lastModified(), this.millis, this.granularity);
    }

    public void setCheckdirs(boolean z) {
        this.includeDirs = z;
    }

    public void setDatetime(String str) {
        this.dateTime = str;
        this.millis = -1L;
    }

    public void setGranularity(int i) {
        this.granularity = i;
    }

    public void setMillis(long j) {
        this.millis = j;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0035 -> B:10:0x002e). Please submit an issue!!! */
    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if (MILLIS_KEY.equalsIgnoreCase(name)) {
                    try {
                        setMillis(Long.parseLong(parameterArr[i].getValue()));
                    } catch (NumberFormatException e) {
                        setError(new StringBuffer().append("Invalid millisecond setting ").append(parameterArr[i].getValue()).toString());
                    }
                } else if (DATETIME_KEY.equalsIgnoreCase(name)) {
                    setDatetime(parameterArr[i].getValue());
                } else if (CHECKDIRS_KEY.equalsIgnoreCase(name)) {
                    setCheckdirs(Project.toBoolean(parameterArr[i].getValue()));
                } else if (GRANULARITY_KEY.equalsIgnoreCase(name)) {
                    try {
                        setGranularity(Integer.parseInt(parameterArr[i].getValue()));
                    } catch (NumberFormatException e2) {
                        setError(new StringBuffer().append("Invalid granularity setting ").append(parameterArr[i].getValue()).toString());
                    }
                } else if ("when".equalsIgnoreCase(name)) {
                    setWhen(new TimeComparison(parameterArr[i].getValue()));
                } else if (PATTERN_KEY.equalsIgnoreCase(name)) {
                    setPattern(parameterArr[i].getValue());
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setPattern(String str) {
        this.pattern = str;
    }

    public void setWhen(TimeComparison timeComparison) {
        this.when = timeComparison;
    }

    public void setWhen(TimeComparisons timeComparisons) {
        setWhen((TimeComparison) timeComparisons);
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{dateselector date: ");
        stringBuffer.append(this.dateTime);
        stringBuffer.append(" compare: ").append(this.when.getValue());
        stringBuffer.append(" granularity: ");
        stringBuffer.append(this.granularity);
        if (this.pattern != null) {
            stringBuffer.append(" pattern: ").append(this.pattern);
        }
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.dateTime == null && this.millis < 0) {
            setError("You must provide a datetime or the number of milliseconds.");
        } else if (this.millis >= 0 || this.dateTime == null) {
        } else {
            try {
                setMillis((this.pattern == null ? DateFormat.getDateTimeInstance(3, 3, Locale.US) : new SimpleDateFormat(this.pattern)).parse(this.dateTime).getTime());
                if (this.millis >= 0) {
                    return;
                }
                setError(new StringBuffer().append("Date of ").append(this.dateTime).append(" results in negative milliseconds value").append(" relative to epoch (January 1, 1970, 00:00:00 GMT).").toString());
            } catch (ParseException e) {
                setError(new StringBuffer().append("Date of ").append(this.dateTime).append(" Cannot be parsed correctly. It should be in").append(this.pattern == null ? " MM/DD/YYYY HH:MM AM_PM" : this.pattern).append(" format.").toString());
            }
        }
    }
}
