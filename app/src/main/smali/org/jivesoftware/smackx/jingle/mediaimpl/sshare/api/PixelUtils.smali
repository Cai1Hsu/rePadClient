.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;
.super Ljava/lang/Object;
.source "PixelUtils.java"


# static fields
.field public static final ADD:I = 0x4

.field public static final ALPHA:I = 0x13

.field public static final ALPHA_TO_GRAY:I = 0x14

.field public static final AVERAGE:I = 0xd

.field public static final CLEAR:I = 0xf

.field public static final COLOR:I = 0xb

.field public static final DIFFERENCE:I = 0x6

.field public static final DISSOLVE:I = 0x11

.field public static final DST_IN:I = 0x12

.field public static final EXCHANGE:I = 0x10

.field public static final HUE:I = 0x8

.field public static final MAX:I = 0x3

.field public static final MIN:I = 0x2

.field public static final MULTIPLY:I = 0x7

.field public static final NORMAL:I = 0x1

.field public static final OVERLAY:I = 0xe

.field public static final REPLACE:I = 0x0

.field public static final SATURATION:I = 0x9

.field public static final SCREEN:I = 0xc

.field public static final SUBTRACT:I = 0x5

.field public static final VALUE:I = 0xa

.field private static final hsb1:[F

.field private static final hsb2:[F

.field private static randomGenerator:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 50
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->randomGenerator:Ljava/util/Random;

    .line 84
    new-array v0, v1, [F

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    .line 85
    new-array v0, v1, [F

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static brightness(I)I
    .locals 4
    .param p0, "rgb"    # I

    .prologue
    .line 68
    shr-int/lit8 v3, p0, 0x10

    and-int/lit16 v2, v3, 0xff

    .line 69
    .local v2, "r":I
    shr-int/lit8 v3, p0, 0x8

    and-int/lit16 v1, v3, 0xff

    .line 70
    .local v1, "g":I
    and-int/lit16 v0, p0, 0xff

    .line 71
    .local v0, "b":I
    add-int v3, v2, v1

    add-int/2addr v3, v0

    div-int/lit8 v3, v3, 0x3

    return v3
.end method

.method public static clamp(I)I
    .locals 1
    .param p0, "c"    # I

    .prologue
    const/16 v0, 0xff

    .line 56
    if-gez p0, :cond_1

    .line 57
    const/4 p0, 0x0

    .line 60
    .end local p0    # "c":I
    :cond_0
    :goto_0
    return p0

    .line 58
    .restart local p0    # "c":I
    :cond_1
    if-le p0, v0, :cond_0

    move p0, v0

    .line 59
    goto :goto_0
.end method

.method public static combinePixels(III)I
    .locals 1
    .param p0, "rgb1"    # I
    .param p1, "rgb2"    # I
    .param p2, "op"    # I

    .prologue
    .line 89
    const/16 v0, 0xff

    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->combinePixels(IIII)I

    move-result v0

    return v0
.end method

.method public static combinePixels(IIII)I
    .locals 17
    .param p0, "rgb1"    # I
    .param p1, "rgb2"    # I
    .param p2, "op"    # I
    .param p3, "extraAlpha"    # I

    .prologue
    .line 97
    if-nez p2, :cond_0

    .line 220
    .end local p0    # "rgb1":I
    :goto_0
    return p0

    .line 99
    .restart local p0    # "rgb1":I
    :cond_0
    shr-int/lit8 v13, p0, 0x18

    and-int/lit16 v1, v13, 0xff

    .line 100
    .local v1, "a1":I
    shr-int/lit8 v13, p0, 0x10

    and-int/lit16 v10, v13, 0xff

    .line 101
    .local v10, "r1":I
    shr-int/lit8 v13, p0, 0x8

    and-int/lit16 v6, v13, 0xff

    .line 102
    .local v6, "g1":I
    move/from16 v0, p0

    and-int/lit16 v4, v0, 0xff

    .line 103
    .local v4, "b1":I
    shr-int/lit8 v13, p1, 0x18

    and-int/lit16 v2, v13, 0xff

    .line 104
    .local v2, "a2":I
    shr-int/lit8 v13, p1, 0x10

    and-int/lit16 v11, v13, 0xff

    .line 105
    .local v11, "r2":I
    shr-int/lit8 v13, p1, 0x8

    and-int/lit16 v7, v13, 0xff

    .line 106
    .local v7, "g2":I
    move/from16 v0, p1

    and-int/lit16 v5, v0, 0xff

    .line 108
    .local v5, "b2":I
    packed-switch p2, :pswitch_data_0

    .line 212
    :cond_1
    :goto_1
    :pswitch_0
    const/16 v13, 0xff

    move/from16 v0, p3

    if-ne v0, v13, :cond_2

    const/16 v13, 0xff

    if-eq v1, v13, :cond_3

    .line 213
    :cond_2
    mul-int v13, v1, p3

    div-int/lit16 v1, v13, 0xff

    .line 214
    rsub-int v13, v1, 0xff

    mul-int/2addr v13, v2

    div-int/lit16 v3, v13, 0xff

    .line 215
    .local v3, "a3":I
    mul-int v13, v10, v1

    mul-int v14, v11, v3

    add-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 216
    mul-int v13, v6, v1

    mul-int v14, v7, v3

    add-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 217
    mul-int v13, v4, v1

    mul-int v14, v5, v3

    add-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 218
    add-int v13, v1, v3

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v1

    .line 220
    .end local v3    # "a3":I
    :cond_3
    shl-int/lit8 v13, v1, 0x18

    shl-int/lit8 v14, v10, 0x10

    or-int/2addr v13, v14

    shl-int/lit8 v14, v6, 0x8

    or-int/2addr v13, v14

    or-int p0, v13, v4

    goto :goto_0

    .line 112
    :pswitch_1
    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 113
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 114
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 115
    goto :goto_1

    .line 117
    :pswitch_2
    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 118
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 119
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 120
    goto :goto_1

    .line 122
    :pswitch_3
    add-int v13, v10, v11

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 123
    add-int v13, v6, v7

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 124
    add-int v13, v4, v5

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 125
    goto :goto_1

    .line 127
    :pswitch_4
    sub-int v13, v11, v10

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 128
    sub-int v13, v7, v6

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 129
    sub-int v13, v5, v4

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 130
    goto/16 :goto_1

    .line 132
    :pswitch_5
    sub-int v13, v10, v11

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 133
    sub-int v13, v6, v7

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 134
    sub-int v13, v4, v5

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 135
    goto/16 :goto_1

    .line 137
    :pswitch_6
    mul-int v13, v10, v11

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 138
    mul-int v13, v6, v7

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 139
    mul-int v13, v4, v5

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 140
    goto/16 :goto_1

    .line 142
    :pswitch_7
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->randomGenerator:Ljava/util/Random;

    invoke-virtual {v13}, Ljava/util/Random;->nextInt()I

    move-result v13

    and-int/lit16 v13, v13, 0xff

    if-gt v13, v1, :cond_1

    .line 143
    move v10, v11

    .line 144
    move v6, v7

    .line 145
    move v4, v5

    goto/16 :goto_1

    .line 149
    :pswitch_8
    add-int v13, v10, v11

    div-int/lit8 v10, v13, 0x2

    .line 150
    add-int v13, v6, v7

    div-int/lit8 v6, v13, 0x2

    .line 151
    add-int v13, v4, v5

    div-int/lit8 v4, v13, 0x2

    .line 152
    goto/16 :goto_1

    .line 157
    :pswitch_9
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    invoke-static {v10, v6, v4, v13}, Ljava/awt/Color;->RGBtoHSB(III[F)[F

    .line 158
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    invoke-static {v11, v7, v5, v13}, Ljava/awt/Color;->RGBtoHSB(III[F)[F

    .line 159
    packed-switch p2, :pswitch_data_1

    .line 174
    :goto_2
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    sget-object v14, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v15, 0x1

    aget v14, v14, v15

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    invoke-static {v13, v14, v15}, Ljava/awt/Color;->HSBtoRGB(FFF)I

    move-result p0

    .line 175
    shr-int/lit8 v13, p0, 0x10

    and-int/lit16 v10, v13, 0xff

    .line 176
    shr-int/lit8 v13, p0, 0x8

    and-int/lit16 v6, v13, 0xff

    .line 177
    move/from16 v0, p0

    and-int/lit16 v4, v0, 0xff

    .line 178
    goto/16 :goto_1

    .line 161
    :pswitch_a
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x0

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    const/16 v16, 0x0

    aget v15, v15, v16

    aput v15, v13, v14

    goto :goto_2

    .line 164
    :pswitch_b
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x1

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    aput v15, v13, v14

    goto :goto_2

    .line 167
    :pswitch_c
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x2

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    aput v15, v13, v14

    goto :goto_2

    .line 170
    :pswitch_d
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x0

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    const/16 v16, 0x0

    aget v15, v15, v16

    aput v15, v13, v14

    .line 171
    sget-object v13, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb2:[F

    const/4 v14, 0x1

    sget-object v15, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->hsb1:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    aput v15, v13, v14

    goto :goto_2

    .line 180
    :pswitch_e
    rsub-int v13, v10, 0xff

    rsub-int v14, v11, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v10, v13, 0xff

    .line 181
    rsub-int v13, v6, 0xff

    rsub-int v14, v7, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v6, v13, 0xff

    .line 182
    rsub-int v13, v4, 0xff

    rsub-int v14, v5, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v4, v13, 0xff

    .line 183
    goto/16 :goto_1

    .line 186
    :pswitch_f
    rsub-int v13, v10, 0xff

    rsub-int v14, v11, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v12, v13, 0xff

    .line 187
    .local v12, "s":I
    mul-int v13, v10, v11

    div-int/lit16 v8, v13, 0xff

    .line 188
    .local v8, "m":I
    mul-int v13, v12, v10

    rsub-int v14, v10, 0xff

    mul-int/2addr v14, v8

    add-int/2addr v13, v14

    div-int/lit16 v10, v13, 0xff

    .line 189
    rsub-int v13, v6, 0xff

    rsub-int v14, v7, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v12, v13, 0xff

    .line 190
    mul-int v13, v6, v7

    div-int/lit16 v8, v13, 0xff

    .line 191
    mul-int v13, v12, v6

    rsub-int v14, v6, 0xff

    mul-int/2addr v14, v8

    add-int/2addr v13, v14

    div-int/lit16 v6, v13, 0xff

    .line 192
    rsub-int v13, v4, 0xff

    rsub-int v14, v5, 0xff

    mul-int/2addr v13, v14

    div-int/lit16 v13, v13, 0xff

    rsub-int v12, v13, 0xff

    .line 193
    mul-int v13, v4, v5

    div-int/lit16 v8, v13, 0xff

    .line 194
    mul-int v13, v12, v4

    rsub-int v14, v4, 0xff

    mul-int/2addr v14, v8

    add-int/2addr v13, v14

    div-int/lit16 v4, v13, 0xff

    .line 195
    goto/16 :goto_1

    .line 197
    .end local v8    # "m":I
    .end local v12    # "s":I
    :pswitch_10
    const/16 v4, 0xff

    move v6, v4

    move v10, v4

    .line 198
    goto/16 :goto_1

    .line 200
    :pswitch_11
    mul-int v13, v11, v1

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v10

    .line 201
    mul-int v13, v7, v1

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v6

    .line 202
    mul-int v13, v5, v1

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v4

    .line 203
    mul-int v13, v2, v1

    div-int/lit16 v13, v13, 0xff

    invoke-static {v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v1

    .line 204
    shl-int/lit8 v13, v1, 0x18

    shl-int/lit8 v14, v10, 0x10

    or-int/2addr v13, v14

    shl-int/lit8 v14, v6, 0x8

    or-int/2addr v13, v14

    or-int p0, v13, v4

    goto/16 :goto_0

    .line 206
    :pswitch_12
    mul-int v13, v1, v2

    div-int/lit16 v1, v13, 0xff

    .line 207
    shl-int/lit8 v13, v1, 0x18

    shl-int/lit8 v14, v11, 0x10

    or-int/2addr v13, v14

    shl-int/lit8 v14, v7, 0x8

    or-int/2addr v13, v14

    or-int p0, v13, v5

    goto/16 :goto_0

    .line 209
    :pswitch_13
    rsub-int v9, v1, 0xff

    .line 210
    .local v9, "na":I
    shl-int/lit8 v13, v1, 0x18

    shl-int/lit8 v14, v9, 0x10

    or-int/2addr v13, v14

    shl-int/lit8 v14, v9, 0x8

    or-int/2addr v13, v14

    or-int p0, v13, v9

    goto/16 :goto_0

    .line 108
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_e
        :pswitch_8
        :pswitch_f
        :pswitch_10
        :pswitch_0
        :pswitch_7
        :pswitch_11
        :pswitch_12
        :pswitch_13
    .end packed-switch

    .line 159
    :pswitch_data_1
    .packed-switch 0x8
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method public static combinePixels(IIIII)I
    .locals 2
    .param p0, "rgb1"    # I
    .param p1, "rgb2"    # I
    .param p2, "op"    # I
    .param p3, "extraAlpha"    # I
    .param p4, "channelMask"    # I

    .prologue
    .line 93
    xor-int/lit8 v0, p4, -0x1

    and-int/2addr v0, p1

    and-int v1, p0, p4

    invoke-static {v1, p1, p2, p3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->combinePixels(IIII)I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public static interpolate(IIF)I
    .locals 2
    .param p0, "v1"    # I
    .param p1, "v2"    # I
    .param p2, "f"    # F

    .prologue
    .line 64
    int-to-float v0, p0

    sub-int v1, p1, p0

    int-to-float v1, v1

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    float-to-int v0, v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v0

    return v0
.end method

.method public static nearColors(III)Z
    .locals 7
    .param p0, "rgb1"    # I
    .param p1, "rgb2"    # I
    .param p2, "tolerance"    # I

    .prologue
    .line 75
    shr-int/lit8 v6, p0, 0x10

    and-int/lit16 v4, v6, 0xff

    .line 76
    .local v4, "r1":I
    shr-int/lit8 v6, p0, 0x8

    and-int/lit16 v2, v6, 0xff

    .line 77
    .local v2, "g1":I
    and-int/lit16 v0, p0, 0xff

    .line 78
    .local v0, "b1":I
    shr-int/lit8 v6, p1, 0x10

    and-int/lit16 v5, v6, 0xff

    .line 79
    .local v5, "r2":I
    shr-int/lit8 v6, p1, 0x8

    and-int/lit16 v3, v6, 0xff

    .line 80
    .local v3, "g2":I
    and-int/lit16 v1, p1, 0xff

    .line 81
    .local v1, "b2":I
    sub-int v6, v4, v5

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    if-gt v6, p2, :cond_0

    sub-int v6, v2, v3

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    if-gt v6, p2, :cond_0

    sub-int v6, v0, v1

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    if-gt v6, p2, :cond_0

    const/4 v6, 0x1

    :goto_0
    return v6

    :cond_0
    const/4 v6, 0x0

    goto :goto_0
.end method
