package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.packet.Jingle;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStatePending.class */
public class JingleSessionStatePending extends JingleSessionState {
    private static JingleSessionStatePending INSTANCE = null;

    /* renamed from: org.jivesoftware.smackx.jingle.JingleSessionStatePending$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStatePending$1.class */
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
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_MODIFY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_REMOVE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_ACCEPT.ordinal()] = 4;
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

    protected JingleSessionStatePending() {
    }

    public static JingleSessionState getInstance() {
        JingleSessionStatePending jingleSessionStatePending;
        synchronized (JingleSessionStatePending.class) {
            try {
                if (INSTANCE == null) {
                    INSTANCE = new JingleSessionStatePending();
                }
                jingleSessionStatePending = INSTANCE;
            } finally {
            }
        }
        return jingleSessionStatePending;
    }

    private IQ receiveContentAcceptAction(Jingle jingle) {
        return null;
    }

    private IQ receiveSessionAcceptAction(JingleSession jingleSession, Jingle jingle) {
        jingleSession.setSessionState(JingleSessionStateActive.getInstance());
        return jingleSession.createAck(jingle);
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
                iq = receiveContentAcceptAction(jingle);
                break;
            case 2:
            case 3:
            case 5:
            case 7:
                break;
            case 4:
                iq = receiveSessionAcceptAction(jingleSession, jingle);
                break;
            case 6:
                iq = receiveSessionTerminateAction(jingleSession, jingle);
                break;
            default:
                iq = null;
                break;
        }
        return iq;
    }
}
