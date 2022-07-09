.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/HashvalueAlgorithm;
.super Ljava/lang/Object;
.source "HashvalueAlgorithm.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getValue(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 55
    const/4 v2, 0x0

    .line 57
    .local v2, "r":Ljava/io/Reader;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 66
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    :goto_0
    return-object v4

    .line 60
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .end local v2    # "r":Ljava/io/Reader;
    .local v3, "r":Ljava/io/Reader;
    :try_start_2
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 62
    .local v1, "hash":I
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v4

    .line 66
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    move-object v2, v3

    .end local v3    # "r":Ljava/io/Reader;
    .restart local v2    # "r":Ljava/io/Reader;
    goto :goto_0

    .line 63
    .end local v1    # "hash":I
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    :goto_2
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v4

    .end local v2    # "r":Ljava/io/Reader;
    .restart local v3    # "r":Ljava/io/Reader;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "r":Ljava/io/Reader;
    .restart local v2    # "r":Ljava/io/Reader;
    goto :goto_2

    .line 63
    .end local v2    # "r":Ljava/io/Reader;
    .restart local v3    # "r":Ljava/io/Reader;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3    # "r":Ljava/io/Reader;
    .restart local v2    # "r":Ljava/io/Reader;
    goto :goto_1
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    const-string/jumbo v0, "HashvalueAlgorithm"

    return-object v0
.end method
