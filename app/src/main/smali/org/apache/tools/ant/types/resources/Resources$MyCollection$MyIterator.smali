.class Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;
.super Ljava/lang/Object;
.source "Resources.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/resources/Resources$MyCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyIterator"
.end annotation


# instance fields
.field private rci:Ljava/util/Iterator;

.field private ri:Ljava/util/Iterator;

.field private final this$1:Lorg/apache/tools/ant/types/resources/Resources$MyCollection;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;)V
    .locals 1
    .param p1, "this$1"    # Lorg/apache/tools/ant/types/resources/Resources$MyCollection;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->this$1:Lorg/apache/tools/ant/types/resources/Resources$MyCollection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->this$1:Lorg/apache/tools/ant/types/resources/Resources$MyCollection;

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;->access$200(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;)Lorg/apache/tools/ant/types/resources/Resources;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/Resources;->access$300(Lorg/apache/tools/ant/types/resources/Resources;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->rci:Ljava/util/Iterator;

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;Lorg/apache/tools/ant/types/resources/Resources$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/resources/Resources$MyCollection;
    .param p2, "x1"    # Lorg/apache/tools/ant/types/resources/Resources$1;

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;-><init>(Lorg/apache/tools/ant/types/resources/Resources$MyCollection;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 95
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 96
    .local v0, "result":Z
    :goto_0
    if-nez v0, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->rci:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 97
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->rci:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    .line 98
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    goto :goto_0

    .line 95
    .end local v0    # "result":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 100
    .restart local v0    # "result":Z
    :cond_1
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 103
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 106
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator;->ri:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 109
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
