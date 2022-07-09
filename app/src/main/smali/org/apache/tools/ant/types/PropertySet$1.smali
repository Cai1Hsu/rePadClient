.class Lorg/apache/tools/ant/types/PropertySet$1;
.super Ljava/lang/Object;
.source "PropertySet.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/PropertySet;

.field private final val$iter:Ljava/util/Iterator;

.field private final val$m:Lorg/apache/tools/ant/util/FileNameMapper;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/PropertySet;Ljava/util/Iterator;Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/PropertySet;
    .param p2, "val$iter"    # Ljava/util/Iterator;
    .param p3, "val$m"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 525
    iput-object p1, p0, Lorg/apache/tools/ant/types/PropertySet$1;->this$0:Lorg/apache/tools/ant/types/PropertySet;

    iput-object p2, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$iter:Ljava/util/Iterator;

    iput-object p3, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$m:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 522
    new-instance v0, Lorg/apache/tools/ant/types/resources/PropertyResource;

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$1;->this$0:Lorg/apache/tools/ant/types/PropertySet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/PropertySet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/ant/types/resources/PropertyResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 523
    .local v0, "p":Lorg/apache/tools/ant/types/resources/PropertyResource;
    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$m:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v1, :cond_0

    .end local v0    # "p":Lorg/apache/tools/ant/types/resources/PropertyResource;
    :goto_0
    return-object v0

    .restart local v0    # "p":Lorg/apache/tools/ant/types/resources/PropertyResource;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/types/resources/MappedResource;

    iget-object v2, p0, Lorg/apache/tools/ant/types/PropertySet$1;->val$m:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/types/resources/MappedResource;-><init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 526
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
