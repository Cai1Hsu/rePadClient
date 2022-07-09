.class public Lcom/mongodb/GroupCommand;
.super Ljava/lang/Object;
.source "GroupCommand.java"


# instance fields
.field condition:Lcom/mongodb/DBObject;

.field finalize:Ljava/lang/String;

.field initial:Lcom/mongodb/DBObject;

.field input:Ljava/lang/String;

.field keys:Lcom/mongodb/DBObject;

.field reduce:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "inputCollection"    # Lcom/mongodb/DBCollection;
    .param p2, "keys"    # Lcom/mongodb/DBObject;
    .param p3, "condition"    # Lcom/mongodb/DBObject;
    .param p4, "initial"    # Lcom/mongodb/DBObject;
    .param p5, "reduce"    # Ljava/lang/String;
    .param p6, "finalize"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-virtual {p1}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/GroupCommand;->input:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lcom/mongodb/GroupCommand;->keys:Lcom/mongodb/DBObject;

    .line 28
    iput-object p3, p0, Lcom/mongodb/GroupCommand;->condition:Lcom/mongodb/DBObject;

    .line 29
    iput-object p4, p0, Lcom/mongodb/GroupCommand;->initial:Lcom/mongodb/DBObject;

    .line 30
    iput-object p5, p0, Lcom/mongodb/GroupCommand;->reduce:Ljava/lang/String;

    .line 31
    iput-object p6, p0, Lcom/mongodb/GroupCommand;->finalize:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public toDBObject()Lcom/mongodb/DBObject;
    .locals 3

    .prologue
    .line 35
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 36
    .local v0, "args":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v1, "ns"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->input:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-string/jumbo v1, "key"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->keys:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    const-string/jumbo v1, "cond"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->condition:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    const-string/jumbo v1, "$reduce"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->reduce:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string/jumbo v1, "initial"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->initial:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    iget-object v1, p0, Lcom/mongodb/GroupCommand;->finalize:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 42
    const-string/jumbo v1, "finalize"

    iget-object v2, p0, Lcom/mongodb/GroupCommand;->finalize:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_0
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "group"

    invoke-direct {v1, v2, v0}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method
