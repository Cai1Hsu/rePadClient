.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCLock.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-comment"

.field public static final FLAG_NUSERS:Ljava/lang/String; = "-nusers"

.field public static final FLAG_OBSOLETE:Ljava/lang/String; = "-obsolete"

.field public static final FLAG_PNAME:Ljava/lang/String; = "-pname"

.field public static final FLAG_REPLACE:Ljava/lang/String; = "-replace"


# instance fields
.field private mComment:Ljava/lang/String;

.field private mNusers:Ljava/lang/String;

.field private mObjselect:Ljava/lang/String;

.field private mObsolete:Z

.field private mPname:Ljava/lang/String;

.field private mReplace:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 87
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 88
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mReplace:Z

    .line 89
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObsolete:Z

    .line 90
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mComment:Ljava/lang/String;

    .line 91
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mNusers:Ljava/lang/String;

    .line 92
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mPname:Ljava/lang/String;

    .line 93
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObjselect:Ljava/lang/String;

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getReplace()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-replace"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 144
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getObsolete()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 146
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-obsolete"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 150
    :goto_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 152
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getObjselect()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 153
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Should select either an element (pname) or an object (objselect)"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getNusersCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 156
    :cond_2
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPnameCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 158
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getObjselect()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 159
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getObjselect()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 161
    :cond_3
    return-void
.end method

.method private getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 310
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getComment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 321
    :goto_0
    return-void

    .line 318
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-comment"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 319
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getNusersCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 290
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getNusers()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 301
    :goto_0
    return-void

    .line 298
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nusers"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 299
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getNusers()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getOpType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 350
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 351
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPname()Ljava/lang/String;

    move-result-object v0

    .line 353
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getObjselect()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getPnameCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 330
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 341
    :goto_0
    return-void

    .line 338
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-pname"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 339
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getPname()Ljava/lang/String;

    move-result-object v1

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
    .line 103
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 104
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 105
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 108
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 109
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->setViewPath(Ljava/lang/String;)V

    .line 115
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 116
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "lock"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 119
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getOpType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 128
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 129
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 130
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

    .line 131
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 133
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getNusers()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mNusers:Ljava/lang/String;

    return-object v0
.end method

.method public getObjselect()Ljava/lang/String;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObjselect:Ljava/lang/String;

    return-object v0
.end method

.method public getObsolete()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObsolete:Z

    return v0
.end method

.method public getPname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mPname:Ljava/lang/String;

    return-object v0
.end method

.method public getReplace()Z
    .locals 1

    .prologue
    .line 178
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mReplace:Z

    return v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 225
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mComment:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setNusers(Ljava/lang/String;)V
    .locals 0
    .param p1, "nusers"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mNusers:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setObjSel(Ljava/lang/String;)V
    .locals 0
    .param p1, "objsel"    # Ljava/lang/String;

    .prologue
    .line 262
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObjselect:Ljava/lang/String;

    .line 263
    return-void
.end method

.method public setObjselect(Ljava/lang/String;)V
    .locals 0
    .param p1, "objselect"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObjselect:Ljava/lang/String;

    .line 272
    return-void
.end method

.method public setObsolete(Z)V
    .locals 0
    .param p1, "obsolete"    # Z

    .prologue
    .line 187
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mObsolete:Z

    .line 188
    return-void
.end method

.method public setPname(Ljava/lang/String;)V
    .locals 0
    .param p1, "pname"    # Ljava/lang/String;

    .prologue
    .line 243
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mPname:Ljava/lang/String;

    .line 244
    return-void
.end method

.method public setReplace(Z)V
    .locals 0
    .param p1, "replace"    # Z

    .prologue
    .line 169
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCLock;->mReplace:Z

    .line 170
    return-void
.end method
