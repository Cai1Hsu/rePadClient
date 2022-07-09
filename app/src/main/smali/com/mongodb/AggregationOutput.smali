.class public Lcom/mongodb/AggregationOutput;
.super Ljava/lang/Object;
.source "AggregationOutput.java"


# instance fields
.field protected final _cmd:Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _commandResult:Lcom/mongodb/CommandResult;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _resultSet:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;Lcom/mongodb/CommandResult;)V
    .locals 2
    .param p1, "command"    # Lcom/mongodb/DBObject;
    .param p2, "commandResult"    # Lcom/mongodb/CommandResult;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p2, p0, Lcom/mongodb/AggregationOutput;->_commandResult:Lcom/mongodb/CommandResult;

    .line 75
    iput-object p1, p0, Lcom/mongodb/AggregationOutput;->_cmd:Lcom/mongodb/DBObject;

    .line 77
    const-string/jumbo v0, "result"

    invoke-virtual {p2, v0}, Lcom/mongodb/CommandResult;->containsField(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    const-string/jumbo v0, "result"

    invoke-virtual {p2, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    iput-object v0, p0, Lcom/mongodb/AggregationOutput;->_resultSet:Ljava/lang/Iterable;

    .line 81
    return-void

    .line 80
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "result undefined"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getCommand()Lcom/mongodb/DBObject;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mongodb/AggregationOutput;->_cmd:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getCommandResult()Lcom/mongodb/CommandResult;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lcom/mongodb/AggregationOutput;->_commandResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method public getServerUsed()Lcom/mongodb/ServerAddress;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/AggregationOutput;->_commandResult:Lcom/mongodb/CommandResult;

    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v0

    return-object v0
.end method

.method public results()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mongodb/AggregationOutput;->_resultSet:Ljava/lang/Iterable;

    return-object v0
.end method
