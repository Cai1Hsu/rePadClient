.class public Lorg/bson/util/CopyOnWriteMap$Builder;
.super Ljava/lang/Object;
.source "CopyOnWriteMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/CopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final initialValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 104
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    sget-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->STABLE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    iput-object v0, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->initialValues:Ljava/util/Map;

    .line 104
    return-void
.end method


# virtual methods
.method public addAll(Ljava/util/Map;)Lorg/bson/util/CopyOnWriteMap$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)",
            "Lorg/bson/util/CopyOnWriteMap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget-object v0, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->initialValues:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 120
    return-object p0
.end method

.method public liveViews()Lorg/bson/util/CopyOnWriteMap$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/bson/util/CopyOnWriteMap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    sget-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    iput-object v0, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .line 129
    return-object p0
.end method

.method public newHashMap()Lorg/bson/util/CopyOnWriteMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    new-instance v0, Lorg/bson/util/CopyOnWriteMap$Hash;

    iget-object v1, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->initialValues:Ljava/util/Map;

    iget-object v2, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-direct {v0, v1, v2}, Lorg/bson/util/CopyOnWriteMap$Hash;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    return-object v0
.end method

.method public newLinkedMap()Lorg/bson/util/CopyOnWriteMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/bson/util/CopyOnWriteMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    new-instance v0, Lorg/bson/util/CopyOnWriteMap$Linked;

    iget-object v1, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->initialValues:Ljava/util/Map;

    iget-object v2, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-direct {v0, v1, v2}, Lorg/bson/util/CopyOnWriteMap$Linked;-><init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V

    return-object v0
.end method

.method public stableViews()Lorg/bson/util/CopyOnWriteMap$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/bson/util/CopyOnWriteMap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lorg/bson/util/CopyOnWriteMap$Builder;, "Lorg/bson/util/CopyOnWriteMap$Builder<TK;TV;>;"
    sget-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->STABLE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    iput-object v0, p0, Lorg/bson/util/CopyOnWriteMap$Builder;->viewType:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .line 111
    return-object p0
.end method
