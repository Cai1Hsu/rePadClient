.class public Lorg/apache/tools/ant/util/IdentityStack;
.super Ljava/util/Stack;
.source "IdentityStack.java"


# static fields
.field private static final serialVersionUID:J = -0x4d192e6376540bf6L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/util/Stack;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/util/Stack;-><init>()V

    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/IdentityStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    return-void
.end method

.method public static getInstance(Ljava/util/Stack;)Lorg/apache/tools/ant/util/IdentityStack;
    .locals 2
    .param p0, "s"    # Ljava/util/Stack;

    .prologue
    .line 36
    instance-of v1, p0, Lorg/apache/tools/ant/util/IdentityStack;

    if-eqz v1, :cond_0

    .line 37
    check-cast p0, Lorg/apache/tools/ant/util/IdentityStack;

    .line 43
    .end local p0    # "s":Ljava/util/Stack;
    .local v0, "result":Lorg/apache/tools/ant/util/IdentityStack;
    :goto_0
    return-object p0

    .line 39
    .end local v0    # "result":Lorg/apache/tools/ant/util/IdentityStack;
    .restart local p0    # "s":Ljava/util/Stack;
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/util/IdentityStack;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/IdentityStack;-><init>()V

    .line 40
    .restart local v0    # "result":Lorg/apache/tools/ant/util/IdentityStack;
    if-eqz p0, :cond_1

    .line 41
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/IdentityStack;->addAll(Ljava/util/Collection;)Z

    :cond_1
    move-object p0, v0

    .line 43
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/IdentityStack;->indexOf(Ljava/lang/Object;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized indexOf(Ljava/lang/Object;I)I
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "pos"    # I

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/IdentityStack;->size()I

    move-result v1

    .line 81
    .local v1, "size":I
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 82
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/IdentityStack;->get(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 86
    .end local v0    # "i":I
    :goto_1
    monitor-exit p0

    return v0

    .line 81
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 86
    :cond_1
    const/4 v0, -0x1

    goto :goto_1

    .line 80
    .end local v0    # "i":I
    .end local v1    # "size":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized lastIndexOf(Ljava/lang/Object;I)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "pos"    # I

    .prologue
    .line 97
    monitor-enter p0

    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 98
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/IdentityStack;->get(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-ne v1, p1, :cond_0

    .line 102
    .end local v0    # "i":I
    :goto_1
    monitor-exit p0

    return v0

    .line 97
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 102
    :cond_1
    const/4 v0, -0x1

    goto :goto_1

    .line 97
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
