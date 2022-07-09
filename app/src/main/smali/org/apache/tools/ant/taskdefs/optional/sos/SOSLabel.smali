.class public Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;
.super Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;
.source "SOSLabel.java"


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
    .locals 3

    .prologue
    .line 67
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "AddLabel"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getRequiredAttributes()V

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getLabel()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "label attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 79
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-label"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getVerbose()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-log"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 89
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSLabel;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalComment(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalLabel(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;->setInternalVersion(Ljava/lang/String;)V

    .line 37
    return-void
.end method
