.class Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended$1;
.super Ljava/lang/Object;
.source "SSLSocketFactoryExtended.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;->initSSLSocketFactoryEx([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended$1;->this$0:Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 112
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 116
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 2

    .prologue
    .line 106
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/security/cert/X509Certificate;

    .line 107
    .local v0, "myTrustedAnchors":[Ljava/security/cert/X509Certificate;
    return-object v0
.end method
