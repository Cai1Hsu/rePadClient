.class Lcom/mongodb/DBTCPConnector$1;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
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
        "Lcom/mongodb/WriteResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBTCPConnector;

.field final synthetic val$concern:Lcom/mongodb/WriteConcern;

.field final synthetic val$db:Lcom/mongodb/DB;

.field final synthetic val$m:Lcom/mongodb/OutMessage;

.field final synthetic val$port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DB;)V
    .locals 0

    .prologue
    .line 181
    iput-object p1, p0, Lcom/mongodb/DBTCPConnector$1;->this$0:Lcom/mongodb/DBTCPConnector;

    iput-object p2, p0, Lcom/mongodb/DBTCPConnector$1;->val$port:Lcom/mongodb/DBPort;

    iput-object p3, p0, Lcom/mongodb/DBTCPConnector$1;->val$m:Lcom/mongodb/OutMessage;

    iput-object p4, p0, Lcom/mongodb/DBTCPConnector$1;->val$concern:Lcom/mongodb/WriteConcern;

    iput-object p5, p0, Lcom/mongodb/DBTCPConnector$1;->val$db:Lcom/mongodb/DB;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/mongodb/WriteResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$1;->val$port:Lcom/mongodb/DBPort;

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$1;->val$m:Lcom/mongodb/OutMessage;

    invoke-virtual {v0, v1}, Lcom/mongodb/DBPort;->say(Lcom/mongodb/OutMessage;)V

    .line 185
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$1;->val$concern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v0}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$1;->this$0:Lcom/mongodb/DBTCPConnector;

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$1;->val$db:Lcom/mongodb/DB;

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$1;->val$port:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector$1;->val$concern:Lcom/mongodb/WriteConcern;

    invoke-static {v0, v1, v2, v3}, Lcom/mongodb/DBTCPConnector;->access$000(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    .line 188
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mongodb/WriteResult;

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$1;->val$db:Lcom/mongodb/DB;

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$1;->val$port:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector$1;->val$concern:Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)V

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
    .line 181
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$1;->execute()Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method
