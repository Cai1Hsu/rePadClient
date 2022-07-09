.class public Lcom/mongodb/ParallelScanOptions$Builder;
.super Ljava/lang/Object;
.source "ParallelScanOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ParallelScanOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private batchSize:I

.field private numCursors:I

.field private readPreference:Lcom/mongodb/ReadPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/ParallelScanOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ParallelScanOptions$Builder;

    .prologue
    .line 31
    iget v0, p0, Lcom/mongodb/ParallelScanOptions$Builder;->numCursors:I

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/ParallelScanOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ParallelScanOptions$Builder;

    .prologue
    .line 31
    iget v0, p0, Lcom/mongodb/ParallelScanOptions$Builder;->batchSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/mongodb/ParallelScanOptions$Builder;)Lcom/mongodb/ReadPreference;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ParallelScanOptions$Builder;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/ParallelScanOptions$Builder;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method


# virtual methods
.method public batchSize(I)Lcom/mongodb/ParallelScanOptions$Builder;
    .locals 2
    .param p1, "batchSize"    # I

    .prologue
    .line 60
    const-string/jumbo v1, "batchSize >= 0"

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 61
    iput p1, p0, Lcom/mongodb/ParallelScanOptions$Builder;->batchSize:I

    .line 62
    return-object p0

    .line 60
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public build()Lcom/mongodb/ParallelScanOptions;
    .locals 2

    .prologue
    .line 77
    new-instance v0, Lcom/mongodb/ParallelScanOptions;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mongodb/ParallelScanOptions;-><init>(Lcom/mongodb/ParallelScanOptions$Builder;Lcom/mongodb/ParallelScanOptions$1;)V

    return-object v0
.end method

.method public numCursors(I)Lcom/mongodb/ParallelScanOptions$Builder;
    .locals 4
    .param p1, "numCursors"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 46
    const-string/jumbo v3, "numCursors >= 1"

    if-lt p1, v1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 47
    const-string/jumbo v0, "numCursors <= 10000"

    const/16 v3, 0x2710

    if-gt p1, v3, :cond_1

    :goto_1
    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 49
    iput p1, p0, Lcom/mongodb/ParallelScanOptions$Builder;->numCursors:I

    .line 50
    return-object p0

    :cond_0
    move v0, v2

    .line 46
    goto :goto_0

    :cond_1
    move v1, v2

    .line 47
    goto :goto_1
.end method

.method public readPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ParallelScanOptions$Builder;
    .locals 1
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 72
    const-string/jumbo v0, "readPreference"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ReadPreference;

    iput-object v0, p0, Lcom/mongodb/ParallelScanOptions$Builder;->readPreference:Lcom/mongodb/ReadPreference;

    .line 73
    return-object p0
.end method
