.class Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddEofFilter"
.end annotation


# instance fields
.field private lastChar:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 709
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 706
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;->lastChar:I

    .line 710
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x1a

    .line 713
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    .line 716
    .local v0, "thisChar":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 717
    iget v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;->lastChar:I

    if-eq v1, v2, :cond_0

    .line 718
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;->lastChar:I

    .line 719
    iget v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;->lastChar:I

    .line 724
    .end local v0    # "thisChar":I
    :cond_0
    :goto_0
    return v0

    .line 722
    .restart local v0    # "thisChar":I
    :cond_1
    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter;->lastChar:I

    goto :goto_0
.end method
