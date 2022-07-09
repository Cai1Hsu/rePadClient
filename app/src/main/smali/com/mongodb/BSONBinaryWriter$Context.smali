.class Lcom/mongodb/BSONBinaryWriter$Context;
.super Lcom/mongodb/BSONWriter$Context;
.source "BSONBinaryWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BSONBinaryWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Context"
.end annotation


# instance fields
.field private index:I

.field private final startPosition:I

.field final synthetic this$0:Lcom/mongodb/BSONBinaryWriter;


# direct methods
.method public constructor <init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;)V
    .locals 1
    .param p2, "from"    # Lcom/mongodb/BSONBinaryWriter$Context;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/mongodb/BSONBinaryWriter$Context;->this$0:Lcom/mongodb/BSONBinaryWriter;

    .line 400
    invoke-direct {p0, p1, p2}, Lcom/mongodb/BSONWriter$Context;-><init>(Lcom/mongodb/BSONWriter;Lcom/mongodb/BSONWriter$Context;)V

    .line 401
    iget v0, p2, Lcom/mongodb/BSONBinaryWriter$Context;->startPosition:I

    iput v0, p0, Lcom/mongodb/BSONBinaryWriter$Context;->startPosition:I

    .line 402
    iget v0, p2, Lcom/mongodb/BSONBinaryWriter$Context;->index:I

    iput v0, p0, Lcom/mongodb/BSONBinaryWriter$Context;->index:I

    .line 403
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;Lcom/mongodb/BSONContextType;I)V
    .locals 0
    .param p2, "parentContext"    # Lcom/mongodb/BSONBinaryWriter$Context;
    .param p3, "contextType"    # Lcom/mongodb/BSONContextType;
    .param p4, "startPosition"    # I

    .prologue
    .line 394
    iput-object p1, p0, Lcom/mongodb/BSONBinaryWriter$Context;->this$0:Lcom/mongodb/BSONBinaryWriter;

    .line 395
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/BSONWriter$Context;-><init>(Lcom/mongodb/BSONWriter;Lcom/mongodb/BSONWriter$Context;Lcom/mongodb/BSONContextType;)V

    .line 396
    iput p4, p0, Lcom/mongodb/BSONBinaryWriter$Context;->startPosition:I

    .line 397
    return-void
.end method

.method static synthetic access$008(Lcom/mongodb/BSONBinaryWriter$Context;)I
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/BSONBinaryWriter$Context;

    .prologue
    .line 390
    iget v0, p0, Lcom/mongodb/BSONBinaryWriter$Context;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/mongodb/BSONBinaryWriter$Context;->index:I

    return v0
.end method

.method static synthetic access$100(Lcom/mongodb/BSONBinaryWriter$Context;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONBinaryWriter$Context;

    .prologue
    .line 390
    iget v0, p0, Lcom/mongodb/BSONBinaryWriter$Context;->startPosition:I

    return v0
.end method


# virtual methods
.method public copy()Lcom/mongodb/BSONBinaryWriter$Context;
    .locals 2

    .prologue
    .line 412
    new-instance v0, Lcom/mongodb/BSONBinaryWriter$Context;

    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter$Context;->this$0:Lcom/mongodb/BSONBinaryWriter;

    invoke-direct {v0, v1, p0}, Lcom/mongodb/BSONBinaryWriter$Context;-><init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;)V

    return-object v0
.end method

.method public bridge synthetic copy()Lcom/mongodb/BSONWriter$Context;
    .locals 1

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter$Context;->copy()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    return-object v0
.end method

.method public getParentContext()Lcom/mongodb/BSONBinaryWriter$Context;
    .locals 1

    .prologue
    .line 407
    invoke-super {p0}, Lcom/mongodb/BSONWriter$Context;->getParentContext()Lcom/mongodb/BSONWriter$Context;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONBinaryWriter$Context;

    return-object v0
.end method

.method public bridge synthetic getParentContext()Lcom/mongodb/BSONWriter$Context;
    .locals 1

    .prologue
    .line 390
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter$Context;->getParentContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    return-object v0
.end method
