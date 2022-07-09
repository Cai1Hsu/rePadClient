.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCMkdir.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_NOCHECKOUT:Ljava/lang/String; = "-nco"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"


# instance fields
.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mNoco:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 65
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 66
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mComment:Ljava/lang/String;

    .line 67
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mCfile:Ljava/lang/String;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mNoco:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 112
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 121
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getNoCheckout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nco"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 126
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 127
    return-void

    .line 114
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 116
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 118
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nc"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 191
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 197
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 198
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 200
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 218
    :cond_0
    return-void
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
    .line 78
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 79
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 80
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 83
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 84
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->setViewPath(Ljava/lang/String;)V

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "mkdir"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 93
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 99
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 100
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 101
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

    .line 102
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 104
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getNoCheckout()Z
    .locals 1

    .prologue
    .line 180
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mNoco:Z

    return v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mComment:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mCfile:Ljava/lang/String;

    .line 154
    return-void
.end method

.method public setNoCheckout(Z)V
    .locals 0
    .param p1, "co"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir;->mNoco:Z

    .line 172
    return-void
.end method
