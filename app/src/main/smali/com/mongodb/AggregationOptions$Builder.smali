.class public Lcom/mongodb/AggregationOptions$Builder;
.super Ljava/lang/Object;
.source "AggregationOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/AggregationOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private allowDiskUse:Ljava/lang/Boolean;

.field private batchSize:Ljava/lang/Integer;

.field private maxTimeMS:J

.field private outputMode:Lcom/mongodb/AggregationOptions$OutputMode;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    sget-object v0, Lcom/mongodb/AggregationOptions$OutputMode;->INLINE:Lcom/mongodb/AggregationOptions$OutputMode;

    iput-object v0, p0, Lcom/mongodb/AggregationOptions$Builder;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    .line 117
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/AggregationOptions$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/AggregationOptions$1;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/mongodb/AggregationOptions$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/AggregationOptions$Builder;)Ljava/lang/Integer;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/AggregationOptions$Builder;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/mongodb/AggregationOptions$Builder;->batchSize:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/AggregationOptions$Builder;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/AggregationOptions$Builder;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/mongodb/AggregationOptions$Builder;->allowDiskUse:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/AggregationOptions$Builder;)Lcom/mongodb/AggregationOptions$OutputMode;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/AggregationOptions$Builder;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/mongodb/AggregationOptions$Builder;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/AggregationOptions$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/AggregationOptions$Builder;

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/mongodb/AggregationOptions$Builder;->maxTimeMS:J

    return-wide v0
.end method


# virtual methods
.method public allowDiskUse(Ljava/lang/Boolean;)Lcom/mongodb/AggregationOptions$Builder;
    .locals 0
    .param p1, "allowDiskUse"    # Ljava/lang/Boolean;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/mongodb/AggregationOptions$Builder;->allowDiskUse:Ljava/lang/Boolean;

    .line 139
    return-object p0
.end method

.method public batchSize(Ljava/lang/Integer;)Lcom/mongodb/AggregationOptions$Builder;
    .locals 0
    .param p1, "size"    # Ljava/lang/Integer;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/mongodb/AggregationOptions$Builder;->batchSize:Ljava/lang/Integer;

    .line 127
    return-object p0
.end method

.method public build()Lcom/mongodb/AggregationOptions;
    .locals 1

    .prologue
    .line 172
    new-instance v0, Lcom/mongodb/AggregationOptions;

    invoke-direct {v0, p0}, Lcom/mongodb/AggregationOptions;-><init>(Lcom/mongodb/AggregationOptions$Builder;)V

    return-object v0
.end method

.method public maxTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/AggregationOptions$Builder;
    .locals 3
    .param p1, "maxTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 162
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/AggregationOptions$Builder;->maxTimeMS:J

    .line 163
    return-object p0
.end method

.method public outputMode(Lcom/mongodb/AggregationOptions$OutputMode;)Lcom/mongodb/AggregationOptions$Builder;
    .locals 0
    .param p1, "mode"    # Lcom/mongodb/AggregationOptions$OutputMode;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/mongodb/AggregationOptions$Builder;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    .line 149
    return-object p0
.end method
