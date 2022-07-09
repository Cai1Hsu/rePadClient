.class Lcom/mongodb/RawDBObject$ElementIter;
.super Ljava/lang/Object;
.source "RawDBObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/RawDBObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ElementIter"
.end annotation


# instance fields
.field _done:Z

.field _pos:I

.field final synthetic this$0:Lcom/mongodb/RawDBObject;


# direct methods
.method constructor <init>(Lcom/mongodb/RawDBObject;)V
    .locals 1

    .prologue
    .line 342
    iput-object p1, p0, Lcom/mongodb/RawDBObject$ElementIter;->this$0:Lcom/mongodb/RawDBObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 359
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/RawDBObject$ElementIter;->_done:Z

    .line 343
    iget v0, p1, Lcom/mongodb/RawDBObject;->_offset:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/mongodb/RawDBObject$ElementIter;->_pos:I

    .line 344
    return-void
.end method


# virtual methods
.method hasNext()Z
    .locals 2

    .prologue
    .line 347
    iget-boolean v0, p0, Lcom/mongodb/RawDBObject$ElementIter;->_done:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/mongodb/RawDBObject$ElementIter;->_pos:I

    iget-object v1, p0, Lcom/mongodb/RawDBObject$ElementIter;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v1, v1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method next()Lcom/mongodb/RawDBObject$Element;
    .locals 3

    .prologue
    .line 351
    new-instance v0, Lcom/mongodb/RawDBObject$Element;

    iget-object v1, p0, Lcom/mongodb/RawDBObject$ElementIter;->this$0:Lcom/mongodb/RawDBObject;

    iget v2, p0, Lcom/mongodb/RawDBObject$ElementIter;->_pos:I

    invoke-direct {v0, v1, v2}, Lcom/mongodb/RawDBObject$Element;-><init>(Lcom/mongodb/RawDBObject;I)V

    .line 352
    .local v0, "e":Lcom/mongodb/RawDBObject$Element;
    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->eoo()Z

    move-result v1

    iput-boolean v1, p0, Lcom/mongodb/RawDBObject$ElementIter;->_done:Z

    .line 354
    iget v1, p0, Lcom/mongodb/RawDBObject$ElementIter;->_pos:I

    invoke-virtual {v0}, Lcom/mongodb/RawDBObject$Element;->size()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/mongodb/RawDBObject$ElementIter;->_pos:I

    .line 355
    return-object v0
.end method
