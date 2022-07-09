.class public Lcom/edutech/idauthentication/AESSet;
.super Ljava/lang/Object;
.source "AESSet.java"


# static fields
.field static HEX_CHARS:[C


# instance fields
.field private SecretKey:Ljava/lang/String;

.field private cipher:Ljavax/crypto/Cipher;

.field private iv:Ljava/lang/String;

.field private ivspec:Ljavax/crypto/spec/IvParameterSpec;

.field private keyspec:Ljavax/crypto/spec/SecretKeySpec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/edutech/idauthentication/AESSet;->HEX_CHARS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-string/jumbo v1, "fedcba9876543210"

    iput-object v1, p0, Lcom/edutech/idauthentication/AESSet;->iv:Ljava/lang/String;

    .line 17
    const-string/jumbo v1, "Edutech@20131220"

    iput-object v1, p0, Lcom/edutech/idauthentication/AESSet;->SecretKey:Ljava/lang/String;

    .line 21
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v2, p0, Lcom/edutech/idauthentication/AESSet;->iv:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    iput-object v1, p0, Lcom/edutech/idauthentication/AESSet;->ivspec:Ljavax/crypto/spec/IvParameterSpec;

    .line 22
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v2, p0, Lcom/edutech/idauthentication/AESSet;->SecretKey:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const-string/jumbo v3, "AES"

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v1, p0, Lcom/edutech/idauthentication/AESSet;->keyspec:Ljavax/crypto/spec/SecretKeySpec;

    .line 25
    :try_start_0
    const-string/jumbo v1, "AES/CBC/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/idauthentication/AESSet;->cipher:Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 35
    :goto_0
    return-void

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 32
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 33
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static bytesToHex([B)Ljava/lang/String;
    .locals 5
    .param p0, "buf"    # [B

    .prologue
    .line 89
    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    new-array v0, v2, [C

    .line 90
    .local v0, "chars":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-lt v1, v2, :cond_0

    .line 95
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    return-object v2

    .line 92
    :cond_0
    mul-int/lit8 v2, v1, 0x2

    sget-object v3, Lcom/edutech/idauthentication/AESSet;->HEX_CHARS:[C

    aget-byte v4, p0, v1

    and-int/lit16 v4, v4, 0xf0

    ushr-int/lit8 v4, v4, 0x4

    aget-char v3, v3, v4

    aput-char v3, v0, v2

    .line 93
    mul-int/lit8 v2, v1, 0x2

    add-int/lit8 v2, v2, 0x1

    sget-object v3, Lcom/edutech/idauthentication/AESSet;->HEX_CHARS:[C

    aget-byte v4, p0, v1

    and-int/lit8 v4, v4, 0xf

    aget-char v3, v3, v4

    aput-char v3, v0, v2

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static hexToBytes(Ljava/lang/String;)[B
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 100
    if-nez p0, :cond_1

    .line 110
    :cond_0
    return-object v0

    .line 102
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    .line 105
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v2, v3, 0x2

    .line 106
    .local v2, "len":I
    new-array v0, v2, [B

    .line 107
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 108
    mul-int/lit8 v3, v1, 0x2

    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 107
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static padString(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "source"    # Ljava/lang/String;

    .prologue
    .line 115
    const/4 v2, 0x0

    .line 116
    .local v2, "paddingChar":C
    const/16 v3, 0x10

    .line 117
    .local v3, "size":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    rem-int v4, v5, v3

    .line 118
    .local v4, "x":I
    sub-int v1, v3, v4

    .line 120
    .local v1, "padLength":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 125
    return-object p0

    .line 122
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public decrypt(Ljava/lang/String;)[B
    .locals 9
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 59
    :cond_0
    new-instance v5, Ljava/lang/Exception;

    const-string/jumbo v6, "Empty string"

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v5

    .line 61
    :cond_1
    const/4 v0, 0x0

    .line 64
    .local v0, "decrypted":[B
    :try_start_0
    iget-object v5, p0, Lcom/edutech/idauthentication/AESSet;->cipher:Ljavax/crypto/Cipher;

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/edutech/idauthentication/AESSet;->keyspec:Ljavax/crypto/spec/SecretKeySpec;

    iget-object v8, p0, Lcom/edutech/idauthentication/AESSet;->ivspec:Ljavax/crypto/spec/IvParameterSpec;

    invoke-virtual {v5, v6, v7, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 66
    iget-object v5, p0, Lcom/edutech/idauthentication/AESSet;->cipher:Ljavax/crypto/Cipher;

    invoke-static {p1}, Lcom/edutech/idauthentication/AESSet;->hexToBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 68
    array-length v5, v0

    if-lez v5, :cond_2

    .line 70
    const/4 v4, 0x0

    .line 71
    .local v4, "trim":I
    array-length v5, v0

    add-int/lit8 v2, v5, -0x1

    .local v2, "i":I
    :goto_0
    if-gez v2, :cond_3

    .line 73
    if-lez v4, :cond_2

    .line 75
    array-length v5, v0

    sub-int/2addr v5, v4

    new-array v3, v5, [B

    .line 76
    .local v3, "newArray":[B
    const/4 v5, 0x0

    const/4 v6, 0x0

    array-length v7, v0

    sub-int/2addr v7, v4

    invoke-static {v0, v5, v3, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    move-object v0, v3

    .line 84
    .end local v2    # "i":I
    .end local v3    # "newArray":[B
    .end local v4    # "trim":I
    :cond_2
    return-object v0

    .line 71
    .restart local v2    # "i":I
    .restart local v4    # "trim":I
    :cond_3
    aget-byte v5, v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v5, :cond_4

    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 81
    .end local v2    # "i":I
    .end local v4    # "trim":I
    :catch_0
    move-exception v1

    .line 82
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "[decrypt] "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public encrypt(Ljava/lang/String;)[B
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 40
    :cond_0
    new-instance v2, Ljava/lang/Exception;

    const-string/jumbo v3, "Empty string"

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 42
    :cond_1
    const/4 v1, 0x0

    .line 45
    .local v1, "encrypted":[B
    :try_start_0
    iget-object v2, p0, Lcom/edutech/idauthentication/AESSet;->cipher:Ljavax/crypto/Cipher;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/edutech/idauthentication/AESSet;->keyspec:Ljavax/crypto/spec/SecretKeySpec;

    iget-object v5, p0, Lcom/edutech/idauthentication/AESSet;->ivspec:Ljavax/crypto/spec/IvParameterSpec;

    invoke-virtual {v2, v3, v4, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 47
    iget-object v2, p0, Lcom/edutech/idauthentication/AESSet;->cipher:Ljavax/crypto/Cipher;

    invoke-static {p1}, Lcom/edutech/idauthentication/AESSet;->padString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 53
    return-object v1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "[encrypt] "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
.end method
