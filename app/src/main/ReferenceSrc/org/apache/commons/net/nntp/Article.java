package org.apache.commons.net.nntp;

import java.util.ArrayList;

/* loaded from: classes.jar:org/apache/commons/net/nntp/Article.class */
public class Article implements Threadable {
    private String articleId;
    private String date;
    private String from;
    public Article kid;
    public Article next;
    private ArrayList<String> references;
    private String simplifiedSubject;
    private String subject;
    private boolean isReply = false;
    private long articleNumber = -1;

    private void flushSubjectCache() {
        this.simplifiedSubject = null;
    }

    public static void printThread(Article article, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            System.out.print("==>");
        }
        System.out.println(article.getSubject() + "\t" + article.getFrom());
        if (article.kid != null) {
            printThread(article.kid, i + 1);
        }
        if (article.next != null) {
            printThread(article.next, i);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x005a, code lost:
        if (r0.charAt(r11) == 'R') goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x007b, code lost:
        if (r0.charAt(r11 + 1) == 'E') goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ee, code lost:
        if (r0.charAt(r11 + 2) == '(') goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0142, code lost:
        if (r0.charAt(r12) == ')') goto L53;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void simplifySubject() {
        int i = 0;
        String subject = getSubject();
        int length = subject.length();
        boolean z = false;
        while (!z) {
            int i2 = i;
            while (i2 < length && subject.charAt(i2) == ' ') {
                i2++;
            }
            z = true;
            i = i2;
            if (i2 < length - 2) {
                if (subject.charAt(i2) != 'r') {
                    z = true;
                    i = i2;
                }
                if (subject.charAt(i2 + 1) != 'e') {
                    z = true;
                    i = i2;
                }
                if (subject.charAt(i2 + 2) == ':') {
                    i = i2 + 3;
                    z = false;
                } else {
                    z = true;
                    i = i2;
                    if (i2 < length - 2) {
                        if (subject.charAt(i2 + 2) != '[') {
                            z = true;
                            i = i2;
                        }
                        int i3 = i2 + 3;
                        while (i3 < length && subject.charAt(i3) >= '0' && subject.charAt(i3) <= '9') {
                            i3++;
                        }
                        z = true;
                        i = i2;
                        if (i3 < length - 1) {
                            if (subject.charAt(i3) != ']') {
                                z = true;
                                i = i2;
                            }
                            z = true;
                            i = i2;
                            if (subject.charAt(i3 + 1) == ':') {
                                i = i3 + 2;
                                z = false;
                            }
                        }
                    }
                }
            }
            if ("(no subject)".equals(this.simplifiedSubject)) {
                this.simplifiedSubject = "";
            }
            int i4 = length;
            while (i4 > i && subject.charAt(i4 - 1) < ' ') {
                i4--;
            }
            if (i == 0 && i4 == length) {
                this.simplifiedSubject = subject;
            } else {
                this.simplifiedSubject = subject.substring(i, i4);
            }
        }
    }

    @Deprecated
    public void addHeaderField(String str, String str2) {
    }

    public void addReference(String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        if (this.references == null) {
            this.references = new ArrayList<>();
        }
        this.isReply = true;
        for (String str2 : str.split(" ")) {
            this.references.add(str2);
        }
    }

    public String getArticleId() {
        return this.articleId;
    }

    @Deprecated
    public int getArticleNumber() {
        return (int) this.articleNumber;
    }

    public long getArticleNumberLong() {
        return this.articleNumber;
    }

    public String getDate() {
        return this.date;
    }

    public String getFrom() {
        return this.from;
    }

    public String[] getReferences() {
        return this.references == null ? new String[0] : (String[]) this.references.toArray(new String[this.references.size()]);
    }

    public String getSubject() {
        return this.subject;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public boolean isDummy() {
        return this.articleNumber == -1;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public Threadable makeDummy() {
        return new Article();
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public String messageThreadId() {
        return this.articleId;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public String[] messageThreadReferences() {
        return getReferences();
    }

    public void setArticleId(String str) {
        this.articleId = str;
    }

    @Deprecated
    public void setArticleNumber(int i) {
        this.articleNumber = i;
    }

    public void setArticleNumber(long j) {
        this.articleNumber = j;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public void setChild(Threadable threadable) {
        this.kid = (Article) threadable;
        flushSubjectCache();
    }

    public void setDate(String str) {
        this.date = str;
    }

    public void setFrom(String str) {
        this.from = str;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public void setNext(Threadable threadable) {
        this.next = (Article) threadable;
        flushSubjectCache();
    }

    public void setSubject(String str) {
        this.subject = str;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public String simplifiedSubject() {
        if (this.simplifiedSubject == null) {
            simplifySubject();
        }
        return this.simplifiedSubject;
    }

    @Override // org.apache.commons.net.nntp.Threadable
    public boolean subjectIsReply() {
        return this.isReply;
    }

    public String toString() {
        return this.articleNumber + " " + this.articleId + " " + this.subject;
    }
}
