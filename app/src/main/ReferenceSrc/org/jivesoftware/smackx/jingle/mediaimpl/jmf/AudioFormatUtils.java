package org.jivesoftware.smackx.jingle.mediaimpl.jmf;

import javax.media.format.AudioFormat;
import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioFormatUtils.class */
public class AudioFormatUtils {
    public static AudioFormat getAudioFormat(PayloadType payloadType) {
        AudioFormat audioFormat;
        switch (payloadType.getId()) {
            case 0:
                audioFormat = new AudioFormat("ULAW/rtp");
                break;
            case 1:
            case 2:
            default:
                audioFormat = null;
                break;
            case 3:
                audioFormat = new AudioFormat("gsm/rtp");
                break;
            case 4:
                audioFormat = new AudioFormat("g723/rtp");
                break;
        }
        return audioFormat;
    }
}
