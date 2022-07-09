.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCMklbtype.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_GLOBAL:Ljava/lang/String; = "-global"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"

.field public static final FLAG_ORDINARY:Ljava/lang/String; = "-ordinary"

.field public static final FLAG_PBRANCH:Ljava/lang/String; = "-pbranch"

.field public static final FLAG_REPLACE:Ljava/lang/String; = "-replace"

.field public static final FLAG_SHARED:Ljava/lang/String; = "-shared"


# instance fields
.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mGlobal:Z

.field private mOrdinary:Z

.field private mPbranch:Z

.field private mReplace:Z

.field private mShared:Z

.field private mTypeName:Ljava/lang/String;

.field private mVOB:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 97
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mTypeName:Ljava/lang/String;

    .line 98
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mVOB:Ljava/lang/String;

    .line 99
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mComment:Ljava/lang/String;

    .line 100
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mCfile:Ljava/lang/String;

    .line 101
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mReplace:Z

    .line 102
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mGlobal:Z

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mOrdinary:Z

    .line 104
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mPbranch:Z

    .line 105
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mShared:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getReplace()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-replace"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 152
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getOrdinary()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 154
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ordinary"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 162
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getPbranch()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 164
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-pbranch"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 167
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getShared()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 169
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-shared"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 172
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 174
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 185
    :goto_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getTypeSpecifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 186
    return-void

    .line 156
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getGlobal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-global"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 176
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 178
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_1

    .line 180
    :cond_6
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nc"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 359
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 365
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 366
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 368
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 377
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 383
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 384
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 386
    :cond_0
    return-void
.end method

.method private getTypeSpecifier()Ljava/lang/String;
    .locals 3

    .prologue
    .line 395
    const/4 v0, 0x0

    .line 397
    .local v0, "typenm":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getTypeName()Ljava/lang/String;

    move-result-object v0

    .line 398
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getVOB()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 399
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getVOB()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 402
    :cond_0
    return-object v0
.end method


# virtual methods
.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 116
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    const/4 v2, 0x0

    .line 119
    .local v2, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getTypeName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 120
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Required attribute TypeName not specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 126
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getClearToolCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "mklbtype"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 129
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getFailOnErr()Z

    move-result v3

    if-nez v3, :cond_1

    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Ignoring any errors that occur for: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getTypeSpecifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 135
    :cond_1
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v2

    .line 136
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getFailOnErr()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 137
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 138
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 140
    .end local v1    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 348
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getGlobal()Z
    .locals 1

    .prologue
    .line 258
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mGlobal:Z

    return v0
.end method

.method public getOrdinary()Z
    .locals 1

    .prologue
    .line 276
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mOrdinary:Z

    return v0
.end method

.method public getPbranch()Z
    .locals 1

    .prologue
    .line 294
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mPbranch:Z

    return v0
.end method

.method public getReplace()Z
    .locals 1

    .prologue
    .line 240
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mReplace:Z

    return v0
.end method

.method public getShared()Z
    .locals 1

    .prologue
    .line 312
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mShared:Z

    return v0
.end method

.method public getTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mTypeName:Ljava/lang/String;

    return-object v0
.end method

.method public getVOB()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mVOB:Ljava/lang/String;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mComment:Ljava/lang/String;

    .line 322
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 339
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mCfile:Ljava/lang/String;

    .line 340
    return-void
.end method

.method public setGlobal(Z)V
    .locals 0
    .param p1, "glob"    # Z

    .prologue
    .line 249
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mGlobal:Z

    .line 250
    return-void
.end method

.method public setOrdinary(Z)V
    .locals 0
    .param p1, "ordinary"    # Z

    .prologue
    .line 267
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mOrdinary:Z

    .line 268
    return-void
.end method

.method public setPbranch(Z)V
    .locals 0
    .param p1, "pbranch"    # Z

    .prologue
    .line 285
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mPbranch:Z

    .line 286
    return-void
.end method

.method public setReplace(Z)V
    .locals 0
    .param p1, "repl"    # Z

    .prologue
    .line 231
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mReplace:Z

    .line 232
    return-void
.end method

.method public setShared(Z)V
    .locals 0
    .param p1, "shared"    # Z

    .prologue
    .line 303
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mShared:Z

    .line 304
    return-void
.end method

.method public setTypeName(Ljava/lang/String;)V
    .locals 0
    .param p1, "tn"    # Ljava/lang/String;

    .prologue
    .line 195
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mTypeName:Ljava/lang/String;

    .line 196
    return-void
.end method

.method public setVOB(Ljava/lang/String;)V
    .locals 0
    .param p1, "vob"    # Ljava/lang/String;

    .prologue
    .line 213
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype;->mVOB:Ljava/lang/String;

    .line 214
    return-void
.end method
