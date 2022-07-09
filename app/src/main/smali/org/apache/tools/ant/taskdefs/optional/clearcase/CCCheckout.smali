.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCCheckout.java"


# static fields
.field public static final FLAG_BRANCH:Ljava/lang/String; = "-branch"

.field public static final FLAG_COMMENT:Ljava/lang/String; = "-c"

.field public static final FLAG_COMMENTFILE:Ljava/lang/String; = "-cfile"

.field public static final FLAG_NOCOMMENT:Ljava/lang/String; = "-nc"

.field public static final FLAG_NODATA:Ljava/lang/String; = "-ndata"

.field public static final FLAG_NOWARN:Ljava/lang/String; = "-nwarn"

.field public static final FLAG_OUT:Ljava/lang/String; = "-out"

.field public static final FLAG_RESERVED:Ljava/lang/String; = "-reserved"

.field public static final FLAG_UNRESERVED:Ljava/lang/String; = "-unreserved"

.field public static final FLAG_VERSION:Ljava/lang/String; = "-version"


# instance fields
.field private mBranch:Ljava/lang/String;

.field private mCfile:Ljava/lang/String;

.field private mComment:Ljava/lang/String;

.field private mNdata:Z

.field private mNotco:Z

.field private mNwarn:Z

.field private mOut:Ljava/lang/String;

.field private mReserved:Z

.field private mVersion:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 96
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 97
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mReserved:Z

    .line 98
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mOut:Ljava/lang/String;

    .line 99
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNdata:Z

    .line 100
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mBranch:Ljava/lang/String;

    .line 101
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mVersion:Z

    .line 102
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNwarn:Z

    .line 103
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mComment:Ljava/lang/String;

    .line 104
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mCfile:Ljava/lang/String;

    .line 105
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNotco:Z

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getReserved()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 183
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-reserved"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 189
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getOut()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 191
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getOutCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 200
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getBranch()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 202
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getBranchCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 211
    :cond_1
    :goto_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getNoWarn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 213
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nwarn"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 216
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 218
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 229
    :goto_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 233
    return-void

    .line 186
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-unreserved"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 193
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getNoData()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ndata"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 204
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getVersion()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 206
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-version"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_2

    .line 220
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 222
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_3

    .line 224
    :cond_7
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-nc"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_3
.end method

.method private getBranchCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 426
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getBranch()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 432
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-branch"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 433
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getBranch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 435
    :cond_0
    return-void
.end method

.method private getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 445
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 451
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-c"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 452
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 454
    :cond_0
    return-void
.end method

.method private getCommentFileCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 463
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getCommentFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 469
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-cfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 470
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getCommentFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 472
    :cond_0
    return-void
.end method

.method private getOutCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 408
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getOut()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 414
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-out"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 415
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getOut()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 417
    :cond_0
    return-void
.end method

.method private lsCheckout()Z
    .locals 4

    .prologue
    .line 156
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 162
    .local v0, "cmdl":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getClearToolCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "lsco"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-cview"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 165
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-short"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 166
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-d"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 168
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getViewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->runS(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "result":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 115
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 116
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 117
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 120
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 121
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->setViewPath(Ljava/lang/String;)V

    .line 127
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "checkout"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 130
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 136
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getNotco()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->lsCheckout()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Already checked out in this view: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 150
    :cond_1
    return-void

    .line 141
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_3

    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 145
    :cond_3
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 146
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 147
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

    .line 148
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4
.end method

.method public getBranch()Ljava/lang/String;
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mBranch:Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 380
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mCfile:Ljava/lang/String;

    return-object v0
.end method

.method public getNoData()Z
    .locals 1

    .prologue
    .line 308
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNdata:Z

    return v0
.end method

.method public getNoWarn()Z
    .locals 1

    .prologue
    .line 362
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNwarn:Z

    return v0
.end method

.method public getNotco()Z
    .locals 1

    .prologue
    .line 270
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNotco:Z

    return v0
.end method

.method public getOut()Ljava/lang/String;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mOut:Ljava/lang/String;

    return-object v0
.end method

.method public getReserved()Z
    .locals 1

    .prologue
    .line 250
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mReserved:Z

    return v0
.end method

.method public getVersion()Z
    .locals 1

    .prologue
    .line 344
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mVersion:Z

    return v0
.end method

.method public setBranch(Ljava/lang/String;)V
    .locals 0
    .param p1, "branch"    # Ljava/lang/String;

    .prologue
    .line 317
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mBranch:Ljava/lang/String;

    .line 318
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 371
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mComment:Ljava/lang/String;

    .line 372
    return-void
.end method

.method public setCommentFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "cfile"    # Ljava/lang/String;

    .prologue
    .line 389
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mCfile:Ljava/lang/String;

    .line 390
    return-void
.end method

.method public setNoData(Z)V
    .locals 0
    .param p1, "ndata"    # Z

    .prologue
    .line 299
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNdata:Z

    .line 300
    return-void
.end method

.method public setNoWarn(Z)V
    .locals 0
    .param p1, "nwarn"    # Z

    .prologue
    .line 353
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNwarn:Z

    .line 354
    return-void
.end method

.method public setNotco(Z)V
    .locals 0
    .param p1, "notco"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mNotco:Z

    .line 261
    return-void
.end method

.method public setOut(Ljava/lang/String;)V
    .locals 0
    .param p1, "outf"    # Ljava/lang/String;

    .prologue
    .line 280
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mOut:Ljava/lang/String;

    .line 281
    return-void
.end method

.method public setReserved(Z)V
    .locals 0
    .param p1, "reserved"    # Z

    .prologue
    .line 241
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mReserved:Z

    .line 242
    return-void
.end method

.method public setVersion(Z)V
    .locals 0
    .param p1, "version"    # Z

    .prologue
    .line 335
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCCheckout;->mVersion:Z

    .line 336
    return-void
.end method
