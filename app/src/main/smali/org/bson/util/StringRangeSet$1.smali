.class Lorg/bson/util/StringRangeSet$1;
.super Ljava/lang/Object;
.source "StringRangeSet.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bson/util/StringRangeSet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field index:I

.field final synthetic this$0:Lorg/bson/util/StringRangeSet;


# direct methods
.method constructor <init>(Lorg/bson/util/StringRangeSet;)V
    .locals 1

    .prologue
    .line 43
    iput-object p1, p0, Lorg/bson/util/StringRangeSet$1;->this$0:Lorg/bson/util/StringRangeSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 48
    iget v0, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    iget-object v1, p0, Lorg/bson/util/StringRangeSet$1;->this$0:Lorg/bson/util/StringRangeSet;

    invoke-static {v1}, Lorg/bson/util/StringRangeSet;->access$000(Lorg/bson/util/StringRangeSet;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/bson/util/StringRangeSet$1;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 3

    .prologue
    .line 52
    iget v0, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    .line 53
    invoke-static {}, Lorg/bson/util/StringRangeSet;->access$100()[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    aget-object v0, v0, v1

    .line 54
    :goto_0
    return-object v0

    :cond_0
    iget v0, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/bson/util/StringRangeSet$1;->index:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
