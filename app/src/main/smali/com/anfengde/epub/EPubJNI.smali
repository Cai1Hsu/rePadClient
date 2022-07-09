.class public Lcom/anfengde/epub/EPubJNI;
.super Ljava/lang/Object;
.source "EPubJNI.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-string/jumbo v0, "epubjni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final native addEPubBookmark(Lcom/anfengde/epub/EPubBookmark;I)I
.end method

.method public final native cleanEPubBookCache(I)I
.end method

.method public final native cleanUpEPubEnv()V
.end method

.method public final native closeEPubBook(I)I
.end method

.method public final native deleteEPubBookmark(Lcom/anfengde/epub/EPubBookmark;I)I
.end method

.method public final native epubGetLastError()I
.end method

.method public final native epubGetMessage(I)Ljava/lang/String;
.end method

.method public final native getEPubBookRootFolder(I)Ljava/lang/String;
.end method

.method public final native getEPubBookSize(I)I
.end method

.method public final native getEPubBookmark(Lcom/anfengde/epub/EPubBookmark;II)I
.end method

.method public final native getEPubBookmarkCount(I)I
.end method

.method public final native getEPubCSS(I)Ljava/lang/String;
.end method

.method public final native getEPubChapter(Lcom/anfengde/epub/EPubChapter;II)I
.end method

.method public final native getEPubChapterCount(I)I
.end method

.method public final native getEPubCoverImage(I)Ljava/lang/String;
.end method

.method public final native getEPubManifest(Lcom/anfengde/epub/EPubManifestItem;II)I
.end method

.method public final native getEPubManifestCount(I)I
.end method

.method public final native getEPubMetadata(Lcom/anfengde/epub/EPubMetadata;I)I
.end method

.method public final native getEPubMimetype(I)Ljava/lang/String;
.end method

.method public final native getEPubReadingStatus(Lcom/anfengde/epub/EPubReadingStatus;I)I
.end method

.method public final native getEPubSpine(Lcom/anfengde/epub/EPubSpine;II)I
.end method

.method public final native getEPubSpineCount(I)I
.end method

.method public final native initEPubEnv(Ljava/lang/String;)I
.end method

.method public final native isUnZipping()I
.end method

.method public final native openEPubBook(Ljava/lang/String;)I
.end method

.method public final native updateEPubBookmark(Lcom/anfengde/epub/EPubBookmark;I)I
.end method

.method public final native updateEPubReadingStatus(Lcom/anfengde/epub/EPubReadingStatus;I)I
.end method
