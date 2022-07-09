package android.support.v4.os;

import android.os.AsyncTask;
import android.os.Build;

/* loaded from: classes.jar:android/support/v4/os/AsyncTaskCompat.class */
public final class AsyncTaskCompat {
    private AsyncTaskCompat() {
    }

    public static <Params, Progress, Result> AsyncTask<Params, Progress, Result> executeParallel(AsyncTask<Params, Progress, Result> asyncTask, Params... paramsArr) {
        if (asyncTask == null) {
            throw new IllegalArgumentException("task can not be null");
        }
        if (Build.VERSION.SDK_INT >= 11) {
            AsyncTaskCompatHoneycomb.executeParallel(asyncTask, paramsArr);
        } else {
            asyncTask.execute(paramsArr);
        }
        return asyncTask;
    }
}
