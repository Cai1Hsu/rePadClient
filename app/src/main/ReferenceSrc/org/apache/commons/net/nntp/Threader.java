package org.apache.commons.net.nntp;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes.jar:org/apache/commons/net/nntp/Threader.class */
public class Threader {
    private int bogusIdCount = 0;
    private HashMap<String, ThreadContainer> idTable;
    private ThreadContainer root;

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0118, code lost:
        if (r7.findChild(r6) != false) goto L33;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void buildContainer(Threadable threadable) {
        ThreadContainer threadContainer;
        String messageThreadId = threadable.messageThreadId();
        ThreadContainer threadContainer2 = this.idTable.get(messageThreadId);
        ThreadContainer threadContainer3 = threadContainer2;
        String str = messageThreadId;
        if (threadContainer2 != null) {
            if (threadContainer2.threadable != null) {
                StringBuilder append = new StringBuilder().append("<Bogus-id:");
                int i = this.bogusIdCount;
                this.bogusIdCount = i + 1;
                str = append.append(i).append(">").toString();
                threadContainer3 = null;
            } else {
                threadContainer2.threadable = threadable;
                threadContainer3 = threadContainer2;
                str = messageThreadId;
            }
        }
        ThreadContainer threadContainer4 = threadContainer3;
        if (threadContainer3 == null) {
            threadContainer4 = new ThreadContainer();
            threadContainer4.threadable = threadable;
            this.idTable.put(str, threadContainer4);
        }
        String[] messageThreadReferences = threadable.messageThreadReferences();
        ThreadContainer threadContainer5 = null;
        for (String str2 : messageThreadReferences) {
            ThreadContainer threadContainer6 = this.idTable.get(str2);
            ThreadContainer threadContainer7 = threadContainer6;
            if (threadContainer6 == null) {
                threadContainer7 = new ThreadContainer();
                this.idTable.put(str2, threadContainer7);
            }
            if (threadContainer5 != null && threadContainer7.parent == null && threadContainer5 != threadContainer7 && !threadContainer7.findChild(threadContainer5)) {
                threadContainer7.parent = threadContainer5;
                threadContainer7.next = threadContainer5.child;
                threadContainer5.child = threadContainer7;
            }
            threadContainer5 = threadContainer7;
        }
        ThreadContainer threadContainer8 = threadContainer5;
        if (threadContainer5 != null) {
            if (threadContainer5 != threadContainer4) {
                threadContainer8 = threadContainer5;
            }
            threadContainer8 = null;
        }
        if (threadContainer4.parent != null) {
            ThreadContainer threadContainer9 = null;
            ThreadContainer threadContainer10 = threadContainer4.parent.child;
            while (true) {
                threadContainer = threadContainer10;
                if (threadContainer == null || threadContainer == threadContainer4) {
                    break;
                }
                threadContainer9 = threadContainer;
                threadContainer10 = threadContainer.next;
            }
            if (threadContainer == null) {
                throw new RuntimeException("Didnt find " + threadContainer4 + " in parent" + threadContainer4.parent);
            }
            if (threadContainer9 == null) {
                threadContainer4.parent.child = threadContainer4.next;
            } else {
                threadContainer9.next = threadContainer4.next;
            }
            threadContainer4.next = null;
            threadContainer4.parent = null;
        }
        if (threadContainer8 != null) {
            threadContainer4.parent = threadContainer8;
            threadContainer4.next = threadContainer8.child;
            threadContainer8.child = threadContainer4;
        }
    }

    private ThreadContainer findRootSet() {
        ThreadContainer threadContainer = new ThreadContainer();
        for (String str : this.idTable.keySet()) {
            ThreadContainer threadContainer2 = this.idTable.get(str);
            if (threadContainer2.parent == null) {
                if (threadContainer2.next != null) {
                    throw new RuntimeException("c.next is " + threadContainer2.next.toString());
                }
                threadContainer2.next = threadContainer.child;
                threadContainer.child = threadContainer2;
            }
        }
        return threadContainer;
    }

    private void gatherSubjects() {
        ThreadContainer threadContainer;
        int i = 0;
        ThreadContainer threadContainer2 = this.root.child;
        while (true) {
            ThreadContainer threadContainer3 = threadContainer2;
            if (threadContainer3 == null) {
                break;
            }
            i++;
            threadContainer2 = threadContainer3.next;
        }
        HashMap hashMap = new HashMap((int) (i * 1.2d), 0.9f);
        int i2 = 0;
        ThreadContainer threadContainer4 = this.root.child;
        while (threadContainer4 != null) {
            Threadable threadable = threadContainer4.threadable;
            Threadable threadable2 = threadable;
            if (threadable == null) {
                threadable2 = threadContainer4.child.threadable;
            }
            String simplifiedSubject = threadable2.simplifiedSubject();
            int i3 = i2;
            if (simplifiedSubject != null) {
                if (simplifiedSubject == "") {
                    i3 = i2;
                } else {
                    ThreadContainer threadContainer5 = (ThreadContainer) hashMap.get(simplifiedSubject);
                    if (threadContainer5 != null && (threadContainer4.threadable != null || threadContainer5.threadable == null)) {
                        i3 = i2;
                        if (threadContainer5.threadable != null) {
                            i3 = i2;
                            if (threadContainer5.threadable.subjectIsReply()) {
                                i3 = i2;
                                if (threadContainer4.threadable != null) {
                                    i3 = i2;
                                    if (threadContainer4.threadable.subjectIsReply()) {
                                    }
                                }
                            }
                        }
                    }
                    hashMap.put(simplifiedSubject, threadContainer4);
                    i3 = i2 + 1;
                }
            }
            threadContainer4 = threadContainer4.next;
            i2 = i3;
        }
        if (i2 == 0) {
            return;
        }
        ThreadContainer threadContainer6 = null;
        ThreadContainer threadContainer7 = this.root.child;
        ThreadContainer threadContainer8 = threadContainer7.next;
        while (true) {
            ThreadContainer threadContainer9 = threadContainer8;
            if (threadContainer7 == null) {
                hashMap.clear();
                return;
            }
            Threadable threadable3 = threadContainer7.threadable;
            Threadable threadable4 = threadable3;
            if (threadable3 == null) {
                threadable4 = threadContainer7.child.threadable;
            }
            String simplifiedSubject2 = threadable4.simplifiedSubject();
            ThreadContainer threadContainer10 = threadContainer7;
            if (simplifiedSubject2 != null) {
                if (simplifiedSubject2 == "") {
                    threadContainer10 = threadContainer7;
                } else {
                    ThreadContainer threadContainer11 = (ThreadContainer) hashMap.get(simplifiedSubject2);
                    threadContainer10 = threadContainer7;
                    if (threadContainer11 != threadContainer7) {
                        if (threadContainer6 == null) {
                            this.root.child = threadContainer7.next;
                        } else {
                            threadContainer6.next = threadContainer7.next;
                        }
                        threadContainer7.next = null;
                        if (threadContainer11.threadable == null && threadContainer7.threadable == null) {
                            ThreadContainer threadContainer12 = threadContainer11.child;
                            while (true) {
                                threadContainer = threadContainer12;
                                if (threadContainer == null || threadContainer.next == null) {
                                    break;
                                }
                                threadContainer12 = threadContainer.next;
                            }
                            if (threadContainer != null) {
                                threadContainer.next = threadContainer7.child;
                            }
                            ThreadContainer threadContainer13 = threadContainer7.child;
                            while (true) {
                                ThreadContainer threadContainer14 = threadContainer13;
                                if (threadContainer14 == null) {
                                    break;
                                }
                                threadContainer14.parent = threadContainer11;
                                threadContainer13 = threadContainer14.next;
                            }
                            threadContainer7.child = null;
                        } else if (threadContainer11.threadable == null || (threadContainer7.threadable != null && threadContainer7.threadable.subjectIsReply() && !threadContainer11.threadable.subjectIsReply())) {
                            threadContainer7.parent = threadContainer11;
                            threadContainer7.next = threadContainer11.child;
                            threadContainer11.child = threadContainer7;
                        } else {
                            ThreadContainer threadContainer15 = new ThreadContainer();
                            threadContainer15.threadable = threadContainer11.threadable;
                            threadContainer15.child = threadContainer11.child;
                            ThreadContainer threadContainer16 = threadContainer15.child;
                            while (true) {
                                ThreadContainer threadContainer17 = threadContainer16;
                                if (threadContainer17 == null) {
                                    break;
                                }
                                threadContainer17.parent = threadContainer15;
                                threadContainer16 = threadContainer17.next;
                            }
                            threadContainer11.threadable = null;
                            threadContainer11.child = null;
                            threadContainer7.parent = threadContainer11;
                            threadContainer15.parent = threadContainer11;
                            threadContainer11.child = threadContainer7;
                            threadContainer7.next = threadContainer15;
                        }
                        threadContainer10 = threadContainer6;
                    }
                }
            }
            threadContainer6 = threadContainer10;
            threadContainer7 = threadContainer9;
            threadContainer8 = threadContainer9 == null ? null : threadContainer9.next;
        }
    }

    private void pruneEmptyContainers(ThreadContainer threadContainer) {
        ThreadContainer threadContainer2;
        ThreadContainer threadContainer3;
        ThreadContainer threadContainer4 = null;
        ThreadContainer threadContainer5 = threadContainer.child;
        ThreadContainer threadContainer6 = threadContainer5.next;
        while (true) {
            ThreadContainer threadContainer7 = threadContainer6;
            if (threadContainer5 != null) {
                if (threadContainer5.threadable == null && threadContainer5.child == null) {
                    if (threadContainer4 == null) {
                        threadContainer.child = threadContainer5.next;
                    } else {
                        threadContainer4.next = threadContainer5.next;
                    }
                    threadContainer2 = threadContainer7;
                } else if (threadContainer5.threadable != null || threadContainer5.child == null || (threadContainer5.parent == null && threadContainer5.child.next != null)) {
                    threadContainer4 = threadContainer5;
                    threadContainer2 = threadContainer7;
                    if (threadContainer5.child != null) {
                        pruneEmptyContainers(threadContainer5);
                        threadContainer4 = threadContainer5;
                        threadContainer2 = threadContainer7;
                    }
                } else {
                    ThreadContainer threadContainer8 = threadContainer5.child;
                    if (threadContainer4 == null) {
                        threadContainer.child = threadContainer8;
                    } else {
                        threadContainer4.next = threadContainer8;
                    }
                    ThreadContainer threadContainer9 = threadContainer8;
                    while (true) {
                        threadContainer3 = threadContainer9;
                        if (threadContainer3.next == null) {
                            break;
                        }
                        threadContainer3.parent = threadContainer5.parent;
                        threadContainer9 = threadContainer3.next;
                    }
                    threadContainer3.parent = threadContainer5.parent;
                    threadContainer3.next = threadContainer5.next;
                    threadContainer2 = threadContainer8;
                }
                threadContainer5 = threadContainer2;
                threadContainer6 = threadContainer5 == null ? null : threadContainer5.next;
            } else {
                return;
            }
        }
    }

    public Threadable thread(Iterable<? extends Threadable> iterable) {
        Threadable threadable;
        if (iterable == null) {
            threadable = null;
        } else {
            this.idTable = new HashMap<>();
            for (Threadable threadable2 : iterable) {
                if (!threadable2.isDummy()) {
                    buildContainer(threadable2);
                }
            }
            this.root = findRootSet();
            this.idTable.clear();
            this.idTable = null;
            pruneEmptyContainers(this.root);
            this.root.reverseChildren();
            gatherSubjects();
            if (this.root.next != null) {
                throw new RuntimeException("root node has a next:" + this.root);
            }
            ThreadContainer threadContainer = this.root.child;
            while (true) {
                ThreadContainer threadContainer2 = threadContainer;
                if (threadContainer2 == null) {
                    break;
                }
                if (threadContainer2.threadable == null) {
                    threadContainer2.threadable = threadContainer2.child.threadable.makeDummy();
                }
                threadContainer = threadContainer2.next;
            }
            threadable = this.root.child == null ? null : this.root.child.threadable;
            this.root.flush();
            this.root = null;
        }
        return threadable;
    }

    public Threadable thread(List<? extends Threadable> list) {
        return thread((Iterable<? extends Threadable>) list);
    }

    @Deprecated
    public Threadable thread(Threadable[] threadableArr) {
        return thread(Arrays.asList(threadableArr));
    }
}
