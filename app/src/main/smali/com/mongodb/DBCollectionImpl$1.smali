.class Lcom/mongodb/DBCollectionImpl$1;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl;->createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)V
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

.field final synthetic val$createIndexes:Lcom/mongodb/BasicDBObject;

.field final synthetic val$port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;Lcom/mongodb/BasicDBObject;)V
    .locals 0

    .prologue
    .line 353
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$1;->this$0:Lcom/mongodb/DBCollectionImpl;

    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$1;->val$port:Lcom/mongodb/DBPort;

    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$1;->val$createIndexes:Lcom/mongodb/BasicDBObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/mongodb/CommandResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$1;->val$port:Lcom/mongodb/DBPort;

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$1;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-static {v1}, Lcom/mongodb/DBCollectionImpl;->access$100(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/DBApiLayer;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$1;->val$createIndexes:Lcom/mongodb/BasicDBObject;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$1;->execute()Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method
