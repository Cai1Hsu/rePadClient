.class Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;
.super Ljava/lang/Thread;
.source "IPlanetEjbc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RedirectOutput"
.end annotation


# instance fields
.field private stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 1465
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1466
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;->stream:Ljava/io/InputStream;

    .line 1467
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1474
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;->stream:Ljava/io/InputStream;

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1478
    .local v1, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "text":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1479
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1481
    .end local v2    # "text":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1482
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1485
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1490
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-void

    .line 1485
    .restart local v2    # "text":Ljava/lang/String;
    :cond_0
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 1486
    :catch_1
    move-exception v3

    goto :goto_1

    .line 1484
    .end local v2    # "text":Ljava/lang/String;
    :catchall_0
    move-exception v3

    .line 1485
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 1488
    :goto_2
    throw v3

    .line 1486
    .restart local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v3

    goto :goto_1

    .end local v0    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    goto :goto_2
.end method
