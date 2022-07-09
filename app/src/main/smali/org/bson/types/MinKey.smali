.class public Lorg/bson/types/MinKey;
.super Ljava/lang/Object;
.source "MinKey.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3890827d1eefd444L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 34
    instance-of v0, p1, Lorg/bson/types/MinKey;

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    const-string/jumbo v0, "MinKey"

    return-object v0
.end method
