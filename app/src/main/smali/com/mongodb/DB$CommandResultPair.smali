.class Lcom/mongodb/DB$CommandResultPair;
.super Ljava/lang/Object;
.source "DB.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DB;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CommandResultPair"
.end annotation


# instance fields
.field failure:Lcom/mongodb/CommandFailureException;

.field result:Lcom/mongodb/CommandResult;

.field final synthetic this$0:Lcom/mongodb/DB;


# direct methods
.method public constructor <init>(Lcom/mongodb/DB;Lcom/mongodb/CommandFailureException;)V
    .locals 0
    .param p2, "failure"    # Lcom/mongodb/CommandFailureException;

    .prologue
    .line 780
    iput-object p1, p0, Lcom/mongodb/DB$CommandResultPair;->this$0:Lcom/mongodb/DB;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 781
    iput-object p2, p0, Lcom/mongodb/DB$CommandResultPair;->failure:Lcom/mongodb/CommandFailureException;

    .line 782
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DB;Lcom/mongodb/CommandResult;)V
    .locals 0
    .param p2, "result"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 776
    iput-object p1, p0, Lcom/mongodb/DB$CommandResultPair;->this$0:Lcom/mongodb/DB;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 777
    iput-object p2, p0, Lcom/mongodb/DB$CommandResultPair;->result:Lcom/mongodb/CommandResult;

    .line 778
    return-void
.end method
