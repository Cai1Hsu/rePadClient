package android.support.v4.content;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.support.v4.os.CancellationSignal;
import android.support.v4.os.OperationCanceledException;

/* loaded from: classes.jar:android/support/v4/content/ContentResolverCompat.class */
public final class ContentResolverCompat {
    private static final ContentResolverCompatImpl IMPL;

    /* loaded from: classes.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImpl.class */
    interface ContentResolverCompatImpl {
        Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal);
    }

    /* loaded from: classes.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImplBase.class */
    static class ContentResolverCompatImplBase implements ContentResolverCompatImpl {
        ContentResolverCompatImplBase() {
        }

        @Override // android.support.v4.content.ContentResolverCompat.ContentResolverCompatImpl
        public Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal) {
            if (cancellationSignal != null) {
                cancellationSignal.throwIfCanceled();
            }
            return contentResolver.query(uri, strArr, str, strArr2, str2);
        }
    }

    /* loaded from: classes.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImplJB.class */
    static class ContentResolverCompatImplJB extends ContentResolverCompatImplBase {
        ContentResolverCompatImplJB() {
        }

        @Override // android.support.v4.content.ContentResolverCompat.ContentResolverCompatImplBase, android.support.v4.content.ContentResolverCompat.ContentResolverCompatImpl
        public Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal) {
            Object cancellationSignalObject;
            if (cancellationSignal != null) {
                try {
                    cancellationSignalObject = cancellationSignal.getCancellationSignalObject();
                } catch (Exception e) {
                    if (!ContentResolverCompatJellybean.isFrameworkOperationCanceledException(e)) {
                        throw e;
                    }
                    throw new OperationCanceledException();
                }
            } else {
                cancellationSignalObject = null;
            }
            return ContentResolverCompatJellybean.query(contentResolver, uri, strArr, str, strArr2, str2, cancellationSignalObject);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 16) {
            IMPL = new ContentResolverCompatImplJB();
        } else {
            IMPL = new ContentResolverCompatImplBase();
        }
    }

    private ContentResolverCompat() {
    }

    public static Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal) {
        return IMPL.query(contentResolver, uri, strArr, str, strArr2, str2, cancellationSignal);
    }
}
