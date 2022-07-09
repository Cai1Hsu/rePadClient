package org.apache.commons.io;

import java.io.File;

@Deprecated
/* loaded from: classes.jar:org/apache/commons/io/FileCleaner.class */
public class FileCleaner {
    static final FileCleaningTracker theInstance = new FileCleaningTracker();

    @Deprecated
    public static void exitWhenFinished() {
        synchronized (FileCleaner.class) {
            try {
                theInstance.exitWhenFinished();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static FileCleaningTracker getInstance() {
        return theInstance;
    }

    @Deprecated
    public static int getTrackCount() {
        return theInstance.getTrackCount();
    }

    @Deprecated
    public static void track(File file, Object obj) {
        theInstance.track(file, obj);
    }

    @Deprecated
    public static void track(File file, Object obj, FileDeleteStrategy fileDeleteStrategy) {
        theInstance.track(file, obj, fileDeleteStrategy);
    }

    @Deprecated
    public static void track(String str, Object obj) {
        theInstance.track(str, obj);
    }

    @Deprecated
    public static void track(String str, Object obj, FileDeleteStrategy fileDeleteStrategy) {
        theInstance.track(str, obj, fileDeleteStrategy);
    }
}
