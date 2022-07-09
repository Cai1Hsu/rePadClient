.class public Lorg/apache/tools/ant/taskdefs/condition/Socket;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Socket.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private port:I

.field private server:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->server:Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->port:I

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->server:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 61
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No server specified in socket condition"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 64
    :cond_0
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->port:I

    if-nez v3, :cond_1

    .line 65
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No port specified in socket condition"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 67
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Checking for listener at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->server:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->port:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/condition/Socket;->log(Ljava/lang/String;I)V

    .line 69
    const/4 v1, 0x0

    .line 71
    .local v1, "s":Ljava/net/Socket;
    :try_start_0
    new-instance v2, Ljava/net/Socket;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->server:Ljava/lang/String;

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->port:I

    invoke-direct {v2, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .end local v1    # "s":Ljava/net/Socket;
    .local v2, "s":Ljava/net/Socket;
    if-eqz v2, :cond_2

    .line 77
    :try_start_1
    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 83
    :cond_2
    :goto_0
    const/4 v3, 0x1

    move-object v1, v2

    .end local v2    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    :cond_3
    :goto_1
    return v3

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    const/4 v3, 0x0

    .line 75
    if-eqz v1, :cond_3

    .line 77
    :try_start_2
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 78
    :catch_1
    move-exception v4

    goto :goto_1

    .line 75
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_4

    .line 77
    :try_start_3
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 75
    :cond_4
    :goto_2
    throw v3

    .line 78
    :catch_2
    move-exception v4

    goto :goto_2

    .end local v1    # "s":Ljava/net/Socket;
    .restart local v2    # "s":Ljava/net/Socket;
    :catch_3
    move-exception v3

    goto :goto_0
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 52
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->port:I

    .line 53
    return-void
.end method

.method public setServer(Ljava/lang/String;)V
    .locals 0
    .param p1, "server"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Socket;->server:Ljava/lang/String;

    .line 44
    return-void
.end method
