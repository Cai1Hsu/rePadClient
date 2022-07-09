.class Lcom/mongodb/Update;
.super Ljava/lang/Object;
.source "Update.java"


# instance fields
.field private final filter:Lcom/mongodb/DBObject;

.field private isMulti:Z

.field private isUpsert:Z

.field private final updateOperations:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "filter"    # Lcom/mongodb/DBObject;
    .param p2, "updateOperations"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-boolean v0, p0, Lcom/mongodb/Update;->isUpsert:Z

    .line 23
    iput-boolean v0, p0, Lcom/mongodb/Update;->isMulti:Z

    .line 26
    iput-object p1, p0, Lcom/mongodb/Update;->filter:Lcom/mongodb/DBObject;

    .line 27
    iput-object p2, p0, Lcom/mongodb/Update;->updateOperations:Lcom/mongodb/DBObject;

    .line 28
    return-void
.end method


# virtual methods
.method getFilter()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/Update;->filter:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getUpdateOperations()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/mongodb/Update;->updateOperations:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public isMulti()Z
    .locals 1

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/mongodb/Update;->isMulti:Z

    return v0
.end method

.method isUpsert()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/mongodb/Update;->isUpsert:Z

    return v0
.end method

.method public multi(Z)Lcom/mongodb/Update;
    .locals 0
    .param p1, "isMulti"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/mongodb/Update;->isMulti:Z

    .line 48
    return-object p0
.end method

.method public upsert(Z)Lcom/mongodb/Update;
    .locals 0
    .param p1, "isUpsert"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/mongodb/Update;->isUpsert:Z

    .line 53
    return-object p0
.end method
