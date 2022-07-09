.class Lcom/mongodb/DBPort$2;
.super Ljava/lang/Object;
.source "DBPort.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBPort;->say(Lcom/mongodb/OutMessage;)V
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
.field final synthetic this$0:Lcom/mongodb/DBPort;

.field final synthetic val$msg:Lcom/mongodb/OutMessage;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;)V
    .locals 0

    .prologue
    .line 148
    iput-object p1, p0, Lcom/mongodb/DBPort$2;->this$0:Lcom/mongodb/DBPort;

    iput-object p2, p0, Lcom/mongodb/DBPort$2;->val$msg:Lcom/mongodb/OutMessage;

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
    .line 148
    invoke-virtual {p0}, Lcom/mongodb/DBPort$2;->execute()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public execute()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcom/mongodb/DBPort$2;->this$0:Lcom/mongodb/DBPort;

    new-instance v1, Lcom/mongodb/DBPort$ActiveState;

    iget-object v2, p0, Lcom/mongodb/DBPort$2;->this$0:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/DBPort$2;->val$msg:Lcom/mongodb/OutMessage;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/DBPort$ActiveState;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBPort;->setActiveState(Lcom/mongodb/DBPort$ActiveState;)V

    .line 152
    iget-object v0, p0, Lcom/mongodb/DBPort$2;->val$msg:Lcom/mongodb/OutMessage;

    invoke-virtual {v0}, Lcom/mongodb/OutMessage;->prepare()V

    .line 153
    iget-object v0, p0, Lcom/mongodb/DBPort$2;->val$msg:Lcom/mongodb/OutMessage;

    iget-object v1, p0, Lcom/mongodb/DBPort$2;->this$0:Lcom/mongodb/DBPort;

    invoke-static {v1}, Lcom/mongodb/DBPort;->access$000(Lcom/mongodb/DBPort;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/OutMessage;->pipe(Ljava/io/OutputStream;)V

    .line 154
    const/4 v0, 0x0

    return-object v0
.end method
