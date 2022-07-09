.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCUnCheckout.java"


# static fields
.field public static final FLAG_KEEPCOPY:Ljava/lang/String; = "-keep"

.field public static final FLAG_RM:Ljava/lang/String; = "-rm"


# instance fields
.field private mKeep:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->mKeep:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 100
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getKeepCopy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-keep"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 109
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 110
    return-void

    .line 105
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-rm"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 67
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 68
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 71
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 72
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->setViewPath(Ljava/lang/String;)V

    .line 78
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "uncheckout"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 81
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 87
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 88
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 89
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed executing: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 92
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getKeepCopy()Z
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->mKeep:Z

    return v0
.end method

.method public setKeepCopy(Z)V
    .locals 0
    .param p1, "keep"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout;->mKeep:Z

    .line 119
    return-void
.end method
