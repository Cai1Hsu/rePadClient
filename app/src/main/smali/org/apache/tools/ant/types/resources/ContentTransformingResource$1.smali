.class Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;
.super Ljava/lang/Object;
.source "ContentTransformingResource.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/Appendable;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/resources/ContentTransformingResource;

.field private final val$a:Lorg/apache/tools/ant/types/resources/Appendable;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/resources/ContentTransformingResource;Lorg/apache/tools/ant/types/resources/Appendable;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/ContentTransformingResource;
    .param p2, "val$a"    # Lorg/apache/tools/ant/types/resources/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;->this$0:Lorg/apache/tools/ant/types/resources/ContentTransformingResource;

    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;->val$a:Lorg/apache/tools/ant/types/resources/Appendable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppendOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;->val$a:Lorg/apache/tools/ant/types/resources/Appendable;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/resources/Appendable;->getAppendOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 126
    .local v0, "out":Ljava/io/OutputStream;
    if-eqz v0, :cond_0

    .line 127
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/ContentTransformingResource$1;->this$0:Lorg/apache/tools/ant/types/resources/ContentTransformingResource;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->wrapStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    .line 129
    :cond_0
    return-object v0
.end method
