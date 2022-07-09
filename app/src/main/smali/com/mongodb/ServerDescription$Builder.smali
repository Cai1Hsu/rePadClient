.class Lcom/mongodb/ServerDescription$Builder;
.super Ljava/lang/Object;
.source "ServerDescription.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ServerDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private address:Lcom/mongodb/ServerAddress;

.field private arbiters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private averageLatency:J

.field private exception:Ljava/lang/Throwable;

.field private hosts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private maxDocumentSize:I

.field private maxMessageSize:I

.field private maxWireVersion:I

.field private maxWriteBatchSize:I

.field private minWireVersion:I

.field private ok:Z

.field private passives:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private primary:Ljava/lang/String;

.field private setName:Ljava/lang/String;

.field private state:Lcom/mongodb/ServerConnectionState;

.field private tags:Lcom/mongodb/Tags;

.field private type:Lcom/mongodb/ServerType;

.field private version:Lcom/mongodb/ServerVersion;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    sget-object v0, Lcom/mongodb/ServerType;->Unknown:Lcom/mongodb/ServerType;

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->type:Lcom/mongodb/ServerType;

    .line 80
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->hosts:Ljava/util/Set;

    .line 81
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->passives:Ljava/util/Set;

    .line 82
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->arbiters:Ljava/util/Set;

    .line 84
    const/high16 v0, 0x1000000

    iput v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxDocumentSize:I

    .line 85
    const/high16 v0, 0x2000000

    iput v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxMessageSize:I

    .line 86
    const/16 v0, 0x200

    iput v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxWriteBatchSize:I

    .line 87
    new-instance v0, Lcom/mongodb/Tags;

    invoke-direct {v0}, Lcom/mongodb/Tags;-><init>()V

    invoke-static {v0}, Lcom/mongodb/Tags;->freeze(Lcom/mongodb/Tags;)Lcom/mongodb/Tags;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->tags:Lcom/mongodb/Tags;

    .line 92
    new-instance v0, Lcom/mongodb/ServerVersion;

    invoke-direct {v0}, Lcom/mongodb/ServerVersion;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->version:Lcom/mongodb/ServerVersion;

    .line 93
    iput v1, p0, Lcom/mongodb/ServerDescription$Builder;->minWireVersion:I

    .line 94
    iput v1, p0, Lcom/mongodb/ServerDescription$Builder;->maxWireVersion:I

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerAddress;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->address:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerType;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->type:Lcom/mongodb/ServerType;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mongodb/ServerDescription$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxWriteBatchSize:I

    return v0
.end method

.method static synthetic access$1100(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/Tags;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->tags:Lcom/mongodb/Tags;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->setName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/mongodb/ServerDescription$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-wide v0, p0, Lcom/mongodb/ServerDescription$Builder;->averageLatency:J

    return-wide v0
.end method

.method static synthetic access$1400(Lcom/mongodb/ServerDescription$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/mongodb/ServerDescription$Builder;->ok:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/mongodb/ServerDescription$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget v0, p0, Lcom/mongodb/ServerDescription$Builder;->minWireVersion:I

    return v0
.end method

.method static synthetic access$1600(Lcom/mongodb/ServerDescription$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxWireVersion:I

    return v0
.end method

.method static synthetic access$1700(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/Throwable;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerConnectionState;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->state:Lcom/mongodb/ServerConnectionState;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/ServerDescription$Builder;)Lcom/mongodb/ServerVersion;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->version:Lcom/mongodb/ServerVersion;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->hosts:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->passives:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mongodb/ServerDescription$Builder;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->arbiters:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mongodb/ServerDescription$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->primary:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mongodb/ServerDescription$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxDocumentSize:I

    return v0
.end method

.method static synthetic access$900(Lcom/mongodb/ServerDescription$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerDescription$Builder;

    .prologue
    .line 77
    iget v0, p0, Lcom/mongodb/ServerDescription$Builder;->maxMessageSize:I

    return v0
.end method


# virtual methods
.method public address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "address"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->address:Lcom/mongodb/ServerAddress;

    .line 100
    return-object p0
.end method

.method public arbiters(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mongodb/ServerDescription$Builder;"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "arbiters":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->arbiters:Ljava/util/Set;

    .line 120
    return-object p0

    .line 119
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0
.end method

.method public averageLatency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerDescription$Builder;
    .locals 3
    .param p1, "averageLatency"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 149
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerDescription$Builder;->averageLatency:J

    .line 150
    return-object p0
.end method

.method public build()Lcom/mongodb/ServerDescription;
    .locals 1

    .prologue
    .line 190
    new-instance v0, Lcom/mongodb/ServerDescription;

    invoke-direct {v0, p0}, Lcom/mongodb/ServerDescription;-><init>(Lcom/mongodb/ServerDescription$Builder;)V

    return-object v0
.end method

.method public exception(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->exception:Ljava/lang/Throwable;

    .line 186
    return-object p0
.end method

.method public hosts(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mongodb/ServerDescription$Builder;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "hosts":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->hosts:Ljava/util/Set;

    .line 110
    return-object p0

    .line 109
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0
.end method

.method public maxDocumentSize(I)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "maxBSONObjectSize"    # I

    .prologue
    .line 129
    iput p1, p0, Lcom/mongodb/ServerDescription$Builder;->maxDocumentSize:I

    .line 130
    return-object p0
.end method

.method public maxMessageSize(I)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "maxMessageSize"    # I

    .prologue
    .line 134
    iput p1, p0, Lcom/mongodb/ServerDescription$Builder;->maxMessageSize:I

    .line 135
    return-object p0
.end method

.method public maxWireVersion(I)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "maxWireVersion"    # I

    .prologue
    .line 180
    iput p1, p0, Lcom/mongodb/ServerDescription$Builder;->maxWireVersion:I

    .line 181
    return-object p0
.end method

.method public maxWriteBatchSize(I)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "maxWriteBatchSize"    # I

    .prologue
    .line 139
    iput p1, p0, Lcom/mongodb/ServerDescription$Builder;->maxWriteBatchSize:I

    .line 140
    return-object p0
.end method

.method public minWireVersion(I)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "minWireVersion"    # I

    .prologue
    .line 175
    iput p1, p0, Lcom/mongodb/ServerDescription$Builder;->minWireVersion:I

    .line 176
    return-object p0
.end method

.method public ok(Z)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "ok"    # Z

    .prologue
    .line 159
    iput-boolean p1, p0, Lcom/mongodb/ServerDescription$Builder;->ok:Z

    .line 160
    return-object p0
.end method

.method public passives(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mongodb/ServerDescription$Builder;"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, "passives":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->passives:Ljava/util/Set;

    .line 115
    return-object p0

    .line 114
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0
.end method

.method public primary(Ljava/lang/String;)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "primary"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->primary:Ljava/lang/String;

    .line 125
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "setName"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->setName:Ljava/lang/String;

    .line 155
    return-object p0
.end method

.method public state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;
    .locals 0
    .param p1, "state"    # Lcom/mongodb/ServerConnectionState;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->state:Lcom/mongodb/ServerConnectionState;

    .line 165
    return-object p0
.end method

.method public tags(Lcom/mongodb/Tags;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .param p1, "tags"    # Lcom/mongodb/Tags;

    .prologue
    .line 144
    if-nez p1, :cond_0

    new-instance v0, Lcom/mongodb/Tags;

    invoke-direct {v0}, Lcom/mongodb/Tags;-><init>()V

    invoke-static {v0}, Lcom/mongodb/Tags;->freeze(Lcom/mongodb/Tags;)Lcom/mongodb/Tags;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->tags:Lcom/mongodb/Tags;

    .line 145
    return-object p0

    .line 144
    :cond_0
    invoke-static {p1}, Lcom/mongodb/Tags;->freeze(Lcom/mongodb/Tags;)Lcom/mongodb/Tags;

    move-result-object v0

    goto :goto_0
.end method

.method public type(Lcom/mongodb/ServerType;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .param p1, "type"    # Lcom/mongodb/ServerType;

    .prologue
    .line 104
    const-string/jumbo v0, "type"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerType;

    iput-object v0, p0, Lcom/mongodb/ServerDescription$Builder;->type:Lcom/mongodb/ServerType;

    .line 105
    return-object p0
.end method

.method public version(Lcom/mongodb/ServerVersion;)Lcom/mongodb/ServerDescription$Builder;
    .locals 1
    .param p1, "version"    # Lcom/mongodb/ServerVersion;

    .prologue
    .line 169
    const-string/jumbo v0, "version"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iput-object p1, p0, Lcom/mongodb/ServerDescription$Builder;->version:Lcom/mongodb/ServerVersion;

    .line 171
    return-object p0
.end method
