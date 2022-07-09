.class Lcom/mongodb/InsertRequest;
.super Lcom/mongodb/WriteRequest;
.source "InsertRequest.java"


# instance fields
.field private final document:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "document"    # Lcom/mongodb/DBObject;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/mongodb/WriteRequest;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/mongodb/InsertRequest;->document:Lcom/mongodb/DBObject;

    .line 24
    return-void
.end method


# virtual methods
.method public getDocument()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mongodb/InsertRequest;->document:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method
