.class public Lcom/mongodb/CommandResult;
.super Lcom/mongodb/BasicDBObject;
.source "CommandResult.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final _host:Lcom/mongodb/ServerAddress;


# direct methods
.method constructor <init>(Lcom/mongodb/ServerAddress;)V
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 32
    if-nez p1, :cond_0

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "server address is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/mongodb/CommandResult;->_host:Lcom/mongodb/ServerAddress;

    .line 37
    const-string/jumbo v0, "serverUsed"

    invoke-virtual {p1}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    return-void
.end method

.method private getWriteException()Lcom/mongodb/MongoException;
    .locals 2

    .prologue
    .line 86
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->getCode()I

    move-result v0

    .line 87
    .local v0, "code":I
    const/16 v1, 0x2af8

    if-eq v0, v1, :cond_0

    const/16 v1, 0x2af9

    if-eq v0, v1, :cond_0

    const/16 v1, 0x3126

    if-ne v0, v1, :cond_1

    .line 88
    :cond_0
    new-instance v1, Lcom/mongodb/MongoException$DuplicateKey;

    invoke-direct {v1, p0}, Lcom/mongodb/MongoException$DuplicateKey;-><init>(Lcom/mongodb/CommandResult;)V

    .line 90
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Lcom/mongodb/WriteConcernException;

    invoke-direct {v1, p0}, Lcom/mongodb/WriteConcernException;-><init>(Lcom/mongodb/CommandResult;)V

    goto :goto_0
.end method


# virtual methods
.method getCode()I
    .locals 6

    .prologue
    const/4 v5, -0x1

    .line 100
    const-string/jumbo v3, "code"

    invoke-virtual {p0, v3, v5}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 104
    .local v0, "code":I
    if-ne v0, v5, :cond_1

    const-string/jumbo v3, "errObjects"

    invoke-virtual {p0, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 105
    const-string/jumbo v3, "errObjects"

    invoke-virtual {p0, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/BasicDBObject;

    .line 106
    .local v1, "curErrorDocument":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v3, "err"

    invoke-virtual {p0, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "err"

    invoke-virtual {v1, v4}, Lcom/mongodb/BasicDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    const-string/jumbo v3, "code"

    invoke-virtual {v1, v3, v5}, Lcom/mongodb/BasicDBObject;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 113
    .end local v1    # "curErrorDocument":Lcom/mongodb/BasicDBObject;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    const-string/jumbo v1, "errmsg"

    invoke-virtual {p0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 61
    .local v0, "errorMessage":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 62
    const/4 v1, 0x0

    .line 63
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getException()Lcom/mongodb/MongoException;
    .locals 3

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v0

    if-nez v0, :cond_1

    .line 72
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->getCode()I

    move-result v0

    const/16 v1, 0x32

    if-ne v0, v1, :cond_0

    .line 73
    new-instance v0, Lcom/mongodb/MongoExecutionTimeoutException;

    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->getCode()I

    move-result v1

    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MongoExecutionTimeoutException;-><init>(ILjava/lang/String;)V

    .line 81
    :goto_0
    return-object v0

    .line 76
    :cond_0
    new-instance v0, Lcom/mongodb/CommandFailureException;

    invoke-direct {v0, p0}, Lcom/mongodb/CommandFailureException;-><init>(Lcom/mongodb/CommandResult;)V

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->hasErr()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 79
    invoke-direct {p0}, Lcom/mongodb/CommandResult;->getWriteException()Lcom/mongodb/MongoException;

    move-result-object v0

    goto :goto_0

    .line 81
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getServerUsed()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/mongodb/CommandResult;->_host:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method hasErr()Z
    .locals 2

    .prologue
    .line 121
    const-string/jumbo v1, "err"

    invoke-virtual {p0, v1}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "err":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public ok()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    const-string/jumbo v3, "ok"

    invoke-virtual {p0, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 46
    .local v0, "okValue":Ljava/lang/Object;
    instance-of v3, v0, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    .line 47
    check-cast v0, Ljava/lang/Boolean;

    .end local v0    # "okValue":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 51
    :cond_0
    :goto_0
    return v1

    .line 48
    .restart local v0    # "okValue":Ljava/lang/Object;
    :cond_1
    instance-of v3, v0, Ljava/lang/Number;

    if-eqz v3, :cond_2

    .line 49
    check-cast v0, Ljava/lang/Number;

    .end local v0    # "okValue":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v3

    if-eq v3, v1, :cond_0

    move v1, v2

    goto :goto_0

    .restart local v0    # "okValue":Ljava/lang/Object;
    :cond_2
    move v1, v2

    .line 51
    goto :goto_0
.end method

.method public throwOnError()V
    .locals 1

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->hasErr()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/CommandResult;->getException()Lcom/mongodb/MongoException;

    move-result-object v0

    throw v0

    .line 133
    :cond_1
    return-void
.end method
