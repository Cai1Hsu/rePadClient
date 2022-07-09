.class public Lorg/apache/tools/ant/taskdefs/Local;
.super Lorg/apache/tools/ant/Task;
.source "Local.java"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Local;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Missing attribute name"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Local;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/property/LocalProperties;->get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Local;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/property/LocalProperties;->addLocal(Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Local;->name:Ljava/lang/String;

    .line 36
    return-void
.end method
