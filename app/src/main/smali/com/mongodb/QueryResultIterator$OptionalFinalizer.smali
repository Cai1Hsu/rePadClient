.class Lcom/mongodb/QueryResultIterator$OptionalFinalizer;
.super Ljava/lang/Object;
.source "QueryResultIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/QueryResultIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OptionalFinalizer"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/QueryResultIterator;


# direct methods
.method private constructor <init>(Lcom/mongodb/QueryResultIterator;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/QueryResultIterator;Lcom/mongodb/QueryResultIterator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/QueryResultIterator;
    .param p2, "x1"    # Lcom/mongodb/QueryResultIterator$1;

    .prologue
    .line 248
    invoke-direct {p0, p1}, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;-><init>(Lcom/mongodb/QueryResultIterator;)V

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 251
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-static {v0}, Lcom/mongodb/QueryResultIterator;->access$100(Lcom/mongodb/QueryResultIterator;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-static {v0}, Lcom/mongodb/QueryResultIterator;->access$200(Lcom/mongodb/QueryResultIterator;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-static {v0}, Lcom/mongodb/QueryResultIterator;->access$400(Lcom/mongodb/QueryResultIterator;)Lcom/mongodb/DBApiLayer;

    move-result-object v0

    new-instance v1, Lcom/mongodb/DBApiLayer$DeadCursor;

    iget-object v2, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-static {v2}, Lcom/mongodb/QueryResultIterator;->access$200(Lcom/mongodb/QueryResultIterator;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/mongodb/QueryResultIterator$OptionalFinalizer;->this$0:Lcom/mongodb/QueryResultIterator;

    invoke-static {v4}, Lcom/mongodb/QueryResultIterator;->access$300(Lcom/mongodb/QueryResultIterator;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/mongodb/DBApiLayer$DeadCursor;-><init>(JLcom/mongodb/ServerAddress;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/DBApiLayer;->addDeadCursor(Lcom/mongodb/DBApiLayer$DeadCursor;)V

    .line 254
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 255
    return-void
.end method
