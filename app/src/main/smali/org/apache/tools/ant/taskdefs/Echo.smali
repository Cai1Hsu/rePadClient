.class public Lorg/apache/tools/ant/taskdefs/Echo;
.super Lorg/apache/tools/ant/Task;
.source "Echo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Echo$EchoLevel;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field protected append:Z

.field private encoding:Ljava/lang/String;

.field protected file:Ljava/io/File;

.field private force:Z

.field protected logLevel:I

.field protected message:Ljava/lang/String;

.field private output:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 45
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->file:Ljava/io/File;

    .line 47
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->append:Z

    .line 49
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->encoding:Ljava/lang/String;

    .line 50
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->force:Z

    .line 53
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->logLevel:I

    .line 168
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 106
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Echo;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 64
    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v12, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    .line 66
    .local v12, "msg":Ljava/lang/String;
    :goto_0
    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-direct {v0, v12}, Lorg/apache/tools/ant/types/resources/StringResource;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->output:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_1

    new-instance v1, Lorg/apache/tools/ant/types/resources/LogOutputResource;

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Echo;->logLevel:I

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/types/resources/LogOutputResource;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    :goto_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Echo;->append:Z

    const/4 v7, 0x0

    const-string/jumbo v9, ""

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Echo;->encoding:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    :goto_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Echo;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Echo;->force:Z

    invoke-static/range {v0 .. v10}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    return-void

    .line 64
    .end local v12    # "msg":Ljava/lang/String;
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    goto :goto_0

    .line 66
    .restart local v12    # "msg":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->output:Lorg/apache/tools/ant/types/Resource;

    goto :goto_1

    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Echo;->encoding:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 73
    :catch_0
    move-exception v11

    .line 74
    .local v11, "ioe":Ljava/io/IOException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Echo;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-direct {v0, v11, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setAppend(Z)V
    .locals 0
    .param p1, "append"    # Z

    .prologue
    .line 116
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->append:Z

    .line 117
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->encoding:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 93
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Echo;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Echo;->setOutput(Lorg/apache/tools/ant/types/Resource;)V

    .line 94
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "f"    # Z

    .prologue
    .line 162
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->force:Z

    .line 163
    return-void
.end method

.method public setLevel(Lorg/apache/tools/ant/taskdefs/Echo$EchoLevel;)V
    .locals 1
    .param p1, "echoLevel"    # Lorg/apache/tools/ant/taskdefs/Echo$EchoLevel;

    .prologue
    .line 141
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Echo$EchoLevel;->getLevel()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Echo;->logLevel:I

    .line 142
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 84
    if-nez p1, :cond_0

    const-string/jumbo p1, ""

    .end local p1    # "msg":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->message:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setOutput(Lorg/apache/tools/ant/types/Resource;)V
    .locals 3
    .param p1, "output"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 102
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->output:Lorg/apache/tools/ant/types/Resource;

    if-eqz v1, :cond_0

    .line 103
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Cannot set > 1 output target"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->output:Lorg/apache/tools/ant/types/Resource;

    .line 106
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Echo;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Echo;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Echo;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 107
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    :goto_1
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Echo;->file:Ljava/io/File;

    .line 108
    return-void

    .line 106
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Echo;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 107
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method
