.class Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBCollectionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OrderedRunGenerator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/mongodb/DBCollectionImpl$Run;",
        ">;"
    }
.end annotation


# instance fields
.field private final encoder:Lcom/mongodb/DBEncoder;

.field private final maxBatchWriteSize:I

.field final synthetic this$0:Lcom/mongodb/DBCollectionImpl;

.field private final writeConcern:Lcom/mongodb/WriteConcern;

.field private final writeRequests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)V
    .locals 1
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p5, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")V"
        }
    .end annotation

    .prologue
    .line 567
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 568
    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;

    .line 569
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/mongodb/WriteConcern;->continueOnError(Z)Lcom/mongodb/WriteConcern;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 570
    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->encoder:Lcom/mongodb/DBEncoder;

    .line 571
    invoke-static {p1, p5}, Lcom/mongodb/DBCollectionImpl;->access$200(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->maxBatchWriteSize:I

    .line 572
    return-void
.end method

.method static synthetic access$300(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Lcom/mongodb/WriteConcern;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Lcom/mongodb/DBEncoder;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->encoder:Lcom/mongodb/DBEncoder;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    .prologue
    .line 560
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->maxBatchWriteSize:I

    return v0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/mongodb/DBCollectionImpl$Run;",
            ">;"
        }
    .end annotation

    .prologue
    .line 576
    new-instance v0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;

    invoke-direct {v0, p0}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;-><init>(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)V

    return-object v0
.end method
