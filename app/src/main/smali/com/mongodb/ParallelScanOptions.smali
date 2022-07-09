.class public Lcom/mongodb/ParallelScanOptions;
.super Ljava/lang/Object;
.source "ParallelScanOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ParallelScanOptions$1;,
        Lcom/mongodb/ParallelScanOptions$Builder;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field private final batchSize:I

.field private final numCursors:I

.field private final readPreference:Lcom/mongodb/ReadPreference;


# direct methods
.method private constructor <init>(Lcom/mongodb/ParallelScanOptions$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/mongodb/ParallelScanOptions$Builder;

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    invoke-static {p1}, Lcom/mongodb/ParallelScanOptions$Builder;->access$100(Lcom/mongodb/ParallelScanOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ParallelScanOptions;->numCursors:I

    .line 110
    invoke-static {p1}, Lcom/mongodb/ParallelScanOptions$Builder;->access$200(Lcom/mongodb/ParallelScanOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ParallelScanOptions;->batchSize:I

    .line 111
    invoke-static {p1}, Lcom/mongodb/ParallelScanOptions$Builder;->access$300(Lcom/mongodb/ParallelScanOptions$Builder;)Lcom/mongodb/ReadPreference;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ParallelScanOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 112
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/ParallelScanOptions$Builder;Lcom/mongodb/ParallelScanOptions$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/ParallelScanOptions$Builder;
    .param p2, "x1"    # Lcom/mongodb/ParallelScanOptions$1;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/mongodb/ParallelScanOptions;-><init>(Lcom/mongodb/ParallelScanOptions$Builder;)V

    return-void
.end method

.method public static builder()Lcom/mongodb/ParallelScanOptions$Builder;
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lcom/mongodb/ParallelScanOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/ParallelScanOptions$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getBatchSize()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lcom/mongodb/ParallelScanOptions;->batchSize:I

    return v0
.end method

.method public getNumCursors()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/mongodb/ParallelScanOptions;->numCursors:I

    return v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mongodb/ParallelScanOptions;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method
