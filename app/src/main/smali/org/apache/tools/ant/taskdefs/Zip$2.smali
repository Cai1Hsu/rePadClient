.class Lorg/apache/tools/ant/taskdefs/Zip$2;
.super Ljava/lang/Object;
.source "Zip.java"

# interfaces
.implements Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTargetSelectorForSource(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;
    .locals 1
    .param p1, "sr"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 116
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Zip;->access$000()Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    move-result-object v0

    return-object v0
.end method
