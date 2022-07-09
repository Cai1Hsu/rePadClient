package org.apache.commons.net.nntp;

/* loaded from: classes.jar:org/apache/commons/net/nntp/Threadable.class */
public interface Threadable {
    boolean isDummy();

    Threadable makeDummy();

    String messageThreadId();

    String[] messageThreadReferences();

    void setChild(Threadable threadable);

    void setNext(Threadable threadable);

    String simplifiedSubject();

    boolean subjectIsReply();
}
