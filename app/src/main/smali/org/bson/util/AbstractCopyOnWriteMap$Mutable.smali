.class final Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;
.super Lorg/bson/util/AbstractCopyOnWriteMap$View;
.source "AbstractCopyOnWriteMap.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/AbstractCopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Mutable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/util/AbstractCopyOnWriteMap$View",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x168b749907147e42L


# instance fields
.field private final transient entrySet:Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/AbstractCopyOnWriteMap",
            "<TK;TV;TM;>.EntrySet;"
        }
    .end annotation
.end field

.field private final transient keySet:Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/AbstractCopyOnWriteMap",
            "<TK;TV;TM;>.KeySet;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

.field private final transient values:Lorg/bson/util/AbstractCopyOnWriteMap$Values;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/AbstractCopyOnWriteMap",
            "<TK;TV;TM;>.Values;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap;)V
    .locals 3

    .prologue
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Mutable;"
    const/4 v2, 0x0

    .line 608
    iput-object p1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {p0}, Lorg/bson/util/AbstractCopyOnWriteMap$View;-><init>()V

    .line 612
    new-instance v0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {v0, v1, v2}, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;-><init>(Lorg/bson/util/AbstractCopyOnWriteMap;Lorg/bson/util/AbstractCopyOnWriteMap$1;)V

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->keySet:Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;

    .line 613
    new-instance v0, Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {v0, v1, v2}, Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;-><init>(Lorg/bson/util/AbstractCopyOnWriteMap;Lorg/bson/util/AbstractCopyOnWriteMap$1;)V

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->entrySet:Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;

    .line 614
    new-instance v0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {v0, v1, v2}, Lorg/bson/util/AbstractCopyOnWriteMap$Values;-><init>(Lorg/bson/util/AbstractCopyOnWriteMap;Lorg/bson/util/AbstractCopyOnWriteMap$1;)V

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->values:Lorg/bson/util/AbstractCopyOnWriteMap$Values;

    return-void
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 623
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Mutable;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->entrySet:Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 618
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Mutable;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->keySet:Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 628
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Mutable;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;->values:Lorg/bson/util/AbstractCopyOnWriteMap$Values;

    return-object v0
.end method
