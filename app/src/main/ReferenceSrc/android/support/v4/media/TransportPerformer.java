package android.support.v4.media;

import android.os.SystemClock;
import android.view.KeyEvent;
import org.apache.commons.net.finger.FingerClient;

@Deprecated
/* loaded from: classes.jar:android/support/v4/media/TransportPerformer.class */
public abstract class TransportPerformer {
    static final int AUDIOFOCUS_GAIN = 1;
    static final int AUDIOFOCUS_GAIN_TRANSIENT = 2;
    static final int AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK = 3;
    static final int AUDIOFOCUS_LOSS = -1;
    static final int AUDIOFOCUS_LOSS_TRANSIENT = -2;
    static final int AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK = -3;

    @Deprecated
    public void onAudioFocusChange(int i) {
        int i2;
        switch (i) {
            case -1:
                i2 = 127;
                break;
            default:
                i2 = 0;
                break;
        }
        if (i2 != 0) {
            long uptimeMillis = SystemClock.uptimeMillis();
            onMediaButtonDown(i2, new KeyEvent(uptimeMillis, uptimeMillis, 0, i2, 0));
            onMediaButtonUp(i2, new KeyEvent(uptimeMillis, uptimeMillis, 1, i2, 0));
        }
    }

    @Deprecated
    public int onGetBufferPercentage() {
        return 100;
    }

    @Deprecated
    public abstract long onGetCurrentPosition();

    @Deprecated
    public abstract long onGetDuration();

    @Deprecated
    public int onGetTransportControlFlags() {
        return 60;
    }

    @Deprecated
    public abstract boolean onIsPlaying();

    @Deprecated
    public boolean onMediaButtonDown(int i, KeyEvent keyEvent) {
        switch (i) {
            case FingerClient.DEFAULT_PORT /* 79 */:
            case 85:
                if (onIsPlaying()) {
                    onPause();
                    return true;
                }
                onStart();
                return true;
            case 86:
                onStop();
                return true;
            case TransportMediator.KEYCODE_MEDIA_PLAY /* 126 */:
                onStart();
                return true;
            case 127:
                onPause();
                return true;
            default:
                return true;
        }
    }

    @Deprecated
    public boolean onMediaButtonUp(int i, KeyEvent keyEvent) {
        return true;
    }

    @Deprecated
    public abstract void onPause();

    @Deprecated
    public abstract void onSeekTo(long j);

    @Deprecated
    public abstract void onStart();

    @Deprecated
    public abstract void onStop();
}
