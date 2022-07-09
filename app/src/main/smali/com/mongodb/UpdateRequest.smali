.class Lcom/mongodb/UpdateRequest;
.super Lcom/mongodb/ModifyRequest;
.source "UpdateRequest.java"


# instance fields
.field private final multi:Z


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;Z)V
    .locals 0
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "upsert"    # Z
    .param p3, "update"    # Lcom/mongodb/DBObject;
    .param p4, "multi"    # Z

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/ModifyRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;)V

    .line 24
    iput-boolean p4, p0, Lcom/mongodb/UpdateRequest;->multi:Z

    .line 25
    return-void
.end method


# virtual methods
.method public getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method

.method public getUpdate()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/mongodb/UpdateRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public isMulti()Z
    .locals 1

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/mongodb/UpdateRequest;->multi:Z

    return v0
.end method
