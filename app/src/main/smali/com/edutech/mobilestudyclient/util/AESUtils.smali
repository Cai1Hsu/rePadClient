.class public Lcom/edutech/mobilestudyclient/util/AESUtils;
.super Ljava/lang/Object;
.source "AESUtils.java"


# static fields
.field public static final AES:Ljava/lang/String; = "AES"

.field public static final CIPHER:Ljava/lang/String; = "AES/CBC/PKCS5Padding"

.field public static final CRYPTO:Ljava/lang/String; = "Crypto"

.field public static final SHA1:Ljava/lang/String; = "SHA1PRNG"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 58
    :try_start_0
    const-string/jumbo v7, "AES"

    invoke-static {v7}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v4

    .line 59
    .local v4, "kgen":Ljavax/crypto/KeyGenerator;
    new-instance v6, Ljava/security/SecureRandom;

    invoke-direct {v6}, Ljava/security/SecureRandom;-><init>()V

    .line 60
    .local v6, "sr":Ljava/security/SecureRandom;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 61
    const/16 v7, 0x100

    invoke-virtual {v4, v7, v6}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 62
    invoke-virtual {v4}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v5

    .line 63
    .local v5, "secretKey":Ljavax/crypto/SecretKey;
    invoke-interface {v5}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v2

    .line 64
    .local v2, "enCodeFormat":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v7, "AES"

    invoke-direct {v3, v2, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 65
    .local v3, "key":Ljavax/crypto/spec/SecretKeySpec;
    const-string/jumbo v7, "AES"

    invoke-static {v7}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 66
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v7, 0x2

    invoke-virtual {v0, v7, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 67
    new-instance v7, Ljava/lang/String;

    invoke-static {p0}, Lcom/edutech/mobilestudyclient/util/AESUtils;->parseHexStr2Byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {v0, v8}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "enCodeFormat":[B
    .end local v3    # "key":Ljavax/crypto/spec/SecretKeySpec;
    .end local v4    # "kgen":Ljavax/crypto/KeyGenerator;
    .end local v5    # "secretKey":Ljavax/crypto/SecretKey;
    .end local v6    # "sr":Ljava/security/SecureRandom;
    :goto_0
    return-object v7

    .line 68
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 71
    const/4 v7, 0x0

    goto :goto_0
.end method

.method public static encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "keys"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 34
    :try_start_0
    const-string/jumbo v9, "AES"

    invoke-static {v9}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v6

    .line 35
    .local v6, "kgen":Ljavax/crypto/KeyGenerator;
    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    .line 36
    .local v8, "sr":Ljava/security/SecureRandom;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 37
    const/16 v9, 0x80

    invoke-virtual {v6, v9, v8}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 38
    invoke-virtual {v6}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v7

    .line 39
    .local v7, "secretKey":Ljavax/crypto/SecretKey;
    invoke-interface {v7}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v3

    .line 41
    .local v3, "enCodeFormat":[B
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    const-string/jumbo v9, "fedcba9876543210"

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    invoke-direct {v4, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 44
    .local v4, "iv":Ljavax/crypto/spec/IvParameterSpec;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v9, "0123456789abcdef"

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    const-string/jumbo v10, "AES"

    invoke-direct {v5, v9, v10}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 46
    .local v5, "key":Ljavax/crypto/spec/SecretKeySpec;
    const-string/jumbo v9, "AES/CBC/PKCS5Padding"

    invoke-static {v9}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 47
    .local v1, "cipher":Ljavax/crypto/Cipher;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 48
    .local v0, "byteContent":[B
    const/4 v9, 0x1

    invoke-virtual {v1, v9, v5, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 49
    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v9

    invoke-static {v9}, Lcom/edutech/mobilestudyclient/util/AESUtils;->parseByte2HexStr([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 53
    .end local v0    # "byteContent":[B
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v3    # "enCodeFormat":[B
    .end local v4    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v5    # "key":Ljavax/crypto/spec/SecretKeySpec;
    .end local v6    # "kgen":Ljavax/crypto/KeyGenerator;
    .end local v7    # "secretKey":Ljavax/crypto/SecretKey;
    .end local v8    # "sr":Ljava/security/SecureRandom;
    :goto_0
    return-object v9

    .line 50
    :catch_0
    move-exception v2

    .line 51
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 53
    const/4 v9, 0x0

    goto :goto_0
.end method

.method private static getRawKey([B)[B
    .locals 6
    .param p0, "seed"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    const-string/jumbo v4, "AES"

    invoke-static {v4}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 25
    .local v0, "kgen":Ljavax/crypto/KeyGenerator;
    const-string/jumbo v4, "SHA1PRNG"

    const-string/jumbo v5, "Crypto"

    invoke-static {v4, v5}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v3

    .line 26
    .local v3, "sr":Ljava/security/SecureRandom;
    invoke-virtual {v3, p0}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 27
    const/16 v4, 0x80

    invoke-virtual {v0, v4, v3}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 28
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v2

    .line 29
    .local v2, "skey":Ljavax/crypto/SecretKey;
    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v1

    .line 30
    .local v1, "raw":[B
    return-object v1
.end method

.method public static parseByte2HexStr([B)Ljava/lang/String;
    .locals 5
    .param p0, "buf"    # [B

    .prologue
    .line 75
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 76
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-lt v1, v3, :cond_0

    .line 84
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 77
    :cond_0
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x30

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static parseHexStr2Byte(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexStr"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 89
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_1

    .line 90
    const/4 v3, 0x0

    .line 98
    :cond_0
    return-object v3

    .line 91
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    new-array v3, v4, [B

    .line 92
    .local v3, "result":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    if-ge v1, v4, :cond_0

    .line 93
    mul-int/lit8 v4, v1, 0x2

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 94
    .local v0, "high":I
    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x1

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    .line 96
    .local v2, "low":I
    mul-int/lit8 v4, v0, 0x10

    add-int/2addr v4, v2

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    .line 92
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
