package org.apache.commons.io.input;

/* loaded from: classes.jar:org/apache/commons/io/input/TailerListener.class */
public interface TailerListener {
    void fileNotFound();

    void fileRotated();

    void handle(Exception exc);

    void handle(String str);

    void init(Tailer tailer);
}
