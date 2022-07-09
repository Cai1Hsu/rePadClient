.class public Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "Pack200CompressorOutputStream.java"


# instance fields
.field private finished:Z

.field private final originalOutput:Ljava/io/OutputStream;

.field private final properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/util/Map;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    .local p2, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->IN_MEMORY:Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;Ljava/util/Map;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "mode"    # Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    .local p3, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    .line 79
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    .line 80
    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200Strategy;->newStreamBridge()Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    .line 81
    iput-object p3, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    .line 82
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finish()V

    .line 110
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->stop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 114
    return-void

    .line 112
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public finish()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    iget-boolean v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    if-nez v4, :cond_1

    .line 118
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->finished:Z

    .line 119
    invoke-static {}, Ljava/util/jar/Pack200;->newPacker()Ljava/util/jar/Pack200$Packer;

    move-result-object v2

    .line 120
    .local v2, "p":Ljava/util/jar/Pack200$Packer;
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    if-eqz v4, :cond_0

    .line 121
    invoke-interface {v2}, Ljava/util/jar/Pack200$Packer;->properties()Ljava/util/SortedMap;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->properties:Ljava/util/Map;

    invoke-interface {v4, v5}, Ljava/util/SortedMap;->putAll(Ljava/util/Map;)V

    .line 123
    :cond_0
    const/4 v0, 0x0

    .line 124
    .local v0, "ji":Ljava/util/jar/JarInputStream;
    const/4 v3, 0x0

    .line 126
    .local v3, "success":Z
    :try_start_0
    new-instance v1, Ljava/util/jar/JarInputStream;

    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v4}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->getInput()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/jar/JarInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "ji":Ljava/util/jar/JarInputStream;
    .local v1, "ji":Ljava/util/jar/JarInputStream;
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->originalOutput:Ljava/io/OutputStream;

    invoke-interface {v2, v1, v4}, Ljava/util/jar/Pack200$Packer;->pack(Ljava/util/jar/JarInputStream;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 128
    const/4 v3, 0x1

    .line 130
    if-nez v3, :cond_1

    if-eqz v1, :cond_1

    .line 132
    :try_start_2
    invoke-virtual {v1}, Ljava/util/jar/JarInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 139
    .end local v1    # "ji":Ljava/util/jar/JarInputStream;
    .end local v2    # "p":Ljava/util/jar/Pack200$Packer;
    .end local v3    # "success":Z
    :cond_1
    :goto_0
    return-void

    .line 130
    .restart local v0    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v2    # "p":Ljava/util/jar/Pack200$Packer;
    .restart local v3    # "success":Z
    :catchall_0
    move-exception v4

    :goto_1
    if-nez v3, :cond_2

    if-eqz v0, :cond_2

    .line 132
    :try_start_3
    invoke-virtual {v0}, Ljava/util/jar/JarInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 135
    :cond_2
    :goto_2
    throw v4

    .line 133
    .end local v0    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v1    # "ji":Ljava/util/jar/JarInputStream;
    :catch_0
    move-exception v4

    goto :goto_0

    .end local v1    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v0    # "ji":Ljava/util/jar/JarInputStream;
    :catch_1
    move-exception v5

    goto :goto_2

    .line 130
    .end local v0    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v1    # "ji":Ljava/util/jar/JarInputStream;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "ji":Ljava/util/jar/JarInputStream;
    .restart local v0    # "ji":Ljava/util/jar/JarInputStream;
    goto :goto_1
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write(I)V

    .line 88
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write([B)V

    .line 96
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "b"    # [B
    .param p2, "from"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;->streamBridge:Lorg/apache/commons/compress/compressors/pack200/StreamBridge;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/pack200/StreamBridge;->write([BII)V

    .line 104
    return-void
.end method
