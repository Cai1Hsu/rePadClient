.class public Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;
.super Ljava/security/Provider;
.source "AESUtils2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/idauthentication/AESUtils2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CryptoProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 142
    const-string/jumbo v0, "Crypto"

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const-string/jumbo v1, "HARMONY (SHA1 digest; SecureRandom; SHA1withDSA signature)"

    invoke-direct {p0, v0, v2, v3, v1}, Ljava/security/Provider;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    .line 143
    const-string/jumbo v0, "SecureRandom.SHA1PRNG"

    .line 144
    const-string/jumbo v1, "org.apache.harmony.security.provider.crypto.SHA1PRNG_SecureRandomImpl"

    .line 143
    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const-string/jumbo v0, "SecureRandom.SHA1PRNG ImplementedIn"

    const-string/jumbo v1, "Software"

    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/AESUtils2$CryptoProvider;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    return-void
.end method
