.class Lcom/mongodb/RemoveRequest;
.super Lcom/mongodb/WriteRequest;
.source "RemoveRequest.java"


# instance fields
.field private final multi:Z

.field private final query:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;Z)V
    .locals 0
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "multi"    # Z

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/mongodb/WriteRequest;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/mongodb/RemoveRequest;->query:Lcom/mongodb/DBObject;

    .line 25
    iput-boolean p2, p0, Lcom/mongodb/RemoveRequest;->multi:Z

    .line 26
    return-void
.end method


# virtual methods
.method public getQuery()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mongodb/RemoveRequest;->query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method

.method public isMulti()Z
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/mongodb/RemoveRequest;->multi:Z

    return v0
.end method
