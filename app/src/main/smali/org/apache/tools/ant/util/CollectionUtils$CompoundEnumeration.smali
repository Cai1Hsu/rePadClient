.class final Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;
.super Ljava/lang/Object;
.source "CollectionUtils.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/CollectionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CompoundEnumeration"
.end annotation


# instance fields
.field private final e1:Ljava/util/Enumeration;

.field private final e2:Ljava/util/Enumeration;


# direct methods
.method public constructor <init>(Ljava/util/Enumeration;Ljava/util/Enumeration;)V
    .locals 0
    .param p1, "e1"    # Ljava/util/Enumeration;
    .param p2, "e2"    # Ljava/util/Enumeration;

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    iput-object p1, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e1:Ljava/util/Enumeration;

    .line 230
    iput-object p2, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e2:Ljava/util/Enumeration;

    .line 231
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e1:Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e2:Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 238
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e1:Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e1:Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    .line 241
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$CompoundEnumeration;->e2:Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method
