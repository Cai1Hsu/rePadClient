package org.apache.tools.ant.util;

import java.io.IOException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/util/RetryHandler.class */
public class RetryHandler {
    private int retriesAllowed;
    private Task task;

    public RetryHandler(int i, Task task) {
        this.retriesAllowed = 0;
        this.retriesAllowed = i;
        this.task = task;
    }

    public void execute(Retryable retryable, String str) throws IOException {
        int i = 0;
        while (true) {
            try {
                retryable.execute();
                return;
            } catch (IOException e) {
                i++;
                if (i > this.retriesAllowed && this.retriesAllowed > -1) {
                    this.task.log(new StringBuffer().append("try #").append(i).append(": IO error (").append(str).append("), number of maximum retries reached (").append(this.retriesAllowed).append("), giving up").toString(), 1);
                    throw e;
                }
                this.task.log(new StringBuffer().append("try #").append(i).append(": IO error (").append(str).append("), retrying").toString(), 1);
            }
        }
    }
}
