.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCUpdate.java"


# static fields
.field public static final FLAG_CURRENTTIME:Ljava/lang/String; = "-ctime"

.field public static final FLAG_GRAPHICAL:Ljava/lang/String; = "-graphical"

.field public static final FLAG_LOG:Ljava/lang/String; = "-log"

.field public static final FLAG_NOVERWRITE:Ljava/lang/String; = "-noverwrite"

.field public static final FLAG_OVERWRITE:Ljava/lang/String; = "-overwrite"

.field public static final FLAG_PRESERVETIME:Ljava/lang/String; = "-ptime"

.field public static final FLAG_RENAME:Ljava/lang/String; = "-rename"


# instance fields
.field private mCtime:Z

.field private mGraphical:Z

.field private mLog:Ljava/lang/String;

.field private mOverwrite:Z

.field private mPtime:Z

.field private mRename:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 82
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 83
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mGraphical:Z

    .line 84
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mOverwrite:Z

    .line 85
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mRename:Z

    .line 86
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mCtime:Z

    .line 87
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mPtime:Z

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mLog:Ljava/lang/String;

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getGraphical()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-graphical"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 167
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getViewPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 168
    return-void

    .line 139
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getOverwrite()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 141
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-overwrite"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 152
    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getCurrentTime()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 154
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ctime"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 163
    :cond_1
    :goto_2
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getLogCommand(Lorg/apache/tools/ant/types/Commandline;)V

    goto :goto_0

    .line 143
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getRename()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 145
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-rename"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 148
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-noverwrite"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 156
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getPreserveTime()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-ptime"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private getLogCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getLog()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 299
    :goto_0
    return-void

    .line 296
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-log"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 297
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getLog()Ljava/lang/String;

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
    .line 98
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 99
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 100
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 103
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 104
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->setViewPath(Ljava/lang/String;)V

    .line 110
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 111
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "update"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 114
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x4

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 119
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 120
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getViewPathBasename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 123
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 124
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 125
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

    .line 126
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 128
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getCurrentTime()Z
    .locals 1

    .prologue
    .line 240
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mCtime:Z

    return v0
.end method

.method public getGraphical()Z
    .locals 1

    .prologue
    .line 185
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mGraphical:Z

    return v0
.end method

.method public getLog()Ljava/lang/String;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mLog:Ljava/lang/String;

    return-object v0
.end method

.method public getOverwrite()Z
    .locals 1

    .prologue
    .line 203
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mOverwrite:Z

    return v0
.end method

.method public getPreserveTime()Z
    .locals 1

    .prologue
    .line 259
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mPtime:Z

    return v0
.end method

.method public getRename()Z
    .locals 1

    .prologue
    .line 221
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mRename:Z

    return v0
.end method

.method public setCurrentTime(Z)V
    .locals 0
    .param p1, "ct"    # Z

    .prologue
    .line 231
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mCtime:Z

    .line 232
    return-void
.end method

.method public setGraphical(Z)V
    .locals 0
    .param p1, "graphical"    # Z

    .prologue
    .line 176
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mGraphical:Z

    .line 177
    return-void
.end method

.method public setLog(Ljava/lang/String;)V
    .locals 0
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 269
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mLog:Ljava/lang/String;

    .line 270
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .param p1, "ow"    # Z

    .prologue
    .line 194
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mOverwrite:Z

    .line 195
    return-void
.end method

.method public setPreserveTime(Z)V
    .locals 0
    .param p1, "pt"    # Z

    .prologue
    .line 250
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mPtime:Z

    .line 251
    return-void
.end method

.method public setRename(Z)V
    .locals 0
    .param p1, "ren"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUpdate;->mRename:Z

    .line 213
    return-void
.end method
