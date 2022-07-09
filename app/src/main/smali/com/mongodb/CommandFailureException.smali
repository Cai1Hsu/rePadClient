.class public Lcom/mongodb/CommandFailureException;
.super Lcom/mongodb/MongoException;
.source "CommandFailureException.java"


# static fields
.field private static final serialVersionUID:J = -0x1062be69a062c00dL


# instance fields
.field private final commandResult:Lcom/mongodb/CommandResult;


# direct methods
.method public constructor <init>(Lcom/mongodb/CommandResult;)V
    .locals 2
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 32
    invoke-static {p1}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v0

    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    .line 33
    iput-object p1, p0, Lcom/mongodb/CommandFailureException;->commandResult:Lcom/mongodb/CommandResult;

    .line 34
    return-void
.end method


# virtual methods
.method public getCommandResult()Lcom/mongodb/CommandResult;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/CommandFailureException;->commandResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method
