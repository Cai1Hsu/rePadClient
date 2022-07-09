package de.javawi.jstun.test.demo.ice;

import de.javawi.jstun.util.Address;
import de.javawi.jstun.util.UtilityException;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.UnknownHostException;

/* loaded from: classes.jar:de/javawi/jstun/test/demo/ice/Candidate.class */
public class Candidate implements Comparable {
    private Candidate base;
    private short componentId;
    private int foundationId;
    private boolean isInUse;
    private int priority;
    private DatagramSocket socket;
    private CandidateType type;

    /* loaded from: classes.jar:de/javawi/jstun/test/demo/ice/Candidate$CandidateType.class */
    public enum CandidateType {
        Local,
        ServerReflexive,
        PeerReflexive,
        Relayed
    }

    public Candidate(Address address, CandidateType candidateType, short s, Candidate candidate) throws SocketException, UnknownHostException, UtilityException {
        this.socket = new DatagramSocket(0, address.getInetAddress());
        this.type = candidateType;
        setComponentId(s);
        this.priority = 0;
        this.base = candidate;
        this.isInUse = false;
    }

    public Candidate(Address address, short s) throws SocketException, UnknownHostException, UtilityException {
        this.socket = new DatagramSocket(0, address.getInetAddress());
        this.type = CandidateType.Local;
        this.componentId = s;
        this.priority = 0;
        this.base = this;
        this.isInUse = false;
    }

    @Override // java.lang.Comparable
    public int compareTo(Object obj) {
        return ((Candidate) obj).getPriority() - getPriority();
    }

    public boolean equals(Object obj) {
        return obj == null ? false : ((Candidate) obj).socket.equals(this.socket) && ((Candidate) obj).base.equals(this.base);
    }

    public Address getAddress() throws UtilityException {
        return new Address(this.socket.getLocalAddress().getAddress());
    }

    public Candidate getBase() {
        return this.base;
    }

    public CandidateType getCandidateType() {
        return this.type;
    }

    public short getComponentId() {
        return this.componentId;
    }

    public int getFoundationId() {
        return this.foundationId;
    }

    public boolean getInUse() {
        return this.isInUse;
    }

    public int getPort() {
        return this.socket.getLocalPort();
    }

    public int getPriority() {
        return this.priority;
    }

    public void setBase(Candidate candidate) {
        this.base = candidate;
    }

    public void setComponentId(short s) {
        if (s < 1 || s > 256) {
            throw new IllegalArgumentException(((int) s) + " is not between 1 and 256 inclusive.");
        }
        this.componentId = s;
    }

    public void setFoundationId(int i) {
        this.foundationId = i;
    }

    public void setInUse(boolean z) {
        this.isInUse = z;
    }

    public void setPriority(int i) {
        this.priority = i;
    }
}
