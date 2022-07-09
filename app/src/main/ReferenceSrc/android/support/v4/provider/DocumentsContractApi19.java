package android.support.v4.provider;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.support.annotation.RequiresApi;
import android.text.TextUtils;
import android.util.Log;

@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.jar:android/support/v4/provider/DocumentsContractApi19.class */
class DocumentsContractApi19 {
    private static final int FLAG_VIRTUAL_DOCUMENT = 512;
    private static final String TAG = "DocumentFile";

    DocumentsContractApi19() {
    }

    public static boolean canRead(Context context, Uri uri) {
        boolean z = false;
        if (context.checkCallingOrSelfUriPermission(uri, 1) == 0 && !TextUtils.isEmpty(getRawType(context, uri))) {
            z = true;
        }
        return z;
    }

    public static boolean canWrite(Context context, Uri uri) {
        boolean z;
        if (context.checkCallingOrSelfUriPermission(uri, 2) != 0) {
            z = false;
        } else {
            String rawType = getRawType(context, uri);
            int queryForInt = queryForInt(context, uri, "flags", 0);
            z = false;
            if (!TextUtils.isEmpty(rawType)) {
                if ((queryForInt & 4) != 0) {
                    z = true;
                } else if (!"vnd.android.document/directory".equals(rawType) || (queryForInt & 8) == 0) {
                    z = false;
                    if (!TextUtils.isEmpty(rawType)) {
                        z = false;
                        if ((queryForInt & 2) != 0) {
                            z = true;
                        }
                    }
                } else {
                    z = true;
                }
            }
        }
        return z;
    }

    private static void closeQuietly(AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                autoCloseable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception e2) {
            }
        }
    }

    public static boolean delete(Context context, Uri uri) {
        return DocumentsContract.deleteDocument(context.getContentResolver(), uri);
    }

    public static boolean exists(Context context, Uri uri) {
        boolean z;
        ContentResolver contentResolver = context.getContentResolver();
        Cursor cursor = null;
        Cursor cursor2 = null;
        try {
            try {
                Cursor query = contentResolver.query(uri, new String[]{"document_id"}, null, null, null);
                cursor2 = query;
                cursor = query;
                z = query.getCount() > 0;
                closeQuietly(query);
            } catch (Exception e) {
                Cursor cursor3 = cursor2;
                cursor = cursor2;
                Log.w(TAG, "Failed query: " + e);
                closeQuietly(cursor2);
                z = false;
            }
            return z;
        } catch (Throwable th) {
            closeQuietly(cursor);
            throw th;
        }
    }

    public static long getFlags(Context context, Uri uri) {
        return queryForLong(context, uri, "flags", 0L);
    }

    public static String getName(Context context, Uri uri) {
        return queryForString(context, uri, "_display_name", null);
    }

    private static String getRawType(Context context, Uri uri) {
        return queryForString(context, uri, "mime_type", null);
    }

    public static String getType(Context context, Uri uri) {
        String rawType = getRawType(context, uri);
        String str = rawType;
        if ("vnd.android.document/directory".equals(rawType)) {
            str = null;
        }
        return str;
    }

    public static boolean isDirectory(Context context, Uri uri) {
        return "vnd.android.document/directory".equals(getRawType(context, uri));
    }

    public static boolean isDocumentUri(Context context, Uri uri) {
        return DocumentsContract.isDocumentUri(context, uri);
    }

    public static boolean isFile(Context context, Uri uri) {
        String rawType = getRawType(context, uri);
        return !"vnd.android.document/directory".equals(rawType) && !TextUtils.isEmpty(rawType);
    }

    public static boolean isVirtual(Context context, Uri uri) {
        boolean z = false;
        if (isDocumentUri(context, uri) && (getFlags(context, uri) & 512) != 0) {
            z = true;
        }
        return z;
    }

    public static long lastModified(Context context, Uri uri) {
        return queryForLong(context, uri, "last_modified", 0L);
    }

    public static long length(Context context, Uri uri) {
        return queryForLong(context, uri, "_size", 0L);
    }

    private static int queryForInt(Context context, Uri uri, String str, int i) {
        return (int) queryForLong(context, uri, str, i);
    }

    private static long queryForLong(Context context, Uri uri, String str, long j) {
        long query;
        ContentResolver contentResolver = context.getContentResolver();
        long j2 = null;
        Cursor cursor = null;
        try {
            try {
                query = contentResolver.query(uri, new String[]{str}, null, null, null);
                j2 = query;
            } catch (Exception e) {
                Cursor cursor2 = cursor;
                j2 = cursor;
                Log.w(TAG, "Failed query: " + e);
                closeQuietly(cursor);
            }
            if (query.moveToFirst()) {
                j2 = query;
                if (!query.isNull(0)) {
                    cursor = query;
                    j2 = query;
                    j2 = query.getLong(0);
                    return j;
                }
            }
            closeQuietly(query);
            return j;
        } finally {
            closeQuietly(j2);
        }
    }

    private static String queryForString(Context context, Uri uri, String str, String str2) {
        String str3;
        String query;
        ContentResolver contentResolver = context.getContentResolver();
        String str4 = null;
        Cursor cursor = null;
        try {
            try {
                query = contentResolver.query(uri, new String[]{str}, null, null, null);
                str4 = query;
            } catch (Exception e) {
                Cursor cursor2 = cursor;
                str4 = cursor;
                Log.w(TAG, "Failed query: " + e);
                closeQuietly(cursor);
                str3 = str2;
            }
            if (query.moveToFirst()) {
                str4 = query;
                if (!query.isNull(0)) {
                    cursor = query;
                    str4 = query;
                    str4 = query.getString(0);
                    return str3;
                }
            }
            closeQuietly(query);
            str3 = str2;
            return str3;
        } finally {
            closeQuietly(str4);
        }
    }
}
