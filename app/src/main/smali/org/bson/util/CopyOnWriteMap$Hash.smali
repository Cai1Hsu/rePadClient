.class Lorg/bson/util/CopyOnWriteMap$Hash;
.super Lorg/bson/util/CopyOnWriteMap;
.source "CopyOnWriteMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/CopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Hash"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/bson/util/CopyOnWriteMap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x4877a61eb28c8c11L


# direct methods
.method constructor <init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V
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
    .line 248
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Hash;, "Lorg/bson/util/CopyOnWriteMap$Hash<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-direct {p0, p1, p2}, Lorg/bson/util/CopyOnWriteMap;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    .line 249
    return-void
.end method


# virtual methods
.method public copy(Ljava/util/Map;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N::",
            "Ljava/util/Map",
            "<+TK;+TV;>;>(TN;)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 253
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Hash;, "Lorg/bson/util/CopyOnWriteMap$Hash<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "TN;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method
