.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCCheckin.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_IDENTICAL:Ljava/lang/String; = "-identical"

.field public static final FLAG_KEEPCOPY:Ljava/lang/String; = "-keep"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"

.field public static final FLAG_NOWARN:Ljava/lang/String; = "-nwarn"

.field public static final FLAG_PRESERVETIME:Ljava/lang/String; = "-ptime"


# instance fields
.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mIdentical:Z

.field private mKeep:Z

.field private mNwarn:Z

.field private mPtime:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 81
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mComment:Ljava/lang/String;

    .line 82
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mCfile:Ljava/lang/String;

    .line 83
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mNwarn:Z

    .line 84
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mPtime:Z

    .line 85
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mKeep:Z

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mIdentical:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 131
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 141
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getNoWarn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nwarn"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 146
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getPreserveTime()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ptime"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 151
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getKeepCopy()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 153
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-keep"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 156
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getIdentical()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-identical"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 162
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 163
    return-void

    .line 133
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 135
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 137
    :cond_5
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
    .line 283
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 290
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 292
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 301
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 308
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 310
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
    .line 96
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 97
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 98
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 101
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 102
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->setViewPath(Ljava/lang/String;)V

    .line 108
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "checkin"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 111
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 113
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 117
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 118
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 119
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

    .line 120
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 122
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentical()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mIdentical:Z

    return v0
.end method

.method public getKeepCopy()Z
    .locals 1

    .prologue
    .line 253
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mKeep:Z

    return v0
.end method

.method public getNoWarn()Z
    .locals 1

    .prologue
    .line 217
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mNwarn:Z

    return v0
.end method

.method public getPreserveTime()Z
    .locals 1

    .prologue
    .line 235
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mPtime:Z

    return v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 172
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mComment:Ljava/lang/String;

    .line 173
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mCfile:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setIdentical(Z)V
    .locals 0
    .param p1, "identical"    # Z

    .prologue
    .line 263
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mIdentical:Z

    .line 264
    return-void
.end method

.method public setKeepCopy(Z)V
    .locals 0
    .param p1, "keep"    # Z

    .prologue
    .line 244
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mKeep:Z

    .line 245
    return-void
.end method

.method public setNoWarn(Z)V
    .locals 0
    .param p1, "nwarn"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mNwarn:Z

    .line 209
    return-void
.end method

.method public setPreserveTime(Z)V
    .locals 0
    .param p1, "ptime"    # Z

    .prologue
    .line 226
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin;->mPtime:Z

    .line 227
    return-void
.end method
