.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;
.super Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;
.source "QuantizeFilter.java"


# static fields
.field protected static final matrix:[I


# instance fields
.field private dither:Z

.field private numColors:I

.field private serpentine:Z

.field private sum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->matrix:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x7
        0x3
        0x5
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;-><init>()V

    .line 40
    const/16 v0, 0x10

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->sum:I

    .line 43
    const/16 v0, 0x100

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->numColors:I

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->serpentine:Z

    return-void
.end method


# virtual methods
.method protected filterPixels(II[ILjava/awt/Rectangle;)[I
    .locals 8
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "inPixels"    # [I
    .param p4, "transformedSpace"    # Ljava/awt/Rectangle;

    .prologue
    .line 167
    mul-int v0, p1, p2

    new-array v2, v0, [I

    .line 169
    .local v2, "outPixels":[I
    iget v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->numColors:I

    iget-boolean v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->dither:Z

    iget-boolean v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->serpentine:Z

    move-object v0, p0

    move-object v1, p3

    move v3, p1

    move v4, p2

    invoke-virtual/range {v0 .. v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->quantize([I[IIIIZZ)V

    .line 171
    return-object v2
.end method

.method public getDither()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->dither:Z

    return v0
.end method

.method public getNumColors()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->numColors:I

    return v0
.end method

.method public getSerpentine()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->serpentine:Z

    return v0
.end method

.method public quantize([I[IIIIZZ)V
    .locals 30
    .param p1, "inPixels"    # [I
    .param p2, "outPixels"    # [I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numColors"    # I
    .param p6, "dither"    # Z
    .param p7, "serpentine"    # Z

    .prologue
    .line 95
    mul-int v5, p3, p4

    .line 96
    .local v5, "count":I
    new-instance v18, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;

    invoke-direct/range {v18 .. v18}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;-><init>()V

    .line 97
    .local v18, "quantizer":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;
    move-object/from16 v0, v18

    move/from16 v1, p5

    invoke-interface {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;->setup(I)V

    .line 98
    const/16 v28, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, v28

    invoke-interface {v0, v1, v2, v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;->addPixels([III)V

    .line 99
    invoke-interface/range {v18 .. v18}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;->buildColorTable()[I

    move-result-object v24

    .line 101
    .local v24, "table":[I
    if-nez p6, :cond_0

    .line 102
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    if-ge v12, v5, :cond_9

    .line 103
    aget v28, p1, v12

    move-object/from16 v0, v18

    move/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;->getIndexForColor(I)I

    move-result v28

    aget v28, v24, v28

    aput v28, p2, v12

    .line 102
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 105
    .end local v12    # "i":I
    :cond_0
    const/4 v13, 0x0

    .line 106
    .local v13, "index":I
    const/16 v27, 0x0

    .local v27, "y":I
    :goto_1
    move/from16 v0, v27

    move/from16 v1, p4

    if-ge v0, v1, :cond_9

    .line 107
    if-eqz p7, :cond_2

    and-int/lit8 v28, v27, 0x1

    const/16 v29, 0x1

    move/from16 v0, v28

    move/from16 v1, v29

    if-ne v0, v1, :cond_2

    const/16 v21, 0x1

    .line 109
    .local v21, "reverse":Z
    :goto_2
    if-eqz v21, :cond_3

    .line 110
    mul-int v28, v27, p3

    add-int v28, v28, p3

    add-int/lit8 v13, v28, -0x1

    .line 111
    const/4 v6, -0x1

    .line 116
    .local v6, "direction":I
    :goto_3
    const/16 v26, 0x0

    .local v26, "x":I
    :goto_4
    move/from16 v0, v26

    move/from16 v1, p3

    if-ge v0, v1, :cond_8

    .line 117
    aget v22, p1, v13

    .line 118
    .local v22, "rgb1":I
    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;->getIndexForColor(I)I

    move-result v28

    aget v23, v24, v28

    .line 120
    .local v23, "rgb2":I
    aput v23, p2, v13

    .line 122
    shr-int/lit8 v28, v22, 0x10

    move/from16 v0, v28

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    .line 123
    .local v19, "r1":I
    shr-int/lit8 v28, v22, 0x8

    move/from16 v0, v28

    and-int/lit16 v10, v0, 0xff

    .line 124
    .local v10, "g1":I
    move/from16 v0, v22

    and-int/lit16 v3, v0, 0xff

    .line 126
    .local v3, "b1":I
    shr-int/lit8 v28, v23, 0x10

    move/from16 v0, v28

    and-int/lit16 v0, v0, 0xff

    move/from16 v20, v0

    .line 127
    .local v20, "r2":I
    shr-int/lit8 v28, v23, 0x8

    move/from16 v0, v28

    and-int/lit16 v11, v0, 0xff

    .line 128
    .local v11, "g2":I
    move/from16 v0, v23

    and-int/lit16 v4, v0, 0xff

    .line 130
    .local v4, "b2":I
    sub-int v9, v19, v20

    .line 131
    .local v9, "er":I
    sub-int v8, v10, v11

    .line 132
    .local v8, "eg":I
    sub-int v7, v3, v4

    .line 134
    .local v7, "eb":I
    const/4 v12, -0x1

    .restart local v12    # "i":I
    :goto_5
    const/16 v28, 0x1

    move/from16 v0, v28

    if-gt v12, v0, :cond_7

    .line 135
    add-int v14, v12, v27

    .line 136
    .local v14, "iy":I
    if-ltz v14, :cond_6

    move/from16 v0, p4

    if-ge v14, v0, :cond_6

    .line 137
    const/4 v15, -0x1

    .local v15, "j":I
    :goto_6
    const/16 v28, 0x1

    move/from16 v0, v28

    if-gt v15, v0, :cond_6

    .line 138
    add-int v16, v15, v26

    .line 139
    .local v16, "jx":I
    if-ltz v16, :cond_1

    move/from16 v0, v16

    move/from16 v1, p3

    if-ge v0, v1, :cond_1

    .line 141
    if-eqz v21, :cond_4

    .line 142
    sget-object v28, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->matrix:[I

    add-int/lit8 v29, v12, 0x1

    mul-int/lit8 v29, v29, 0x3

    sub-int v29, v29, v15

    add-int/lit8 v29, v29, 0x1

    aget v25, v28, v29

    .line 145
    .local v25, "w":I
    :goto_7
    if-eqz v25, :cond_1

    .line 146
    if-eqz v21, :cond_5

    sub-int v17, v13, v15

    .line 147
    .local v17, "k":I
    :goto_8
    aget v22, p1, v17

    .line 148
    shr-int/lit8 v28, v22, 0x10

    move/from16 v0, v28

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    .line 149
    shr-int/lit8 v28, v22, 0x8

    move/from16 v0, v28

    and-int/lit16 v10, v0, 0xff

    .line 150
    move/from16 v0, v22

    and-int/lit16 v3, v0, 0xff

    .line 151
    mul-int v28, v9, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->sum:I

    move/from16 v29, v0

    div-int v28, v28, v29

    add-int v19, v19, v28

    .line 152
    mul-int v28, v8, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->sum:I

    move/from16 v29, v0

    div-int v28, v28, v29

    add-int v10, v10, v28

    .line 153
    mul-int v28, v7, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->sum:I

    move/from16 v29, v0

    div-int v28, v28, v29

    add-int v3, v3, v28

    .line 154
    invoke-static/range {v19 .. v19}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v28

    shl-int/lit8 v28, v28, 0x10

    invoke-static {v10}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v29

    shl-int/lit8 v29, v29, 0x8

    or-int v28, v28, v29

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils;->clamp(I)I

    move-result v29

    or-int v28, v28, v29

    aput v28, p1, v17

    .line 137
    .end local v17    # "k":I
    .end local v25    # "w":I
    :cond_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 107
    .end local v3    # "b1":I
    .end local v4    # "b2":I
    .end local v6    # "direction":I
    .end local v7    # "eb":I
    .end local v8    # "eg":I
    .end local v9    # "er":I
    .end local v10    # "g1":I
    .end local v11    # "g2":I
    .end local v12    # "i":I
    .end local v14    # "iy":I
    .end local v15    # "j":I
    .end local v16    # "jx":I
    .end local v19    # "r1":I
    .end local v20    # "r2":I
    .end local v21    # "reverse":Z
    .end local v22    # "rgb1":I
    .end local v23    # "rgb2":I
    .end local v26    # "x":I
    :cond_2
    const/16 v21, 0x0

    goto/16 :goto_2

    .line 113
    .restart local v21    # "reverse":Z
    :cond_3
    mul-int v13, v27, p3

    .line 114
    const/4 v6, 0x1

    .restart local v6    # "direction":I
    goto/16 :goto_3

    .line 144
    .restart local v3    # "b1":I
    .restart local v4    # "b2":I
    .restart local v7    # "eb":I
    .restart local v8    # "eg":I
    .restart local v9    # "er":I
    .restart local v10    # "g1":I
    .restart local v11    # "g2":I
    .restart local v12    # "i":I
    .restart local v14    # "iy":I
    .restart local v15    # "j":I
    .restart local v16    # "jx":I
    .restart local v19    # "r1":I
    .restart local v20    # "r2":I
    .restart local v22    # "rgb1":I
    .restart local v23    # "rgb2":I
    .restart local v26    # "x":I
    :cond_4
    sget-object v28, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->matrix:[I

    add-int/lit8 v29, v12, 0x1

    mul-int/lit8 v29, v29, 0x3

    add-int v29, v29, v15

    add-int/lit8 v29, v29, 0x1

    aget v25, v28, v29

    .restart local v25    # "w":I
    goto :goto_7

    .line 146
    :cond_5
    add-int v17, v13, v15

    goto :goto_8

    .line 134
    .end local v15    # "j":I
    .end local v16    # "jx":I
    .end local v25    # "w":I
    :cond_6
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_5

    .line 160
    .end local v14    # "iy":I
    :cond_7
    add-int/2addr v13, v6

    .line 116
    add-int/lit8 v26, v26, 0x1

    goto/16 :goto_4

    .line 106
    .end local v3    # "b1":I
    .end local v4    # "b2":I
    .end local v7    # "eb":I
    .end local v8    # "eg":I
    .end local v9    # "er":I
    .end local v10    # "g1":I
    .end local v11    # "g2":I
    .end local v12    # "i":I
    .end local v19    # "r1":I
    .end local v20    # "r2":I
    .end local v22    # "rgb1":I
    .end local v23    # "rgb2":I
    :cond_8
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_1

    .line 164
    .end local v6    # "direction":I
    .end local v13    # "index":I
    .end local v21    # "reverse":Z
    .end local v26    # "x":I
    .end local v27    # "y":I
    :cond_9
    return-void
.end method

.method public setDither(Z)V
    .locals 0
    .param p1, "dither"    # Z

    .prologue
    .line 67
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->dither:Z

    .line 68
    return-void
.end method

.method public setNumColors(I)V
    .locals 2
    .param p1, "numColors"    # I

    .prologue
    .line 51
    const/16 v0, 0x8

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x100

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->numColors:I

    .line 52
    return-void
.end method

.method public setSerpentine(Z)V
    .locals 0
    .param p1, "serpentine"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->serpentine:Z

    .line 84
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    const-string/jumbo v0, "Colors/Quantize..."

    return-object v0
.end method
