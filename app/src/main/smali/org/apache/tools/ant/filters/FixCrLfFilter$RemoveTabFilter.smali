.class Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoveTabFilter"
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

    .line 839
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 834
    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    .line 836
    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->tabLength:I

    .line 841
    iput p2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->tabLength:I

    .line 842
    return-void
.end method


# virtual methods
.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 845
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    .line 847
    .local v0, "c":I
    packed-switch v0, :pswitch_data_0

    .line 864
    :pswitch_0
    iget v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    .line 866
    :goto_0
    return v0

    .line 850
    :pswitch_1
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    goto :goto_0

    .line 853
    :pswitch_2
    iget v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->tabLength:I

    iget v3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    iget v4, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->tabLength:I

    rem-int/2addr v3, v4

    sub-int v1, v2, v3

    .line 855
    .local v1, "width":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->editsBlocked()Z

    move-result v2

    if-nez v2, :cond_1

    .line 856
    :goto_1
    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 857
    const/16 v2, 0x20

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->push(C)V

    .line 856
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 859
    :cond_0
    const/16 v0, 0x20

    .line 861
    :cond_1
    iget v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter;->columnNumber:I

    goto :goto_0

    .line 847
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
