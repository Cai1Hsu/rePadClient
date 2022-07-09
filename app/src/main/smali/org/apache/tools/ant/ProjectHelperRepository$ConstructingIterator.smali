.class Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;
.super Ljava/lang/Object;
.source "ProjectHelperRepository.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/ProjectHelperRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConstructingIterator"
.end annotation


# instance fields
.field private empty:Z

.field private final nested:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 1
    .param p1, "nested"    # Ljava/util/Iterator;

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 309
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->empty:Z

    .line 312
    iput-object p1, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->nested:Ljava/util/Iterator;

    .line 313
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->nested:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->empty:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 321
    iget-object v2, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->nested:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 322
    iget-object v2, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->nested:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 329
    .local v0, "c":Ljava/lang/reflect/Constructor;
    :goto_0
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->access$100()[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 325
    .end local v0    # "c":Ljava/lang/reflect/Constructor;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;->empty:Z

    .line 326
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->access$000()Ljava/lang/reflect/Constructor;

    move-result-object v0

    .restart local v0    # "c":Ljava/lang/reflect/Constructor;
    goto :goto_0

    .line 330
    :catch_0
    move-exception v1

    .line 331
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed to invoke no-arg constructor on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 337
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "remove is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
