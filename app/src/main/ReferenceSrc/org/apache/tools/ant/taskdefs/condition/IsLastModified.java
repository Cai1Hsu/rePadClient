package org.apache.tools.ant.taskdefs.condition;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.Touch;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsLastModified.class */
public class IsLastModified extends ProjectComponent implements Condition {
    private Resource resource;
    private long millis = -1;
    private String dateTime = null;
    private Touch.DateFormatFactory dfFactory = Touch.DEFAULT_DF_FACTORY;
    private CompareMode mode = CompareMode.EQUALS;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode.class */
    public static class CompareMode extends EnumeratedAttribute {
        private static final String AFTER_TEXT = "after";
        private static final String BEFORE_TEXT = "before";
        private static final String NOT_AFTER_TEXT = "not-after";
        private static final String NOT_BEFORE_TEXT = "not-before";
        private static final String EQUALS_TEXT = "equals";
        private static final CompareMode EQUALS = new CompareMode(EQUALS_TEXT);

        public CompareMode() {
            this(EQUALS_TEXT);
        }

        public CompareMode(String str) {
            setValue(str);
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{EQUALS_TEXT, BEFORE_TEXT, AFTER_TEXT, NOT_BEFORE_TEXT, NOT_AFTER_TEXT};
        }
    }

    public void add(Resource resource) {
        if (this.resource != null) {
            throw new BuildException("only one resource can be tested");
        }
        this.resource = resource;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z = true;
        validate();
        long millis = getMillis();
        long lastModified = this.resource.getLastModified();
        log(new StringBuffer().append("expected timestamp: ").append(millis).append(" (").append(new Date(millis)).append(")").append(", actual timestamp: ").append(lastModified).append(" (").append(new Date(lastModified)).append(")").toString(), 3);
        if ("equals".equals(this.mode.getValue())) {
            if (millis != lastModified) {
                z = false;
            }
        } else if ("before".equals(this.mode.getValue())) {
            if (millis <= lastModified) {
                z = false;
            }
        } else if ("not-before".equals(this.mode.getValue())) {
            if (millis > lastModified) {
                z = false;
            }
        } else if ("after".equals(this.mode.getValue())) {
            if (millis >= lastModified) {
                z = false;
            }
        } else if (!"not-after".equals(this.mode.getValue())) {
            throw new BuildException(new StringBuffer().append("Unknown mode ").append(this.mode.getValue()).toString());
        } else {
            if (millis < lastModified) {
                z = false;
            }
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected long getMillis() throws BuildException {
        long j = 0;
        if (this.millis >= 0) {
            j = this.millis;
        } else if ("now".equalsIgnoreCase(this.dateTime)) {
            j = System.currentTimeMillis();
        } else {
            try {
                j = this.dfFactory.getPrimaryFormat().parse(this.dateTime).getTime();
            } catch (ParseException e) {
                e = e;
                DateFormat fallbackFormat = this.dfFactory.getFallbackFormat();
                if (fallbackFormat != null) {
                    try {
                        j = fallbackFormat.parse(this.dateTime).getTime();
                    } catch (ParseException e2) {
                        e = e2;
                        if (e != null) {
                        }
                        return j;
                    }
                }
                if (e != null) {
                    throw new BuildException(e.getMessage(), e, getLocation());
                }
            }
        }
        return j;
    }

    public void setDatetime(String str) {
        this.dateTime = str;
    }

    public void setMillis(long j) {
        this.millis = j;
    }

    public void setMode(CompareMode compareMode) {
        this.mode = compareMode;
    }

    public void setPattern(String str) {
        this.dfFactory = new Touch.DateFormatFactory(this, str) { // from class: org.apache.tools.ant.taskdefs.condition.IsLastModified.1
            private final IsLastModified this$0;
            private final String val$pattern;

            {
                this.this$0 = this;
                this.val$pattern = str;
            }

            @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
            public DateFormat getFallbackFormat() {
                return null;
            }

            @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
            public DateFormat getPrimaryFormat() {
                return new SimpleDateFormat(this.val$pattern);
            }
        };
    }

    protected void validate() throws BuildException {
        if (this.millis < 0 || this.dateTime == null) {
            if (this.millis < 0 && this.dateTime == null) {
                throw new BuildException("millis or dateTime is required");
            }
            if (this.resource != null) {
                return;
            }
            throw new BuildException("resource is required");
        }
        throw new BuildException("Only one of dateTime and millis can be set");
    }
}
