.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;
.super Ljava/lang/Object;
.source "DigestAlgorithm.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final BYTE_MASK:I = 0xff


# instance fields
.field private algorithm:Ljava/lang/String;

.field private messageDigest:Ljava/security/MessageDigest;

.field private provider:Ljava/lang/String;

.field private readBufferSize:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const-string/jumbo v0, "MD5"

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    .line 79
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;

    .line 84
    const/16 v0, 0x2000

    iput v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->readBufferSize:I

    return-void
.end method


# virtual methods
.method public getValue(Ljava/io/File;)Ljava/lang/String;
    .locals 13
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v10, 0x0

    .line 154
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->initMessageDigest()V

    .line 155
    const/4 v1, 0x0

    .line 157
    .local v1, "checksum":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v11

    if-nez v11, :cond_0

    .line 191
    :goto_0
    return-object v10

    .line 160
    :cond_0
    const/4 v6, 0x0

    .line 162
    .local v6, "fis":Ljava/io/FileInputStream;
    iget v11, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->readBufferSize:I

    new-array v0, v11, [B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 164
    .local v0, "buf":[B
    :try_start_1
    iget-object v11, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v11}, Ljava/security/MessageDigest;->reset()V

    .line 165
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 166
    .end local v6    # "fis":Ljava/io/FileInputStream;
    .local v7, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v3, Ljava/security/DigestInputStream;

    iget-object v11, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;

    invoke-direct {v3, v7, v11}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 168
    .local v3, "dis":Ljava/security/DigestInputStream;
    :cond_1
    const/4 v11, 0x0

    iget v12, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->readBufferSize:I

    invoke-virtual {v3, v0, v11, v12}, Ljava/security/DigestInputStream;->read([BII)I

    move-result v11

    const/4 v12, -0x1

    if-ne v11, v12, :cond_1

    .line 171
    invoke-virtual {v3}, Ljava/security/DigestInputStream;->close()V

    .line 172
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 173
    const/4 v6, 0x0

    .line 174
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "fis":Ljava/io/FileInputStream;
    :try_start_3
    iget-object v11, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v11}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    .line 175
    .local v5, "fileDigest":[B
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 176
    .local v2, "checksumSb":Ljava/lang/StringBuffer;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    array-length v11, v5

    if-ge v9, v11, :cond_3

    .line 177
    aget-byte v11, v5, v9

    and-int/lit16 v11, v11, 0xff

    invoke-static {v11}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    .line 179
    .local v8, "hexStr":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x2

    if-ge v11, v12, :cond_2

    .line 180
    const-string/jumbo v11, "0"

    invoke-virtual {v2, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    :cond_2
    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 176
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 184
    .end local v8    # "hexStr":Ljava/lang/String;
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v1

    move-object v10, v1

    .line 191
    goto :goto_0

    .line 185
    .end local v2    # "checksumSb":Ljava/lang/StringBuffer;
    .end local v3    # "dis":Ljava/security/DigestInputStream;
    .end local v5    # "fileDigest":[B
    .end local v9    # "i":I
    :catch_0
    move-exception v4

    .line 186
    .local v4, "e":Ljava/lang/Exception;
    :goto_2
    goto :goto_0

    .line 188
    .end local v0    # "buf":[B
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v6    # "fis":Ljava/io/FileInputStream;
    :catch_1
    move-exception v4

    .line 189
    .restart local v4    # "e":Ljava/lang/Exception;
    goto :goto_0

    .line 185
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "buf":[B
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    :catch_2
    move-exception v4

    move-object v6, v7

    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "fis":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method public initMessageDigest()V
    .locals 4

    .prologue
    .line 113
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;

    if-eqz v2, :cond_0

    .line 132
    :goto_0
    return-void

    .line 117
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    if-eqz v2, :cond_1

    const-string/jumbo v2, ""

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "null"

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 119
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "noalgo":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 122
    .end local v0    # "noalgo":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 123
    .local v1, "noprovider":Ljava/security/NoSuchProviderException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 127
    .end local v1    # "noprovider":Ljava/security/NoSuchProviderException;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->messageDigest:Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 128
    :catch_2
    move-exception v0

    .line 129
    .restart local v0    # "noalgo":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public isValid()Z
    .locals 2

    .prologue
    .line 143
    const-string/jumbo v0, "SHA"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "MD5"

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

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
    .line 96
    if-eqz p1, :cond_0

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    .line 98
    return-void

    .line 96
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 200
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 201
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "<DigestAlgorithm:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    const-string/jumbo v1, "algorithm="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->algorithm:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    const-string/jumbo v1, ";provider="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;->provider:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 204
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 205
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
