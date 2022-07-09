.class abstract Lorg/bson/util/CopyOnWriteMap;
.super Lorg/bson/util/AbstractCopyOnWriteMap;
.source "CopyOnWriteMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/util/CopyOnWriteMap$Linked;,
        Lorg/bson/util/CopyOnWriteMap$Hash;,
        Lorg/bson/util/CopyOnWriteMap$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/bson/util/AbstractCopyOnWriteMap",
        "<TK;TV;",
        "Ljava/util/Map",
        "<TK;TV;>;>;"
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/ThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6e209c6cd39d23fdL


# direct methods
.method protected constructor <init>()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap;, "Lorg/bson/util/CopyOnWriteMap<TK;TV;>;"
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-direct {p0, v0, v1}, Lorg/bson/util/CopyOnWriteMap;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    .line 212
    return-void
.end method

.method protected constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 200
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap;, "Lorg/bson/util/CopyOnWriteMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    sget-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-direct {p0, p1, v0}, Lorg/bson/util/CopyOnWriteMap;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    .line 201
    return-void
.end method

.method protected constructor <init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V
    .locals 0
    .param p2, "viewType"    # Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;",
            "Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap;, "Lorg/bson/util/CopyOnWriteMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-direct {p0, p1, p2}, Lorg/bson/util/AbstractCopyOnWriteMap;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    .line 223
    return-void
.end method

.method protected constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V
    .locals 1
    .param p1, "viewType"    # Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .prologue
    .line 230
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap;, "Lorg/bson/util/CopyOnWriteMap<TK;TV;>;"
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/bson/util/AbstractCopyOnWriteMap;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    .line 231
    return-void
.end method

.method public static builder()Lorg/bson/util/CopyOnWriteMap$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/bson/util/CopyOnWriteMap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Lorg/bson/util/CopyOnWriteMap$Builder;

    invoke-direct {v0}, Lorg/bson/util/CopyOnWriteMap$Builder;-><init>()V

    return-object v0
.end method

.method public static newHashMap()Lorg/bson/util/CopyOnWriteMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 147
    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->builder()Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v0

    .line 148
    .local v0, "builder":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    invoke-virtual {v0}, Lorg/bson/util/CopyOnWriteMap$Builder;->newHashMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v1

    return-object v1
.end method

.method public static newHashMap(Ljava/util/Map;)Lorg/bson/util/CopyOnWriteMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->builder()Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v0

    .line 159
    .local v0, "builder":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    invoke-virtual {v0, p0}, Lorg/bson/util/CopyOnWriteMap$Builder;->addAll(Ljava/util/Map;)Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/bson/util/CopyOnWriteMap$Builder;->newHashMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v1

    return-object v1
.end method

.method public static newLinkedMap()Lorg/bson/util/CopyOnWriteMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 170
    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->builder()Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v0

    .line 171
    .local v0, "builder":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    invoke-virtual {v0}, Lorg/bson/util/CopyOnWriteMap$Builder;->newLinkedMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v1

    return-object v1
.end method

.method public static newLinkedMap(Ljava/util/Map;)Lorg/bson/util/CopyOnWriteMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-static {}, Lorg/bson/util/CopyOnWriteMap;->builder()Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v0

    .line 183
    .local v0, "builder":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    invoke-virtual {v0, p0}, Lorg/bson/util/CopyOnWriteMap$Builder;->addAll(Ljava/util/Map;)Lorg/bson/util/CopyOnWriteMap$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/bson/util/CopyOnWriteMap$Builder;->newLinkedMap()Lorg/bson/util/CopyOnWriteMap;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected abstract copy(Ljava/util/Map;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N::",
            "Ljava/util/Map",
            "<+TK;+TV;>;>(TN;)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Lorg/bson/util/annotations/GuardedBy;
        value = "internal-lock"
    .end annotation
.end method
