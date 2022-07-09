.class public Lcom/anfengde/epub/core/value/TableOfContent;
.super Ljava/lang/Object;
.source "TableOfContent.java"


# instance fields
.field private chapterList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/EPubChapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    .line 20
    return-void
.end method


# virtual methods
.method public addChapter(Lcom/anfengde/epub/EPubChapter;)V
    .locals 1
    .param p1, "chapter"    # Lcom/anfengde/epub/EPubChapter;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public clearChapter()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 71
    return-void
.end method

.method public getChapter(I)Lcom/anfengde/epub/EPubChapter;
    .locals 2
    .param p1, "num"    # I

    .prologue
    .line 33
    const/4 v0, 0x0

    .line 34
    .local v0, "chapNum":I
    if-gez p1, :cond_1

    .line 35
    const/4 v0, 0x0

    .line 39
    :goto_0
    iget-object v1, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 42
    :cond_0
    iget-object v1, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/anfengde/epub/EPubChapter;

    return-object v1

    .line 37
    :cond_1
    move v0, p1

    goto :goto_0
.end method

.method public getChapterList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/EPubChapter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTotalSize()I
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/anfengde/epub/core/value/TableOfContent;->chapterList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
