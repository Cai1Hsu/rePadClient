.class Lcom/mongodb/SocketSettings$Builder;
.super Ljava/lang/Object;
.source "SocketSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/SocketSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private connectTimeoutMS:J

.field private readTimeoutMS:J

.field private socketFactory:Ljavax/net/SocketFactory;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/SocketSettings$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/SocketSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/SocketSettings$Builder;

    .prologue
    .line 34
    iget-wide v0, p0, Lcom/mongodb/SocketSettings$Builder;->connectTimeoutMS:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/mongodb/SocketSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/SocketSettings$Builder;

    .prologue
    .line 34
    iget-wide v0, p0, Lcom/mongodb/SocketSettings$Builder;->readTimeoutMS:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/mongodb/SocketSettings$Builder;)Ljavax/net/SocketFactory;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/SocketSettings$Builder;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mongodb/SocketSettings$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/mongodb/SocketSettings;
    .locals 1

    .prologue
    .line 55
    new-instance v0, Lcom/mongodb/SocketSettings;

    invoke-direct {v0, p0}, Lcom/mongodb/SocketSettings;-><init>(Lcom/mongodb/SocketSettings$Builder;)V

    return-object v0
.end method

.method public connectTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;
    .locals 4
    .param p1, "connectTimeout"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 40
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/SocketSettings$Builder;->connectTimeoutMS:J

    .line 41
    return-object p0
.end method

.method public readTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;
    .locals 4
    .param p1, "readTimeout"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 45
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/SocketSettings$Builder;->readTimeoutMS:J

    .line 46
    return-object p0
.end method

.method public socketFactory(Ljavax/net/SocketFactory;)Lcom/mongodb/SocketSettings$Builder;
    .locals 1
    .param p1, "socketFactory"    # Ljavax/net/SocketFactory;

    .prologue
    .line 50
    const-string/jumbo v0, "socketFactory"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/SocketFactory;

    iput-object v0, p0, Lcom/mongodb/SocketSettings$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 51
    return-object p0
.end method
