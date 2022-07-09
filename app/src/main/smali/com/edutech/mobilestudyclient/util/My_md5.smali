.class public Lcom/edutech/mobilestudyclient/util/My_md5;
.super Ljava/lang/Object;
.source "My_md5.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static MD5_string(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "inStr"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 47
    .local v0, "a":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-lt v1, v3, :cond_0

    .line 50
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    .line 51
    .local v2, "s":Ljava/lang/String;
    return-object v2

    .line 48
    .end local v2    # "s":Ljava/lang/String;
    :cond_0
    aget-char v3, v0, v1

    xor-int/lit8 v3, v3, 0x74

    int-to-char v3, v3

    aput-char v3, v0, v1

    .line 47
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static Md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "plainText"    # Ljava/lang/String;

    .prologue
    .line 10
    :try_start_0
    const-string/jumbo v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    .line 11
    .local v4, "md":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/security/MessageDigest;->update([B)V

    .line 12
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 16
    .local v0, "b":[B
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v8, ""

    invoke-direct {v1, v8}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 17
    .local v1, "buf":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    .local v7, "offset":I
    :goto_0
    array-length v8, v0

    if-lt v7, v8, :cond_0

    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 27
    .local v6, "md5_32":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x8

    const/16 v10, 0x18

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 29
    .local v5, "md5_16":Ljava/lang/String;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "result: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "result: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x8

    const/16 v12, 0x18

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 38
    .end local v0    # "b":[B
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "md5_16":Ljava/lang/String;
    .end local v6    # "md5_32":Ljava/lang/String;
    .end local v7    # "offset":I
    :goto_1
    return-object v6

    .line 18
    .restart local v0    # "b":[B
    .restart local v1    # "buf":Ljava/lang/StringBuffer;
    .restart local v4    # "md":Ljava/security/MessageDigest;
    .restart local v7    # "offset":I
    :cond_0
    aget-byte v3, v0, v7

    .line 19
    .local v3, "i":I
    if-gez v3, :cond_1

    .line 20
    add-int/lit16 v3, v3, 0x100

    .line 21
    :cond_1
    const/16 v8, 0x10

    if-ge v3, v8, :cond_2

    .line 22
    const-string/jumbo v8, "0"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 34
    .end local v0    # "b":[B
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v7    # "offset":I
    :catch_0
    move-exception v2

    .line 36
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 38
    const/4 v6, 0x0

    goto :goto_1
.end method
