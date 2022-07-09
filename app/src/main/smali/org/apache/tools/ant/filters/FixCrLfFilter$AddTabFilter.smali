.class Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddTabFilter"
.end annotation


# instance fields
.field private columnNumber:I

.field private tabLength:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;I)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "tabLength"    # I

    .prologue
    const/4 v0, 0x0

    .line 761
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 756
    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    .line 758
    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    .line 762
    iput p2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    .line 763
    return-void
.end method


# virtual methods
.method public read()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 766
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    .line 768
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 827
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    .line 829
    :cond_0
    :goto_0
    return v0

    .line 771
    :sswitch_0
    const/4 v6, 0x0

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    goto :goto_0

    .line 774
    :sswitch_1
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    .line 775
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->editsBlocked()Z

    move-result v6

    if-nez v6, :cond_0

    .line 776
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    div-int/2addr v6, v7

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    mul-int v1, v6, v7

    .line 777
    .local v1, "colNextTab":I
    const/4 v2, 0x1

    .line 778
    .local v2, "countSpaces":I
    const/4 v4, 0x0

    .line 780
    .local v4, "numTabs":I
    :goto_1
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    const/4 v6, -0x1

    if-eq v0, v6, :cond_4

    .line 781
    sparse-switch v0, :sswitch_data_1

    .line 798
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->push(I)V

    move v3, v2

    .line 802
    .end local v2    # "countSpaces":I
    .local v3, "countSpaces":I
    :goto_2
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "countSpaces":I
    .restart local v2    # "countSpaces":I
    if-lez v3, :cond_3

    .line 803
    const/16 v6, 0x20

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->push(C)V

    .line 804
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    move v3, v2

    .end local v2    # "countSpaces":I
    .restart local v3    # "countSpaces":I
    goto :goto_2

    .line 783
    .end local v3    # "countSpaces":I
    .restart local v2    # "countSpaces":I
    :sswitch_2
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    if-ne v6, v1, :cond_1

    .line 784
    add-int/lit8 v4, v4, 0x1

    .line 785
    const/4 v2, 0x0

    .line 786
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    add-int/2addr v1, v6

    goto :goto_1

    .line 788
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 790
    goto :goto_1

    .line 792
    :sswitch_3
    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    .line 793
    add-int/lit8 v4, v4, 0x1

    .line 794
    const/4 v2, 0x0

    .line 795
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    add-int/2addr v1, v6

    .line 796
    goto :goto_1

    .line 806
    .end local v4    # "numTabs":I
    .local v5, "numTabs":I
    :goto_3
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "numTabs":I
    .restart local v4    # "numTabs":I
    if-lez v5, :cond_2

    .line 807
    const/16 v6, 0x9

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->push(C)V

    .line 808
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    sub-int/2addr v6, v7

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    move v5, v4

    .end local v4    # "numTabs":I
    .restart local v5    # "numTabs":I
    goto :goto_3

    .line 810
    .end local v5    # "numTabs":I
    .restart local v4    # "numTabs":I
    :cond_2
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    .line 811
    sparse-switch v0, :sswitch_data_2

    goto :goto_0

    .line 816
    :sswitch_4
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    add-int/2addr v6, v7

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    goto :goto_0

    .line 813
    :sswitch_5
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    goto/16 :goto_0

    .line 824
    .end local v1    # "colNextTab":I
    .end local v2    # "countSpaces":I
    .end local v4    # "numTabs":I
    :sswitch_6
    iget v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    div-int/2addr v6, v7

    iget v7, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->tabLength:I

    mul-int/2addr v6, v7

    iput v6, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter;->columnNumber:I

    goto/16 :goto_0

    .restart local v1    # "colNextTab":I
    .restart local v2    # "countSpaces":I
    .restart local v4    # "numTabs":I
    :cond_3
    move v5, v4

    .end local v4    # "numTabs":I
    .restart local v5    # "numTabs":I
    goto :goto_3

    .end local v5    # "numTabs":I
    .restart local v4    # "numTabs":I
    :cond_4
    move v3, v2

    .end local v2    # "countSpaces":I
    .restart local v3    # "countSpaces":I
    goto :goto_2

    .line 768
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_6
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_1
    .end sparse-switch

    .line 781
    :sswitch_data_1
    .sparse-switch
        0x9 -> :sswitch_3
        0x20 -> :sswitch_2
    .end sparse-switch

    .line 811
    :sswitch_data_2
    .sparse-switch
        0x9 -> :sswitch_4
        0x20 -> :sswitch_5
    .end sparse-switch
.end method
