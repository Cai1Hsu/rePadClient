.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCMkattr.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"

.field public static final FLAG_RECURSE:Ljava/lang/String; = "-recurse"

.field public static final FLAG_REPLACE:Ljava/lang/String; = "-replace"

.field public static final FLAG_VERSION:Ljava/lang/String; = "-version"


# instance fields
.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mRecurse:Z

.field private mReplace:Z

.field private mTypeName:Ljava/lang/String;

.field private mTypeValue:Ljava/lang/String;

.field private mVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 86
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mReplace:Z

    .line 87
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mRecurse:Z

    .line 88
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mVersion:Ljava/lang/String;

    .line 89
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeName:Ljava/lang/String;

    .line 90
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeValue:Ljava/lang/String;

    .line 91
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mComment:Ljava/lang/String;

    .line 92
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mCfile:Ljava/lang/String;

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getReplace()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-replace"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 151
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getRecurse()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-recurse"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 156
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getVersion()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 158
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getVersionCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 161
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 163
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 173
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 175
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 177
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 179
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeValueCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 182
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 183
    return-void

    .line 165
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 167
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 169
    :cond_6
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
    .line 338
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 344
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 345
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 347
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 356
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 362
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 363
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 365
    :cond_0
    return-void
.end method

.method private getTypeCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 374
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeName()Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "typenm":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 377
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 379
    :cond_0
    return-void
.end method

.method private getTypeValueCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 3
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 388
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeValue()Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "typevl":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 391
    const-string/jumbo v1, "windows"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 392
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\\\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\\\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 396
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 398
    :cond_0
    return-void

    .line 394
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getVersionCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 320
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getVersion()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 326
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-version"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 327
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 329
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
    .line 102
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 103
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 104
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 107
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 108
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Required attribute TypeName not specified"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 110
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getTypeValue()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 111
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Required attribute TypeValue not specified"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 114
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    .line 115
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->setViewPath(Ljava/lang/String;)V

    .line 121
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "mkattr"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 124
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 126
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_3

    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 134
    :cond_3
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 135
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 136
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

    .line 137
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 139
    .end local v2    # "msg":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getRecurse()Z
    .locals 1

    .prologue
    .line 219
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mRecurse:Z

    return v0
.end method

.method public getReplace()Z
    .locals 1

    .prologue
    .line 201
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mReplace:Z

    return v0
.end method

.method public getTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeName:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeValue:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mVersion:Ljava/lang/String;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 246
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mComment:Ljava/lang/String;

    .line 247
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 264
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mCfile:Ljava/lang/String;

    .line 265
    return-void
.end method

.method public setRecurse(Z)V
    .locals 0
    .param p1, "recurse"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mRecurse:Z

    .line 211
    return-void
.end method

.method public setReplace(Z)V
    .locals 0
    .param p1, "replace"    # Z

    .prologue
    .line 192
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mReplace:Z

    .line 193
    return-void
.end method

.method public setTypeName(Ljava/lang/String;)V
    .locals 0
    .param p1, "tn"    # Ljava/lang/String;

    .prologue
    .line 282
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeName:Ljava/lang/String;

    .line 283
    return-void
.end method

.method public setTypeValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "tv"    # Ljava/lang/String;

    .prologue
    .line 300
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mTypeValue:Ljava/lang/String;

    .line 301
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 228
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCMkattr;->mVersion:Ljava/lang/String;

    .line 229
    return-void
.end method
