.class public Lcom/edutech/daoxueben/until/ExamsInfo;
.super Ljava/lang/Object;
.source "ExamsInfo.java"


# instance fields
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

.field private exams_answer:I

.field private exams_body:Ljava/lang/String;

.field private exams_id:Ljava/lang/String;

.field private exams_path:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private exams_progress:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private exams_result:Ljava/lang/String;

.field private exams_studentresult:Ljava/lang/String;

.field private exams_totalsize:J

.field private exams_type:Ljava/lang/String;

.field private exams_updatetime:Ljava/lang/String;

.field private exams_webpath:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private question_id:Ljava/lang/String;

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
    .locals 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    .line 29
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    .line 34
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    .line 35
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    .line 36
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/edutech/daoxueben/until/ExamsInfo;)V
    .locals 2
    .param p1, "examsinfo"    # Lcom/edutech/daoxueben/until/ExamsInfo;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    .line 56
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    .line 57
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    .line 58
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    .line 59
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    .line 60
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    .line 61
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    .line 62
    iget v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    iput v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    .line 63
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    .line 64
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    .line 65
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    .line 66
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    .line 67
    iget-wide v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    iput-wide v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    .line 68
    iget-object v0, p1, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "exams_id"    # Ljava/lang/String;
    .param p2, "question_id"    # Ljava/lang/String;
    .param p3, "exams_body"    # Ljava/lang/String;
    .param p4, "exams_type"    # Ljava/lang/String;
    .param p5, "exams_totalsize"    # J
    .param p9, "exams_result"    # Ljava/lang/String;
    .param p10, "exams_answer"    # I
    .param p14, "exams_studentresult"    # Ljava/lang/String;
    .param p15, "exams_updatetime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I",
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
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p7, "exams_webpath":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p8, "exams_path":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p11, "exams_progress":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p12, "downloadsize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    .local p13, "size":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    .line 43
    iput-object p7, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    .line 44
    iput-object p8, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    .line 45
    iput-object p9, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    .line 46
    iput p10, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    .line 47
    iput-object p11, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    .line 48
    iput-object p12, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    .line 49
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    .line 50
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    .line 51
    iput-wide p5, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    .line 52
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    .line 53
    return-void
.end method


# virtual methods
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
    .line 145
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getExams_updatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

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
    .line 151
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getexams_answer()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    return v0
.end method

.method public getexams_body()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_path()Ljava/util/ArrayList;
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
    .line 133
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getexams_progress()Ljava/util/ArrayList;
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
    .line 139
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getexams_result()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_studentresult()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_totalsize()J
    .locals 2

    .prologue
    .line 157
    iget-wide v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    return-wide v0
.end method

.method public getexams_type()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    return-object v0
.end method

.method public getexams_webpath()Ljava/util/ArrayList;
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
    .line 127
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getexamsinfo()Lcom/edutech/daoxueben/until/ExamsInfo;
    .locals 0

    .prologue
    .line 71
    return-object p0
.end method

.method public getquestion_id()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    return-object v0
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
    .line 148
    .local p1, "downloadsize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    .line 149
    return-void
.end method

.method public setExams_updatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_updatetime"    # Ljava/lang/String;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    .line 167
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
    .line 154
    .local p1, "size":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    .line 155
    return-void
.end method

.method public setexams_answer(I)V
    .locals 0
    .param p1, "exams_answer"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    .line 99
    return-void
.end method

.method public setexams_body(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_body"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public setexams_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_id"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setexams_path(Ljava/util/ArrayList;)V
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
    .line 136
    .local p1, "exams_path":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    .line 137
    return-void
.end method

.method public setexams_progress(Ljava/util/ArrayList;)V
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
    .line 142
    .local p1, "exams_progress":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    .line 143
    return-void
.end method

.method public setexams_result(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_result"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setexams_studentresult(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_studentresult"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setexams_totalsize(J)V
    .locals 1
    .param p1, "exams_totalsize"    # J

    .prologue
    .line 160
    iput-wide p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    .line 161
    return-void
.end method

.method public setexams_type(Ljava/lang/String;)V
    .locals 0
    .param p1, "exams_type"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setexams_webpath(Ljava/util/ArrayList;)V
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
    .line 130
    .local p1, "exams_webpath":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    .line 131
    return-void
.end method

.method public setquestion_id(Ljava/lang/String;)V
    .locals 0
    .param p1, "question_id"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo \nexams_id = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nquestion_id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->question_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_body = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_body:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_totalsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_totalsize:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_webpath = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_webpath:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_path = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_path:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_result = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_result:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_answer = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_answer:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_progress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_progress:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\ndownloadsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->downloadsize:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nsize = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->size:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_studentresult = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_studentresult:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nexams_updatetime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/daoxueben/until/ExamsInfo;->exams_updatetime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
