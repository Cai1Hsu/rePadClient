package org.jivesoftware.smackx.jingle;

import java.util.Iterator;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.MediaNegotiator;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportNegotiator;
import org.jivesoftware.smackx.jingle.nat.TransportResolver;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.packet.JingleDescription;
import org.jivesoftware.smackx.packet.JingleError;
import org.jivesoftware.smackx.packet.JingleTransport;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStateUnknown.class */
public class JingleSessionStateUnknown extends JingleSessionState {
    private static JingleSessionStateUnknown INSTANCE = null;

    /* renamed from: org.jivesoftware.smackx.jingle.JingleSessionStateUnknown$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStateUnknown$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum = new int[JingleActionEnum.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0024 -> B:11:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INITIATE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_TERMINATE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    protected JingleSessionStateUnknown() {
    }

    public static JingleSessionState getInstance() {
        JingleSessionStateUnknown jingleSessionStateUnknown;
        synchronized (JingleSessionStateUnknown.class) {
            try {
                if (INSTANCE == null) {
                    INSTANCE = new JingleSessionStateUnknown();
                }
                jingleSessionStateUnknown = INSTANCE;
            } finally {
            }
        }
        return jingleSessionStateUnknown;
    }

    private IQ receiveSessionInitiateAction(JingleSession jingleSession, Jingle jingle) {
        IQ iq;
        if (1 == 0) {
            iq = jingleSession.createJingleError(jingle, JingleError.NEGOTIATION_ERROR);
        } else {
            IQ createAck = jingleSession.createAck(jingle);
            jingleSession.setSessionState(JingleSessionStatePending.getInstance());
            for (JingleContent jingleContent : jingle.getContentsList()) {
                ContentNegotiator contentNegotiator = new ContentNegotiator(jingleSession, jingleContent.getCreator(), jingleContent.getName());
                JingleDescription description = jingleContent.getDescription();
                JingleMediaManager jingleMediaManager = jingleSession.getMediaManagers().get(0);
                for (JingleMediaManager jingleMediaManager2 : jingleSession.getMediaManagers()) {
                    boolean z = true;
                    Iterator<PayloadType> it = jingleMediaManager2.getPayloads().iterator();
                    JingleMediaManager jingleMediaManager3 = jingleMediaManager;
                    while (true) {
                        jingleMediaManager = jingleMediaManager3;
                        if (it.hasNext()) {
                            PayloadType next = it.next();
                            boolean z2 = z;
                            for (PayloadType payloadType : description.getPayloadTypesList()) {
                                if (next.getId() != payloadType.getId()) {
                                    z2 = false;
                                }
                            }
                            z = z2;
                            if (z2) {
                                jingleMediaManager3 = jingleMediaManager2;
                                z = z2;
                            }
                        }
                    }
                }
                contentNegotiator.setMediaNegotiator(new MediaNegotiator(jingleSession, jingleMediaManager, description.getPayloadTypesList(), contentNegotiator));
                for (JingleTransport jingleTransport : jingleContent.getJingleTransportsList()) {
                    for (JingleMediaManager jingleMediaManager4 : jingleSession.getMediaManagers()) {
                        TransportResolver transportResolver = null;
                        try {
                            transportResolver = jingleMediaManager4.getTransportManager().getResolver(jingleSession);
                        } catch (XMPPException e) {
                            e.printStackTrace();
                        }
                        if (transportResolver.getType().equals(TransportResolver.Type.rawupd)) {
                            contentNegotiator.setTransportNegotiator(new TransportNegotiator.RawUdp(jingleSession, transportResolver, contentNegotiator));
                        }
                        if (transportResolver.getType().equals(TransportResolver.Type.ice)) {
                            contentNegotiator.setTransportNegotiator(new TransportNegotiator.Ice(jingleSession, transportResolver, contentNegotiator));
                        }
                    }
                }
                jingleSession.addContentNegotiator(contentNegotiator);
            }
            jingleSession.setupListeners();
            iq = createAck;
        }
        return iq;
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
        IQ receiveSessionTerminateAction;
        switch (AnonymousClass1.$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[jingleActionEnum.ordinal()]) {
            case 1:
                receiveSessionTerminateAction = receiveSessionInitiateAction(jingleSession, jingle);
                break;
            case 2:
                receiveSessionTerminateAction = receiveSessionTerminateAction(jingleSession, jingle);
                break;
            default:
                receiveSessionTerminateAction = jingleSession.createJingleError(jingle, JingleError.MALFORMED_STANZA);
                break;
        }
        return receiveSessionTerminateAction;
    }
}
