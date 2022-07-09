.class final Lcom/jcraft/jzlib/Adler32;
.super Ljava/lang/Object;
.source "Adler32.java"


# static fields
.field private static final BASE:I = 0xfff1

.field private static final NMAX:I = 0x15b0


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method adler32(J[BII)J
    .locals 13
    .param p1, "adler"    # J
    .param p3, "buf"    # [B
    .param p4, "index"    # I
    .param p5, "len"    # I

    .prologue
    .line 45
    if-nez p3, :cond_0

    const-wide/16 v8, 0x1

    .line 82
    :goto_0
    return-wide v8

    .line 47
    :cond_0
    const-wide/32 v8, 0xffff

    and-long v4, p1, v8

    .line 48
    .local v4, "s1":J
    const/16 v8, 0x10

    shr-long v8, p1, v8

    const-wide/32 v10, 0xffff

    and-long v6, v8, v10

    .line 51
    .local v6, "s2":J
    :goto_1
    if-lez p5, :cond_5

    .line 52
    const/16 v8, 0x15b0

    move/from16 v0, p5

    if-ge v0, v8, :cond_1

    move/from16 v3, p5

    .line 53
    .local v3, "k":I
    :goto_2
    sub-int p5, p5, v3

    move/from16 v2, p4

    .line 54
    .end local p4    # "index":I
    .local v2, "index":I
    :goto_3
    const/16 v8, 0x10

    if-lt v3, v8, :cond_2

    .line 55
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 56
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 57
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 58
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 59
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 60
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 61
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 62
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 63
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 64
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 65
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 66
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 67
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 68
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 69
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "index":I
    .restart local p4    # "index":I
    aget-byte v8, p3, v2

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 70
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 71
    add-int/lit8 v3, v3, -0x10

    goto/16 :goto_3

    .line 52
    .end local v2    # "index":I
    .end local v3    # "k":I
    .restart local p4    # "index":I
    :cond_1
    const/16 v3, 0x15b0

    goto/16 :goto_2

    .line 73
    .end local p4    # "index":I
    .restart local v2    # "index":I
    .restart local v3    # "k":I
    :cond_2
    if-eqz v3, :cond_4

    :cond_3
    move/from16 p4, v2

    .line 75
    .end local v2    # "index":I
    .restart local p4    # "index":I
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "index":I
    .restart local v2    # "index":I
    aget-byte v8, p3, p4

    and-int/lit16 v8, v8, 0xff

    int-to-long v8, v8

    add-long/2addr v4, v8

    add-long/2addr v6, v4

    .line 77
    add-int/lit8 v3, v3, -0x1

    if-nez v3, :cond_3

    :cond_4
    move/from16 p4, v2

    .line 79
    .end local v2    # "index":I
    .restart local p4    # "index":I
    const-wide/32 v8, 0xfff1

    rem-long/2addr v4, v8

    .line 80
    const-wide/32 v8, 0xfff1

    rem-long/2addr v6, v8

    goto/16 :goto_1

    .line 82
    .end local v3    # "k":I
    :cond_5
    const/16 v8, 0x10

    shl-long v8, v6, v8

    or-long/2addr v8, v4

    goto/16 :goto_0
.end method
