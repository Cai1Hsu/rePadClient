.class public Lorg/apache/tools/ant/taskdefs/ResourceCount;
.super Lorg/apache/tools/ant/Task;
.source "ResourceCount.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final COUNT_REQUIRED:Ljava/lang/String; = "Use of the ResourceCount condition requires that the count attribute be set."

.field private static final ONE_NESTED_MESSAGE:Ljava/lang/String; = "ResourceCount can count resources from exactly one nested ResourceCollection."


# instance fields
.field private count:Ljava/lang/Integer;

.field private property:Ljava/lang/String;

.field private rc:Lorg/apache/tools/ant/types/ResourceCollection;

.field private when:Lorg/apache/tools/ant/types/Comparison;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 41
    sget-object v0, Lorg/apache/tools/ant/types/Comparison;->EQUAL:Lorg/apache/tools/ant/types/Comparison;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->when:Lorg/apache/tools/ant/types/Comparison;

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-eqz v0, :cond_0

    .line 52
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "ResourceCount can count resources from exactly one nested ResourceCollection."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 55
    return-void
.end method

.method public eval()Z
    .locals 3

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v0, :cond_0

    .line 91
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "ResourceCount can count resources from exactly one nested ResourceCollection."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->count:Ljava/lang/Integer;

    if-nez v0, :cond_1

    .line 94
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Use of the ResourceCount condition requires that the count attribute be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->when:Lorg/apache/tools/ant/types/Comparison;

    new-instance v1, Ljava/lang/Integer;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->count:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Comparison;->evaluate(I)Z

    move-result v0

    return v0
.end method

.method public execute()V
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "ResourceCount can count resources from exactly one nested ResourceCollection."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->property:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 78
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "resource count = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/ResourceCount;->log(Ljava/lang/String;)V

    .line 82
    :goto_0
    return-void

    .line 80
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ResourceCount;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->property:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setCount(I)V
    .locals 1
    .param p1, "c"    # I

    .prologue
    .line 104
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->count:Ljava/lang/Integer;

    .line 105
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->property:Ljava/lang/String;

    .line 122
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 62
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject()Ljava/lang/Object;

    move-result-object v0

    .line 63
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v1, :cond_0

    .line 64
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t denote a ResourceCollection"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 67
    :cond_0
    check-cast v0, Lorg/apache/tools/ant/types/ResourceCollection;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/ResourceCount;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 68
    return-void
.end method

.method public setWhen(Lorg/apache/tools/ant/types/Comparison;)V
    .locals 0
    .param p1, "c"    # Lorg/apache/tools/ant/types/Comparison;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ResourceCount;->when:Lorg/apache/tools/ant/types/Comparison;

    .line 114
    return-void
.end method
