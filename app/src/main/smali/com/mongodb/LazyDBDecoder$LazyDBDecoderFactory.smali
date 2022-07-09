.class Lcom/mongodb/LazyDBDecoder$LazyDBDecoderFactory;
.super Ljava/lang/Object;
.source "LazyDBDecoder.java"

# interfaces
.implements Lcom/mongodb/DBDecoderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/LazyDBDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LazyDBDecoderFactory"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/mongodb/DBDecoder;
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/mongodb/LazyDBDecoder;

    invoke-direct {v0}, Lcom/mongodb/LazyDBDecoder;-><init>()V

    return-object v0
.end method
