.class public Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;
.super Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;
.source "CCUnlock.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "-comment"

.field public static final FLAG_PNAME:Ljava/lang/String; = "-pname"


# instance fields
.field private mComment:Ljava/lang/String;

.field private mPname:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 70
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/ClearCase;-><init>()V

    .line 71
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mComment:Ljava/lang/String;

    .line 72
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mPname:Ljava/lang/String;

    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 121
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getObjSelect()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Should select either an element (pname) or an object (objselect)"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPnameCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getObjSelect()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 128
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getObjSelect()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 130
    :cond_1
    return-void
.end method

.method private getCommentCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 204
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getComment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 215
    :goto_0
    return-void

    .line 212
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-comment"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 213
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getOpType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPname()Ljava/lang/String;

    move-result-object v0

    .line 247
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getObjSelect()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getPnameCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 224
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPname()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 235
    :goto_0
    return-void

    .line 232
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-pname"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 233
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getPname()Ljava/lang/String;

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
    .line 82
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 83
    .local v1, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 84
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    const/4 v3, 0x0

    .line 87
    .local v3, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getViewPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 88
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->setViewPath(Ljava/lang/String;)V

    .line 94
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getClearToolCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "unlock"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 98
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 103
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getFailOnErr()Z

    move-result v4

    if-nez v4, :cond_1

    .line 104
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring any errors that occur for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getOpType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 107
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v3

    .line 108
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getFailOnErr()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 109
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

    .line 110
    .local v2, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 112
    .end local v2    # "msg":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mComment:Ljava/lang/String;

    return-object v0
.end method

.method public getObjselect()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->getObjSelect()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mPname:Ljava/lang/String;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mComment:Ljava/lang/String;

    .line 140
    return-void
.end method

.method public setObjSel(Ljava/lang/String;)V
    .locals 0
    .param p1, "objsel"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->setObjSelect(Ljava/lang/String;)V

    .line 186
    return-void
.end method

.method public setObjselect(Ljava/lang/String;)V
    .locals 0
    .param p1, "objselect"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->setObjSelect(Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public setPname(Ljava/lang/String;)V
    .locals 0
    .param p1, "pname"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock;->mPname:Ljava/lang/String;

    .line 158
    return-void
.end method
