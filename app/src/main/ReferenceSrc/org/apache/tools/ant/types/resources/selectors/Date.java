package org.apache.tools.ant.types.resources.selectors;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.TimeComparison;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Date.class */
public class Date implements ResourceSelector {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final String MILLIS_OR_DATETIME = "Either the millis or the datetime attribute must be set.";
    private Long millis = null;
    private String dateTime = null;
    private String pattern = null;
    private TimeComparison when = TimeComparison.EQUAL;
    private long granularity = FILE_UTILS.getFileTimestampGranularity();

    public String getDatetime() {
        String str;
        synchronized (this) {
            str = this.dateTime;
        }
        return str;
    }

    public long getGranularity() {
        long j;
        synchronized (this) {
            j = this.granularity;
        }
        return j;
    }

    public long getMillis() {
        long longValue;
        synchronized (this) {
            longValue = this.millis == null ? -1L : this.millis.longValue();
        }
        return longValue;
    }

    public String getPattern() {
        String str;
        synchronized (this) {
            str = this.pattern;
        }
        return str;
    }

    public TimeComparison getWhen() {
        TimeComparison timeComparison;
        synchronized (this) {
            timeComparison = this.when;
        }
        return timeComparison;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v41, types: [java.text.DateFormat] */
    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean evaluate;
        synchronized (this) {
            if (this.dateTime == null && this.millis == null) {
                throw new BuildException(MILLIS_OR_DATETIME);
            }
            if (this.millis == null) {
                try {
                    long time = (this.pattern == null ? DateFormat.getDateTimeInstance(3, 3, Locale.US) : new SimpleDateFormat(this.pattern)).parse(this.dateTime).getTime();
                    if (time < 0) {
                        throw new BuildException(new StringBuffer().append("Date of ").append(this.dateTime).append(" results in negative milliseconds value").append(" relative to epoch (January 1, 1970, 00:00:00 GMT).").toString());
                    }
                    setMillis(time);
                } catch (ParseException e) {
                    throw new BuildException(new StringBuffer().append("Date of ").append(this.dateTime).append(" Cannot be parsed correctly. It should be in").append(this.pattern == null ? " MM/DD/YYYY HH:MM AM_PM" : this.pattern).append(" format.").toString());
                }
            }
            evaluate = this.when.evaluate(resource.getLastModified(), this.millis.longValue(), this.granularity);
        }
        return evaluate;
    }

    public void setDateTime(String str) {
        synchronized (this) {
            this.dateTime = str;
            this.millis = null;
        }
    }

    public void setGranularity(long j) {
        synchronized (this) {
            this.granularity = j;
        }
    }

    public void setMillis(long j) {
        synchronized (this) {
            this.millis = new Long(j);
        }
    }

    public void setPattern(String str) {
        synchronized (this) {
            this.pattern = str;
        }
    }

    public void setWhen(TimeComparison timeComparison) {
        synchronized (this) {
            this.when = timeComparison;
        }
    }
}
