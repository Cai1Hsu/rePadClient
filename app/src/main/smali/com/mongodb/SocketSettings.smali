.class final Lcom/mongodb/SocketSettings;
.super Ljava/lang/Object;
.source "SocketSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/SocketSettings$Builder;
    }
.end annotation


# instance fields
.field private final connectTimeoutMS:J

.field private final readTimeoutMS:J

.field private final socketFactory:Ljavax/net/SocketFactory;


# direct methods
.method constructor <init>(Lcom/mongodb/SocketSettings$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/mongodb/SocketSettings$Builder;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-static {p1}, Lcom/mongodb/SocketSettings$Builder;->access$000(Lcom/mongodb/SocketSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/SocketSettings;->connectTimeoutMS:J

    .line 73
    invoke-static {p1}, Lcom/mongodb/SocketSettings$Builder;->access$100(Lcom/mongodb/SocketSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/SocketSettings;->readTimeoutMS:J

    .line 74
    invoke-static {p1}, Lcom/mongodb/SocketSettings$Builder;->access$200(Lcom/mongodb/SocketSettings$Builder;)Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/SocketSettings;->socketFactory:Ljavax/net/SocketFactory;

    .line 75
    return-void
.end method

.method public static builder()Lcom/mongodb/SocketSettings$Builder;
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/mongodb/SocketSettings$Builder;

    invoke-direct {v0}, Lcom/mongodb/SocketSettings$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getConnectTimeout(Ljava/util/concurrent/TimeUnit;)I
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 60
    iget-wide v0, p0, Lcom/mongodb/SocketSettings;->connectTimeoutMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getReadTimeout(Ljava/util/concurrent/TimeUnit;)I
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 64
    iget-wide v0, p0, Lcom/mongodb/SocketSettings;->readTimeoutMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mongodb/SocketSettings;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method
