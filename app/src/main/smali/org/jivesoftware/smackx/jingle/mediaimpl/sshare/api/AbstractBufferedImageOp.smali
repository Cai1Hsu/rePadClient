.class public abstract Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/AbstractBufferedImageOp;
.super Ljava/lang/Object;
.source "AbstractBufferedImageOp.java"

# interfaces
.implements Ljava/awt/image/BufferedImageOp;
.implements Ljava/lang/Cloneable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 92
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 95
    :goto_0
    return-object v1

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public createCompatibleDestImage(Ljava/awt/image/BufferedImage;Ljava/awt/image/ColorModel;)Ljava/awt/image/BufferedImage;
    .locals 4
    .param p1, "src"    # Ljava/awt/image/BufferedImage;
    .param p2, "dstCM"    # Ljava/awt/image/ColorModel;

    .prologue
    .line 32
    if-nez p2, :cond_0

    .line 33
    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getColorModel()Ljava/awt/image/ColorModel;

    move-result-object p2

    .line 34
    :cond_0
    new-instance v0, Ljava/awt/image/BufferedImage;

    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    invoke-virtual {p2, v1, v2}, Ljava/awt/image/ColorModel;->createCompatibleWritableRaster(II)Ljava/awt/image/WritableRaster;

    move-result-object v1

    invoke-virtual {p2}, Ljava/awt/image/ColorModel;->isAlphaPremultiplied()Z

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, p2, v1, v2, v3}, Ljava/awt/image/BufferedImage;-><init>(Ljava/awt/image/ColorModel;Ljava/awt/image/WritableRaster;ZLjava/util/Hashtable;)V

    return-object v0
.end method

.method public getBounds2D(Ljava/awt/image/BufferedImage;)Ljava/awt/geom/Rectangle2D;
    .locals 4
    .param p1, "src"    # Ljava/awt/image/BufferedImage;

    .prologue
    const/4 v3, 0x0

    .line 38
    new-instance v0, Ljava/awt/Rectangle;

    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getHeight()I

    move-result v2

    invoke-direct {v0, v3, v3, v1, v2}, Ljava/awt/Rectangle;-><init>(IIII)V

    return-object v0
.end method

.method public getPoint2D(Ljava/awt/geom/Point2D;Ljava/awt/geom/Point2D;)Ljava/awt/geom/Point2D;
    .locals 4
    .param p1, "srcPt"    # Ljava/awt/geom/Point2D;
    .param p2, "dstPt"    # Ljava/awt/geom/Point2D;

    .prologue
    .line 42
    if-nez p2, :cond_0

    .line 43
    new-instance p2, Ljava/awt/geom/Point2D$Double;

    .end local p2    # "dstPt":Ljava/awt/geom/Point2D;
    invoke-direct {p2}, Ljava/awt/geom/Point2D$Double;-><init>()V

    .line 44
    .restart local p2    # "dstPt":Ljava/awt/geom/Point2D;
    :cond_0
    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getX()D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/awt/geom/Point2D;->getY()D

    move-result-wide v2

    invoke-virtual {p2, v0, v1, v2, v3}, Ljava/awt/geom/Point2D;->setLocation(DD)V

    .line 45
    return-object p2
.end method

.method public getRGB(Ljava/awt/image/BufferedImage;IIII[I)[I
    .locals 9
    .param p1, "image"    # Ljava/awt/image/BufferedImage;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "pixels"    # [I

    .prologue
    .line 65
    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getType()I

    move-result v8

    .line 66
    .local v8, "type":I
    const/4 v0, 0x2

    if-eq v8, v0, :cond_0

    const/4 v0, 0x1

    if-ne v8, v0, :cond_1

    .line 67
    :cond_0
    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getRaster()Ljava/awt/image/WritableRaster;

    move-result-object v0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Ljava/awt/image/WritableRaster;->getDataElements(IIIILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    .line 68
    :goto_0
    return-object v0

    :cond_1
    const/4 v6, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    move v7, p4

    invoke-virtual/range {v0 .. v7}, Ljava/awt/image/BufferedImage;->getRGB(IIII[III)[I

    move-result-object v0

    goto :goto_0
.end method

.method public getRenderingHints()Ljava/awt/RenderingHints;
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    return-object v0
.end method

.method public setRGB(Ljava/awt/image/BufferedImage;IIII[I)V
    .locals 9
    .param p1, "image"    # Ljava/awt/image/BufferedImage;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "pixels"    # [I

    .prologue
    .line 83
    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getType()I

    move-result v8

    .line 84
    .local v8, "type":I
    const/4 v0, 0x2

    if-eq v8, v0, :cond_0

    const/4 v0, 0x1

    if-ne v8, v0, :cond_1

    .line 85
    :cond_0
    invoke-virtual {p1}, Ljava/awt/image/BufferedImage;->getRaster()Ljava/awt/image/WritableRaster;

    move-result-object v0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Ljava/awt/image/WritableRaster;->setDataElements(IIIILjava/lang/Object;)V

    .line 88
    :goto_0
    return-void

    .line 87
    :cond_1
    const/4 v6, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    move v7, p4

    invoke-virtual/range {v0 .. v7}, Ljava/awt/image/BufferedImage;->setRGB(IIII[III)V

    goto :goto_0
.end method
