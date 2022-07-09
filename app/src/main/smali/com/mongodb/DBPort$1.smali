.class Lcom/mongodb/DBPort$1;
.super Ljava/lang/Object;
.source "DBPort.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBPort;->call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
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
        "Lcom/mongodb/Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;

.field final synthetic val$coll:Lcom/mongodb/DBCollection;

.field final synthetic val$decoder:Lcom/mongodb/DBDecoder;

.field final synthetic val$msg:Lcom/mongodb/OutMessage;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    iput-object p2, p0, Lcom/mongodb/DBPort$1;->val$msg:Lcom/mongodb/OutMessage;

    iput-object p3, p0, Lcom/mongodb/DBPort$1;->val$coll:Lcom/mongodb/DBCollection;

    iput-object p4, p0, Lcom/mongodb/DBPort$1;->val$decoder:Lcom/mongodb/DBDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/mongodb/Response;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v0, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    new-instance v1, Lcom/mongodb/DBPort$ActiveState;

    iget-object v2, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/DBPort$1;->val$msg:Lcom/mongodb/OutMessage;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/DBPort$ActiveState;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBPort;->setActiveState(Lcom/mongodb/DBPort$ActiveState;)V

    .line 139
    iget-object v0, p0, Lcom/mongodb/DBPort$1;->val$msg:Lcom/mongodb/OutMessage;

    invoke-virtual {v0}, Lcom/mongodb/OutMessage;->prepare()V

    .line 140
    iget-object v0, p0, Lcom/mongodb/DBPort$1;->val$msg:Lcom/mongodb/OutMessage;

    iget-object v1, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    invoke-static {v1}, Lcom/mongodb/DBPort;->access$000(Lcom/mongodb/DBPort;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/OutMessage;->pipe(Ljava/io/OutputStream;)V

    .line 141
    new-instance v1, Lcom/mongodb/Response;

    iget-object v0, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    invoke-static {v0}, Lcom/mongodb/DBPort;->access$100(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerAddress;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBPort$1;->val$coll:Lcom/mongodb/DBCollection;

    iget-object v0, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    invoke-static {v0}, Lcom/mongodb/DBPort;->access$200(Lcom/mongodb/DBPort;)Ljava/io/InputStream;

    move-result-object v4

    iget-object v0, p0, Lcom/mongodb/DBPort$1;->val$decoder:Lcom/mongodb/DBDecoder;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBPort$1;->this$0:Lcom/mongodb/DBPort;

    invoke-static {v0}, Lcom/mongodb/DBPort;->access$300(Lcom/mongodb/DBPort;)Lcom/mongodb/DBDecoder;

    move-result-object v0

    :goto_0
    invoke-direct {v1, v2, v3, v4, v0}, Lcom/mongodb/Response;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/DBCollection;Ljava/io/InputStream;Lcom/mongodb/DBDecoder;)V

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBPort$1;->val$decoder:Lcom/mongodb/DBDecoder;

    goto :goto_0
.end method

.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/mongodb/DBPort$1;->execute()Lcom/mongodb/Response;

    move-result-object v0

    return-object v0
.end method
