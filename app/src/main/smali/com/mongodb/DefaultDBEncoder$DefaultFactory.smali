.class Lcom/mongodb/DefaultDBEncoder$DefaultFactory;
.super Ljava/lang/Object;
.source "DefaultDBEncoder.java"

# interfaces
.implements Lcom/mongodb/DBEncoderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DefaultDBEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DefaultFactory"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/mongodb/DBEncoder;
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/mongodb/DefaultDBEncoder;

    invoke-direct {v0}, Lcom/mongodb/DefaultDBEncoder;-><init>()V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    const-string/jumbo v0, "DefaultDBEncoder.DefaultFactory"

    return-object v0
.end method
