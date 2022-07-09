.class public Lcom/edutech/daoxueben/until/OldBooks;
.super Ljava/lang/Object;
.source "OldBooks.java"


# instance fields
.field private book_id:Ljava/lang/String;

.field private book_isnew:I

.field private book_name:Ljava/lang/String;

.field private book_path:Ljava/lang/String;

.field private book_total:I

.field private book_updatetime:Ljava/lang/String;

.field private bookdownloadsize:J

.field private booksize:J

.field private progress:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    .line 17
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    .line 18
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    .line 19
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    .line 20
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    .line 21
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    .line 22
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    .line 23
    iput v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    .line 24
    iput v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/edutech/daoxueben/until/OldBooks;)V
    .locals 2
    .param p1, "book"    # Lcom/edutech/daoxueben/until/OldBooks;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iget-object v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    .line 39
    iget-object v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    .line 40
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    .line 41
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    .line 42
    iget-object v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    .line 43
    iget-object v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    .line 44
    iget-object v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    .line 45
    iget v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    iput v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    .line 46
    iget v0, p1, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    iput v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 2
    .param p1, "book_id"    # Ljava/lang/String;
    .param p2, "book_name"    # Ljava/lang/String;
    .param p3, "bookdownloadsize"    # Ljava/lang/Long;
    .param p4, "booksize"    # Ljava/lang/Long;
    .param p5, "book_path"    # Ljava/lang/String;
    .param p6, "progress"    # Ljava/lang/String;
    .param p7, "book_updatetime"    # Ljava/lang/String;
    .param p8, "book_isnew"    # I
    .param p9, "book_total"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    .line 29
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    .line 30
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    .line 31
    iput-object p5, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    .line 32
    iput-object p6, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    .line 33
    iput-object p7, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    .line 34
    iput p8, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    .line 35
    iput p9, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    .line 36
    return-void
.end method


# virtual methods
.method public getBook_isnew()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    return v0
.end method

.method public getBook_total()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    return v0
.end method

.method public getBook_updatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    return-object v0
.end method

.method public getBookdownloadsize()J
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    return-wide v0
.end method

.method public getBooksize()J
    .locals 2

    .prologue
    .line 74
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    return-wide v0
.end method

.method public getProgress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    return-object v0
.end method

.method public getbook_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    return-object v0
.end method

.method public getbook_name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    return-object v0
.end method

.method public getbook_path()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    return-object v0
.end method

.method public getbooks()Lcom/edutech/daoxueben/until/OldBooks;
    .locals 0

    .prologue
    .line 51
    return-object p0
.end method

.method public setBook_isnew(I)V
    .locals 0
    .param p1, "book_isnew"    # I

    .prologue
    .line 101
    iput p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    .line 102
    return-void
.end method

.method public setBook_total(I)V
    .locals 0
    .param p1, "book_total"    # I

    .prologue
    .line 107
    iput p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    .line 108
    return-void
.end method

.method public setBook_updatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_updatetime"    # Ljava/lang/String;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setBookdownloadsize(J)V
    .locals 1
    .param p1, "bookdownloadsize"    # J

    .prologue
    .line 71
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    .line 72
    return-void
.end method

.method public setBooksize(J)V
    .locals 1
    .param p1, "booksize"    # J

    .prologue
    .line 77
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    .line 78
    return-void
.end method

.method public setProgress(Ljava/lang/String;)V
    .locals 0
    .param p1, "progress"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setbook_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_id"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setbook_name(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_name"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setbook_path(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_path"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo \nbook_id = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_name = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbookdownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/OldBooks;->bookdownloadsize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbooksize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/OldBooks;->booksize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_path = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nprogress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->progress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_updatetime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_updatetime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_isnew = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_isnew:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_total = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/edutech/daoxueben/until/OldBooks;->book_total:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
