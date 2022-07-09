package org.jivesoftware.smackx.jingle.nat;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/ICECandidate.class */
public class ICECandidate extends TransportCandidate implements Comparable<ICECandidate> {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(ICECandidate.class);
    private TransportCandidate.Channel channel;
    private String id;
    private int network;
    private int preference;
    private TransportCandidate.Protocol proto;
    private Type type;
    private String username;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/ICECandidate$Type.class */
    public enum Type {
        relay,
        srflx,
        prflx,
        local,
        host
    }

    public ICECandidate() {
    }

    public ICECandidate(String str, int i, int i2, String str2, int i3, String str3, int i4, Type type) {
        super(str, i3, i);
        this.proto = TransportCandidate.Protocol.UDP;
        this.channel = TransportCandidate.Channel.MYRTPVOICE;
        this.network = i2;
        this.password = str2;
        this.username = str3;
        this.preference = i4;
        this.type = type;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportCandidate
    public void check(final List<TransportCandidate> list) {
        Thread thread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.ICECandidate.1
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x00dd -> B:24:0x00d6). Please submit an issue!!! */
            @Override // java.lang.Runnable
            public void run() {
                final TestResult testResult = new TestResult();
                if (ICECandidate.this.getType().equals("relay")) {
                    ICECandidate.this.triggerCandidateChecked(false);
                    return;
                }
                ResultListener resultListener = new ResultListener() { // from class: org.jivesoftware.smackx.jingle.nat.ICECandidate.1.1
                    @Override // org.jivesoftware.smackx.jingle.nat.ResultListener
                    public void testFinished(TestResult testResult2, TransportCandidate transportCandidate) {
                        if (!testResult2.isReachable() || !this.equals(transportCandidate)) {
                            return;
                        }
                        testResult.setResult(true);
                        ICECandidate.LOGGER.debug("Candidate reachable: " + transportCandidate.getIp() + ":" + transportCandidate.getPort() + " from " + ICECandidate.this.getIp() + ":" + ICECandidate.this.getPort());
                    }
                };
                for (TransportCandidate transportCandidate : list) {
                    TransportCandidate.CandidateEcho candidateEcho = transportCandidate.getCandidateEcho();
                    if (candidateEcho != null && (transportCandidate instanceof ICECandidate) && ((ICECandidate) transportCandidate).getType().equals(ICECandidate.this.getType())) {
                        try {
                            candidateEcho.addResultListener(resultListener);
                            InetAddress.getByName(ICECandidate.this.getIp());
                            candidateEcho.testASync(this, ICECandidate.this.getPassword());
                        } catch (UnknownHostException e) {
                            e.printStackTrace();
                        }
                    }
                }
                for (int i = 0; i < 10 && !testResult.isReachable(); i++) {
                    try {
                        ICECandidate.LOGGER.error("ICE Candidate retry #" + i);
                        Thread.sleep(400L);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                }
                for (TransportCandidate transportCandidate2 : list) {
                    TransportCandidate.CandidateEcho candidateEcho2 = transportCandidate2.getCandidateEcho();
                    if (candidateEcho2 != null) {
                        candidateEcho2.removeResultListener(resultListener);
                    }
                }
                ICECandidate.this.triggerCandidateChecked(testResult.isReachable());
            }
        }, "Transport candidate check");
        thread.setName("Transport candidate test");
        thread.start();
    }

    public int compareTo(ICECandidate iCECandidate) {
        return getPreference() < iCECandidate.getPreference() ? -1 : getPreference() > iCECandidate.getPreference() ? 1 : 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x013f  */
    @Override // org.jivesoftware.smackx.jingle.nat.TransportCandidate
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (!super.equals(obj)) {
                z = false;
            } else if (getClass() != obj.getClass()) {
                z = false;
            } else {
                ICECandidate iCECandidate = (ICECandidate) obj;
                if (getChannel() == null) {
                    if (iCECandidate.getChannel() != null) {
                        z = false;
                    }
                    if (getId() != null) {
                        if (iCECandidate.getId() != null) {
                            z = false;
                        }
                        if (getNetwork() == iCECandidate.getNetwork()) {
                            z = false;
                        } else if (getPassword() == null) {
                            if (iCECandidate.getPassword() != null) {
                                z = false;
                            }
                            if (getPreference() == iCECandidate.getPreference()) {
                                z = false;
                            } else if (getProto() == null) {
                                if (iCECandidate.getProto() != null) {
                                    z = false;
                                }
                                if (getUsername() != null) {
                                    if (iCECandidate.getUsername() != null) {
                                        z = false;
                                    }
                                    if (getIp() != null) {
                                        if (iCECandidate.getIp() != null) {
                                            z = false;
                                        }
                                        if (getPort() == iCECandidate.getPort()) {
                                            z = false;
                                        } else if (getType() == null) {
                                            if (iCECandidate.getType() != null) {
                                                z = false;
                                            }
                                        } else if (!getType().equals(iCECandidate.getType())) {
                                            z = false;
                                        }
                                    } else {
                                        if (!getIp().equals(iCECandidate.getIp())) {
                                            z = false;
                                        }
                                        if (getPort() == iCECandidate.getPort()) {
                                        }
                                    }
                                } else {
                                    if (!getUsername().equals(iCECandidate.getUsername())) {
                                        z = false;
                                    }
                                    if (getIp() != null) {
                                    }
                                }
                            } else {
                                if (!getProto().equals(iCECandidate.getProto())) {
                                    z = false;
                                }
                                if (getUsername() != null) {
                                }
                            }
                        } else {
                            if (!getPassword().equals(iCECandidate.password)) {
                                z = false;
                            }
                            if (getPreference() == iCECandidate.getPreference()) {
                            }
                        }
                    } else {
                        if (!getId().equals(iCECandidate.getId())) {
                            z = false;
                        }
                        if (getNetwork() == iCECandidate.getNetwork()) {
                        }
                    }
                } else {
                    if (!getChannel().equals(iCECandidate.getChannel())) {
                        z = false;
                    }
                    if (getId() != null) {
                    }
                }
            }
        }
        return z;
    }

    public TransportCandidate.Channel getChannel() {
        return this.channel;
    }

    public String getId() {
        return this.id;
    }

    public int getNetwork() {
        return this.network;
    }

    public int getPreference() {
        return this.preference;
    }

    public TransportCandidate.Protocol getProto() {
        return this.proto;
    }

    public Type getType() {
        return this.type;
    }

    public String getUsername() {
        return this.username;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportCandidate
    public boolean isNull() {
        boolean z;
        if (super.isNull()) {
            z = true;
        } else {
            z = true;
            if (!getProto().isNull()) {
                z = true;
                if (!getChannel().isNull()) {
                    z = false;
                }
            }
        }
        return z;
    }

    public void setChannel(TransportCandidate.Channel channel) {
        this.channel = channel;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setNetwork(int i) {
        this.network = i;
    }

    public void setPreference(int i) {
        this.preference = i;
    }

    public void setProto(TransportCandidate.Protocol protocol) {
        this.proto = protocol;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public void setUsername(String str) {
        this.username = str;
    }
}
