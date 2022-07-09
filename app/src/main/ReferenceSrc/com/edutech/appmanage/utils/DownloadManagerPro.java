package com.edutech.appmanage.utils;

import android.app.DownloadManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import java.lang.reflect.Method;

/* loaded from: classes.jar:com/edutech/appmanage/utils/DownloadManagerPro.class */
public class DownloadManagerPro {
    public static final String COLUMN_LOCAL_FILENAME = "local_filename";
    public static final String COLUMN_LOCAL_URI = "local_uri";
    public static final String METHOD_NAME_PAUSE_DOWNLOAD = "pauseDownload";
    public static final String METHOD_NAME_RESUME_DOWNLOAD = "resumeDownload";
    private DownloadManager downloadManager;
    public static final Uri CONTENT_URI = Uri.parse("content://downloads/my_downloads");
    private static boolean isInitPauseDownload = false;
    private static boolean isInitResumeDownload = false;
    private static Method pauseDownload = null;
    private static Method resumeDownload = null;

    /* loaded from: classes.jar:com/edutech/appmanage/utils/DownloadManagerPro$RequestPro.class */
    public static class RequestPro extends DownloadManager.Request {
        public static final String METHOD_NAME_SET_NOTI_CLASS = "setNotiClass";
        public static final String METHOD_NAME_SET_NOTI_EXTRAS = "setNotiExtras";
        private static boolean isInitNotiClass = false;
        private static boolean isInitNotiExtras = false;
        private static Method setNotiClass = null;
        private static Method setNotiExtras = null;

        public RequestPro(Uri uri) {
            super(uri);
        }

        public void setNotiClass(String str) {
            synchronized (this) {
                if (!isInitNotiClass) {
                    isInitNotiClass = true;
                    try {
                        setNotiClass = DownloadManager.Request.class.getMethod(METHOD_NAME_SET_NOTI_CLASS, CharSequence.class);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            if (setNotiClass != null) {
                try {
                    setNotiClass.invoke(this, str);
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }

        public void setNotiExtras(String str) {
            synchronized (this) {
                if (!isInitNotiExtras) {
                    isInitNotiExtras = true;
                    try {
                        setNotiExtras = DownloadManager.Request.class.getMethod(METHOD_NAME_SET_NOTI_EXTRAS, CharSequence.class);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            if (setNotiExtras != null) {
                try {
                    setNotiExtras.invoke(this, str);
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
    }

    public DownloadManagerPro(DownloadManager downloadManager) {
        this.downloadManager = downloadManager;
    }

    private int getInt(long j, String str) {
        Cursor cursor = null;
        try {
            Cursor query = this.downloadManager.query(new DownloadManager.Query().setFilterById(j));
            int i = -1;
            if (query != null) {
                i = -1;
                if (query.moveToFirst()) {
                    cursor = query;
                    i = query.getInt(query.getColumnIndex(str));
                }
            }
            if (query != null) {
                query.close();
            }
            return i;
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    private String getString(long j, String str) {
        Cursor cursor = null;
        try {
            Cursor query = this.downloadManager.query(new DownloadManager.Query().setFilterById(j));
            String str2 = null;
            if (query != null) {
                str2 = null;
                if (query.moveToFirst()) {
                    cursor = query;
                    str2 = query.getString(query.getColumnIndex(str));
                }
            }
            if (query != null) {
                query.close();
            }
            return str2;
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    private static void initPauseMethod() {
        if (isInitPauseDownload) {
            return;
        }
        isInitPauseDownload = true;
        try {
            pauseDownload = DownloadManager.class.getMethod(METHOD_NAME_PAUSE_DOWNLOAD, long[].class);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void initResumeMethod() {
        if (isInitResumeDownload) {
            return;
        }
        isInitResumeDownload = true;
        try {
            resumeDownload = DownloadManager.class.getMethod(METHOD_NAME_RESUME_DOWNLOAD, long[].class);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isExistPauseAndResumeMethod() {
        initPauseMethod();
        initResumeMethod();
        return (pauseDownload == null || resumeDownload == null) ? false : true;
    }

    public int[] getBytesAndStatus(long j) {
        int[] iArr = {-1, -1};
        Cursor cursor = null;
        try {
            Cursor query = this.downloadManager.query(new DownloadManager.Query().setFilterById(j));
            if (query != null && query.moveToFirst()) {
                iArr[0] = query.getInt(query.getColumnIndexOrThrow("bytes_so_far"));
                iArr[1] = query.getInt(query.getColumnIndexOrThrow("total_size"));
                cursor = query;
                iArr[2] = query.getInt(query.getColumnIndex("status"));
            }
            if (query != null) {
                query.close();
            }
            return iArr;
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    public int[] getDownloadBytes(long j) {
        int[] bytesAndStatus = getBytesAndStatus(j);
        return new int[]{bytesAndStatus[0], bytesAndStatus[1]};
    }

    public int getErrorCode(long j) {
        return getInt(j, "reason");
    }

    public String getFileName(long j) {
        return getString(j, Build.VERSION.SDK_INT < 11 ? COLUMN_LOCAL_URI : COLUMN_LOCAL_FILENAME);
    }

    public int getPausedReason(long j) {
        return getInt(j, "reason");
    }

    public int getReason(long j) {
        return getInt(j, "reason");
    }

    public int getStatusById(long j) {
        return getInt(j, "status");
    }

    public String getUri(long j) {
        return getString(j, "uri");
    }

    public int pauseDownload(long... jArr) {
        int i;
        initPauseMethod();
        if (pauseDownload == null) {
            i = -1;
        } else {
            try {
                i = ((Integer) pauseDownload.invoke(this.downloadManager, jArr)).intValue();
            } catch (Exception e) {
                e.printStackTrace();
                i = -1;
            }
        }
        return i;
    }

    public int resumeDownload(long... jArr) {
        int i;
        initResumeMethod();
        if (resumeDownload == null) {
            i = -1;
        } else {
            try {
                i = ((Integer) resumeDownload.invoke(this.downloadManager, jArr)).intValue();
            } catch (Exception e) {
                e.printStackTrace();
                i = -1;
            }
        }
        return i;
    }
}
