.class public Lcom/edutech/idauthentication/AESUtils2;
.super Ljava/lang/Object;
.source "AESUtils2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;
    }
.end annotation


# static fields
.field private static final AES:Ljava/lang/String; = "AES"

.field private static final CBC_PKCS5_PADDING:Ljava/lang/String; = "AES/CBC/PKCS5Padding"

.field private static final HEX:Ljava/lang/String; = "0123456789ABCDEF"

.field private static final SHA1PRNG:Ljava/lang/String; = "SHA1PRNG"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendHex(Ljava/lang/StringBuffer;B)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuffer;
    .param p1, "b"    # B

    .prologue
    .line 131
    const-string/jumbo v0, "0123456789ABCDEF"

    shr-int/lit8 v1, p1, 0x4

    and-int/lit8 v1, v1, 0xf

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "0123456789ABCDEF"

    and-int/lit8 v2, p1, 0xf

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 132
    return-void
.end method

.method public static decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "encrypted"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    .end local p1    # "encrypted":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 94
    .restart local p1    # "encrypted":Ljava/lang/String;
    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/edutech/idauthentication/AESUtils2;->toByte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {p0, v2}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;[B)[B

    move-result-object v1

    .line 95
    .local v1, "result":[B
    new-instance p1, Ljava/lang/String;

    .end local p1    # "encrypted":Ljava/lang/String;
    invoke-direct {p1, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    .end local v1    # "result":[B
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    const/4 p1, 0x0

    goto :goto_0
.end method

.method private static decrypt(Ljava/lang/String;[B)[B
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "encrypted"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/idauthentication/AESUtils2;->getRawKey([B)[B

    move-result-object v2

    .line 113
    .local v2, "raw":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 114
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const-string/jumbo v4, "AES"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 115
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 116
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 117
    .local v1, "decrypted":[B
    return-object v1
.end method

.method public static encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "cleartext"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    .end local p1    # "cleartext":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 67
    .restart local p1    # "cleartext":Ljava/lang/String;
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {p0, v2}, Lcom/edutech/idauthentication/AESUtils2;->encrypt(Ljava/lang/String;[B)[B

    move-result-object v1

    .line 68
    .local v1, "result":[B
    new-instance p1, Ljava/lang/String;

    .end local p1    # "cleartext":Ljava/lang/String;
    invoke-direct {p1, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 69
    .end local v1    # "result":[B
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 72
    const/4 p1, 0x0

    goto :goto_0
.end method

.method private static encrypt(Ljava/lang/String;[B)[B
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "clear"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/idauthentication/AESUtils2;->getRawKey([B)[B

    move-result-object v2

    .line 80
    .local v2, "raw":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string/jumbo v4, "AES"

    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 81
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const-string/jumbo v4, "AES"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 82
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v4, 0x1

    invoke-virtual {v0, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 83
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 84
    .local v1, "encrypted":[B
    return-object v1
.end method

.method public static generateKey()Ljava/lang/String;
    .locals 5

    .prologue
    .line 25
    :try_start_0
    const-string/jumbo v4, "SHA1PRNG"

    invoke-static {v4}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v2

    .line 26
    .local v2, "localSecureRandom":Ljava/security/SecureRandom;
    const/16 v4, 0x14

    new-array v0, v4, [B

    .line 27
    .local v0, "bytes_key":[B
    invoke-virtual {v2, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 28
    invoke-static {v0}, Lcom/edutech/idauthentication/AESUtils2;->toHex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 33
    .end local v0    # "bytes_key":[B
    :goto_0
    return-object v3

    .line 30
    :catch_0
    move-exception v1

    .line 31
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 33
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static getRawKey([B)[B
    .locals 7
    .param p0, "seed"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    const-string/jumbo v5, "AES"

    invoke-static {v5}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 39
    .local v0, "kgen":Ljavax/crypto/KeyGenerator;
    const/4 v4, 0x0

    .line 41
    .local v4, "sr":Ljava/security/SecureRandom;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 42
    .local v2, "sdk_version":I
    const/16 v5, 0x17

    if-le v2, v5, :cond_0

    .line 43
    const-string/jumbo v5, "SHA1PRNG"

    new-instance v6, Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;

    invoke-direct {v6}, Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;-><init>()V

    invoke-static {v5, v6}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/SecureRandom;

    move-result-object v4

    .line 51
    :goto_0
    invoke-virtual {v4, p0}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 52
    const/16 v5, 0x80

    invoke-virtual {v0, v5, v4}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 54
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v3

    .line 55
    .local v3, "skey":Ljavax/crypto/SecretKey;
    invoke-interface {v3}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v1

    .line 56
    .local v1, "raw":[B
    return-object v1

    .line 44
    .end local v1    # "raw":[B
    .end local v3    # "skey":Ljavax/crypto/SecretKey;
    :cond_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x11

    if-lt v5, v6, :cond_1

    .line 45
    const-string/jumbo v5, "SHA1PRNG"

    const-string/jumbo v6, "Crypto"

    invoke-static {v5, v6}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v4

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string/jumbo v5, "SHA1PRNG"

    invoke-static {v5}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v4

    goto :goto_0
.end method

.method public static toByte(Ljava/lang/String;)[B
    .locals 5
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v1, v3, 0x2

    .line 103
    .local v1, "len":I
    new-array v2, v1, [B

    .line 104
    .local v2, "result":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 106
    return-object v2

    .line 105
    :cond_0
    mul-int/lit8 v3, v0, 0x2

    mul-int/lit8 v4, v0, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    move-result v3

    aput-byte v3, v2, v0

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static toHex([B)Ljava/lang/String;
    .locals 3
    .param p0, "buf"    # [B

    .prologue
    .line 121
    if-nez p0, :cond_0

    .line 122
    const-string/jumbo v2, ""

    .line 127
    :goto_0
    return-object v2

    .line 123
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 124
    .local v1, "result":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_1

    .line 127
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 125
    :cond_1
    aget-byte v2, p0, v0

    invoke-static {v1, v2}, Lcom/edutech/idauthentication/AESUtils2;->appendHex(Ljava/lang/StringBuffer;B)V

    .line 124
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
