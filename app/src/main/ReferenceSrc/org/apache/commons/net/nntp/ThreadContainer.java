package org.apache.commons.net.nntp;

/* loaded from: classes.jar:org/apache/commons/net/nntp/ThreadContainer.class */
class ThreadContainer {
    ThreadContainer child;
    ThreadContainer next;
    ThreadContainer parent;
    Threadable threadable;

    ThreadContainer() {
    }

    boolean findChild(ThreadContainer threadContainer) {
        return this.child == null ? false : this.child == threadContainer ? true : this.child.findChild(threadContainer);
    }

    void flush() {
        if (this.parent == null || this.threadable != null) {
            this.parent = null;
            if (this.threadable != null) {
                this.threadable.setChild(this.child == null ? null : this.child.threadable);
            }
            if (this.child != null) {
                this.child.flush();
                this.child = null;
            }
            if (this.threadable != null) {
                this.threadable.setNext(this.next == null ? null : this.next.threadable);
            }
            if (this.next != null) {
                this.next.flush();
                this.next = null;
            }
            this.threadable = null;
            return;
        }
        throw new RuntimeException("no threadable in " + toString());
    }

    void reverseChildren() {
        if (this.child != null) {
            ThreadContainer threadContainer = null;
            ThreadContainer threadContainer2 = this.child;
            ThreadContainer threadContainer3 = threadContainer2.next;
            while (true) {
                ThreadContainer threadContainer4 = threadContainer3;
                if (threadContainer2 == null) {
                    break;
                }
                threadContainer2.next = threadContainer;
                threadContainer = threadContainer2;
                threadContainer2 = threadContainer4;
                threadContainer3 = threadContainer4 == null ? null : threadContainer4.next;
            }
            this.child = threadContainer;
            ThreadContainer threadContainer5 = this.child;
            while (true) {
                ThreadContainer threadContainer6 = threadContainer5;
                if (threadContainer6 == null) {
                    return;
                }
                threadContainer6.reverseChildren();
                threadContainer5 = threadContainer6.next;
            }
        }
    }
}
