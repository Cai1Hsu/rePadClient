.class Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoveEofFilter"
.end annotation


# instance fields
.field private lookAhead:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 3
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v2, -0x1

    .line 732
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 729
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I

    .line 735
    :try_start_0
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 739
    :goto_0
    return-void

    .line 736
    :catch_0
    move-exception v0

    .line 737
    .local v0, "e":Ljava/io/IOException;
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I

    goto :goto_0
.end method


# virtual methods
.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 742
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v1

    .line 745
    .local v1, "lookAhead2":I
    if-ne v1, v0, :cond_0

    iget v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I

    const/16 v3, 0x1a

    if-ne v2, v3, :cond_0

    .line 751
    :goto_0
    return v0

    .line 749
    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I

    .line 750
    .local v0, "i":I
    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter;->lookAhead:I

    goto :goto_0
.end method
