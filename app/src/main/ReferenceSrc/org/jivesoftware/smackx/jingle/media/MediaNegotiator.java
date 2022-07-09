package org.jivesoftware.smackx.jingle.media;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.ContentNegotiator;
import org.jivesoftware.smackx.jingle.JingleActionEnum;
import org.jivesoftware.smackx.jingle.JingleException;
import org.jivesoftware.smackx.jingle.JingleNegotiator;
import org.jivesoftware.smackx.jingle.JingleNegotiatorState;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.listeners.JingleListener;
import org.jivesoftware.smackx.jingle.listeners.JingleMediaListener;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.packet.JingleDescription;
import org.jivesoftware.smackx.packet.JingleError;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/MediaNegotiator.class */
public class MediaNegotiator extends JingleNegotiator {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(MediaNegotiator.class);
    private final JingleMediaManager mediaManager;
    private ContentNegotiator parentNegotiator;
    private final List<PayloadType> localAudioPts = new ArrayList();
    private final List<PayloadType> remoteAudioPts = new ArrayList();
    private PayloadType bestCommonAudioPt = null;

    /* renamed from: org.jivesoftware.smackx.jingle.media.MediaNegotiator$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/MediaNegotiator$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum = new int[JingleActionEnum.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0051 -> B:21:0x0040). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0055 -> B:29:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0059 -> B:27:0x002a). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x005d -> B:25:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0061 -> B:23:0x0014). Please submit an issue!!! */
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
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INFO.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INITIATE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_ACCEPT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    public MediaNegotiator(JingleSession jingleSession, JingleMediaManager jingleMediaManager, List<PayloadType> list, ContentNegotiator contentNegotiator) {
        super(jingleSession);
        this.mediaManager = jingleMediaManager;
        this.parentNegotiator = contentNegotiator;
        if (list == null || list.size() <= 0) {
            return;
        }
        this.localAudioPts.addAll(list);
    }

    private PayloadType calculateBestCommonAudioPt(List<PayloadType> list) {
        PayloadType.Audio audio;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        PayloadType.Audio audio2 = null;
        if (!list.isEmpty()) {
            arrayList.addAll(this.localAudioPts);
            arrayList.retainAll(list);
            arrayList2.addAll(list);
            arrayList2.retainAll(this.localAudioPts);
            audio2 = null;
            if (!arrayList.isEmpty()) {
                audio2 = null;
                if (!arrayList2.isEmpty()) {
                    if (this.session.getInitiator().equals(this.session.getConnection().getUser())) {
                        PayloadType preferredPayloadType = this.mediaManager.getPreferredPayloadType();
                        PayloadType.Audio audio3 = null;
                        if (preferredPayloadType != null) {
                            audio3 = null;
                            if (preferredPayloadType instanceof PayloadType.Audio) {
                                audio3 = null;
                                if (arrayList.contains(preferredPayloadType)) {
                                    audio3 = (PayloadType.Audio) preferredPayloadType;
                                }
                            }
                        }
                        audio2 = audio3;
                        if (audio3 == null) {
                            Iterator it = arrayList.iterator();
                            while (true) {
                                audio2 = audio3;
                                if (!it.hasNext()) {
                                    break;
                                }
                                PayloadType payloadType = (PayloadType) it.next();
                                if (payloadType instanceof PayloadType.Audio) {
                                    audio2 = (PayloadType.Audio) payloadType;
                                    break;
                                }
                            }
                        }
                    } else {
                        Iterator it2 = arrayList2.iterator();
                        while (true) {
                            audio = null;
                            if (!it2.hasNext()) {
                                break;
                            }
                            PayloadType payloadType2 = (PayloadType) it2.next();
                            if (payloadType2 instanceof PayloadType.Audio) {
                                audio = (PayloadType.Audio) payloadType2;
                                break;
                            }
                        }
                        audio2 = audio;
                    }
                }
            }
        }
        return audio2;
    }

    private Jingle createAudioPayloadTypesOffer() {
        JingleContent jingleContent = new JingleContent(this.parentNegotiator.getCreator(), this.parentNegotiator.getName());
        JingleDescription.Audio audio = new JingleDescription.Audio();
        audio.addAudioPayloadTypes(this.localAudioPts);
        jingleContent.setDescription(audio);
        Jingle jingle = new Jingle(JingleActionEnum.CONTENT_ACCEPT);
        jingle.addContent(jingleContent);
        return jingle;
    }

    private IQ receiveContentAcceptAction(Jingle jingle, JingleDescription jingleDescription) throws XMPPException {
        IQ createAck;
        new ArrayList();
        this.bestCommonAudioPt = calculateBestCommonAudioPt(jingleDescription.getAudioPayloadTypesList());
        if (this.bestCommonAudioPt == null) {
            setNegotiatorState(JingleNegotiatorState.FAILED);
            createAck = this.session.createJingleError(jingle, JingleError.NEGOTIATION_ERROR);
        } else {
            setNegotiatorState(JingleNegotiatorState.SUCCEEDED);
            triggerMediaEstablished(getBestCommonAudioPt());
            LOGGER.error("Media choice:" + getBestCommonAudioPt().getName());
            createAck = this.session.createAck(jingle);
        }
        return createAck;
    }

    private Jingle receiveResult(IQ iq) throws XMPPException {
        return null;
    }

    private IQ receiveSessionAcceptAction(Jingle jingle, JingleDescription jingleDescription) throws JingleException {
        new ArrayList();
        if (this.bestCommonAudioPt == null) {
            this.bestCommonAudioPt = calculateBestCommonAudioPt(this.remoteAudioPts);
        }
        List<PayloadType> audioPayloadTypesList = jingleDescription.getAudioPayloadTypesList();
        if (!audioPayloadTypesList.isEmpty()) {
            if (audioPayloadTypesList.size() != 1) {
                if (audioPayloadTypesList.size() <= 1) {
                    return null;
                }
                throw new JingleException(JingleError.MALFORMED_STANZA);
            }
            PayloadType.Audio audio = (PayloadType.Audio) audioPayloadTypesList.get(0);
            if (this.bestCommonAudioPt != null && !audio.equals(this.bestCommonAudioPt)) {
                throw new JingleException(JingleError.NEGOTIATION_ERROR);
            }
            return null;
        }
        return null;
    }

    private IQ receiveSessionInfoAction(Jingle jingle, JingleDescription jingleDescription) throws JingleException {
        PayloadType payloadType = this.bestCommonAudioPt;
        List<PayloadType> audioPayloadTypesList = jingleDescription.getAudioPayloadTypesList();
        if (!audioPayloadTypesList.isEmpty()) {
            synchronized (this.remoteAudioPts) {
                this.remoteAudioPts.clear();
                this.remoteAudioPts.addAll(audioPayloadTypesList);
            }
            this.bestCommonAudioPt = calculateBestCommonAudioPt(this.remoteAudioPts);
            if (this.bestCommonAudioPt == null) {
                throw new JingleException(JingleError.NO_COMMON_PAYLOAD);
            }
            boolean z = !this.bestCommonAudioPt.equals(payloadType);
            if (payloadType == null || z) {
            }
            return null;
        }
        return null;
    }

    private IQ receiveSessionInitiateAction(Jingle jingle, JingleDescription jingleDescription) {
        new ArrayList();
        List<PayloadType> audioPayloadTypesList = jingleDescription.getAudioPayloadTypesList();
        this.bestCommonAudioPt = calculateBestCommonAudioPt(audioPayloadTypesList);
        synchronized (this.remoteAudioPts) {
            this.remoteAudioPts.addAll(audioPayloadTypesList);
        }
        if (this.bestCommonAudioPt != null) {
            setNegotiatorState(JingleNegotiatorState.PENDING);
            return null;
        }
        setNegotiatorState(JingleNegotiatorState.FAILED);
        return null;
    }

    public void addRemoteAudioPayloadType(PayloadType.Audio audio) {
        if (audio != null) {
            synchronized (this.remoteAudioPts) {
                this.remoteAudioPts.add(audio);
            }
        }
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public void close() {
        super.close();
        triggerMediaClosed(getBestCommonAudioPt());
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public List<IQ> dispatchIncomingPacket(IQ iq, String str) throws XMPPException {
        IQ iq2;
        JingleDescription description;
        ArrayList arrayList = new ArrayList();
        if (iq.getType().equals(IQ.Type.ERROR)) {
            setNegotiatorState(JingleNegotiatorState.FAILED);
            triggerMediaClosed(getBestCommonAudioPt());
            throw new JingleException(iq.getError().getMessage());
        }
        if (iq.getType().equals(IQ.Type.RESULT)) {
            iq2 = null;
            if (isExpectedId(iq.getPacketID())) {
                receiveResult(iq);
                removeExpectedId(iq.getPacketID());
                iq2 = null;
            }
        } else {
            iq2 = null;
            if (iq instanceof Jingle) {
                Jingle jingle = (Jingle) iq;
                JingleActionEnum action = jingle.getAction();
                Iterator<JingleContent> it = jingle.getContentsList().iterator();
                IQ iq3 = null;
                while (true) {
                    iq2 = iq3;
                    if (it.hasNext()) {
                        JingleContent next = it.next();
                        if (next.getName().equals(this.parentNegotiator.getName()) && (description = next.getDescription()) != null) {
                            switch (AnonymousClass1.$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[action.ordinal()]) {
                                case 1:
                                    iq3 = receiveContentAcceptAction(jingle, description);
                                    continue;
                                case 4:
                                    iq3 = receiveSessionInfoAction(jingle, description);
                                    continue;
                                case 5:
                                    iq3 = receiveSessionInitiateAction(jingle, description);
                                    continue;
                                case 6:
                                    iq3 = receiveSessionAcceptAction(jingle, description);
                                    continue;
                            }
                        }
                    }
                }
            }
        }
        if (iq2 != null) {
            addExpectedId(iq2.getPacketID());
            arrayList.add(iq2);
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    protected void doStart() {
    }

    public PayloadType getBestCommonAudioPt() {
        return this.bestCommonAudioPt;
    }

    public JingleDescription getJingleDescription() {
        JingleDescription.Audio audio;
        PayloadType bestCommonAudioPt = getBestCommonAudioPt();
        if (bestCommonAudioPt != null) {
            audio = new JingleDescription.Audio(bestCommonAudioPt);
        } else {
            audio = new JingleDescription.Audio();
            audio.addAudioPayloadTypes(this.localAudioPts);
        }
        return audio;
    }

    public JingleMediaManager getMediaManager() {
        return this.mediaManager;
    }

    public boolean isEstablished() {
        return getBestCommonAudioPt() != null;
    }

    public boolean isFullyEstablished() {
        return isEstablished() && (getNegotiatorState() == JingleNegotiatorState.SUCCEEDED || getNegotiatorState() == JingleNegotiatorState.FAILED);
    }

    protected void triggerMediaClosed(PayloadType payloadType) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleMediaListener) {
                ((JingleMediaListener) jingleListener).mediaClosed(payloadType);
            }
        }
    }

    protected void triggerMediaEstablished(PayloadType payloadType) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleMediaListener) {
                ((JingleMediaListener) jingleListener).mediaEstablished(payloadType);
            }
        }
    }
}
