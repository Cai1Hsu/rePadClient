.class public Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;
.super Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;
.source "SOSCheckin.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 2

    .prologue
    .line 73
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getFilename()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 78
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "CheckInFile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-file"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 91
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getRequiredAttributes()V

    .line 92
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getOptionalAttributes()V

    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-log"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    return-object v0

    .line 85
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "CheckInProject"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckin;->getRecursive()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalComment(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public final setFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalFilename(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 46
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalRecursive(Z)V

    .line 47
    return-void
.end method
