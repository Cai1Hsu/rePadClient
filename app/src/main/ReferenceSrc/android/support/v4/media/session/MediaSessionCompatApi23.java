package android.support.v4.media.session;

import android.annotation.TargetApi;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.media.session.MediaSessionCompatApi21;

@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi23.class */
class MediaSessionCompatApi23 {

    /* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi23$Callback.class */
    public interface Callback extends MediaSessionCompatApi21.Callback {
        void onPlayFromUri(Uri uri, Bundle bundle);
    }

    /* loaded from: classes.jar:android/support/v4/media/session/MediaSessionCompatApi23$CallbackProxy.class */
    static class CallbackProxy<T extends Callback> extends MediaSessionCompatApi21.CallbackProxy<T> {
        public CallbackProxy(T t) {
            super(t);
        }

        @Override // android.media.session.MediaSession.Callback
        public void onPlayFromUri(Uri uri, Bundle bundle) {
            ((Callback) this.mCallback).onPlayFromUri(uri, bundle);
        }
    }

    MediaSessionCompatApi23() {
    }

    public static Object createCallback(Callback callback) {
        return new CallbackProxy(callback);
    }
}
