.class public Lorg/bson/types/Code;
.super Ljava/lang/Object;
.source "Code.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x69970cd70016ee9L


# instance fields
.field final _code:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/bson/types/Code;->_code:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 39
    instance-of v1, p1, Lorg/bson/types/Code;

    if-nez v1, :cond_0

    .line 40
    const/4 v1, 0x0

    .line 43
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 42
    check-cast v0, Lorg/bson/types/Code;

    .line 43
    .local v0, "c":Lorg/bson/types/Code;
    iget-object v1, p0, Lorg/bson/types/Code;->_code:Ljava/lang/String;

    iget-object v2, v0, Lorg/bson/types/Code;->_code:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lorg/bson/types/Code;->_code:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/bson/types/Code;->_code:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/bson/types/Code;->getCode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
