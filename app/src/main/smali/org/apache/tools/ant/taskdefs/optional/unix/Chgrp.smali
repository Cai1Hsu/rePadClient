.class public Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;
.super Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;
.source "Chgrp.java"


# instance fields
.field private haveGroup:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->haveGroup:Z

    .line 49
    const-string/jumbo v0, "chgrp"

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->setExecutable(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method protected checkConfiguration()V
    .locals 3

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->haveGroup:Z

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Required attribute group not set in chgrp"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 71
    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->checkConfiguration()V

    .line 72
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 80
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the executable"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 1
    .param p1, "group"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Chgrp;->haveGroup:Z

    .line 60
    return-void
.end method
