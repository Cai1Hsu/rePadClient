.class Lcom/mongodb/DBCollectionImpl$3;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl;->receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/DBPort$Operation",
        "<",
        "Lcom/mongodb/CommandResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBCollectionImpl;

.field final synthetic val$port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)V
    .locals 0

    .prologue
    .line 491
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$3;->this$0:Lcom/mongodb/DBCollectionImpl;

    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$3;->val$port:Lcom/mongodb/DBPort;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/mongodb/CommandResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 494
    new-instance v0, Lcom/mongodb/Response;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$3;->val$port:Lcom/mongodb/DBPort;

    invoke-virtual {v2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mongodb/DBCollectionImpl$3;->val$port:Lcom/mongodb/DBPort;

    invoke-virtual {v4}, Lcom/mongodb/DBPort;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    invoke-interface {v5}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/mongodb/Response;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/DBCollection;Ljava/io/InputStream;Lcom/mongodb/DBDecoder;)V

    .line 496
    .local v0, "response":Lcom/mongodb/Response;
    new-instance v1, Lcom/mongodb/CommandResult;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$3;->val$port:Lcom/mongodb/DBPort;

    invoke-virtual {v2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 497
    .local v1, "writeCommandResult":Lcom/mongodb/CommandResult;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/mongodb/Response;->get(I)Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 498
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 499
    return-object v1
.end method

.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 491
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$3;->execute()Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method
