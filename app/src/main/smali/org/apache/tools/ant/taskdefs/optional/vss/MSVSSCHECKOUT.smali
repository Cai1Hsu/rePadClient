.class public Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;
.super Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;
.source "MSVSSCHECKOUT.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 38
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 41
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getVsspath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 42
    const-string/jumbo v1, "vsspath attribute must be set!"

    .line 43
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 49
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getSSCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "Checkout"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getVsspath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getLocalpath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getAutoresponse()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getRecursive()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getVersionDateLabel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getLogin()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 65
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getFileTimeStamp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getWritableFiles()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT;->getGetLocalCopy()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 71
    return-object v0
.end method

.method public setAutoresponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 131
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalAutoResponse(Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method public setDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalDate(Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public setFileTimeStamp(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;)V
    .locals 0
    .param p1, "timestamp"    # Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    .prologue
    .line 140
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalFileTimeStamp(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;)V

    .line 141
    return-void
.end method

.method public setGetLocalCopy(Z)V
    .locals 0
    .param p1, "get"    # Z

    .prologue
    .line 163
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalGetLocalCopy(Z)V

    .line 164
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalLabel(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public setLocalpath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "localPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 80
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalLocalPath(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 89
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalRecursive(Z)V

    .line 90
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalVersion(Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public setWritableFiles(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;)V
    .locals 0
    .param p1, "files"    # Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    .prologue
    .line 154
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalWritableFiles(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;)V

    .line 155
    return-void
.end method
