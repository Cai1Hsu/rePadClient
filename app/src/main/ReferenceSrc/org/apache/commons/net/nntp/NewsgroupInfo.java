package org.apache.commons.net.nntp;

/* loaded from: classes.jar:org/apache/commons/net/nntp/NewsgroupInfo.class */
public final class NewsgroupInfo {
    public static final int MODERATED_POSTING_PERMISSION = 1;
    public static final int PERMITTED_POSTING_PERMISSION = 2;
    public static final int PROHIBITED_POSTING_PERMISSION = 3;
    public static final int UNKNOWN_POSTING_PERMISSION = 0;
    private long __estimatedArticleCount;
    private long __firstArticle;
    private long __lastArticle;
    private String __newsgroup;
    private int __postingPermission;

    void _setArticleCount(long j) {
        this.__estimatedArticleCount = j;
    }

    void _setFirstArticle(long j) {
        this.__firstArticle = j;
    }

    void _setLastArticle(long j) {
        this.__lastArticle = j;
    }

    void _setNewsgroup(String str) {
        this.__newsgroup = str;
    }

    void _setPostingPermission(int i) {
        this.__postingPermission = i;
    }

    @Deprecated
    public int getArticleCount() {
        return (int) this.__estimatedArticleCount;
    }

    public long getArticleCountLong() {
        return this.__estimatedArticleCount;
    }

    @Deprecated
    public int getFirstArticle() {
        return (int) this.__firstArticle;
    }

    public long getFirstArticleLong() {
        return this.__firstArticle;
    }

    @Deprecated
    public int getLastArticle() {
        return (int) this.__lastArticle;
    }

    public long getLastArticleLong() {
        return this.__lastArticle;
    }

    public String getNewsgroup() {
        return this.__newsgroup;
    }

    public int getPostingPermission() {
        return this.__postingPermission;
    }
}
