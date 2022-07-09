.class final Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;
.super Ljava/net/Authenticator;
.source "SetProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProxyAuth"
.end annotation


# instance fields
.field private auth:Ljava/net/PasswordAuthentication;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 273
    invoke-direct {p0}, Ljava/net/Authenticator;-><init>()V

    .line 274
    new-instance v0, Ljava/net/PasswordAuthentication;

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/net/PasswordAuthentication;-><init>(Ljava/lang/String;[C)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;->auth:Ljava/net/PasswordAuthentication;

    .line 275
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$1;

    .prologue
    .line 270
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getPasswordAuthentication()Ljava/net/PasswordAuthentication;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;->auth:Ljava/net/PasswordAuthentication;

    return-object v0
.end method
