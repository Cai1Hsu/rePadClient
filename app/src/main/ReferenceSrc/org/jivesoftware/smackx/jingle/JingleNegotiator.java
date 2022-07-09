package org.jivesoftware.smackx.jingle;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.listeners.JingleListener;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleNegotiator.class */
public abstract class JingleNegotiator {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleNegotiator.class);
    private String expectedAckId;
    private boolean isStarted;
    private final List<JingleListener> listeners;
    protected JingleSession session;
    private JingleNegotiatorState state;

    /* renamed from: org.jivesoftware.smackx.jingle.JingleNegotiator$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleNegotiator$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState = new int[JingleNegotiatorState.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x002f -> B:14:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0033 -> B:12:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState[JingleNegotiatorState.PENDING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState[JingleNegotiatorState.FAILED.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState[JingleNegotiatorState.SUCCEEDED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public JingleNegotiator() {
        this(null);
    }

    public JingleNegotiator(JingleSession jingleSession) {
        this.listeners = new ArrayList();
        this.session = jingleSession;
        this.state = JingleNegotiatorState.PENDING;
    }

    public void addExpectedId(String str) {
        this.expectedAckId = str;
    }

    public void addListener(JingleListener jingleListener) {
        synchronized (this.listeners) {
            this.listeners.add(jingleListener);
        }
    }

    public void close() {
    }

    public abstract List<IQ> dispatchIncomingPacket(IQ iq, String str) throws XMPPException;

    protected abstract void doStart();

    public Connection getConnection() {
        return this.session != null ? this.session.getConnection() : null;
    }

    protected List<JingleListener> getListenersList() {
        ArrayList arrayList;
        synchronized (this.listeners) {
            arrayList = new ArrayList(this.listeners);
        }
        return arrayList;
    }

    public JingleNegotiatorState getNegotiatorState() {
        return this.state;
    }

    public JingleSession getSession() {
        return this.session;
    }

    public boolean isExpectedId(String str) {
        return str != null ? str.equals(this.expectedAckId) : false;
    }

    public boolean isStarted() {
        return this.isStarted;
    }

    public void removeExpectedId(String str) {
        addExpectedId(null);
    }

    public void removeListener(JingleListener jingleListener) {
        synchronized (this.listeners) {
            this.listeners.remove(jingleListener);
        }
    }

    public void setNegotiatorState(JingleNegotiatorState jingleNegotiatorState) {
        LOGGER.debug("Negotiator state change: " + this.state + "->" + jingleNegotiatorState + "(" + getClass().getSimpleName() + ")");
        switch (AnonymousClass1.$SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState[jingleNegotiatorState.ordinal()]) {
            case 1:
            case 2:
            case 3:
            default:
                this.state = jingleNegotiatorState;
                return;
        }
    }

    public void setSession(JingleSession jingleSession) {
        this.session = jingleSession;
    }

    public void start() {
        this.isStarted = true;
        doStart();
    }
}
