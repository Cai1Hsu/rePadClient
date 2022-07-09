.class Lorg/jivesoftware/smack/util/Cache$1;
.super Ljava/util/AbstractCollection;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/util/Cache;->values()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/util/Cache;

.field values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/util/Cache$CacheObject",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/util/Cache;)V
    .locals 1

    .prologue
    .line 223
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$1;, "Lorg/jivesoftware/smack/util/Cache.1;"
    iput-object p1, p0, Lorg/jivesoftware/smack/util/Cache$1;->this$0:Lorg/jivesoftware/smack/util/Cache;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 224
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$1;->this$0:Lorg/jivesoftware/smack/util/Cache;

    iget-object v0, v0, Lorg/jivesoftware/smack/util/Cache;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache$1;->values:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$1;, "Lorg/jivesoftware/smack/util/Cache.1;"
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$1$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/Cache$1$1;-><init>(Lorg/jivesoftware/smack/util/Cache$1;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 244
    .local p0, "this":Lorg/jivesoftware/smack/util/Cache$1;, "Lorg/jivesoftware/smack/util/Cache.1;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$1;->values:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method
