.class Lcom/mongodb/DefaultDBDecoder$DefaultFactory;
.super Ljava/lang/Object;
.source "DefaultDBDecoder.java"

# interfaces
.implements Lcom/mongodb/DBDecoderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DefaultDBDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DefaultFactory"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/mongodb/DBDecoder;
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/mongodb/DefaultDBDecoder;

    invoke-direct {v0}, Lcom/mongodb/DefaultDBDecoder;-><init>()V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    const-string/jumbo v0, "DefaultDBDecoder.DefaultFactory"

    return-object v0
.end method
