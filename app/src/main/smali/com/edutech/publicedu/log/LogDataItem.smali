.class public Lcom/edutech/publicedu/log/LogDataItem;
.super Ljava/lang/Object;
.source "LogDataItem.java"


# instance fields
.field private AssetsID:Ljava/lang/String;

.field private AssetsName:Ljava/lang/String;

.field private BookID:Ljava/lang/String;

.field private BookName:Ljava/lang/String;

.field private FirstTime:Ljava/lang/String;

.field private LastTime:Ljava/lang/String;

.field private SectionsID:Ljava/lang/String;

.field private SubjectID:Ljava/lang/String;

.field private TotalTime:Ljava/lang/String;

.field private Type:Ljava/lang/String;

.field private VisitCount:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAssetsID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsID:Ljava/lang/String;

    return-object v0
.end method

.method public getAssetsName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsName:Ljava/lang/String;

    return-object v0
.end method

.method public getBookID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookID:Ljava/lang/String;

    return-object v0
.end method

.method public getBookName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookName:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->FirstTime:Ljava/lang/String;

    return-object v0
.end method

.method public getLastTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->LastTime:Ljava/lang/String;

    return-object v0
.end method

.method public getSectionsID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->SectionsID:Ljava/lang/String;

    return-object v0
.end method

.method public getSubjectID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->SubjectID:Ljava/lang/String;

    return-object v0
.end method

.method public getTotalTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->TotalTime:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->Type:Ljava/lang/String;

    return-object v0
.end method

.method public getVisitCount()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogDataItem;->VisitCount:Ljava/lang/String;

    return-object v0
.end method

.method public setAssetsID(Ljava/lang/String;)V
    .locals 0
    .param p1, "assetsID"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsID:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setAssetsName(Ljava/lang/String;)V
    .locals 0
    .param p1, "assetsName"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsName:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setBookID(Ljava/lang/String;)V
    .locals 0
    .param p1, "bookID"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookID:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public setBookName(Ljava/lang/String;)V
    .locals 0
    .param p1, "bookName"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookName:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setFirstTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "firstTime"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->FirstTime:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setLastTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastTime"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->LastTime:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setSectionsID(Ljava/lang/String;)V
    .locals 0
    .param p1, "sectionsID"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->SectionsID:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setSubjectID(Ljava/lang/String;)V
    .locals 0
    .param p1, "subjectID"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->SubjectID:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setTotalTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "totalTime"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->TotalTime:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->Type:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setVisitCount(Ljava/lang/String;)V
    .locals 0
    .param p1, "visitCount"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/edutech/publicedu/log/LogDataItem;->VisitCount:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "LogDataItem [Type="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->Type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", SubjectID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->SubjectID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 107
    const-string/jumbo v1, ", BookID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", BookName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->BookName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 108
    const-string/jumbo v1, ", SectionsID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->SectionsID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", AssetsID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 109
    const-string/jumbo v1, ", AssetsName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->AssetsName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", FirstTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->FirstTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 110
    const-string/jumbo v1, ", LastTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->LastTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", TotalTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->TotalTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 111
    const-string/jumbo v1, ", VisitCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogDataItem;->VisitCount:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
