.class public abstract Lorg/apache/tools/ant/types/resources/ContentTransformingResource;
.super Lorg/apache/tools/ant/types/resources/ResourceDecorator;
.source "ContentTransformingResource.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field static class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;-><init>()V

    .line 43
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 51
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 117
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
.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    .line 117
    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.Appendable"

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 118
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->isAppendSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.Appendable"

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Appendable;

    .line 121
    .local v0, "a":Lorg/apache/tools/ant/types/resources/Appendable;
    if-eqz v0, :cond_0

    .line 122
    new-instance v2, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;

    invoke-direct {v2, p0, v0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;-><init>(Lorg/apache/tools/ant/types/resources/ContentTransformingResource;Lorg/apache/tools/ant/types/resources/Appendable;)V

    .line 137
    .end local v0    # "a":Lorg/apache/tools/ant/types/resources/Appendable;
    :cond_0
    :goto_2
    return-object v2

    .line 117
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    goto :goto_0

    .line 119
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    goto :goto_1

    .line 137
    :cond_3
    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_4

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_3
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_5

    move-object v1, v2

    :goto_4
    move-object v2, v1

    goto :goto_2

    :cond_4
    sget-object v1, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_3

    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_4
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 91
    .local v0, "in":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->wrapStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    .line 94
    :cond_0
    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 107
    .local v0, "out":Ljava/io/OutputStream;
    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->wrapStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    .line 110
    :cond_0
    return-object v0
.end method

.method public getSize()J
    .locals 8

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->isExists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 60
    const/4 v2, 0x0

    .line 62
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 63
    const/16 v5, 0x2000

    new-array v0, v5, [B

    .line 64
    .local v0, "buf":[B
    const/4 v4, 0x0

    .line 66
    .local v4, "size":I
    :goto_0
    const/4 v5, 0x0

    array-length v6, v0

    invoke-virtual {v2, v0, v5, v6}, Ljava/io/InputStream;->read([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .local v3, "readNow":I
    if-lez v3, :cond_0

    .line 67
    add-int/2addr v4, v3

    goto :goto_0

    .line 69
    :cond_0
    int-to-long v6, v4

    .line 74
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 77
    .end local v0    # "buf":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "readNow":I
    .end local v4    # "size":I
    :goto_1
    return-wide v6

    .line 70
    .restart local v2    # "in":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 71
    .local v1, "ex":Ljava/io/IOException;
    :try_start_1
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "caught exception while reading "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v5

    .line 77
    .end local v2    # "in":Ljava/io/InputStream;
    :cond_1
    const-wide/16 v6, 0x0

    goto :goto_1
.end method

.method protected isAppendSupported()Z
    .locals 1

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract wrapStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract wrapStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
