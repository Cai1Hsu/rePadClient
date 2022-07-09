.class public Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;
.super Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;
.source "SOSGet.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 2

    .prologue
    .line 82
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getFilename()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "GetFile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-file"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getVersion()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-revision"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 111
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getRequiredAttributes()V

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getOptionalAttributes()V

    .line 114
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    return-object v0

    .line 100
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "GetProject"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getRecursive()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getLabel()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-label"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSGet;->getLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final setFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalFilename(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalLabel(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 47
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalRecursive(Z)V

    .line 48
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalVersion(Ljava/lang/String;)V

    .line 58
    return-void
.end method
