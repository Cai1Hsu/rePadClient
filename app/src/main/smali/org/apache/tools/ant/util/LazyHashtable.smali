.class public Lorg/apache/tools/ant/util/LazyHashtable;
.super Ljava/util/Hashtable;
.source "LazyHashtable.java"


# instance fields
.field protected initAllDone:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/util/Hashtable;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyHashtable;->initAllDone:Z

    .line 39
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 87
    invoke-super {p0, p1}, Ljava/util/Hashtable;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 97
    invoke-super {p0, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 106
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/LazyHashtable;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 59
    invoke-super {p0}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected initAll()V
    .locals 1

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyHashtable;->initAllDone:Z

    if-eqz v0, :cond_0

    .line 50
    :goto_0
    return-void

    .line 49
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyHashtable;->initAllDone:Z

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 68
    invoke-super {p0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keys()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 115
    invoke-super {p0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LazyHashtable;->initAll()V

    .line 77
    invoke-super {p0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method
