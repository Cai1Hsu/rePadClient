.class public Lcom/edutech/idauthentication/Async;
.super Landroid/os/AsyncTask;
.source "Async.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static listPb:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ProgressBar;",
            ">;"
        }
    .end annotation
.end field

.field public static peerdata:I


# instance fields
.field public downloadsize:J

.field private finished:Z

.field public isFinish:Z

.field private paused:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/idauthentication/Async;->listPb:Ljava/util/List;

    .line 30
    const/16 v0, 0x2800

    sput v0, Lcom/edutech/idauthentication/Async;->peerdata:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 25
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 28
    iput-boolean v2, p0, Lcom/edutech/idauthentication/Async;->paused:Z

    .line 31
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/edutech/idauthentication/Async;->downloadsize:J

    .line 32
    iput-boolean v2, p0, Lcom/edutech/idauthentication/Async;->isFinish:Z

    .line 25
    return-void
.end method


# virtual methods
.method public continued()V
    .locals 1

    .prologue
    .line 305
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/idauthentication/Async;->paused:Z

    .line 307
    return-void
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/idauthentication/Async;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .param p1, "Params"    # [Ljava/lang/String;

    .prologue
    .line 44
    const/16 v27, 0x0

    aget-object v8, p1, v27

    .line 46
    .local v8, "filename":Ljava/lang/String;
    const/16 v27, 0x1

    aget-object v26, p1, v27

    .line 48
    .local v26, "webpath":Ljava/lang/String;
    const/4 v11, 0x0

    .line 49
    .local v11, "isSuppertRange":Z
    const/16 v23, 0x0

    .line 50
    .local v23, "url":Ljava/net/URL;
    const/4 v9, 0x0

    .line 51
    .local v9, "httpURLConnection":Ljava/net/HttpURLConnection;
    const/16 v19, 0x0

    .line 52
    .local v19, "tempURLCon":Ljava/net/HttpURLConnection;
    const/4 v10, 0x0

    .line 53
    .local v10, "inputStream":Ljava/io/InputStream;
    const/4 v15, 0x0

    .line 55
    .local v15, "outputStream":Ljava/io/RandomAccessFile;
    const-wide/16 v12, 0x0

    .line 59
    .local v12, "length":J
    move-object/from16 v25, v26

    .line 60
    .local v25, "urlpath":Ljava/lang/String;
    :try_start_0
    new-instance v24, Ljava/net/URL;

    invoke-direct/range {v24 .. v25}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_b
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .end local v23    # "url":Ljava/net/URL;
    .local v24, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual/range {v24 .. v24}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v27

    move-object/from16 v0, v27

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object/from16 v19, v0

    .line 64
    const-string/jumbo v27, "Range"

    const-string/jumbo v28, "bytes=0-1024"

    move-object/from16 v0, v19

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->connect()V

    .line 66
    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v22

    .line 67
    .local v22, "templength":I
    const/16 v27, 0x401

    move/from16 v0, v22

    move/from16 v1, v27

    if-ne v0, v1, :cond_5

    .line 70
    const/4 v11, 0x1

    .line 75
    :goto_0
    if-eqz v19, :cond_0

    .line 77
    invoke-virtual/range {v19 .. v19}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 80
    :cond_0
    invoke-virtual/range {v24 .. v24}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v27

    move-object/from16 v0, v27

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v9, v0

    .line 81
    const/16 v27, 0x1388

    move/from16 v0, v27

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 82
    const-string/jumbo v27, "GET"

    move-object/from16 v0, v27

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 83
    const-string/jumbo v27, "Accept"

    const-string/jumbo v28, "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string/jumbo v27, "Accept-Language"

    const-string/jumbo v28, "zh-CN"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string/jumbo v27, "Referer"

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string/jumbo v27, "Charset"

    const-string/jumbo v28, "UTF-8"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string/jumbo v27, "User-Agent"

    const-string/jumbo v28, "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const-string/jumbo v27, "Connection"

    const-string/jumbo v28, "Keep-Alive"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    new-instance v27, Ljava/lang/StringBuilder;

    sget-object v28, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v28 .. v28}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 106
    .local v18, "savepath":Ljava/lang/String;
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, v18

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 111
    .local v14, "outFile":Ljava/io/File;
    const-wide/16 v20, 0x0

    .line 114
    .local v20, "startPosition":J
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_7

    .line 115
    if-eqz v11, :cond_6

    .line 117
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v20

    .line 136
    :goto_1
    const-string/jumbo v27, "Range"

    new-instance v28, Ljava/lang/StringBuilder;

    const-string/jumbo v29, "bytes="

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string/jumbo v29, "-"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    :goto_2
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->connect()V

    .line 153
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v27

    move/from16 v0, v27

    int-to-long v12, v0

    .line 154
    const-wide/16 v28, -0x1

    cmp-long v27, v12, v28

    if-nez v27, :cond_1

    .line 156
    const-wide/16 v28, -0x1

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/edutech/idauthentication/Async;->downloadsize:J

    .line 175
    :cond_1
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    .line 185
    new-instance v16, Ljava/io/RandomAccessFile;

    const-string/jumbo v27, "rw"

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-direct {v0, v14, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_c
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_9
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 188
    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .local v16, "outputStream":Ljava/io/RandomAccessFile;
    :try_start_2
    move-object/from16 v0, v16

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 190
    sget v27, Lcom/edutech/idauthentication/Async;->peerdata:I

    move/from16 v0, v27

    new-array v4, v0, [B

    .line 191
    .local v4, "buf":[B
    const/16 v17, 0x0

    .line 192
    .local v17, "read":I
    move-wide/from16 v6, v20

    .line 202
    .local v6, "curSize":J
    add-long v12, v12, v20

    .line 212
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/edutech/idauthentication/Async;->finished:Z

    move/from16 v27, v0

    if-nez v27, :cond_a

    .line 246
    :cond_2
    :goto_4
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 247
    invoke-virtual/range {v16 .. v16}, Ljava/io/RandomAccessFile;->close()V

    .line 248
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_a
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 268
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 269
    if-eqz v10, :cond_10

    .line 273
    :try_start_3
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 274
    if-eqz v16, :cond_3

    .line 276
    invoke-virtual/range {v16 .. v16}, Ljava/io/RandomAccessFile;->close()V

    .line 278
    :cond_3
    if-eqz v9, :cond_10

    .line 280
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_8

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .line 290
    .end local v4    # "buf":[B
    .end local v6    # "curSize":J
    .end local v14    # "outFile":Ljava/io/File;
    .end local v17    # "read":I
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    :cond_4
    :goto_5
    return-object v26

    .line 73
    .end local v23    # "url":Ljava/net/URL;
    .restart local v22    # "templength":I
    .restart local v24    # "url":Ljava/net/URL;
    :cond_5
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 121
    .restart local v14    # "outFile":Ljava/io/File;
    .restart local v18    # "savepath":Ljava/lang/String;
    .restart local v20    # "startPosition":J
    :cond_6
    const-wide/16 v20, 0x0

    goto/16 :goto_1

    .line 144
    :cond_7
    :try_start_4
    invoke-static {v14}, Lcom/edutech/idauthentication/FileInOutHelper;->createNewFile(Ljava/io/File;)Z
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_9
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    .line 251
    .end local v14    # "outFile":Ljava/io/File;
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    :catch_0
    move-exception v5

    move-object/from16 v23, v24

    .line 253
    .end local v24    # "url":Ljava/net/URL;
    .local v5, "e":Ljava/net/MalformedURLException;
    .restart local v23    # "url":Ljava/net/URL;
    :goto_6
    :try_start_5
    invoke-virtual {v5}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 268
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 269
    if-eqz v10, :cond_4

    .line 273
    :try_start_6
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 274
    if-eqz v15, :cond_8

    .line 276
    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->close()V

    .line 278
    :cond_8
    if-eqz v9, :cond_4

    .line 280
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_5

    .line 283
    :catch_1
    move-exception v5

    .line 285
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 216
    .end local v5    # "e":Ljava/io/IOException;
    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v4    # "buf":[B
    .restart local v6    # "curSize":J
    .restart local v14    # "outFile":Ljava/io/File;
    .restart local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v17    # "read":I
    .restart local v18    # "savepath":Ljava/lang/String;
    .restart local v20    # "startPosition":J
    .restart local v22    # "templength":I
    .restart local v24    # "url":Ljava/net/URL;
    :cond_9
    const-wide/16 v28, 0x1f4

    :try_start_7
    invoke-static/range {v28 .. v29}, Ljava/lang/Thread;->sleep(J)V

    .line 214
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/edutech/idauthentication/Async;->paused:Z

    move/from16 v27, v0

    if-nez v27, :cond_9

    .line 218
    invoke-virtual {v10, v4}, Ljava/io/InputStream;->read([B)I

    move-result v17

    .line 220
    const/16 v27, -0x1

    move/from16 v0, v17

    move/from16 v1, v27

    if-eq v0, v1, :cond_2

    .line 224
    const/16 v27, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v27

    move/from16 v2, v17

    invoke-virtual {v0, v4, v1, v2}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 225
    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v28, v0

    add-long v6, v6, v28

    .line 236
    cmp-long v27, v6, v12

    if-nez v27, :cond_b

    .line 238
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->isFinish:Z

    goto/16 :goto_4

    .line 251
    .end local v4    # "buf":[B
    .end local v6    # "curSize":J
    .end local v17    # "read":I
    :catch_2
    move-exception v5

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto :goto_6

    .line 244
    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v4    # "buf":[B
    .restart local v6    # "curSize":J
    .restart local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v17    # "read":I
    .restart local v24    # "url":Ljava/net/URL;
    :cond_b
    const-wide/16 v28, 0xa

    invoke-static/range {v28 .. v29}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_a
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto/16 :goto_3

    .line 256
    .end local v4    # "buf":[B
    .end local v6    # "curSize":J
    .end local v17    # "read":I
    :catch_3
    move-exception v5

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .line 258
    .end local v14    # "outFile":Ljava/io/File;
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    .end local v24    # "url":Ljava/net/URL;
    .restart local v5    # "e":Ljava/io/IOException;
    .restart local v23    # "url":Ljava/net/URL;
    :goto_7
    :try_start_8
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 268
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 269
    if-eqz v10, :cond_4

    .line 273
    :try_start_9
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 274
    if-eqz v15, :cond_c

    .line 276
    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->close()V

    .line 278
    :cond_c
    if-eqz v9, :cond_4

    .line 280
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    goto/16 :goto_5

    .line 283
    :catch_4
    move-exception v5

    .line 285
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_5

    .line 261
    .end local v5    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v5

    .line 263
    .local v5, "e":Ljava/lang/InterruptedException;
    :goto_8
    :try_start_a
    invoke-virtual {v5}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 268
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 269
    if-eqz v10, :cond_4

    .line 273
    :try_start_b
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 274
    if-eqz v15, :cond_d

    .line 276
    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->close()V

    .line 278
    :cond_d
    if-eqz v9, :cond_4

    .line 280
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    goto/16 :goto_5

    .line 283
    :catch_6
    move-exception v5

    .line 285
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_5

    .line 267
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v27

    .line 268
    :goto_9
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 269
    if-eqz v10, :cond_f

    .line 273
    :try_start_c
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 274
    if-eqz v15, :cond_e

    .line 276
    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->close()V

    .line 278
    :cond_e
    if-eqz v9, :cond_f

    .line 280
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_7

    .line 288
    :cond_f
    :goto_a
    throw v27

    .line 283
    :catch_7
    move-exception v5

    .line 285
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a

    .line 283
    .end local v5    # "e":Ljava/io/IOException;
    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v4    # "buf":[B
    .restart local v6    # "curSize":J
    .restart local v14    # "outFile":Ljava/io/File;
    .restart local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v17    # "read":I
    .restart local v18    # "savepath":Ljava/lang/String;
    .restart local v20    # "startPosition":J
    .restart local v22    # "templength":I
    .restart local v24    # "url":Ljava/net/URL;
    :catch_8
    move-exception v5

    .line 285
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    .end local v5    # "e":Ljava/io/IOException;
    :cond_10
    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto/16 :goto_5

    .line 267
    .end local v4    # "buf":[B
    .end local v6    # "curSize":J
    .end local v14    # "outFile":Ljava/io/File;
    .end local v17    # "read":I
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    .end local v23    # "url":Ljava/net/URL;
    .restart local v24    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v27

    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto :goto_9

    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v14    # "outFile":Ljava/io/File;
    .restart local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v18    # "savepath":Ljava/lang/String;
    .restart local v20    # "startPosition":J
    .restart local v22    # "templength":I
    .restart local v24    # "url":Ljava/net/URL;
    :catchall_2
    move-exception v27

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto :goto_9

    .line 261
    .end local v14    # "outFile":Ljava/io/File;
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    .end local v23    # "url":Ljava/net/URL;
    .restart local v24    # "url":Ljava/net/URL;
    :catch_9
    move-exception v5

    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto :goto_8

    .end local v15    # "outputStream":Ljava/io/RandomAccessFile;
    .end local v23    # "url":Ljava/net/URL;
    .restart local v14    # "outFile":Ljava/io/File;
    .restart local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v18    # "savepath":Ljava/lang/String;
    .restart local v20    # "startPosition":J
    .restart local v22    # "templength":I
    .restart local v24    # "url":Ljava/net/URL;
    :catch_a
    move-exception v5

    move-object/from16 v15, v16

    .end local v16    # "outputStream":Ljava/io/RandomAccessFile;
    .restart local v15    # "outputStream":Ljava/io/RandomAccessFile;
    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto :goto_8

    .line 256
    .end local v14    # "outFile":Ljava/io/File;
    .end local v18    # "savepath":Ljava/lang/String;
    .end local v20    # "startPosition":J
    .end local v22    # "templength":I
    :catch_b
    move-exception v5

    goto/16 :goto_7

    .end local v23    # "url":Ljava/net/URL;
    .restart local v24    # "url":Ljava/net/URL;
    :catch_c
    move-exception v5

    move-object/from16 v23, v24

    .end local v24    # "url":Ljava/net/URL;
    .restart local v23    # "url":Ljava/net/URL;
    goto/16 :goto_7

    .line 251
    :catch_d
    move-exception v5

    goto/16 :goto_6
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/edutech/idauthentication/Async;->paused:Z

    return v0
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 315
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 316
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 317
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/idauthentication/Async;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 8
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 324
    const-string/jumbo v5, ""

    .line 326
    .local v5, "webpath":Ljava/lang/String;
    move-object v5, p1

    .line 328
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-lt v1, v6, :cond_0

    .line 419
    :goto_1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 420
    return-void

    .line 329
    :cond_0
    :try_start_1
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_7

    .line 330
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/edutech/idauthentication/Async;->finished:Z

    .line 332
    iget-boolean v6, p0, Lcom/edutech/idauthentication/Async;->isFinish:Z

    if-eqz v6, :cond_4

    .line 333
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_3

    .line 379
    :cond_2
    :goto_2
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 416
    :catch_0
    move-exception v0

    .line 417
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1

    .line 333
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_3
    :try_start_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 335
    .local v4, "tmpdownload":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v6, "appwebpath"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 337
    const-string/jumbo v6, "appwebpath"

    .line 336
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 337
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 338
    if-eqz v6, :cond_1

    .line 339
    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    const-string/jumbo v6, "appname"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 340
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 339
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 342
    .local v2, "localpath":Ljava/lang/String;
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 345
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    .line 346
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 351
    .end local v2    # "localpath":Ljava/lang/String;
    .end local v4    # "tmpdownload":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 353
    .restart local v4    # "tmpdownload":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v6, "appwebpath"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 355
    const-string/jumbo v6, "appwebpath"

    .line 354
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 355
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 356
    if-eqz v6, :cond_5

    .line 358
    const-string/jumbo v6, "redownload_count"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 357
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 359
    .local v3, "reDownCount":I
    const/4 v6, 0x3

    if-ge v3, v6, :cond_6

    .line 360
    add-int/lit8 v3, v3, 0x1

    .line 362
    const-string/jumbo v6, "redownload_count"

    .line 363
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 361
    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 365
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 367
    const-string/jumbo v6, "appname"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 366
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 365
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 368
    .restart local v2    # "localpath":Ljava/lang/String;
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    sget-object v6, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    .line 372
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2

    .line 328
    .end local v2    # "localpath":Ljava/lang/String;
    .end local v3    # "reDownCount":I
    .end local v4    # "tmpdownload":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 425
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 427
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .param p1, "values"    # [Ljava/lang/Integer;

    .prologue
    .line 434
    sget-object v0, Lcom/edutech/idauthentication/Async;->listPb:Ljava/util/List;

    const/4 v1, 0x1

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 435
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 436
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/edutech/idauthentication/Async;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 297
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/idauthentication/Async;->paused:Z

    .line 299
    return-void
.end method
