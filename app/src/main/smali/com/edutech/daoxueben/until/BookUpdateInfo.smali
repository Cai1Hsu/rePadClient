.class public Lcom/edutech/daoxueben/until/BookUpdateInfo;
.super Ljava/lang/Object;
.source "BookUpdateInfo.java"


# instance fields
.field private book_isnew:I

.field private id:Ljava/lang/String;

.field private source:Ljava/lang/String;

.field private total:I

.field private type:Ljava/lang/String;

.field private updated:Z

.field private updatetime:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    .line 15
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    .line 16
    iput-boolean v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    .line 17
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    .line 19
    iput v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    .line 20
    iput v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/edutech/daoxueben/until/BookUpdateInfo;)V
    .locals 1
    .param p1, "bookupdateinfo"    # Lcom/edutech/daoxueben/until/BookUpdateInfo;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    .line 35
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    .line 36
    iget-boolean v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    .line 37
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    .line 38
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    .line 39
    iget v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    iput v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    .line 40
    iget v0, p1, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    iput v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "updated"    # Z
    .param p4, "source"    # Ljava/lang/String;
    .param p5, "updatetime"    # Ljava/lang/String;
    .param p6, "book_isnew"    # I
    .param p7, "total"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    .line 26
    iput-boolean p3, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    .line 27
    iput-object p4, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    .line 28
    iput-object p5, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    .line 29
    iput p6, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    .line 30
    iput p7, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    .line 32
    return-void
.end method


# virtual methods
.method public getBookUpdateInfo()Lcom/edutech/daoxueben/until/BookUpdateInfo;
    .locals 0

    .prologue
    .line 45
    return-object p0
.end method

.method public getBook_isnew()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    return v0
.end method

.method public getid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getsource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    return-object v0
.end method

.method public gettotal()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    return v0
.end method

.method public gettype()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getupdated()Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    return v0
.end method

.method public getupdatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    return-object v0
.end method

.method public setBook_isnew(I)V
    .locals 0
    .param p1, "book_isnew"    # I

    .prologue
    .line 83
    iput p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    .line 84
    return-void
.end method

.method public setid(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setsource(Ljava/lang/String;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public settotal(I)V
    .locals 0
    .param p1, "total"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    .line 90
    return-void
.end method

.method public settype(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setupdated(Z)V
    .locals 0
    .param p1, "updated"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    .line 66
    return-void
.end method

.method public setupdatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatetime"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo \nid = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\ntype = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nupdated = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updated:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsource = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->source:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nupdatetime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->updatetime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_isnew = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->book_isnew:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\ntotal = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/edutech/daoxueben/until/BookUpdateInfo;->total:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
