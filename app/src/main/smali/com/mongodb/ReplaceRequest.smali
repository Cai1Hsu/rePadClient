.class Lcom/mongodb/ReplaceRequest;
.super Lcom/mongodb/ModifyRequest;
.source "ReplaceRequest.java"


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "upsert"    # Z
    .param p3, "document"    # Lcom/mongodb/DBObject;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/ModifyRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getDocument()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/mongodb/ReplaceRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method
