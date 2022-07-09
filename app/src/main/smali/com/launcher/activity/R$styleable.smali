.class public final Lcom/launcher/activity/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/launcher/activity/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final ActionEditText:[I

.field public static final ActionEditText_onBadgeClick:I = 0x4

.field public static final ActionEditText_optionOneColor:I = 0x1

.field public static final ActionEditText_optionOneString:I = 0x0

.field public static final ActionEditText_optionTwoColor:I = 0x3

.field public static final ActionEditText_optionTwoString:I = 0x2

.field public static final PullToRefresh:[I

.field public static final PullToRefresh_ptrAdapterViewBackground:I = 0x10

.field public static final PullToRefresh_ptrAnimationStyle:I = 0xc

.field public static final PullToRefresh_ptrDrawable:I = 0x6

.field public static final PullToRefresh_ptrDrawableBottom:I = 0x12

.field public static final PullToRefresh_ptrDrawableEnd:I = 0x8

.field public static final PullToRefresh_ptrDrawableStart:I = 0x7

.field public static final PullToRefresh_ptrDrawableTop:I = 0x11

.field public static final PullToRefresh_ptrHeaderBackground:I = 0x1

.field public static final PullToRefresh_ptrHeaderSubTextColor:I = 0x3

.field public static final PullToRefresh_ptrHeaderTextAppearance:I = 0xa

.field public static final PullToRefresh_ptrHeaderTextColor:I = 0x2

.field public static final PullToRefresh_ptrListViewExtrasEnabled:I = 0xe

.field public static final PullToRefresh_ptrMode:I = 0x4

.field public static final PullToRefresh_ptrOverScroll:I = 0x9

.field public static final PullToRefresh_ptrRefreshableViewBackground:I = 0x0

.field public static final PullToRefresh_ptrRotateDrawableWhilePulling:I = 0xf

.field public static final PullToRefresh_ptrScrollingWhileRefreshingEnabled:I = 0xd

.field public static final PullToRefresh_ptrShowIndicator:I = 0x5

.field public static final PullToRefresh_ptrSubHeaderTextAppearance:I = 0xb


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 4771
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/launcher/activity/R$styleable;->ActionEditText:[I

    .line 4895
    const/16 v0, 0x13

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/launcher/activity/R$styleable;->PullToRefresh:[I

    .line 5166
    return-void

    .line 4771
    :array_0
    .array-data 4
        0x7f010013
        0x7f010014
        0x7f010015
        0x7f010016
        0x7f010017
    .end array-data

    .line 4895
    :array_1
    .array-data 4
        0x7f010000
        0x7f010001
        0x7f010002
        0x7f010003
        0x7f010004
        0x7f010005
        0x7f010006
        0x7f010007
        0x7f010008
        0x7f010009
        0x7f01000a
        0x7f01000b
        0x7f01000c
        0x7f01000d
        0x7f01000e
        0x7f01000f
        0x7f010010
        0x7f010011
        0x7f010012
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4752
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
