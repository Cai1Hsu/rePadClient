.class Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;
.super Lcom/google/zxing/qrcode/decoder/DataMask;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/qrcode/decoder/DataMask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataMask101"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 135
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/zxing/qrcode/decoder/DataMask$1;

    .prologue
    .line 135
    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;-><init>()V

    return-void
.end method


# virtual methods
.method isMasked(II)Z
    .locals 3
    .param p1, "i"    # I
    .param p2, "j"    # I

    .prologue
    .line 138
    mul-int v0, p1, p2

    .line 139
    .local v0, "temp":I
    and-int/lit8 v1, v0, 0x1

    rem-int/lit8 v2, v0, 0x3

    add-int/2addr v1, v2

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
