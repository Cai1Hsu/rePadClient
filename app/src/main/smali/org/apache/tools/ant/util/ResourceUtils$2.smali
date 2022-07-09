.class Lorg/apache/tools/ant/util/ResourceUtils$2;
.super Ljava/lang/Object;
.source "ResourceUtils.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/ResourceUtils$1;

.field private final val$sr:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/ResourceUtils$1;Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/ResourceUtils$1;
    .param p2, "val$sr"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/tools/ant/util/ResourceUtils$2;->this$0:Lorg/apache/tools/ant/util/ResourceUtils$1;

    iput-object p2, p0, Lorg/apache/tools/ant/util/ResourceUtils$2;->val$sr:Lorg/apache/tools/ant/types/Resource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 4
    .param p1, "target"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/tools/ant/util/ResourceUtils$2;->val$sr:Lorg/apache/tools/ant/types/Resource;

    iget-object v1, p0, Lorg/apache/tools/ant/util/ResourceUtils$2;->this$0:Lorg/apache/tools/ant/util/ResourceUtils$1;

    invoke-static {v1}, Lorg/apache/tools/ant/util/ResourceUtils$1;->access$000(Lorg/apache/tools/ant/util/ResourceUtils$1;)J

    move-result-wide v2

    invoke-static {v0, p1, v2, v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z

    move-result v0

    return v0
.end method
