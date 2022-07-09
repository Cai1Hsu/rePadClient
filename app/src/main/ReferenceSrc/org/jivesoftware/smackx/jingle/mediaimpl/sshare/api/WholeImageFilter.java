package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.util.Hashtable;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/WholeImageFilter.class */
public abstract class WholeImageFilter extends AbstractBufferedImageOp {
    protected Rectangle originalSpace;
    protected Rectangle transformedSpace;

    public BufferedImage filter(BufferedImage bufferedImage, BufferedImage bufferedImage2) {
        int width = bufferedImage.getWidth();
        int height = bufferedImage.getHeight();
        bufferedImage.getType();
        bufferedImage.getRaster();
        this.originalSpace = new Rectangle(0, 0, width, height);
        this.transformedSpace = new Rectangle(0, 0, width, height);
        transformSpace(this.transformedSpace);
        BufferedImage bufferedImage3 = bufferedImage2;
        if (bufferedImage2 == null) {
            ColorModel colorModel = bufferedImage.getColorModel();
            bufferedImage3 = new BufferedImage(colorModel, colorModel.createCompatibleWritableRaster(this.transformedSpace.width, this.transformedSpace.height), colorModel.isAlphaPremultiplied(), (Hashtable) null);
        }
        bufferedImage3.getRaster();
        setRGB(bufferedImage3, 0, 0, this.transformedSpace.width, this.transformedSpace.height, filterPixels(width, height, getRGB(bufferedImage, 0, 0, width, height, null), this.transformedSpace));
        return bufferedImage3;
    }

    protected abstract int[] filterPixels(int i, int i2, int[] iArr, Rectangle rectangle);

    protected void transformSpace(Rectangle rectangle) {
    }
}
