.class Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;
.super Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MaskJavaTabLiteralsFilter"
.end annotation


# static fields
.field private static final IN_CHAR_CONST:I = 0x2

.field private static final IN_MULTI_COMMENT:I = 0x5

.field private static final IN_SINGLE_COMMENT:I = 0x4

.field private static final IN_STR_CONST:I = 0x3

.field private static final JAVA:I = 0x1

.field private static final TRANS_FROM_MULTI:I = 0x8

.field private static final TRANS_TO_COMMENT:I = 0x6


# instance fields
.field private editsBlocked:Z

.field private state:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 516
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;-><init>(Ljava/io/Reader;)V

    .line 497
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->editsBlocked:Z

    .line 517
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    .line 518
    return-void
.end method


# virtual methods
.method public editsBlocked()Z
    .locals 1

    .prologue
    .line 521
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->editsBlocked:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->editsBlocked()Z

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

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 525
    invoke-super {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    .line 527
    .local v0, "thisChar":I
    iget v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    if-eq v1, v3, :cond_0

    iget v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    if-ne v1, v4, :cond_1

    :cond_0
    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->editsBlocked:Z

    .line 529
    iget v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    packed-switch v1, :pswitch_data_0

    .line 617
    :goto_1
    :pswitch_0
    return v0

    .line 527
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 532
    :pswitch_1
    sparse-switch v0, :sswitch_data_0

    goto :goto_1

    .line 537
    :sswitch_0
    iput v4, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 534
    :sswitch_1
    iput v3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 540
    :sswitch_2
    const/4 v1, 0x6

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 547
    :pswitch_2
    packed-switch v0, :pswitch_data_1

    goto :goto_1

    .line 549
    :pswitch_3
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 556
    :pswitch_4
    packed-switch v0, :pswitch_data_2

    goto :goto_1

    .line 558
    :pswitch_5
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 566
    :pswitch_6
    packed-switch v0, :pswitch_data_3

    :pswitch_7
    goto :goto_1

    .line 569
    :pswitch_8
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 577
    :pswitch_9
    packed-switch v0, :pswitch_data_4

    goto :goto_1

    .line 579
    :pswitch_a
    const/16 v1, 0x8

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 587
    :pswitch_b
    sparse-switch v0, :sswitch_data_1

    .line 601
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 589
    :sswitch_3
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 592
    :sswitch_4
    const/4 v1, 0x4

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 595
    :sswitch_5
    iput v3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 598
    :sswitch_6
    iput v4, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 606
    :pswitch_c
    packed-switch v0, :pswitch_data_5

    goto :goto_1

    .line 608
    :pswitch_d
    iput v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter;->state:I

    goto :goto_1

    .line 529
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_6
        :pswitch_9
        :pswitch_b
        :pswitch_0
        :pswitch_c
    .end packed-switch

    .line 532
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x27 -> :sswitch_1
        0x2f -> :sswitch_2
    .end sparse-switch

    .line 547
    :pswitch_data_1
    .packed-switch 0x27
        :pswitch_3
    .end packed-switch

    .line 556
    :pswitch_data_2
    .packed-switch 0x22
        :pswitch_5
    .end packed-switch

    .line 566
    :pswitch_data_3
    .packed-switch 0xa
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 577
    :pswitch_data_4
    .packed-switch 0x2a
        :pswitch_a
    .end packed-switch

    .line 587
    :sswitch_data_1
    .sparse-switch
        0x22 -> :sswitch_6
        0x27 -> :sswitch_5
        0x2a -> :sswitch_3
        0x2f -> :sswitch_4
    .end sparse-switch

    .line 606
    :pswitch_data_5
    .packed-switch 0x2f
        :pswitch_d
    .end packed-switch
.end method
