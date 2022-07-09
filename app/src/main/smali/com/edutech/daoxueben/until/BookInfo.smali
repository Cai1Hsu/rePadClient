.class public Lcom/edutech/daoxueben/until/BookInfo;
.super Ljava/lang/Object;
.source "BookInfo.java"


# instance fields
.field private book_id:Ljava/lang/String;

.field private book_name:Ljava/lang/String;

.field private book_updatetime:Ljava/lang/String;

.field private bookdownloadsize:J

.field private booksize:J

.field private chapter_id:Ljava/lang/String;

.field private chapter_name:Ljava/lang/String;

.field private downloadsize:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private exams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;"
        }
    .end annotation
.end field

.field private exams_progress:Ljava/lang/String;

.field private isParent:Z

.field private isdown:Z

.field private isnew:Z

.field private section_dxid:Ljava/lang/String;

.field private section_id:Ljava/lang/String;

.field private section_name:Ljava/lang/String;

.field private section_path:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private section_progress:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private section_tag:Ljava/lang/String;

.field private section_updatetime:Ljava/lang/String;

.field private section_webpath:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private size:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    .line 33
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    .line 34
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    .line 35
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    .line 36
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    .line 47
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    .line 48
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    .line 49
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    .line 51
    iput-boolean v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    .line 52
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/edutech/daoxueben/until/BookInfo;->setexams_progress(Ljava/lang/String;)V

    .line 53
    iput-boolean v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    .line 54
    return-void
.end method

.method public constructor <init>(Lcom/edutech/daoxueben/until/BookInfo;)V
    .locals 2
    .param p1, "bookinfo"    # Lcom/edutech/daoxueben/until/BookInfo;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    .line 82
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    .line 83
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    .line 84
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    .line 85
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    .line 86
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    .line 87
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    .line 88
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    .line 89
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    .line 90
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    .line 91
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    .line 92
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    .line 93
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    .line 94
    iget-boolean v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    .line 96
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    .line 97
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    .line 98
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    .line 99
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    .line 100
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    .line 101
    iget-boolean v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    .line 102
    iget-object v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    .line 103
    iget-boolean v0, p1, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;ZZZ)V
    .locals 4
    .param p1, "book_id"    # Ljava/lang/String;
    .param p2, "book_name"    # Ljava/lang/String;
    .param p3, "bookdownloadsize"    # Ljava/lang/Long;
    .param p4, "booksize"    # Ljava/lang/Long;
    .param p5, "book_updatetime"    # Ljava/lang/String;
    .param p6, "chapter_id"    # Ljava/lang/String;
    .param p7, "chapter_name"    # Ljava/lang/String;
    .param p8, "section_id"    # Ljava/lang/String;
    .param p9, "section_dxid"    # Ljava/lang/String;
    .param p10, "section_name"    # Ljava/lang/String;
    .param p13, "exams_progress"    # Ljava/lang/String;
    .param p15, "section_tag"    # Ljava/lang/String;
    .param p16, "section_updatetime"    # Ljava/lang/String;
    .param p20, "isdown"    # Z
    .param p21, "isnew"    # Z
    .param p22, "isParent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;ZZZ)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p11, "section_webpath":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p12, "section_path":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p14, "exams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    .local p17, "section_progress":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p18, "downloadsize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .local p19, "size":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    .line 58
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    .line 59
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    .line 60
    iput-object p7, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    .line 61
    iput-object p10, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    .line 62
    iput-object p11, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    .line 63
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    .line 64
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    .line 65
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    .line 66
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    .line 67
    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    .line 68
    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    .line 69
    move/from16 v0, p22

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    .line 71
    iput-object p5, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    .line 72
    iput-object p6, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    .line 73
    iput-object p8, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    .line 74
    iput-object p9, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    .line 75
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    .line 76
    move/from16 v0, p20

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    .line 77
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    .line 78
    move/from16 v0, p21

    iput-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    .line 79
    return-void
.end method


# virtual methods
.method public getBook_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    return-object v0
.end method

.method public getBook_name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    return-object v0
.end method

.method public getBook_updatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    return-object v0
.end method

.method public getBookdownloadsize()J
    .locals 2

    .prologue
    .line 181
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    return-wide v0
.end method

.method public getBooksize()J
    .locals 2

    .prologue
    .line 187
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    return-wide v0
.end method

.method public getChapter_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDownloadsize()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getExams()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 230
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSection_dxid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    return-object v0
.end method

.method public getSection_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    return-object v0
.end method

.method public getSection_path()Ljava/util/ArrayList;
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
    .line 168
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSection_progress()Ljava/util/ArrayList;
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
    .line 174
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSection_webpath()Ljava/util/ArrayList;
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
    .line 162
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSize()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getbookinfo()Lcom/edutech/daoxueben/until/BookInfo;
    .locals 0

    .prologue
    .line 106
    return-object p0
.end method

.method public getchapter_name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_progress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_tag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    return-object v0
.end method

.method public getsection_updatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    return-object v0
.end method

.method public isIsdown()Z
    .locals 1

    .prologue
    .line 236
    iget-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    return v0
.end method

.method public isIsnew()Z
    .locals 1

    .prologue
    .line 248
    iget-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    return v0
.end method

.method public isParent()Z
    .locals 1

    .prologue
    .line 143
    iget-boolean v0, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    return v0
.end method

.method public setBook_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_id"    # Ljava/lang/String;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    .line 154
    return-void
.end method

.method public setBook_name(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_name"    # Ljava/lang/String;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    .line 160
    return-void
.end method

.method public setBook_updatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "book_updatetime"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public setBookdownloadsize(J)V
    .locals 1
    .param p1, "bookdownloadsize"    # J

    .prologue
    .line 184
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    .line 185
    return-void
.end method

.method public setBooksize(J)V
    .locals 1
    .param p1, "booksize"    # J

    .prologue
    .line 190
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    .line 191
    return-void
.end method

.method public setChapter_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "chapter_id"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public setDownloadsize(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 196
    .local p1, "downloadsize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    .line 197
    return-void
.end method

.method public setExams(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 233
    .local p1, "exams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    .line 234
    return-void
.end method

.method public setIsdown(Z)V
    .locals 0
    .param p1, "isdown"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    .line 240
    return-void
.end method

.method public setIsnew(Z)V
    .locals 0
    .param p1, "isnew"    # Z

    .prologue
    .line 251
    iput-boolean p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    .line 252
    return-void
.end method

.method public setParent(Z)V
    .locals 0
    .param p1, "isParent"    # Z

    .prologue
    .line 146
    iput-boolean p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    .line 147
    return-void
.end method

.method public setSection_dxid(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_dxid"    # Ljava/lang/String;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    .line 228
    return-void
.end method

.method public setSection_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_id"    # Ljava/lang/String;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public setSection_path(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "section_path":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    .line 172
    return-void
.end method

.method public setSection_progress(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "section_progress":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    .line 178
    return-void
.end method

.method public setSection_webpath(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "section_webpath":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    .line 166
    return-void
.end method

.method public setSize(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 202
    .local p1, "size":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    .line 203
    return-void
.end method

.method public setchapter_name(Ljava/lang/String;)V
    .locals 0
    .param p1, "chapter_name"    # Ljava/lang/String;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setexams_progress(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_progress"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setsection_name(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_name"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public setsection_tag(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_tag"    # Ljava/lang/String;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setsection_updatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "section_updatetime"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo \nbook_id = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_name = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbookdownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->bookdownloadsize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbooksize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/BookInfo;->booksize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nbook_updatetime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->book_updatetime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nchapter_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nchapter_name = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->chapter_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_dxid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_dxid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_name = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_webpath = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_webpath:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_path = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_path:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_progress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams_progress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->exams:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_tag = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_updatetime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_updatetime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsection_progress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->section_progress:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\ndownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->downloadsize:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->size:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nisdown = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isdown:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nisnew = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isnew:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nisParent = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/edutech/daoxueben/until/BookInfo;->isParent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
