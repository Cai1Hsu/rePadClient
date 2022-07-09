.class public Lorg/bson/types/CodeWScope;
.super Lorg/bson/types/Code;
.source "CodeWScope.java"


# static fields
.field private static final serialVersionUID:J = -0x573835a7df0f9c82L


# instance fields
.field final _scope:Lorg/bson/BSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/bson/BSONObject;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "scope"    # Lorg/bson/BSONObject;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/bson/types/Code;-><init>(Ljava/lang/String;)V

    .line 32
    iput-object p2, p0, Lorg/bson/types/CodeWScope;->_scope:Lorg/bson/BSONObject;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 40
    instance-of v2, p1, Lorg/bson/types/CodeWScope;

    if-nez v2, :cond_1

    .line 44
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 43
    check-cast v0, Lorg/bson/types/CodeWScope;

    .line 44
    .local v0, "c":Lorg/bson/types/CodeWScope;
    iget-object v2, p0, Lorg/bson/types/CodeWScope;->_code:Ljava/lang/String;

    iget-object v3, v0, Lorg/bson/types/CodeWScope;->_code:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/bson/types/CodeWScope;->_scope:Lorg/bson/BSONObject;

    iget-object v3, v0, Lorg/bson/types/CodeWScope;->_scope:Lorg/bson/BSONObject;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getScope()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lorg/bson/types/CodeWScope;->_scope:Lorg/bson/BSONObject;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/bson/types/CodeWScope;->_code:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/bson/types/CodeWScope;->_scope:Lorg/bson/BSONObject;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
