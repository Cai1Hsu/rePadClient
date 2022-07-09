.class public Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;
.super Lorg/apache/tools/ant/taskdefs/optional/sos/SOS;
.source "SOSCheckout.java"


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
    .line 62
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    .line 65
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->getFilename()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "CheckOutFile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-file"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->getFilename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 80
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->getRequiredAttributes()V

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->getOptionalAttributes()V

    .line 83
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    return-object v0

    .line 74
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-command"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "CheckOutProject"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->commandLine:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/sos/SOSCheckout;->getRecursive()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
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
