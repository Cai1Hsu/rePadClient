package org.jivesoftware.smackx.jingle.nat;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/ResultListener.class */
public interface ResultListener {
    void testFinished(TestResult testResult, TransportCandidate transportCandidate);
}
