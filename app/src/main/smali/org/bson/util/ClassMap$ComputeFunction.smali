.class final Lorg/bson/util/ClassMap$ComputeFunction;
.super Ljava/lang/Object;
.source "ClassMap.java"

# interfaces
.implements Lorg/bson/util/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/ClassMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ComputeFunction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/bson/util/Function",
        "<",
        "Ljava/lang/Class",
        "<*>;TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/util/ClassMap;


# direct methods
.method private constructor <init>(Lorg/bson/util/ClassMap;)V
    .locals 0

    .prologue
    .line 51
    .local p0, "this":Lorg/bson/util/ClassMap$ComputeFunction;, "Lorg/bson/util/ClassMap<TT;>.ComputeFunction;"
    iput-object p1, p0, Lorg/bson/util/ClassMap$ComputeFunction;->this$0:Lorg/bson/util/ClassMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/bson/util/ClassMap;Lorg/bson/util/ClassMap$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/bson/util/ClassMap;
    .param p2, "x1"    # Lorg/bson/util/ClassMap$1;

    .prologue
    .line 51
    .local p0, "this":Lorg/bson/util/ClassMap$ComputeFunction;, "Lorg/bson/util/ClassMap<TT;>.ComputeFunction;"
    invoke-direct {p0, p1}, Lorg/bson/util/ClassMap$ComputeFunction;-><init>(Lorg/bson/util/ClassMap;)V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)TT;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lorg/bson/util/ClassMap$ComputeFunction;, "Lorg/bson/util/ClassMap<TT;>.ComputeFunction;"
    .local p1, "a":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/bson/util/ClassMap;->getAncestry(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 55
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lorg/bson/util/ClassMap$ComputeFunction;->this$0:Lorg/bson/util/ClassMap;

    invoke-static {v3}, Lorg/bson/util/ClassMap;->access$000(Lorg/bson/util/ClassMap;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 56
    .local v2, "result":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_0

    .line 60
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 51
    .local p0, "this":Lorg/bson/util/ClassMap$ComputeFunction;, "Lorg/bson/util/ClassMap<TT;>.ComputeFunction;"
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/bson/util/ClassMap$ComputeFunction;->apply(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
