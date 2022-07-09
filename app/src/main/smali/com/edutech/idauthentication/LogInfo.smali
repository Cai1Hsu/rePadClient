.class public Lcom/edutech/idauthentication/LogInfo;
.super Ljava/lang/Object;
.source "LogInfo.java"


# instance fields
.field private AssetsID:Ljava/lang/String;

.field private AssetsName:Ljava/lang/String;

.field private BookID:Ljava/lang/String;

.field private BookName:Ljava/lang/String;

.field private ChapterID:Ljava/lang/String;

.field private FirstTime:Ljava/lang/String;

.field private LastTime:Ljava/lang/String;

.field private MachineID:Ljava/lang/String;

.field private PartID:Ljava/lang/String;

.field private SectionsID:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private SubjectID:Ljava/lang/String;

.field private TotalTime:J

.field private Type:Ljava/lang/String;

.field private UserID:Ljava/lang/String;

.field private VisitCount:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    .line 27
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    .line 28
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    .line 29
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    .line 30
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    .line 31
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    .line 35
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    .line 36
    iput-wide v2, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    .line 37
    iput-wide v2, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/edutech/idauthentication/LogInfo;)V
    .locals 2
    .param p1, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    .line 62
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    .line 63
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    .line 64
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    .line 65
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    .line 66
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    .line 67
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    .line 68
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    .line 69
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    .line 70
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    .line 71
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    .line 72
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    .line 73
    iget-wide v0, p1, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    iput-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    .line 74
    iget-wide v0, p1, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    iput-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    .line 75
    iget-object v0, p1, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 2
    .param p1, "MachineID"    # Ljava/lang/String;
    .param p2, "Type"    # Ljava/lang/String;
    .param p3, "UserID"    # Ljava/lang/String;
    .param p4, "SubjectID"    # Ljava/lang/String;
    .param p5, "BookID"    # Ljava/lang/String;
    .param p6, "BookName"    # Ljava/lang/String;
    .param p8, "ChapterID"    # Ljava/lang/String;
    .param p9, "PartID"    # Ljava/lang/String;
    .param p10, "AssetsID"    # Ljava/lang/String;
    .param p11, "AssetsName"    # Ljava/lang/String;
    .param p12, "FirstTime"    # Ljava/lang/String;
    .param p13, "LastTime"    # Ljava/lang/String;
    .param p14, "TotalTime"    # J
    .param p16, "VisitCount"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJ)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p7, "SectionsID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    .line 46
    iput-object p4, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    .line 47
    iput-object p5, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    .line 49
    iput-object p8, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    .line 50
    iput-object p9, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    .line 51
    iput-object p10, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    .line 52
    iput-object p11, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    .line 53
    iput-object p12, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    .line 54
    iput-object p13, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    .line 55
    move-wide/from16 v0, p14

    iput-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    .line 56
    move-wide/from16 v0, p16

    iput-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    .line 57
    iput-object p7, p0, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    .line 58
    return-void
.end method


# virtual methods
.method public getAssetsID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    return-object v0
.end method

.method public getAssetsName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    return-object v0
.end method

.method public getBookID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    return-object v0
.end method

.method public getChapterID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    return-object v0
.end method

.method public getLastTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    return-object v0
.end method

.method public getMachineID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    return-object v0
.end method

.method public getPartID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    return-object v0
.end method

.method public getSectionsID()Ljava/util/ArrayList;
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
    .line 172
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSubjectID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    return-object v0
.end method

.method public getTotalTime()J
    .locals 2

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    return-object v0
.end method

.method public getVisitCount()J
    .locals 2

    .prologue
    .line 154
    iget-wide v0, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    return-wide v0
.end method

.method public getlogs()Lcom/edutech/idauthentication/LogInfo;
    .locals 0

    .prologue
    .line 79
    return-object p0
.end method

.method public setAssetsID(Ljava/lang/String;)V
    .locals 0
    .param p1, "assetsID"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setAssetsName(Ljava/lang/String;)V
    .locals 0
    .param p1, "assetsName"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    .line 140
    return-void
.end method

.method public setBookID(Ljava/lang/String;)V
    .locals 0
    .param p1, "bookID"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setBookName(Ljava/lang/String;)V
    .locals 0
    .param p1, "bookName"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setChapterID(Ljava/lang/String;)V
    .locals 0
    .param p1, "ChapterID"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setFirstTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "firstTime"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setLastTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastTime"    # Ljava/lang/String;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setMachineID(Ljava/lang/String;)V
    .locals 0
    .param p1, "machineID"    # Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public setPartID(Ljava/lang/String;)V
    .locals 0
    .param p1, "partID"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setSectionsID(Ljava/util/ArrayList;)V
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
    .line 175
    .local p1, "sectionsID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->SectionsID:Ljava/util/ArrayList;

    .line 176
    return-void
.end method

.method public setSubjectID(Ljava/lang/String;)V
    .locals 0
    .param p1, "subjectID"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    .line 122
    return-void
.end method

.method public setTotalTime(J)V
    .locals 1
    .param p1, "totalTime"    # J

    .prologue
    .line 112
    iput-wide p1, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    .line 113
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "Type"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setUserID(Ljava/lang/String;)V
    .locals 0
    .param p1, "UserID"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setVisitCount(J)V
    .locals 1
    .param p1, "visitCount"    # J

    .prologue
    .line 157
    iput-wide p1, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    .line 158
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "bookinfo\nMachineID = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->MachineID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->Type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nUserID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->UserID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nSubjectID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->SubjectID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nBookID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->BookID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nBookName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->BookName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nChapterID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->ChapterID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nPartID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->PartID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nAssetsID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nAssetsName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->AssetsName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nFirstTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->FirstTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nLastTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/idauthentication/LogInfo;->LastTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nTotalTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/idauthentication/LogInfo;->TotalTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\nVisitCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/edutech/idauthentication/LogInfo;->VisitCount:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
