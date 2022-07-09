.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyHostnameVerifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method private constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 4483
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;)V
    .locals 0

    .prologue
    .line 4483
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    .line 4488
    const/4 v0, 0x1

    return v0
.end method
