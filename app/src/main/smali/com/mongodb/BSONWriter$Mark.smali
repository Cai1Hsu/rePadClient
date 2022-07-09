.class Lcom/mongodb/BSONWriter$Mark;
.super Ljava/lang/Object;
.source "BSONWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BSONWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mark"
.end annotation


# instance fields
.field private final currentName:Ljava/lang/String;

.field private final markedContext:Lcom/mongodb/BSONWriter$Context;

.field private final markedState:Lcom/mongodb/BSONWriter$State;

.field private final serializationDepth:I

.field final synthetic this$0:Lcom/mongodb/BSONWriter;


# direct methods
.method protected constructor <init>(Lcom/mongodb/BSONWriter;)V
    .locals 1

    .prologue
    .line 587
    iput-object p1, p0, Lcom/mongodb/BSONWriter$Mark;->this$0:Lcom/mongodb/BSONWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 588
    invoke-static {p1}, Lcom/mongodb/BSONWriter;->access$000(Lcom/mongodb/BSONWriter;)Lcom/mongodb/BSONWriter$Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BSONWriter$Context;->copy()Lcom/mongodb/BSONWriter$Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->markedContext:Lcom/mongodb/BSONWriter$Context;

    .line 589
    invoke-static {p1}, Lcom/mongodb/BSONWriter;->access$100(Lcom/mongodb/BSONWriter;)Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->markedState:Lcom/mongodb/BSONWriter$State;

    .line 590
    invoke-static {p1}, Lcom/mongodb/BSONWriter;->access$200(Lcom/mongodb/BSONWriter;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->currentName:Ljava/lang/String;

    .line 591
    invoke-static {p1}, Lcom/mongodb/BSONWriter;->access$300(Lcom/mongodb/BSONWriter;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/BSONWriter$Mark;->serializationDepth:I

    .line 592
    return-void
.end method


# virtual methods
.method protected reset()V
    .locals 2

    .prologue
    .line 595
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->this$0:Lcom/mongodb/BSONWriter;

    iget-object v1, p0, Lcom/mongodb/BSONWriter$Mark;->markedContext:Lcom/mongodb/BSONWriter$Context;

    invoke-virtual {v0, v1}, Lcom/mongodb/BSONWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 596
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->this$0:Lcom/mongodb/BSONWriter;

    iget-object v1, p0, Lcom/mongodb/BSONWriter$Mark;->markedState:Lcom/mongodb/BSONWriter$State;

    invoke-virtual {v0, v1}, Lcom/mongodb/BSONWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 597
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->this$0:Lcom/mongodb/BSONWriter;

    iget-object v1, p0, Lcom/mongodb/BSONWriter$Mark;->currentName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mongodb/BSONWriter;->access$202(Lcom/mongodb/BSONWriter;Ljava/lang/String;)Ljava/lang/String;

    .line 598
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Mark;->this$0:Lcom/mongodb/BSONWriter;

    iget v1, p0, Lcom/mongodb/BSONWriter$Mark;->serializationDepth:I

    invoke-static {v0, v1}, Lcom/mongodb/BSONWriter;->access$302(Lcom/mongodb/BSONWriter;I)I

    .line 599
    return-void
.end method
