package android.support.v4.media.session;

import android.annotation.TargetApi;
import android.media.Rating;
import android.media.RemoteControlClient;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.media.session.MediaSessionCompatApi18;
import org.apache.http.HttpStatus;

@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi19.class */
class MediaSessionCompatApi19 {
    private static final long ACTION_SET_RATING = 128;
    private static final String METADATA_KEY_RATING = "android.media.metadata.RATING";
    private static final String METADATA_KEY_USER_RATING = "android.media.metadata.USER_RATING";
    private static final String METADATA_KEY_YEAR = "android.media.metadata.YEAR";

    /* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi19$Callback.class */
    interface Callback extends MediaSessionCompatApi18.Callback {
        void onSetRating(Object obj);
    }

    /* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener.class */
    static class OnMetadataUpdateListener<T extends Callback> implements RemoteControlClient.OnMetadataUpdateListener {
        protected final T mCallback;

        public OnMetadataUpdateListener(T t) {
            this.mCallback = t;
        }

        @Override // android.media.RemoteControlClient.OnMetadataUpdateListener
        public void onMetadataUpdate(int i, Object obj) {
            if (i != 268435457 || !(obj instanceof Rating)) {
                return;
            }
            this.mCallback.onSetRating(obj);
        }
    }

    MediaSessionCompatApi19() {
    }

    static void addNewMetadata(Bundle bundle, RemoteControlClient.MetadataEditor metadataEditor) {
        if (bundle == null) {
            return;
        }
        if (bundle.containsKey("android.media.metadata.YEAR")) {
            metadataEditor.putLong(8, bundle.getLong("android.media.metadata.YEAR"));
        }
        if (bundle.containsKey("android.media.metadata.RATING")) {
            metadataEditor.putObject(HttpStatus.SC_SWITCHING_PROTOCOLS, (Object) bundle.getParcelable("android.media.metadata.RATING"));
        }
        if (!bundle.containsKey("android.media.metadata.USER_RATING")) {
            return;
        }
        metadataEditor.putObject(268435457, (Object) bundle.getParcelable("android.media.metadata.USER_RATING"));
    }

    public static Object createMetadataUpdateListener(Callback callback) {
        return new OnMetadataUpdateListener(callback);
    }

    static int getRccTransportControlFlagsFromActions(long j) {
        int rccTransportControlFlagsFromActions = MediaSessionCompatApi18.getRccTransportControlFlagsFromActions(j);
        int i = rccTransportControlFlagsFromActions;
        if ((128 & j) != 0) {
            i = rccTransportControlFlagsFromActions | 512;
        }
        return i;
    }

    public static void setMetadata(Object obj, Bundle bundle, long j) {
        RemoteControlClient.MetadataEditor editMetadata = ((RemoteControlClient) obj).editMetadata(true);
        MediaSessionCompatApi14.buildOldMetadata(bundle, editMetadata);
        addNewMetadata(bundle, editMetadata);
        if ((128 & j) != 0) {
            editMetadata.addEditableKey(268435457);
        }
        editMetadata.apply();
    }

    public static void setOnMetadataUpdateListener(Object obj, Object obj2) {
        ((RemoteControlClient) obj).setMetadataUpdateListener((RemoteControlClient.OnMetadataUpdateListener) obj2);
    }

    public static void setTransportControlFlags(Object obj, long j) {
        ((RemoteControlClient) obj).setTransportControlFlags(getRccTransportControlFlagsFromActions(j));
    }
}
