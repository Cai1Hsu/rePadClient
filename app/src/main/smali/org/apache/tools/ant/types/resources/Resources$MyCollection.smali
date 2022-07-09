.class Lorg/apache/tools/ant/types/resources/Resources$MyCollection;
.super Ljava/util/AbstractCollection;
.source "Resources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/resources/Resources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCollection"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;
    }
.end annotation


# instance fields
.field private cached:Ljava/util/Collection;

.field private final this$0:Lorg/apache/tools/ant/types/resources/Resources;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/resources/Resources;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/Resources;

    .prologue
    .line 72
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->this$0:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 73
    return-void
.end method

.method static access$200(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;)Lorg/apache/tools/ant/types/resources/Resources;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/Resources$MyCollection;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->this$0:Lorg/apache/tools/ant/types/resources/Resources;

    return-object v0
.end method

.method private declared-synchronized getCache()Ljava/util/Collection;
    .locals 3

    .prologue
    .line 81
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->cached:Ljava/util/Collection;

    .line 82
    .local v0, "coll":Ljava/util/Collection;
    if-nez v0, :cond_0

    .line 83
    new-instance v1, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;-><init>(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;Lorg/apache/tools/ant/types/resources/Resources$1;)V

    invoke-static {v1}, Lorg/apache/tools/ant/util/CollectionUtils;->asCollection(Ljava/util/Iterator;)Ljava/util/Collection;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->this$0:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/Resources;->access$100(Lorg/apache/tools/ant/types/resources/Resources;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 85
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->cached:Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :cond_0
    monitor-exit p0

    return-object v0

    .line 81
    .end local v0    # "coll":Ljava/util/Collection;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->getCache()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->getCache()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method
