package org.apache.tools.ant.taskdefs;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.taskdefs.condition.ConditionBase;
import org.apache.tools.ant.types.EnumeratedAttribute;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/WaitFor.class */
public class WaitFor extends ConditionBase {
    public static final long DEFAULT_CHECK_MILLIS = 500;
    public static final long DEFAULT_MAX_WAIT_MILLIS = 180000;
    public static final long ONE_DAY = 86400000;
    public static final long ONE_HOUR = 3600000;
    public static final long ONE_MILLISECOND = 1;
    public static final long ONE_MINUTE = 60000;
    public static final long ONE_SECOND = 1000;
    public static final long ONE_WEEK = 604800000;
    private String timeoutProperty;
    private long maxWait = DEFAULT_MAX_WAIT_MILLIS;
    private long maxWaitMultiplier = 1;
    private long checkEvery = 500;
    private long checkEveryMultiplier = 1;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/WaitFor$Unit.class */
    public static class Unit extends EnumeratedAttribute {
        private Map timeTable = new HashMap();
        public static final String MILLISECOND = "millisecond";
        public static final String SECOND = "second";
        public static final String MINUTE = "minute";
        public static final String HOUR = "hour";
        public static final String DAY = "day";
        public static final String WEEK = "week";
        private static final String[] UNITS = {MILLISECOND, SECOND, MINUTE, HOUR, DAY, WEEK};

        public Unit() {
            this.timeTable.put(MILLISECOND, new Long(1L));
            this.timeTable.put(SECOND, new Long(1000L));
            this.timeTable.put(MINUTE, new Long(60000L));
            this.timeTable.put(HOUR, new Long(3600000L));
            this.timeTable.put(DAY, new Long(86400000L));
            this.timeTable.put(WEEK, new Long(604800000L));
        }

        public long getMultiplier() {
            return ((Long) this.timeTable.get(getValue().toLowerCase(Locale.ENGLISH))).longValue();
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return UNITS;
        }
    }

    public WaitFor() {
        super("waitfor");
    }

    public WaitFor(String str) {
        super(str);
    }

    public long calculateCheckEveryMillis() {
        return this.checkEvery * this.checkEveryMultiplier;
    }

    public long calculateMaxWaitMillis() {
        return this.maxWait * this.maxWaitMultiplier;
    }

    public void execute() throws BuildException {
        if (countConditions() > 1) {
            throw new BuildException(new StringBuffer().append("You must not nest more than one condition into ").append(getTaskName()).toString());
        }
        if (countConditions() < 1) {
            throw new BuildException(new StringBuffer().append("You must nest a condition into ").append(getTaskName()).toString());
        }
        Condition condition = (Condition) getConditions().nextElement();
        try {
            long calculateMaxWaitMillis = calculateMaxWaitMillis();
            long calculateCheckEveryMillis = calculateCheckEveryMillis();
            long currentTimeMillis = System.currentTimeMillis();
            while (System.currentTimeMillis() < currentTimeMillis + calculateMaxWaitMillis) {
                if (condition.eval()) {
                    processSuccess();
                    return;
                }
                Thread.sleep(calculateCheckEveryMillis);
            }
        } catch (InterruptedException e) {
            log(new StringBuffer().append("Task ").append(getTaskName()).append(" interrupted, treating as timed out.").toString());
        }
        processTimeout();
    }

    protected void processSuccess() {
        log(new StringBuffer().append(getTaskName()).append(": condition was met").toString(), 3);
    }

    protected void processTimeout() {
        log(new StringBuffer().append(getTaskName()).append(": timeout").toString(), 3);
        if (this.timeoutProperty != null) {
            getProject().setNewProperty(this.timeoutProperty, "true");
        }
    }

    public void setCheckEvery(long j) {
        this.checkEvery = j;
    }

    public void setCheckEveryUnit(Unit unit) {
        this.checkEveryMultiplier = unit.getMultiplier();
    }

    public void setMaxWait(long j) {
        this.maxWait = j;
    }

    public void setMaxWaitUnit(Unit unit) {
        this.maxWaitMultiplier = unit.getMultiplier();
    }

    public void setTimeoutProperty(String str) {
        this.timeoutProperty = str;
    }
}
