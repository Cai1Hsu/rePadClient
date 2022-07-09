package org.apache.tools.ant.taskdefs.optional.testing;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskAdapter;
import org.apache.tools.ant.taskdefs.Parallel;
import org.apache.tools.ant.taskdefs.Sequential;
import org.apache.tools.ant.taskdefs.WaitFor;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.taskdefs.condition.ConditionBase;
import org.apache.tools.ant.util.WorkerAnt;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/testing/Funtest.class */
public class Funtest extends Task {
    public static final String APPLICATION_EXCEPTION = "Application Exception";
    public static final String APPLICATION_FORCIBLY_SHUT_DOWN = "Application forcibly shut down";
    public static final String SHUTDOWN_INTERRUPTED = "Shutdown interrupted";
    public static final String SKIPPING_TESTS = "Condition failed -skipping tests";
    public static final String TEARDOWN_EXCEPTION = "Teardown Exception";
    public static final String WARN_OVERRIDING = "Overriding previous definition of ";
    private Sequential application;
    private BuildException applicationException;
    private BlockFor block;
    private NestedCondition condition;
    private String failureProperty;
    private Sequential reporting;
    private Sequential setup;
    private BuildException taskException;
    private Sequential teardown;
    private BuildException teardownException;
    private BuildException testException;
    private Sequential tests;
    private Parallel timedTests;
    private long timeout;
    private long timeoutUnitMultiplier = 1;
    private long shutdownTime = 10000;
    private long shutdownUnitMultiplier = 1;
    private String failureMessage = "Tests failed";
    private boolean failOnTeardownErrors = true;

    /* renamed from: org.apache.tools.ant.taskdefs.optional.testing.Funtest$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/testing/Funtest$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition.class */
    private static class NestedCondition extends ConditionBase implements Condition {
        private NestedCondition() {
        }

        NestedCondition(AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.apache.tools.ant.taskdefs.condition.Condition
        public boolean eval() {
            if (countConditions() != 1) {
                throw new BuildException("A single nested condition is required.");
            }
            return ((Condition) getConditions().nextElement()).eval();
        }
    }

    private void bind(Task task) {
        task.bindToOwner(this);
        task.init();
    }

    private void logOverride(String str, Object obj) {
        if (obj != null) {
            log(new StringBuffer().append("Overriding previous definition of <").append(str).append('>').toString(), 2);
        }
    }

    private Parallel newParallel(long j) {
        Parallel parallel = new Parallel();
        bind(parallel);
        parallel.setFailOnAny(true);
        parallel.setTimeout(j);
        return parallel;
    }

    private Parallel newParallel(long j, Task task) {
        Parallel newParallel = newParallel(j);
        newParallel.addTask(task);
        return newParallel;
    }

    private void validateTask(Task task, String str) {
        if (task == null || task.getProject() != null) {
            return;
        }
        throw new BuildException(new StringBuffer().append(str).append(" task is not bound to the project").append(task).toString());
    }

    public void addApplication(Sequential sequential) {
        logOverride("application", this.application);
        this.application = sequential;
    }

    public void addBlock(BlockFor blockFor) {
        logOverride("block", this.block);
        this.block = blockFor;
    }

    public void addReporting(Sequential sequential) {
        logOverride("reporting", this.reporting);
        this.reporting = sequential;
    }

    public void addSetup(Sequential sequential) {
        logOverride("setup", this.setup);
        this.setup = sequential;
    }

    public void addTeardown(Sequential sequential) {
        logOverride("teardown", this.teardown);
        this.teardown = sequential;
    }

    public void addTests(Sequential sequential) {
        logOverride("tests", this.tests);
        this.tests = sequential;
    }

    public ConditionBase createCondition() {
        logOverride("condition", this.condition);
        this.condition = new NestedCondition(null);
        return this.condition;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0144 A[Catch: InterruptedException -> 0x0195, TryCatch #0 {InterruptedException -> 0x0195, blocks: (B:34:0x012b, B:36:0x0144), top: B:59:0x012b }] */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() throws BuildException {
        BuildException e;
        validateTask(this.setup, "setup");
        validateTask(this.application, "application");
        validateTask(this.tests, "tests");
        validateTask(this.reporting, "reporting");
        validateTask(this.teardown, "teardown");
        if (this.condition != null && !this.condition.eval()) {
            log(SKIPPING_TESTS);
            return;
        }
        long j = this.timeout * this.timeoutUnitMultiplier;
        Parallel newParallel = newParallel(j);
        WorkerAnt workerAnt = new WorkerAnt(newParallel, null);
        if (this.application != null) {
            newParallel.addTask(this.application);
        }
        long j2 = 0;
        Sequential sequential = new Sequential();
        bind(sequential);
        if (this.block != null) {
            Task taskAdapter = new TaskAdapter(this.block);
            taskAdapter.bindToOwner(this);
            validateTask(taskAdapter, "block");
            sequential.addTask(taskAdapter);
            j2 = this.block.calculateMaxWaitMillis();
        }
        long j3 = j2;
        if (this.tests != null) {
            sequential.addTask(this.tests);
            j3 = j2 + j;
        }
        long j4 = j3;
        if (this.reporting != null) {
            sequential.addTask(this.reporting);
            j4 = j3 + j;
        }
        this.timedTests = newParallel(j4, sequential);
        try {
            try {
                if (this.setup != null) {
                    newParallel(j, this.setup).execute();
                }
                workerAnt.start();
                this.timedTests.execute();
                if (this.teardown != null) {
                    try {
                        try {
                            try {
                                newParallel(j, this.teardown).execute();
                            } catch (BuildException e2) {
                                e = e2;
                                this.teardownException = e;
                                long j5 = this.shutdownTime * this.shutdownUnitMultiplier;
                                workerAnt.waitUntilFinished(j5);
                                if (workerAnt.isAlive()) {
                                }
                                this.applicationException = workerAnt.getBuildException();
                                processExceptions();
                            }
                        } catch (BuildException e3) {
                            e = e3;
                        }
                    } catch (BuildException e4) {
                        e = e4;
                    }
                }
            } finally {
                if (this.teardown != null) {
                    try {
                        newParallel(j, this.teardown).execute();
                    } catch (BuildException e5) {
                        this.teardownException = e5;
                    }
                }
            }
        } catch (BuildException e6) {
            this.testException = e6;
            if (this.teardown != null) {
                try {
                    newParallel(j, this.teardown).execute();
                } catch (BuildException e7) {
                    e = e7;
                    this.teardownException = e;
                    long j52 = this.shutdownTime * this.shutdownUnitMultiplier;
                    workerAnt.waitUntilFinished(j52);
                    if (workerAnt.isAlive()) {
                    }
                    this.applicationException = workerAnt.getBuildException();
                    processExceptions();
                }
            }
        }
        try {
            long j522 = this.shutdownTime * this.shutdownUnitMultiplier;
            workerAnt.waitUntilFinished(j522);
            if (workerAnt.isAlive()) {
                log(APPLICATION_FORCIBLY_SHUT_DOWN, 1);
                workerAnt.interrupt();
                workerAnt.waitUntilFinished(j522);
            }
        } catch (InterruptedException e8) {
            log(SHUTDOWN_INTERRUPTED, e8, 3);
        }
        this.applicationException = workerAnt.getBuildException();
        processExceptions();
    }

    public BuildException getApplicationException() {
        return this.applicationException;
    }

    public BuildException getTaskException() {
        return this.taskException;
    }

    public BuildException getTeardownException() {
        return this.teardownException;
    }

    public BuildException getTestException() {
        return this.testException;
    }

    protected void ignoringThrowable(String str, Throwable th) {
        log(new StringBuffer().append(str).append(": ").append(th.toString()).toString(), th, 1);
    }

    protected void processExceptions() {
        this.taskException = this.testException;
        if (this.applicationException != null) {
            if (this.taskException == null || (this.taskException instanceof BuildTimeoutException)) {
                this.taskException = this.applicationException;
            } else {
                ignoringThrowable(APPLICATION_EXCEPTION, this.applicationException);
            }
        }
        if (this.teardownException != null) {
            if (this.taskException != null || !this.failOnTeardownErrors) {
                ignoringThrowable(TEARDOWN_EXCEPTION, this.teardownException);
            } else {
                this.taskException = this.teardownException;
            }
        }
        if (this.failureProperty != null && getProject().getProperty(this.failureProperty) != null) {
            log(this.failureMessage);
            if (this.taskException == null) {
                this.taskException = new BuildException(this.failureMessage);
            }
        }
        if (this.taskException != null) {
            throw this.taskException;
        }
    }

    public void setFailOnTeardownErrors(boolean z) {
        this.failOnTeardownErrors = z;
    }

    public void setFailureMessage(String str) {
        this.failureMessage = str;
    }

    public void setFailureProperty(String str) {
        this.failureProperty = str;
    }

    public void setShutdownTime(long j) {
        this.shutdownTime = j;
    }

    public void setShutdownUnit(WaitFor.Unit unit) {
        this.shutdownUnitMultiplier = unit.getMultiplier();
    }

    public void setTimeout(long j) {
        this.timeout = j;
    }

    public void setTimeoutUnit(WaitFor.Unit unit) {
        this.timeoutUnitMultiplier = unit.getMultiplier();
    }
}
