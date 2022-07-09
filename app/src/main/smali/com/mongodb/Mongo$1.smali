.class Lcom/mongodb/Mongo$1;
.super Lorg/bson/util/SimplePool;
.source "Mongo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/Mongo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/util/SimplePool",
        "<",
        "Lorg/bson/io/PoolOutputBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/Mongo;


# direct methods
.method constructor <init>(Lcom/mongodb/Mongo;I)V
    .locals 0
    .param p2, "x0"    # I

    .prologue
    .line 671
    iput-object p1, p0, Lcom/mongodb/Mongo$1;->this$0:Lcom/mongodb/Mongo;

    invoke-direct {p0, p2}, Lorg/bson/util/SimplePool;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createNew()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 671
    invoke-virtual {p0}, Lcom/mongodb/Mongo$1;->createNew()Lorg/bson/io/PoolOutputBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected createNew()Lorg/bson/io/PoolOutputBuffer;
    .locals 1

    .prologue
    .line 674
    new-instance v0, Lorg/bson/io/PoolOutputBuffer;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer;-><init>()V

    return-object v0
.end method
