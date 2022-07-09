.class public Lcom/anfengde/epub/core/EPubDriver;
.super Ljava/lang/Object;
.source "EPubDriver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EPubDriver"


# instance fields
.field private bookPath:Ljava/lang/String;

.field private cachePath:Ljava/lang/String;

.field public clsEPub:Lcom/anfengde/epub/EPubJNI;

.field public handle:I

.field initFlag:I

.field public mBook:Lcom/anfengde/epub/core/value/BookInfo;

.field public mToc:Lcom/anfengde/epub/core/value/TableOfContent;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "argCachePath"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lcom/anfengde/epub/core/value/BookInfo;

    invoke-direct {v0}, Lcom/anfengde/epub/core/value/BookInfo;-><init>()V

    iput-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    .line 43
    new-instance v0, Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-direct {v0}, Lcom/anfengde/epub/core/value/TableOfContent;-><init>()V

    iput-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Lcom/anfengde/epub/core/EPubDriver;->initFlag:I

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    .line 71
    iput-object p1, p0, Lcom/anfengde/epub/core/EPubDriver;->cachePath:Ljava/lang/String;

    .line 74
    return-void
.end method

.method private getMeataData(I)I
    .locals 2
    .param p1, "handle"    # I

    .prologue
    .line 142
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget-object v1, p0, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v1, v1, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    invoke-virtual {v0, v1, p1}, Lcom/anfengde/epub/EPubJNI;->getEPubMetadata(Lcom/anfengde/epub/EPubMetadata;I)I

    move-result v0

    return v0
.end method


# virtual methods
.method public cleanUp()V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v0}, Lcom/anfengde/epub/EPubJNI;->cleanUpEPubEnv()V

    .line 225
    return-void
.end method

.method public closeBook()I
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget v1, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/EPubJNI;->closeEPubBook(I)I

    move-result v0

    return v0
.end method

.method public getBookSize()I
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget v1, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/EPubJNI;->getEPubBookSize(I)I

    move-result v0

    return v0
.end method

.method public getCachePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->cachePath:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverImg()Ljava/lang/String;
    .locals 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget v1, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/EPubJNI;->getEPubCoverImage(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget v1, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/EPubJNI;->getEPubCoverImage(I)Ljava/lang/String;

    move-result-object v0

    .line 245
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "../image/afd_coverimg.png"

    goto :goto_0
.end method

.method public getErrorMessage(I)Ljava/lang/String;
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 208
    iget-object v0, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v0, p1}, Lcom/anfengde/epub/EPubJNI;->epubGetMessage(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastError()I
    .locals 1

    .prologue
    .line 198
    const/4 v0, -0x1

    return v0
.end method

.method public getToc(I)I
    .locals 6
    .param p1, "handle"    # I

    .prologue
    .line 153
    iget-object v5, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v5, p1}, Lcom/anfengde/epub/EPubJNI;->getEPubChapterCount(I)I

    move-result v0

    .line 154
    .local v0, "chapterNumber":I
    if-lez v0, :cond_0

    .line 155
    move v1, p1

    .line 156
    .local v1, "current_handle":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v0, :cond_1

    .line 169
    .end local v1    # "current_handle":I
    .end local v3    # "i":I
    :cond_0
    const/4 v5, 0x1

    :goto_1
    return v5

    .line 157
    .restart local v1    # "current_handle":I
    .restart local v3    # "i":I
    :cond_1
    new-instance v2, Lcom/anfengde/epub/EPubChapter;

    invoke-direct {v2}, Lcom/anfengde/epub/EPubChapter;-><init>()V

    .line 158
    .local v2, "epubChapter":Lcom/anfengde/epub/EPubChapter;
    iget-object v5, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v5, v2, v1, v3}, Lcom/anfengde/epub/EPubJNI;->getEPubChapter(Lcom/anfengde/epub/EPubChapter;II)I

    move-result v4

    .line 160
    .local v4, "next_handle":I
    if-nez v4, :cond_2

    .line 162
    const/4 v5, -0x1

    goto :goto_1

    .line 165
    :cond_2
    move v1, v4

    .line 166
    iget-object v5, p0, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v5, v2}, Lcom/anfengde/epub/core/value/TableOfContent;->addChapter(Lcom/anfengde/epub/EPubChapter;)V

    .line 156
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public initEPubJNI()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 84
    new-instance v2, Lcom/anfengde/epub/EPubJNI;

    invoke-direct {v2}, Lcom/anfengde/epub/EPubJNI;-><init>()V

    iput-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    .line 86
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget-object v3, p0, Lcom/anfengde/epub/core/EPubDriver;->cachePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/EPubJNI;->initEPubEnv(Ljava/lang/String;)I

    move-result v0

    .line 88
    .local v0, "ret":I
    if-eq v0, v1, :cond_0

    .line 89
    iget-object v1, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v1}, Lcom/anfengde/epub/EPubJNI;->epubGetLastError()I

    move-result v1

    .line 93
    :goto_0
    return v1

    .line 91
    :cond_0
    iput v1, p0, Lcom/anfengde/epub/core/EPubDriver;->initFlag:I

    goto :goto_0
.end method

.method public openBook(Ljava/lang/String;)I
    .locals 5
    .param p1, "argBookPath"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/anfengde/epub/core/EPubDriver;->bookPath:Ljava/lang/String;

    .line 105
    const/4 v1, 0x0

    .line 107
    .local v1, "ret":I
    iget v2, p0, Lcom/anfengde/epub/core/EPubDriver;->initFlag:I

    if-gtz v2, :cond_0

    .line 108
    const/4 v2, 0x0

    .line 131
    :goto_0
    return v2

    .line 110
    :cond_0
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget-object v3, p0, Lcom/anfengde/epub/core/EPubDriver;->bookPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/EPubJNI;->openEPubBook(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    .line 113
    iget v2, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    if-nez v2, :cond_1

    .line 114
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v2}, Lcom/anfengde/epub/EPubJNI;->epubGetLastError()I

    move-result v2

    goto :goto_0

    .line 116
    :cond_1
    iget v2, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-direct {p0, v2}, Lcom/anfengde/epub/core/EPubDriver;->getMeataData(I)I

    move-result v1

    .line 117
    const-string/jumbo v2, "EPubDriver"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "getMeataData return: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    if-nez v1, :cond_2

    .line 120
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v2}, Lcom/anfengde/epub/EPubJNI;->epubGetLastError()I

    move-result v2

    goto :goto_0

    .line 122
    :cond_2
    iget v2, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {p0, v2}, Lcom/anfengde/epub/core/EPubDriver;->getToc(I)I

    move-result v1

    .line 123
    const-string/jumbo v2, "EPubDriver"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "getToc return: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    if-gtz v1, :cond_3

    .line 126
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v2}, Lcom/anfengde/epub/EPubJNI;->epubGetLastError()I

    move-result v2

    goto :goto_0

    .line 128
    :cond_3
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    iget v3, p0, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/EPubJNI;->getEPubBookRootFolder(I)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "baseUrl":Ljava/lang/String;
    iget-object v2, p0, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    invoke-virtual {v2, v0}, Lcom/anfengde/epub/core/value/BookInfo;->setPath(Ljava/lang/String;)V

    .line 131
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public setCachePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "cachePath"    # Ljava/lang/String;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/anfengde/epub/core/EPubDriver;->cachePath:Ljava/lang/String;

    .line 189
    return-void
.end method
