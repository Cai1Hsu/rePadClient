.class public Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;
.super Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;
.source "MSVSSADD.java"


# instance fields
.field private localPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->localPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 39
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 42
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getLocalpath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 43
    const-string/jumbo v1, "localPath attribute must be set!"

    .line 44
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 50
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getSSCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "Add"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getLocalpath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getAutoresponse()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getRecursive()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getWritable()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getLogin()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->getComment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 66
    return-object v0
.end method

.method protected getLocalpath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->localPath:Ljava/lang/String;

    return-object v0
.end method

.method public setAutoresponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalAutoResponse(Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalComment(Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public setLocalpath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "localPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 120
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSADD;->localPath:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 84
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalRecursive(Z)V

    .line 85
    return-void
.end method

.method public final setWritable(Z)V
    .locals 0
    .param p1, "writable"    # Z

    .prologue
    .line 93
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalWritable(Z)V

    .line 94
    return-void
.end method
