package com.anfengde.epub;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class EPubJNI {
    public final native int addEPubBookmark(EPubBookmark ePubBookmark, int i);

    public final native int cleanEPubBookCache(int i);

    public final native void cleanUpEPubEnv();

    public final native int closeEPubBook(int i);

    public final native int deleteEPubBookmark(EPubBookmark ePubBookmark, int i);

    public final native int epubGetLastError();

    public final native String epubGetMessage(int i);

    public final native String getEPubBookRootFolder(int i);

    public final native int getEPubBookSize(int i);

    public final native int getEPubBookmark(EPubBookmark ePubBookmark, int i, int i2);

    public final native int getEPubBookmarkCount(int i);

    public final native String getEPubCSS(int i);

    public final native int getEPubChapter(EPubChapter ePubChapter, int i, int i2);

    public final native int getEPubChapterCount(int i);

    public final native String getEPubCoverImage(int i);

    public final native int getEPubManifest(EPubManifestItem ePubManifestItem, int i, int i2);

    public final native int getEPubManifestCount(int i);

    public final native int getEPubMetadata(EPubMetadata ePubMetadata, int i);

    public final native String getEPubMimetype(int i);

    public final native int getEPubReadingStatus(EPubReadingStatus ePubReadingStatus, int i);

    public final native int getEPubSpine(EPubSpine ePubSpine, int i, int i2);

    public final native int getEPubSpineCount(int i);

    public final native int initEPubEnv(String str);

    public final native int isUnZipping();

    public final native int openEPubBook(String str);

    public final native int updateEPubBookmark(EPubBookmark ePubBookmark, int i);

    public final native int updateEPubReadingStatus(EPubReadingStatus ePubReadingStatus, int i);

    static {
        System.loadLibrary("epubjni");
    }
}
