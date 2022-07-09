.class Lorg/apache/tools/ant/types/resources/Restrict$1;
.super Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;
.source "Restrict.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/resources/Restrict;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/resources/Restrict;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/Restrict;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/Restrict$1;->this$0:Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/LazyResourceCollectionWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method protected filterResource(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 43
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Restrict$1;->this$0:Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Restrict;->getSelectors()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v1, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 45
    const/4 v1, 0x1

    .line 48
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
