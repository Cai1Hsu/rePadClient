.class Lorg/apache/tools/ant/taskdefs/Get$GetThread;
.super Ljava/lang/Thread;
.source "Get.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Get;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetThread"
.end annotation


# instance fields
.field private connection:Ljava/net/URLConnection;

.field private final dest:Ljava/io/File;

.field private exception:Lorg/apache/tools/ant/BuildException;

.field private final hasTimestamp:Z

.field private ioexception:Ljava/io/IOException;

.field private is:Ljava/io/InputStream;

.field private final logLevel:I

.field private os:Ljava/io/OutputStream;

.field private final progress:Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;

.field private redirections:I

.field private final source:Ljava/net/URL;

.field private success:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Get;

.field private final timestamp:J


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Get;Ljava/net/URL;Ljava/io/File;ZJLorg/apache/tools/ant/taskdefs/Get$DownloadProgress;I)V
    .locals 3
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Get;
    .param p2, "source"    # Ljava/net/URL;
    .param p3, "dest"    # Ljava/io/File;
    .param p4, "h"    # Z
    .param p5, "t"    # J
    .param p7, "p"    # Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;
    .param p8, "l"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 558
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 549
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->success:Z

    .line 550
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->ioexception:Ljava/io/IOException;

    .line 551
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->exception:Lorg/apache/tools/ant/BuildException;

    .line 552
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    .line 553
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    .line 555
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->redirections:I

    .line 559
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->source:Ljava/net/URL;

    .line 560
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    .line 561
    iput-boolean p4, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->hasTimestamp:Z

    .line 562
    iput-wide p5, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->timestamp:J

    .line 563
    iput-object p7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->progress:Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;

    .line 564
    iput p8, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    .line 565
    return-void
.end method

.method private downloadFile()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 719
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Get;->access$500(Lorg/apache/tools/ant/taskdefs/Get;)I

    move-result v7

    if-ge v3, v7, :cond_0

    .line 724
    :try_start_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->connection:Ljava/net/URLConnection;

    invoke-virtual {v7}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 730
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    if-nez v7, :cond_2

    .line 731
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Can\'t get "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->source:Ljava/net/URL;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v5, v7, v8}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 732
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Get;->access$100(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 762
    :goto_1
    return v6

    .line 726
    :catch_0
    move-exception v1

    .line 727
    .local v1, "ex":Ljava/io/IOException;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Error opening connection "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    iget v9, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v7, v8, v9}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 719
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 735
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_1
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Can\'t get "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->source:Ljava/net/URL;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Get;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 739
    :cond_2
    new-instance v7, Ljava/io/FileOutputStream;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    .line 740
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->progress:Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;

    invoke-interface {v7}, Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;->beginDownload()V

    .line 741
    const/4 v2, 0x0

    .line 743
    .local v2, "finished":Z
    const v7, 0x19000

    :try_start_1
    new-array v0, v7, [B

    .line 745
    .local v0, "buffer":[B
    :goto_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_4

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "length":I
    if-ltz v4, :cond_4

    .line 746
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    const/4 v8, 0x0

    invoke-virtual {v7, v0, v8, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 747
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->progress:Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;

    invoke-interface {v7}, Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;->onTick()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 751
    .end local v0    # "buffer":[B
    .end local v4    # "length":I
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 752
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 757
    if-nez v2, :cond_3

    .line 758
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 751
    :cond_3
    throw v5

    .line 749
    .restart local v0    # "buffer":[B
    :cond_4
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->isInterrupted()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v7

    if-nez v7, :cond_6

    move v2, v5

    .line 751
    :goto_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 752
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 757
    if-nez v2, :cond_5

    .line 758
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 761
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->progress:Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;

    invoke-interface {v6}, Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;->endDownload()V

    move v6, v5

    .line 762
    goto/16 :goto_1

    :cond_6
    move v2, v6

    .line 749
    goto :goto_3
.end method

.method private get()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 579
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->source:Ljava/net/URL;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->connection:Ljava/net/URLConnection;

    .line 581
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->connection:Ljava/net/URLConnection;

    if-nez v1, :cond_1

    .line 583
    const/4 v0, 0x0

    .line 595
    :cond_0
    :goto_0
    return v0

    .line 586
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->downloadFile()Z

    move-result v0

    .line 591
    .local v0, "downloadSucceeded":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Get;->access$000(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 592
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->updateTimeStamp()V

    goto :goto_0
.end method

.method private openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 17
    .param p1, "aSource"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 633
    invoke-virtual/range {p1 .. p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 636
    .local v2, "connection":Ljava/net/URLConnection;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->hasTimestamp:Z

    if-eqz v14, :cond_0

    .line 637
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->timestamp:J

    invoke-virtual {v2, v14, v15}, Ljava/net/URLConnection;->setIfModifiedSince(J)V

    .line 640
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v14}, Lorg/apache/tools/ant/taskdefs/Get;->access$200(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v14}, Lorg/apache/tools/ant/taskdefs/Get;->access$300(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_2

    .line 641
    :cond_1
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v15}, Lorg/apache/tools/ant/taskdefs/Get;->access$200(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ":"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v15}, Lorg/apache/tools/ant/taskdefs/Get;->access$300(Lorg/apache/tools/ant/taskdefs/Get;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    .line 646
    .local v13, "up":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;

    invoke-direct {v4}, Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;-><init>()V

    .line 647
    .local v4, "encoder":Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;
    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-virtual {v4, v14}, Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;->encode([B)Ljava/lang/String;

    move-result-object v5

    .line 648
    .local v5, "encoding":Ljava/lang/String;
    const-string/jumbo v14, "Authorization"

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Basic "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v14, v15}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    .end local v4    # "encoder":Lorg/apache/tools/ant/taskdefs/Get$Base64Converter;
    .end local v5    # "encoding":Ljava/lang/String;
    .end local v13    # "up":Ljava/lang/String;
    :cond_2
    instance-of v14, v2, Ljava/net/HttpURLConnection;

    if-eqz v14, :cond_3

    move-object v14, v2

    .line 653
    check-cast v14, Ljava/net/HttpURLConnection;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    move-object v14, v2

    .line 655
    check-cast v14, Ljava/net/HttpURLConnection;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v15}, Lorg/apache/tools/ant/taskdefs/Get;->access$400(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v15

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 660
    :cond_3
    :try_start_0
    invoke-virtual {v2}, Ljava/net/URLConnection;->connect()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    instance-of v14, v2, Ljava/net/HttpURLConnection;

    if-eqz v14, :cond_5

    move-object v6, v2

    .line 668
    check-cast v6, Ljava/net/HttpURLConnection;

    .line 669
    .local v6, "httpConnection":Ljava/net/HttpURLConnection;
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    .line 670
    .local v12, "responseCode":I
    const/16 v14, 0x12d

    if-eq v12, v14, :cond_4

    const/16 v14, 0x12e

    if-eq v12, v14, :cond_4

    const/16 v14, 0x12f

    if-ne v12, v14, :cond_8

    .line 674
    :cond_4
    const-string/jumbo v14, "Location"

    invoke-virtual {v6, v14}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 675
    .local v10, "newLocation":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    const/16 v14, 0x12d

    if-ne v12, v14, :cond_6

    const-string/jumbo v14, " permanently"

    :goto_0
    invoke-virtual {v15, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, " moved to "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 678
    .local v7, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v14, v7, v15}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 679
    new-instance v11, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v11, v0, v10}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 680
    .local v11, "newURL":Ljava/net/URL;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v11}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->redirectionAllowed(Ljava/net/URL;Ljava/net/URL;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 682
    const/4 v2, 0x0

    .line 714
    .end local v2    # "connection":Ljava/net/URLConnection;
    .end local v6    # "httpConnection":Ljava/net/HttpURLConnection;
    .end local v7    # "message":Ljava/lang/String;
    .end local v10    # "newLocation":Ljava/lang/String;
    .end local v11    # "newURL":Ljava/net/URL;
    .end local v12    # "responseCode":I
    :cond_5
    :goto_1
    return-object v2

    .line 661
    .restart local v2    # "connection":Ljava/net/URLConnection;
    :catch_0
    move-exception v3

    .line 663
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Failed to parse "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->source:Ljava/net/URL;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 675
    .end local v3    # "e":Ljava/lang/NullPointerException;
    .restart local v6    # "httpConnection":Ljava/net/HttpURLConnection;
    .restart local v10    # "newLocation":Ljava/lang/String;
    .restart local v12    # "responseCode":I
    :cond_6
    const-string/jumbo v14, ""

    goto :goto_0

    .line 684
    .restart local v7    # "message":Ljava/lang/String;
    .restart local v11    # "newURL":Ljava/net/URL;
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v2

    goto :goto_1

    .line 687
    .end local v7    # "message":Ljava/lang/String;
    .end local v10    # "newLocation":Ljava/lang/String;
    .end local v11    # "newURL":Ljava/net/URL;
    :cond_8
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getLastModified()J

    move-result-wide v8

    .line 688
    .local v8, "lastModified":J
    const/16 v14, 0x130

    if-eq v12, v14, :cond_9

    const-wide/16 v14, 0x0

    cmp-long v14, v8, v14

    if-eqz v14, :cond_a

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->hasTimestamp:Z

    if-eqz v14, :cond_a

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->timestamp:J

    cmp-long v14, v14, v8

    if-ltz v14, :cond_a

    .line 694
    :cond_9
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    const-string/jumbo v15, "Not modified - so not downloaded"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 695
    const/4 v2, 0x0

    goto :goto_1

    .line 698
    :cond_a
    const/16 v14, 0x191

    if-ne v12, v14, :cond_5

    .line 699
    const-string/jumbo v7, "HTTP Authorization failure"

    .line 700
    .restart local v7    # "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v14}, Lorg/apache/tools/ant/taskdefs/Get;->access$100(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 701
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v14, v7, v15}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 702
    const/4 v2, 0x0

    goto :goto_1

    .line 704
    :cond_b
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v14, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14
.end method

.method private redirectionAllowed(Ljava/net/URL;Ljava/net/URL;)Z
    .locals 4
    .param p1, "aSource"    # Ljava/net/URL;
    .param p2, "aDest"    # Ljava/net/URL;

    .prologue
    const/4 v1, 0x0

    .line 600
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v2, "http"

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "https"

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 603
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Redirection detected from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ". Protocol switch unsafe, not allowed."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 606
    .local v0, "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Get;->access$100(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 607
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    iget v3, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v2, v0, v3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 627
    .end local v0    # "message":Ljava/lang/String;
    :goto_0
    return v1

    .line 610
    .restart local v0    # "message":Ljava/lang/String;
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 614
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->redirections:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->redirections:I

    .line 615
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->redirections:I

    const/16 v3, 0x19

    if-le v2, v3, :cond_4

    .line 616
    const-string/jumbo v0, "More than 25 times redirected, giving up"

    .line 618
    .restart local v0    # "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Get;->access$100(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 619
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    iget v3, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v2, v0, v3}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 622
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 627
    .end local v0    # "message":Ljava/lang/String;
    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private updateTimeStamp()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 766
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->connection:Ljava/net/URLConnection;

    invoke-virtual {v3}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v0

    .line 767
    .local v0, "remoteTimestamp":J
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Get;->access$600(Lorg/apache/tools/ant/taskdefs/Get;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 768
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 769
    .local v2, "t":Ljava/util/Date;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->this$0:Lorg/apache/tools/ant/taskdefs/Get;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "last modified = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v2}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    cmp-long v3, v0, v6

    if-nez v3, :cond_2

    const-string/jumbo v3, " - using current time instead"

    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->logLevel:I

    invoke-virtual {v4, v3, v5}, Lorg/apache/tools/ant/taskdefs/Get;->log(Ljava/lang/String;I)V

    .line 774
    .end local v2    # "t":Ljava/util/Date;
    :cond_0
    cmp-long v3, v0, v6

    if-eqz v3, :cond_1

    .line 775
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Get;->access$700()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v3, v4, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V

    .line 777
    :cond_1
    return-void

    .line 769
    .restart local v2    # "t":Ljava/util/Date;
    :cond_2
    const-string/jumbo v3, ""

    goto :goto_0
.end method


# virtual methods
.method closeStreams()V
    .locals 1

    .prologue
    .line 799
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->interrupt()V

    .line 800
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->os:Ljava/io/OutputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 801
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->is:Ljava/io/InputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 802
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->success:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 803
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->dest:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 805
    :cond_0
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 569
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->get()Z

    move-result v2

    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->success:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1

    .line 575
    :goto_0
    return-void

    .line 570
    :catch_0
    move-exception v1

    .line 571
    .local v1, "ioex":Ljava/io/IOException;
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->ioexception:Ljava/io/IOException;

    goto :goto_0

    .line 572
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 573
    .local v0, "bex":Lorg/apache/tools/ant/BuildException;
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->exception:Lorg/apache/tools/ant/BuildException;

    goto :goto_0
.end method

.method wasSuccessful()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 785
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->ioexception:Ljava/io/IOException;

    if-eqz v0, :cond_0

    .line 786
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->ioexception:Ljava/io/IOException;

    throw v0

    .line 788
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->exception:Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_1

    .line 789
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->exception:Lorg/apache/tools/ant/BuildException;

    throw v0

    .line 791
    :cond_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Get$GetThread;->success:Z

    return v0
.end method
