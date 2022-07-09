.class Lcom/mongodb/DBCollectionImpl$2;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl;->sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;
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
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBCollectionImpl;

.field final synthetic val$buffer:Lorg/bson/io/PoolOutputBuffer;

.field final synthetic val$port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl;Lorg/bson/io/PoolOutputBuffer;Lcom/mongodb/DBPort;)V
    .locals 0

    .prologue
    .line 477
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$2;->val$buffer:Lorg/bson/io/PoolOutputBuffer;

    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 477
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$2;->execute()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public execute()Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$2;->val$buffer:Lorg/bson/io/PoolOutputBuffer;

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    invoke-virtual {v1}, Lcom/mongodb/DBPort;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/PoolOutputBuffer;->pipe(Ljava/io/OutputStream;)I

    .line 481
    const/4 v0, 0x0

    return-object v0
.end method
