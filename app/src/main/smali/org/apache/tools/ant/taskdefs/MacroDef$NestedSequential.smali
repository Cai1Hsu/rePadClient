.class public Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;
.super Ljava/lang/Object;
.source "MacroDef.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NestedSequential"
.end annotation


# instance fields
.field private nested:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    return-void
.end method

.method public getNested()Ljava/util/List;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    return-object v0
.end method

.method public similar(Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;)Z
    .locals 6
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    .prologue
    const/4 v4, 0x0

    .line 164
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    .line 165
    .local v3, "size":I
    iget-object v5, p1, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v3, v5, :cond_1

    .line 175
    :cond_0
    :goto_0
    return v4

    .line 168
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v3, :cond_2

    .line 169
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/UnknownElement;

    .line 170
    .local v1, "me":Lorg/apache/tools/ant/UnknownElement;
    iget-object v5, p1, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->nested:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/UnknownElement;

    .line 171
    .local v2, "o":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/UnknownElement;->similar(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 168
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 175
    .end local v1    # "me":Lorg/apache/tools/ant/UnknownElement;
    .end local v2    # "o":Lorg/apache/tools/ant/UnknownElement;
    :cond_2
    const/4 v4, 0x1

    goto :goto_0
.end method
