.class Lorg/apache/tools/ant/types/Resource$1;
.super Ljava/lang/Object;
.source "Resource.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private done:Z

.field private final this$0:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/Resource;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 361
    iput-object p1, p0, Lorg/apache/tools/ant/types/Resource$1;->this$0:Lorg/apache/tools/ant/types/Resource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 350
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Resource$1;->done:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 352
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/Resource$1;->done:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 355
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/Resource$1;->done:Z

    if-eqz v0, :cond_0

    .line 356
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 358
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Resource$1;->done:Z

    .line 359
    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource$1;->this$0:Lorg/apache/tools/ant/types/Resource;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 362
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
