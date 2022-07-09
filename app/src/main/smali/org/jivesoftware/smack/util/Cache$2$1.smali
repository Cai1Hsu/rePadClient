.class Lorg/jivesoftware/smack/util/Cache$2$1;
.super Ljava/lang/Object;
.source "Cache.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/util/Cache$2;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Lorg/jivesoftware/smack/util/Cache$CacheObject",
            "<TV;>;>;>;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lorg/jivesoftware/smack/util/Cache$2;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/util/Cache$2;)V
    .locals 1

    .prologue
    .line 294
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$2$1;, "Lorg/jivesoftware/smack/util/Cache$2.1;"
    iput-object p1, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->this$1:Lorg/jivesoftware/smack/util/Cache$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->this$1:Lorg/jivesoftware/smack/util/Cache$2;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/Cache$2;->access$000(Lorg/jivesoftware/smack/util/Cache$2;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->it:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 297
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$2$1;, "Lorg/jivesoftware/smack/util/Cache$2.1;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 294
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$2$1;, "Lorg/jivesoftware/smack/util/Cache$2.1;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache$2$1;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 301
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$2$1;, "Lorg/jivesoftware/smack/util/Cache$2.1;"
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 302
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Lorg/jivesoftware/smack/util/Cache$CacheObject<TV;>;>;"
    new-instance v2, Lorg/jivesoftware/smack/util/Cache$2$1$1;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;

    iget-object v1, v1, Lorg/jivesoftware/smack/util/Cache$CacheObject;->object:Ljava/lang/Object;

    invoke-direct {v2, p0, v3, v1}, Lorg/jivesoftware/smack/util/Cache$2$1$1;-><init>(Lorg/jivesoftware/smack/util/Cache$2$1;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 311
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$2$1;, "Lorg/jivesoftware/smack/util/Cache$2.1;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$2$1;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 312
    return-void
.end method
