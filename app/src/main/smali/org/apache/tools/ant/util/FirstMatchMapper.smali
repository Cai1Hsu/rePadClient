.class public Lorg/apache/tools/ant/util/FirstMatchMapper;
.super Lorg/apache/tools/ant/util/ContainerMapper;
.source "FirstMatchMapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ContainerMapper;-><init>()V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/FirstMatchMapper;->getMappers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 34
    .local v2, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    if-eqz v2, :cond_0

    .line 35
    invoke-interface {v2, p1}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "mapped":[Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 41
    .end local v1    # "mapped":[Ljava/lang/String;
    .end local v2    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
