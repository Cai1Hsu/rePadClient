.class abstract Lcom/mongodb/ModifyRequest;
.super Lcom/mongodb/WriteRequest;
.source "ModifyRequest.java"


# instance fields
.field private final query:Lcom/mongodb/DBObject;

.field private final updateDocument:Lcom/mongodb/DBObject;

.field private final upsert:Z


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "upsert"    # Z
    .param p3, "updateDocument"    # Lcom/mongodb/DBObject;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/mongodb/WriteRequest;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/mongodb/ModifyRequest;->query:Lcom/mongodb/DBObject;

    .line 26
    iput-boolean p2, p0, Lcom/mongodb/ModifyRequest;->upsert:Z

    .line 27
    iput-object p3, p0, Lcom/mongodb/ModifyRequest;->updateDocument:Lcom/mongodb/DBObject;

    .line 28
    return-void
.end method


# virtual methods
.method public getQuery()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/ModifyRequest;->query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getUpdateDocument()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ModifyRequest;->updateDocument:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public isMulti()Z
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method public isUpsert()Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/mongodb/ModifyRequest;->upsert:Z

    return v0
.end method
