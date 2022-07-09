.class Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;
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
    name = "UnorderedRunGenerator"
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
    .line 621
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 622
    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->writeRequests:Ljava/util/List;

    .line 623
    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/mongodb/WriteConcern;->continueOnError(Z)Lcom/mongodb/WriteConcern;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 624
    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->encoder:Lcom/mongodb/DBEncoder;

    .line 625
    invoke-static {p1, p5}, Lcom/mongodb/DBCollectionImpl;->access$200(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->maxBatchWriteSize:I

    .line 626
    return-void
.end method

.method static synthetic access$1100(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    .prologue
    .line 614
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->maxBatchWriteSize:I

    return v0
.end method

.method static synthetic access$700(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    .prologue
    .line 614
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->writeRequests:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Lcom/mongodb/WriteConcern;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    .prologue
    .line 614
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Lcom/mongodb/DBEncoder;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    .prologue
    .line 614
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->encoder:Lcom/mongodb/DBEncoder;

    return-object v0
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
    .line 630
    new-instance v0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;

    invoke-direct {v0, p0}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;-><init>(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)V

    return-object v0
.end method
