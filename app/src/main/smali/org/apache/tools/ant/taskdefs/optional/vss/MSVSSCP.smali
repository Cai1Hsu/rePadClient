.class public Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;
.super Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;
.source "MSVSSCP.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 37
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 40
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getVsspath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 41
    const-string/jumbo v1, "vsspath attribute must be set!"

    .line 42
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 48
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getSSCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "CP"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 52
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getVsspath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getAutoresponse()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSCP;->getLogin()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 58
    return-object v0
.end method

.method public setAutoresponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalAutoResponse(Ljava/lang/String;)V

    .line 68
    return-void
.end method
