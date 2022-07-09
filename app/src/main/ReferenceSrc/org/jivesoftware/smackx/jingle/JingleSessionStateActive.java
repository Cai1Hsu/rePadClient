package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleError;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStateActive.class */
public class JingleSessionStateActive extends JingleSessionState {
    private static JingleSessionStateActive INSTANCE = null;

    /* renamed from: org.jivesoftware.smackx.jingle.JingleSessionStateActive$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStateActive$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum = new int[JingleActionEnum.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x005d -> B:28:0x004c). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0061 -> B:24:0x0040). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0065 -> B:34:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0069 -> B:32:0x002a). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x006d -> B:30:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0071 -> B:26:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_ACCEPT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_ADD.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_MODIFY.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_REMOVE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INFO.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_TERMINATE.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.TRANSPORT_INFO.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    protected JingleSessionStateActive() {
    }

    public static JingleSessionState getInstance() {
        JingleSessionStateActive jingleSessionStateActive;
        synchronized (JingleSessionStateActive.class) {
            try {
                if (INSTANCE == null) {
                    INSTANCE = new JingleSessionStateActive();
                }
                jingleSessionStateActive = INSTANCE;
            } finally {
            }
        }
        return jingleSessionStateActive;
    }

    private IQ receiveSessionTerminateAction(JingleSession jingleSession, Jingle jingle) {
        IQ createAck = jingleSession.createAck(jingle);
        try {
            jingleSession.terminate("Closed remotely");
        } catch (XMPPException e) {
            e.printStackTrace();
        }
        return createAck;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public void enter() {
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public void exit() {
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public IQ processJingle(JingleSession jingleSession, Jingle jingle, JingleActionEnum jingleActionEnum) {
        IQ iq = null;
        switch (AnonymousClass1.$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[jingleActionEnum.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 7:
                break;
            case 6:
                receiveSessionTerminateAction(jingleSession, jingle);
                iq = null;
                break;
            default:
                iq = jingleSession.createJingleError(jingle, JingleError.OUT_OF_ORDER);
                break;
        }
        return iq;
    }
}
