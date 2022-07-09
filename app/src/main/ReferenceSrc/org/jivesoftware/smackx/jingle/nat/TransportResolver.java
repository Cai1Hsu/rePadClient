package org.jivesoftware.smackx.jingle.nat;

import java.io.IOException;
import java.net.ServerSocket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.nat.TransportResolverListener;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportResolver.class */
public abstract class TransportResolver {
    public static final int CHECK_TIMEOUT = 3000;
    private static final SmackLogger LOGGER = SmackLogger.getLogger(TransportResolver.class);
    public Type type = Type.rawupd;
    private final ArrayList<TransportResolverListener> listeners = new ArrayList<>();
    private boolean initialized = false;
    protected final List<TransportCandidate> candidates = new ArrayList();
    private boolean resolving = false;
    private boolean resolved = false;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportResolver$Type.class */
    public enum Type {
        rawupd,
        ice
    }

    protected TransportResolver() {
    }

    private void triggerResolveEnd() {
        Iterator<TransportResolverListener> it = getListenersList().iterator();
        while (it.hasNext()) {
            TransportResolverListener next = it.next();
            if (next instanceof TransportResolverListener.Resolver) {
                ((TransportResolverListener.Resolver) next).end();
            }
        }
    }

    private void triggerResolveInit() {
        Iterator<TransportResolverListener> it = getListenersList().iterator();
        while (it.hasNext()) {
            TransportResolverListener next = it.next();
            if (next instanceof TransportResolverListener.Resolver) {
                ((TransportResolverListener.Resolver) next).init();
            }
        }
    }

    protected void addCandidate(TransportCandidate transportCandidate) {
        synchronized (this.candidates) {
            if (!this.candidates.contains(transportCandidate)) {
                this.candidates.add(transportCandidate);
            }
        }
        triggerCandidateAdded(transportCandidate);
    }

    public void addListener(TransportResolverListener transportResolverListener) {
        synchronized (this.listeners) {
            this.listeners.add(transportResolverListener);
        }
    }

    public abstract void cancel() throws XMPPException;

    public void clear() throws XMPPException {
        cancel();
        this.candidates.clear();
    }

    protected void clearCandidates() {
        synchronized (this.candidates) {
            this.candidates.clear();
        }
    }

    public TransportCandidate getCandidate(int i) {
        TransportCandidate transportCandidate;
        synchronized (this.candidates) {
            transportCandidate = this.candidates.get(i);
        }
        return transportCandidate;
    }

    public int getCandidateCount() {
        int size;
        synchronized (this.candidates) {
            size = this.candidates.size();
        }
        return size;
    }

    public Iterator<TransportCandidate> getCandidates() {
        Iterator<TransportCandidate> it;
        synchronized (this.candidates) {
            it = Collections.unmodifiableList(new ArrayList(this.candidates)).iterator();
        }
        return it;
    }

    public List<TransportCandidate> getCandidatesList() {
        Throwable th;
        ArrayList arrayList;
        synchronized (this.candidates) {
            try {
                arrayList = new ArrayList(this.candidates);
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                return arrayList;
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }

    protected int getFreePort() {
        int i;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i3 >= 10) {
                int i4 = i2;
                try {
                    int i5 = i2;
                    ServerSocket serverSocket = new ServerSocket(0);
                    int i6 = i2;
                    int localPort = serverSocket.getLocalPort();
                    i4 = localPort;
                    serverSocket.close();
                    i4 = localPort;
                } catch (IOException e) {
                    e.printStackTrace();
                }
                i = i4;
                break;
            }
            int round = (int) (10000 + Math.round(Math.random() * 10000.0d));
            if (round % 2 != 0) {
                round++;
            }
            i2 = round;
            try {
                int i7 = round;
                ServerSocket serverSocket2 = new ServerSocket(round);
                int i8 = round;
                int localPort2 = serverSocket2.getLocalPort();
                i2 = localPort2;
                serverSocket2.close();
                i = localPort2;
                break;
            } catch (IOException e2) {
                e2.printStackTrace();
                i3++;
            }
        }
        return i;
    }

    public ArrayList<TransportResolverListener> getListenersList() {
        ArrayList<TransportResolverListener> arrayList;
        synchronized (this.listeners) {
            arrayList = new ArrayList<>(this.listeners);
        }
        return arrayList;
    }

    public TransportCandidate getPreferredCandidate() {
        TransportCandidate transportCandidate = null;
        ArrayList arrayList = new ArrayList();
        for (TransportCandidate transportCandidate2 : getCandidatesList()) {
            if (transportCandidate2 instanceof ICECandidate) {
                arrayList.add((ICECandidate) transportCandidate2);
            }
        }
        if (arrayList.size() > 0) {
            Collections.sort(arrayList);
            transportCandidate = (TransportCandidate) arrayList.get(arrayList.size() - 1);
            LOGGER.debug("Result: " + transportCandidate.getIp());
        }
        return transportCandidate;
    }

    public Type getType() {
        return this.type;
    }

    public abstract void initialize() throws XMPPException;

    public void initializeAndWait() throws XMPPException {
        initialize();
        try {
            LOGGER.debug("Initializing transport resolver...");
            while (!isInitialized()) {
                LOGGER.debug("Resolver init still pending");
                Thread.sleep(1000L);
            }
            LOGGER.debug("Transport resolved\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isInitialized() {
        boolean z;
        synchronized (this) {
            z = this.initialized;
        }
        return z;
    }

    public boolean isResolved() {
        return this.resolved;
    }

    public boolean isResolving() {
        return this.resolving;
    }

    public void removeListener(TransportResolverListener transportResolverListener) {
        synchronized (this.listeners) {
            this.listeners.remove(transportResolverListener);
        }
    }

    public abstract void resolve(JingleSession jingleSession) throws XMPPException;

    public void setInitialized() {
        synchronized (this) {
            this.initialized = true;
        }
    }

    protected void setResolveEnd() {
        synchronized (this) {
            this.resolved = true;
            this.resolving = false;
            triggerResolveEnd();
        }
    }

    protected void setResolveInit() {
        synchronized (this) {
            this.resolved = false;
            this.resolving = true;
            triggerResolveInit();
        }
    }

    public void setType(Type type) {
        this.type = type;
    }

    protected void triggerCandidateAdded(TransportCandidate transportCandidate) {
        Iterator<TransportResolverListener> it = getListenersList().iterator();
        while (it.hasNext()) {
            TransportResolverListener next = it.next();
            if (next instanceof TransportResolverListener.Resolver) {
                LOGGER.debug("triggerCandidateAdded : " + transportCandidate.getLocalIp());
                ((TransportResolverListener.Resolver) next).candidateAdded(transportCandidate);
            }
        }
    }
}
