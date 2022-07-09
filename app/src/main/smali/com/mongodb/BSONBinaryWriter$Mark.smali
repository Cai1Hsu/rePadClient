.class Lcom/mongodb/BSONBinaryWriter$Mark;
.super Lcom/mongodb/BSONWriter$Mark;
.source "BSONBinaryWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BSONBinaryWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mark"
.end annotation


# instance fields
.field private final position:I

.field final synthetic this$0:Lcom/mongodb/BSONBinaryWriter;


# direct methods
.method protected constructor <init>(Lcom/mongodb/BSONBinaryWriter;)V
    .locals 1

    .prologue
    .line 419
    iput-object p1, p0, Lcom/mongodb/BSONBinaryWriter$Mark;->this$0:Lcom/mongodb/BSONBinaryWriter;

    invoke-direct {p0, p1}, Lcom/mongodb/BSONWriter$Mark;-><init>(Lcom/mongodb/BSONWriter;)V

    .line 420
    invoke-static {p1}, Lcom/mongodb/BSONBinaryWriter;->access$200(Lcom/mongodb/BSONBinaryWriter;)Lorg/bson/io/OutputBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    iput v0, p0, Lcom/mongodb/BSONBinaryWriter$Mark;->position:I

    .line 421
    return-void
.end method


# virtual methods
.method protected reset()V
    .locals 2

    .prologue
    .line 424
    invoke-super {p0}, Lcom/mongodb/BSONWriter$Mark;->reset()V

    .line 425
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter$Mark;->this$0:Lcom/mongodb/BSONBinaryWriter;

    invoke-static {v0}, Lcom/mongodb/BSONBinaryWriter;->access$200(Lcom/mongodb/BSONBinaryWriter;)Lorg/bson/io/OutputBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter$Mark;->this$0:Lcom/mongodb/BSONBinaryWriter;

    invoke-static {v1}, Lcom/mongodb/BSONBinaryWriter;->access$300(Lcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BSONBinaryWriter$Mark;

    move-result-object v1

    iget v1, v1, Lcom/mongodb/BSONBinaryWriter$Mark;->position:I

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->truncateToPosition(I)V

    .line 426
    return-void
.end method
