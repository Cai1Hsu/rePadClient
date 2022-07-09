package com.edutech.appmanage.utils;

import android.app.DownloadManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
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

    public DownloadManagerPro(DownloadManager downloadManager) {
        this.downloadManager = downloadManager;
    }

    public int getStatusById(long downloadId) {
        return getInt(downloadId, "status");
    }

    public int[] getDownloadBytes(long downloadId) {
        int[] bytesAndStatus = getBytesAndStatus(downloadId);
        return new int[]{bytesAndStatus[0], bytesAndStatus[1]};
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[IF]}, finally: {[IF, INVOKE] complete} */
    public int[] getBytesAndStatus(long downloadId) {
        int[] bytesAndStatus = {-1, -1};
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                bytesAndStatus[0] = c.getInt(c.getColumnIndexOrThrow("bytes_so_far"));
                bytesAndStatus[1] = c.getInt(c.getColumnIndexOrThrow("total_size"));
                bytesAndStatus[2] = c.getInt(c.getColumnIndex("status"));
            }
            return bytesAndStatus;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }

    public int pauseDownload(long... ids) {
        initPauseMethod();
        if (pauseDownload == null) {
            return -1;
        }
        try {
            return ((Integer) pauseDownload.invoke(this.downloadManager, ids)).intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int resumeDownload(long... ids) {
        initResumeMethod();
        if (resumeDownload == null) {
            return -1;
        }
        try {
            return ((Integer) resumeDownload.invoke(this.downloadManager, ids)).intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public static boolean isExistPauseAndResumeMethod() {
        initPauseMethod();
        initResumeMethod();
        return (pauseDownload == null || resumeDownload == null) ? false : true;
    }

    private static void initPauseMethod() {
        if (!isInitPauseDownload) {
            isInitPauseDownload = true;
            try {
                pauseDownload = DownloadManager.class.getMethod(METHOD_NAME_PAUSE_DOWNLOAD, long[].class);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static void initResumeMethod() {
        if (!isInitResumeDownload) {
            isInitResumeDownload = true;
            try {
                resumeDownload = DownloadManager.class.getMethod(METHOD_NAME_RESUME_DOWNLOAD, long[].class);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public String getFileName(long downloadId) {
        return getString(downloadId, Build.VERSION.SDK_INT < 11 ? COLUMN_LOCAL_URI : COLUMN_LOCAL_FILENAME);
    }

    public String getUri(long downloadId) {
        return getString(downloadId, "uri");
    }

    public int getReason(long downloadId) {
        return getInt(downloadId, "reason");
    }

    public int getPausedReason(long downloadId) {
        return getInt(downloadId, "reason");
    }

    public int getErrorCode(long downloadId) {
        return getInt(downloadId, "reason");
    }

    /* loaded from: classes.dex */
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

        public void setNotiClass(String className) {
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
                    setNotiClass.invoke(this, className);
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }

        public void setNotiExtras(String extras) {
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
                    setNotiExtras.invoke(this, extras);
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[IF]}, finally: {[IF, INVOKE] complete} */
    private String getString(long downloadId, String columnName) {
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        String result = null;
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                result = c.getString(c.getColumnIndex(columnName));
            }
            return result;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[IF]}, finally: {[IF, INVOKE] complete} */
    private int getInt(long downloadId, String columnName) {
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        int result = -1;
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                result = c.getInt(c.getColumnIndex(columnName));
            }
            return result;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }
}
