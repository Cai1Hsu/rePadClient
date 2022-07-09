package org.jivesoftware.smackx.jingle.nat;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportResolverListener.class */
public interface TransportResolverListener {

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker.class */
    public interface Checker extends TransportResolverListener {
        void candidateChecked(TransportCandidate transportCandidate, boolean z);

        void candidateChecking(TransportCandidate transportCandidate);
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver.class */
    public interface Resolver extends TransportResolverListener {
        void candidateAdded(TransportCandidate transportCandidate);

        void end();

        void init();
    }
}
