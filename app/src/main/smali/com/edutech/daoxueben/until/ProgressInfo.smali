.class public Lcom/edutech/daoxueben/until/ProgressInfo;
.super Ljava/lang/Object;
.source "ProgressInfo.java"


# instance fields
.field private book_id:Ljava/lang/String;

.field private ischange:Z

.field private newdownloadsize:J

.field private olddownloadsize:J

.field private section_newprogress:Ljava/lang/String;

.field private section_oldprogress:Ljava/lang/String;

.field private section_webpath:Ljava/lang/String;

.field private size:J

.field private source_id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    .line 19
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    .line 20
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    .line 21
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    .line 22
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    .line 23
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    .line 24
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/edutech/daoxueben/until/ProgressInfo;)V
    .locals 2
    .param p1, "progress"    # Lcom/edutech/daoxueben/until/ProgressInfo;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    .line 41
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    .line 42
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    .line 43
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    .line 44
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    .line 45
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    .line 46
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    .line 47
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    .line 48
    iget-boolean v0, p1, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJZ)V
    .locals 0
    .param p1, "book_id"    # Ljava/lang/String;
    .param p2, "source_id"    # Ljava/lang/String;
    .param p3, "section_webpath"    # Ljava/lang/String;
    .param p4, "section_newprogress"    # Ljava/lang/String;
    .param p5, "section_oldprogress"    # Ljava/lang/String;
    .param p6, "newdownloadsize"    # J
    .param p8, "olddownloadsize"    # J
    .param p10, "size"    # J
    .param p12, "ischange"    # Z

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    .line 33
    iput-object p5, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    .line 34
    iput-wide p6, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    .line 35
    iput-wide p8, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    .line 36
    iput-wide p10, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    .line 37
    iput-boolean p12, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    .line 38
    return-void
.end method


# virtual methods
.method public getBook_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    return-object v0
.end method

.method public getNewdownloadsize()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    return-wide v0
.end method

.method public getOlddownloadsize()J
    .locals 2

    .prologue
    .line 98
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    return-wide v0
.end method

.method public getProgressInfo()Lcom/edutech/daoxueben/until/ProgressInfo;
    .locals 0

    .prologue
    .line 51
    return-object p0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 104
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    return-wide v0
.end method

.method public getSource_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_newprogress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_oldprogress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_webpath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    return-object v0
.end method

.method public isIschange()Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    return v0
.end method

.method public setBook_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_id"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setIschange(Z)V
    .locals 0
    .param p1, "ischange"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    .line 84
    return-void
.end method

.method public setNewdownloadsize(J)V
    .locals 1
    .param p1, "newdownloadsize"    # J

    .prologue
    .line 95
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    .line 96
    return-void
.end method

.method public setOlddownloadsize(J)V
    .locals 1
    .param p1, "olddownloadsize"    # J

    .prologue
    .line 101
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    .line 102
    return-void
.end method

.method public setSize(J)V
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 107
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    .line 108
    return-void
.end method

.method public setSource_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "source_id"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setsection_newprogress(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_newprogress"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setsection_oldprogress(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_oldprogress"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setsection_webpath(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_webpath"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo \nbook_id = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->book_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsource_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->source_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_webpath = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_webpath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_newprogress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_newprogress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_oldprogress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->section_oldprogress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nnewdownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->newdownloadsize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nolddownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->olddownloadsize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->size:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nischange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/edutech/daoxueben/until/ProgressInfo;->ischange:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
