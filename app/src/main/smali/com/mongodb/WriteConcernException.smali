.class public Lcom/mongodb/WriteConcernException;
.super Lcom/mongodb/MongoException;
.source "WriteConcernException.java"


# static fields
.field private static final serialVersionUID:J = 0xbac08b3e8a9a3e6L


# instance fields
.field private final commandResult:Lcom/mongodb/CommandResult;


# direct methods
.method constructor <init>(ILcom/mongodb/CommandResult;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 38
    invoke-virtual {p2}, Lcom/mongodb/CommandResult;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    .line 39
    iput-object p2, p0, Lcom/mongodb/WriteConcernException;->commandResult:Lcom/mongodb/CommandResult;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/CommandResult;)V
    .locals 1
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 34
    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->getCode()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/mongodb/WriteConcernException;-><init>(ILcom/mongodb/CommandResult;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getCommandResult()Lcom/mongodb/CommandResult;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/WriteConcernException;->commandResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method
