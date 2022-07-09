.class public Lorg/apache/tools/ant/taskdefs/Dirname;
.super Lorg/apache/tools/ant/Task;
.source "Dirname.java"


# instance fields
.field private file:Ljava/io/File;

.field private property:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->property:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 72
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "property attribute required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Dirname;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 74
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->file:Ljava/io/File;

    if-nez v1, :cond_1

    .line 75
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "file attribute required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Dirname;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 77
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Dirname;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->property:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 55
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->file:Ljava/io/File;

    .line 56
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Dirname;->property:Ljava/lang/String;

    .line 64
    return-void
.end method
