.class Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;
.super Ljava/lang/Object;
.source "AbstractCopyOnWriteMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/AbstractCopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnmodifiableIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final delegate:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 467
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;, "Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator<TT;>;"
    .local p1, "delegate":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 468
    iput-object p1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;->delegate:Ljava/util/Iterator;

    .line 469
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 472
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;, "Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator<TT;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;->delegate:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 476
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;, "Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator<TT;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;->delegate:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 480
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;, "Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
