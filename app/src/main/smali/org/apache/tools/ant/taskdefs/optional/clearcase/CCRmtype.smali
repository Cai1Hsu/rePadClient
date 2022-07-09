.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCRmtype.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_FORCE:Ljava/lang/String; = "-force"

.field public static final FLAG_IGNORE:Ljava/lang/String; = "-ignore"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"

.field public static final FLAG_RMALL:Ljava/lang/String; = "-rmall"


# instance fields
.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mIgnore:Z

.field private mRmall:Z

.field private mTypeKind:Ljava/lang/String;

.field private mTypeName:Ljava/lang/String;

.field private mVOB:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 88
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 89
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeKind:Ljava/lang/String;

    .line 90
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeName:Ljava/lang/String;

    .line 91
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mVOB:Ljava/lang/String;

    .line 92
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mComment:Ljava/lang/String;

    .line 93
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mCfile:Ljava/lang/String;

    .line 94
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mRmall:Z

    .line 95
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mIgnore:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getIgnore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ignore"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 144
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getRmAll()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 146
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-rmall"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-force"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 149
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 151
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 162
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeSpecifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 163
    return-void

    .line 153
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 155
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 157
    :cond_3
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
    .line 317
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 323
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 324
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 326
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 335
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 341
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 342
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 344
    :cond_0
    return-void
.end method

.method private getTypeSpecifier()Ljava/lang/String;
    .locals 5

    .prologue
    .line 298
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeKind()Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, "tkind":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeName()Ljava/lang/String;

    move-result-object v1

    .line 300
    .local v1, "tname":Ljava/lang/String;
    const/4 v2, 0x0

    .line 303
    .local v2, "typeSpec":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 304
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getVOB()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 305
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getVOB()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 307
    :cond_0
    return-object v2
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
    .line 105
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 106
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    const/4 v2, 0x0

    .line 109
    .local v2, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeKind()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 110
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Required attribute TypeKind not specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 112
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    .line 113
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Required attribute TypeName not specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 119
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getClearToolCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 120
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "rmtype"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 122
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getFailOnErr()Z

    move-result v3

    if-nez v3, :cond_2

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Ignoring any errors that occur for: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getTypeSpecifier()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 128
    :cond_2
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v2

    .line 129
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getFailOnErr()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 130
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

    .line 131
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 133
    .end local v1    # "msg":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getIgnore()Z
    .locals 1

    .prologue
    .line 180
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mIgnore:Z

    return v0
.end method

.method public getRmAll()Z
    .locals 1

    .prologue
    .line 198
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mRmall:Z

    return v0
.end method

.method public getTypeKind()Ljava/lang/String;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeKind:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeName:Ljava/lang/String;

    return-object v0
.end method

.method public getVOB()Ljava/lang/String;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mVOB:Ljava/lang/String;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 207
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mComment:Ljava/lang/String;

    .line 208
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 225
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mCfile:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setIgnore(Z)V
    .locals 0
    .param p1, "ignore"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mIgnore:Z

    .line 172
    return-void
.end method

.method public setRmAll(Z)V
    .locals 0
    .param p1, "rmall"    # Z

    .prologue
    .line 189
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mRmall:Z

    .line 190
    return-void
.end method

.method public setTypeKind(Ljava/lang/String;)V
    .locals 0
    .param p1, "tk"    # Ljava/lang/String;

    .prologue
    .line 243
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeKind:Ljava/lang/String;

    .line 244
    return-void
.end method

.method public setTypeName(Ljava/lang/String;)V
    .locals 0
    .param p1, "tn"    # Ljava/lang/String;

    .prologue
    .line 261
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mTypeName:Ljava/lang/String;

    .line 262
    return-void
.end method

.method public setVOB(Ljava/lang/String;)V
    .locals 0
    .param p1, "vob"    # Ljava/lang/String;

    .prologue
    .line 279
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype;->mVOB:Ljava/lang/String;

    .line 280
    return-void
.end method
