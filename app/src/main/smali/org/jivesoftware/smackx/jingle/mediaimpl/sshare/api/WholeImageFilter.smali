.class public abstract Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;
.super Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/AbstractBufferedImageOp;
.source "WholeImageFilter.java"


# instance fields
.field protected originalSpace:Ljava/awt/Rectangle;

.field protected transformedSpace:Ljava/awt/Rectangle;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/AbstractBufferedImageOp;-><init>()V

    .line 44
    return-void
.end method


# virtual methods
.method public filter(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;
    .locals 18
    .param p1, "src"    # Ljava/awt/image/BufferedImage;
    .param p2, "dst"    # Ljava/awt/image/BufferedImage;

    .prologue
    .line 47
    invoke-virtual/range {p1 .. p1}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v5

    .line 48
    .local v5, "width":I
    invoke-virtual/range {p1 .. p1}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v6

    .line 49
    .local v6, "height":I
    invoke-virtual/range {p1 .. p1}, Ljava/awt/image/BufferedImage;->getType()I

    move-result v17

    .line 50
    .local v17, "type":I
    invoke-virtual/range {p1 .. p1}, Ljava/awt/image/BufferedImage;->getRaster()Ljava/awt/image/WritableRaster;

    move-result-object v16

    .line 52
    .local v16, "srcRaster":Ljava/awt/image/WritableRaster;
    new-instance v1, Ljava/awt/Rectangle;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v5, v6}, Ljava/awt/Rectangle;-><init>(IIII)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->originalSpace:Ljava/awt/Rectangle;

    .line 53
    new-instance v1, Ljava/awt/Rectangle;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v5, v6}, Ljava/awt/Rectangle;-><init>(IIII)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    .line 54
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformSpace(Ljava/awt/Rectangle;)V

    .line 56
    if-nez p2, :cond_0

    .line 57
    invoke-virtual/range {p1 .. p1}, Ljava/awt/image/BufferedImage;->getColorModel()Ljava/awt/image/ColorModel;

    move-result-object v14

    .line 58
    .local v14, "dstCM":Ljava/awt/image/ColorModel;
    new-instance p2, Ljava/awt/image/BufferedImage;

    .end local p2    # "dst":Ljava/awt/image/BufferedImage;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    iget v1, v1, Ljava/awt/Rectangle;->width:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    iget v2, v2, Ljava/awt/Rectangle;->height:I

    invoke-virtual {v14, v1, v2}, Ljava/awt/image/ColorModel;->createCompatibleWritableRaster(II)Ljava/awt/image/WritableRaster;

    move-result-object v1

    invoke-virtual {v14}, Ljava/awt/image/ColorModel;->isAlphaPremultiplied()Z

    move-result v2

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-direct {v0, v14, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(Ljava/awt/image/ColorModel;Ljava/awt/image/WritableRaster;ZLjava/util/Hashtable;)V

    .line 60
    .end local v14    # "dstCM":Ljava/awt/image/ColorModel;
    .restart local p2    # "dst":Ljava/awt/image/BufferedImage;
    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/awt/image/BufferedImage;->getRaster()Ljava/awt/image/WritableRaster;

    move-result-object v15

    .line 62
    .local v15, "dstRaster":Ljava/awt/image/WritableRaster;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->getRGB(Ljava/awt/image/BufferedImage;IIII[I)[I

    move-result-object v13

    .line 63
    .local v13, "inPixels":[I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6, v13, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->filterPixels(II[ILjava/awt/Rectangle;)[I

    move-result-object v13

    .line 64
    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    iget v11, v1, Ljava/awt/Rectangle;->width:I

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->transformedSpace:Ljava/awt/Rectangle;

    iget v12, v1, Ljava/awt/Rectangle;->height:I

    move-object/from16 v7, p0

    move-object/from16 v8, p2

    invoke-virtual/range {v7 .. v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter;->setRGB(Ljava/awt/image/BufferedImage;IIII[I)V

    .line 66
    return-object p2
.end method

.method protected abstract filterPixels(II[ILjava/awt/Rectangle;)[I
.end method

.method protected transformSpace(Ljava/awt/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Ljava/awt/Rectangle;

    .prologue
    .line 74
    return-void
.end method
