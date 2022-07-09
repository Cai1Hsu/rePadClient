package android.support.v4.media;

import android.annotation.TargetApi;
import android.media.MediaDescription;
import android.net.Uri;
import android.support.annotation.RequiresApi;
import android.support.v4.media.MediaDescriptionCompatApi21;

@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.jar:android/support/v4/media/MediaDescriptionCompatApi23.class */
class MediaDescriptionCompatApi23 extends MediaDescriptionCompatApi21 {

    /* loaded from: classes.jar:android/support/v4/media/MediaDescriptionCompatApi23$Builder.class */
    static class Builder extends MediaDescriptionCompatApi21.Builder {
        Builder() {
        }

        public static void setMediaUri(Object obj, Uri uri) {
            ((MediaDescription.Builder) obj).setMediaUri(uri);
        }
    }

    MediaDescriptionCompatApi23() {
    }

    public static Uri getMediaUri(Object obj) {
        return ((MediaDescription) obj).getMediaUri();
    }
}
