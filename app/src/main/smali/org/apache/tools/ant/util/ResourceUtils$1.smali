.class Lorg/apache/tools/ant/util/ResourceUtils$1;
.super Ljava/lang/Object;
.source "ResourceUtils.java"

# interfaces
.implements Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;


# instance fields
.field private final val$granularity:J


# direct methods
.method constructor <init>(J)V
    .locals 1
    .param p1, "val$granularity"    # J

    .prologue
    .line 149
    iput-wide p1, p0, Lorg/apache/tools/ant/util/ResourceUtils$1;->val$granularity:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/util/ResourceUtils$1;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/tools/ant/util/ResourceUtils$1;

    .prologue
    .line 149
    iget-wide v0, p0, Lorg/apache/tools/ant/util/ResourceUtils$1;->val$granularity:J

    return-wide v0
.end method


# virtual methods
.method public getTargetSelectorForSource(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;
    .locals 1
    .param p1, "sr"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 150
    new-instance v0, Lorg/apache/tools/ant/util/ResourceUtils$2;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/util/ResourceUtils$2;-><init>(Lorg/apache/tools/ant/util/ResourceUtils$1;Lorg/apache/tools/ant/types/Resource;)V

    return-object v0
.end method
