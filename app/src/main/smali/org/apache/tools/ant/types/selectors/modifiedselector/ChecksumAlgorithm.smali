.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;
.super Ljava/lang/Object;
.source "ChecksumAlgorithm.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;


# instance fields
.field private algorithm:Ljava/lang/String;

.field private checksum:Ljava/util/zip/Checksum;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const-string/jumbo v0, "CRC"

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    return-void
.end method


# virtual methods
.method public getValue(Ljava/io/File;)Ljava/lang/String;
    .locals 8
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->initChecksum()V

    .line 118
    const/4 v4, 0x0

    .line 121
    .local v4, "rval":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 122
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    invoke-interface {v5}, Ljava/util/zip/Checksum;->reset()V

    .line 123
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 124
    .local v2, "fis":Ljava/io/FileInputStream;
    new-instance v0, Ljava/util/zip/CheckedInputStream;

    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    invoke-direct {v0, v2, v5}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V

    .line 125
    .local v0, "check":Ljava/util/zip/CheckedInputStream;
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 126
    .local v3, "in":Ljava/io/BufferedInputStream;
    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->read()I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    .line 129
    invoke-virtual {v0}, Ljava/util/zip/CheckedInputStream;->getChecksum()Ljava/util/zip/Checksum;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    .line 130
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .end local v0    # "check":Ljava/util/zip/CheckedInputStream;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v3    # "in":Ljava/io/BufferedInputStream;
    :cond_1
    :goto_0
    return-object v4

    .line 132
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public initChecksum()V
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    if-eqz v0, :cond_0

    .line 96
    :goto_0
    return-void

    .line 89
    :cond_0
    const-string/jumbo v0, "CRC"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 90
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    goto :goto_0

    .line 91
    :cond_1
    const-string/jumbo v0, "ADLER"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    new-instance v0, Ljava/util/zip/Adler32;

    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->checksum:Ljava/util/zip/Checksum;

    goto :goto_0

    .line 94
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/security/NoSuchAlgorithmException;

    invoke-direct {v1}, Ljava/security/NoSuchAlgorithmException;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public isValid()Z
    .locals 2

    .prologue
    .line 107
    const-string/jumbo v0, "CRC"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "ADLER"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .locals 1
    .param p1, "algorithm"    # Ljava/lang/String;

    .prologue
    .line 79
    if-eqz p1, :cond_0

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    .line 81
    return-void

    .line 79
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 144
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 145
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "<ChecksumAlgorithm:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 146
    const-string/jumbo v1, "algorithm="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 147
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
