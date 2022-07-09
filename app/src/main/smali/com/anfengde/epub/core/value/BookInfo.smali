.class public Lcom/anfengde/epub/core/value/BookInfo;
.super Ljava/lang/Object;
.source "BookInfo.java"


# instance fields
.field private cssPath:Ljava/lang/String;

.field public metadata:Lcom/anfengde/epub/EPubMetadata;

.field private path:Ljava/lang/String;

.field private spineList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
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

    .line 34
    new-instance v0, Lcom/anfengde/epub/EPubMetadata;

    invoke-direct {v0}, Lcom/anfengde/epub/EPubMetadata;-><init>()V

    iput-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->spineList:Ljava/util/ArrayList;

    .line 20
    return-void
.end method


# virtual methods
.method public addSpine(Ljava/lang/String;)V
    .locals 1
    .param p1, "spine"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->spineList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public getCssPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->cssPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getSpineItem(I)Ljava/lang/String;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->spineList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getSpineList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/anfengde/epub/core/value/BookInfo;->spineList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setCssPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "cssPath"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/anfengde/epub/core/value/BookInfo;->cssPath:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/anfengde/epub/core/value/BookInfo;->path:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "BookInfo [bookType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 104
    const-string/jumbo v1, ", title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", author="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->creator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 105
    const-string/jumbo v1, ", publisher="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->publisher:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", date="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->date:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", subject="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 107
    const-string/jumbo v1, ", language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->language:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->rights:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", isbn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v1, v1, Lcom/anfengde/epub/EPubMetadata;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 109
    const-string/jumbo v1, ", path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 110
    const-string/jumbo v1, ", cssPath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->cssPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 111
    const-string/jumbo v1, ", spineList="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/core/value/BookInfo;->spineList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
