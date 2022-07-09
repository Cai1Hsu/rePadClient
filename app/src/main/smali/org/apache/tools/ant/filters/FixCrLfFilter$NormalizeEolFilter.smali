.class Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NormalizeEolFilter"
.end annotation


# instance fields
.field private eol:[C

.field private fixLast:Z

.field private normalizedEOL:I

.field private previousWasEOL:Z


# direct methods
.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "eolString"    # Ljava/lang/String;
    .param p3, "fixLast"    # Z

    .prologue
    .line 631
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 626
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    .line 628
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->eol:[C

    .line 632
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->eol:[C

    .line 633
    iput-boolean p3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->fixLast:Z

    .line 634
    return-void
.end method


# virtual methods
.method public read()I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xd

    const/16 v8, 0xa

    .line 637
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v6

    .line 639
    .local v6, "thisChar":I
    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    if-nez v7, :cond_8

    .line 640
    const/4 v4, 0x0

    .line 641
    .local v4, "numEOL":I
    const/4 v0, 0x0

    .line 642
    .local v0, "atEnd":Z
    sparse-switch v6, :sswitch_data_0

    .line 688
    :cond_0
    :goto_0
    if-lez v4, :cond_7

    move v5, v4

    .line 689
    .end local v4    # "numEOL":I
    .local v5, "numEOL":I
    :goto_1
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "numEOL":I
    .restart local v4    # "numEOL":I
    if-lez v5, :cond_5

    .line 690
    iget-object v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->eol:[C

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push([C)V

    .line 691
    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    iget-object v8, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->eol:[C

    array-length v8, v8

    add-int/2addr v7, v8

    iput v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    move v5, v4

    .end local v4    # "numEOL":I
    .restart local v5    # "numEOL":I
    goto :goto_1

    .line 644
    .end local v5    # "numEOL":I
    .restart local v4    # "numEOL":I
    :sswitch_0
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v1

    .line 645
    .local v1, "c":I
    const/4 v7, -0x1

    if-ne v1, v7, :cond_1

    .line 646
    const/4 v0, 0x1

    .line 647
    iget-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->fixLast:Z

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->previousWasEOL:Z

    if-nez v7, :cond_0

    .line 648
    const/4 v4, 0x1

    .line 649
    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    goto :goto_0

    .line 652
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    goto :goto_0

    .line 656
    .end local v1    # "c":I
    :sswitch_1
    const/4 v0, 0x1

    .line 657
    iget-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->fixLast:Z

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->previousWasEOL:Z

    if-nez v7, :cond_0

    .line 658
    const/4 v4, 0x1

    goto :goto_0

    .line 663
    :sswitch_2
    const/4 v4, 0x1

    .line 664
    goto :goto_0

    .line 666
    :sswitch_3
    const/4 v4, 0x1

    .line 667
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v2

    .line 668
    .local v2, "c1":I
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v3

    .line 670
    .local v3, "c2":I
    if-ne v2, v9, :cond_2

    if-eq v3, v8, :cond_0

    .line 672
    :cond_2
    if-ne v2, v9, :cond_3

    .line 675
    const/4 v4, 0x2

    .line 676
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    goto :goto_0

    .line 677
    :cond_3
    if-ne v2, v8, :cond_4

    .line 679
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    goto :goto_0

    .line 682
    :cond_4
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    .line 683
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->push(I)V

    goto :goto_0

    .line 693
    .end local v2    # "c1":I
    .end local v3    # "c2":I
    :cond_5
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->previousWasEOL:Z

    .line 694
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->read()I

    move-result v6

    .line 701
    .end local v0    # "atEnd":Z
    .end local v4    # "numEOL":I
    :cond_6
    :goto_2
    return v6

    .line 695
    .restart local v0    # "atEnd":Z
    .restart local v4    # "numEOL":I
    :cond_7
    if-nez v0, :cond_6

    .line 696
    const/4 v7, 0x0

    iput-boolean v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->previousWasEOL:Z

    goto :goto_2

    .line 699
    .end local v0    # "atEnd":Z
    .end local v4    # "numEOL":I
    :cond_8
    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter;->normalizedEOL:I

    goto :goto_2

    .line 642
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0xa -> :sswitch_2
        0xd -> :sswitch_3
        0x1a -> :sswitch_0
    .end sparse-switch
.end method
