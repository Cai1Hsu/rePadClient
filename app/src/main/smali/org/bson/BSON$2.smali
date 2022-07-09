.class final Lorg/bson/BSON$2;
.super Ljava/lang/ThreadLocal;
.source "BSON.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/BSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lorg/bson/BSONDecoder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 329
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 329
    invoke-virtual {p0}, Lorg/bson/BSON$2;->initialValue()Lorg/bson/BSONDecoder;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Lorg/bson/BSONDecoder;
    .locals 1

    .prologue
    .line 331
    new-instance v0, Lorg/bson/BasicBSONDecoder;

    invoke-direct {v0}, Lorg/bson/BasicBSONDecoder;-><init>()V

    return-object v0
.end method
