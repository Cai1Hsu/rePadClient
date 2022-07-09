.class public Lorg/apache/tools/ant/types/Reference;
.super Ljava/lang/Object;
.source "Reference.java"


# instance fields
.field private project:Lorg/apache/tools/ant/Project;

.field private refid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Reference;->setRefId(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/Reference;->setRefId(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Reference;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 62
    return-void
.end method


# virtual methods
.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getRefId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    return-object v0
.end method

.method public getReferencedObject()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    if-nez v0, :cond_0

    .line 129
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "No project set on reference to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 4
    .param p1, "fallback"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v1, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 110
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No reference specified"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 114
    .local v0, "o":Ljava/lang/Object;
    :goto_0
    if-nez v0, :cond_2

    .line 115
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Reference "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    .end local v0    # "o":Ljava/lang/Object;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    iget-object v2, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 117
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    return-object v0
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 88
    iput-object p1, p0, Lorg/apache/tools/ant/types/Reference;->project:Lorg/apache/tools/ant/Project;

    .line 89
    return-void
.end method

.method public setRefId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/apache/tools/ant/types/Reference;->refid:Ljava/lang/String;

    .line 71
    return-void
.end method
