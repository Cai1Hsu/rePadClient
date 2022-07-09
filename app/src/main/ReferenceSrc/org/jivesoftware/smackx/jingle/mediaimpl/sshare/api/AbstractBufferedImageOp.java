package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.awt.image.ColorModel;
import java.util.Hashtable;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/AbstractBufferedImageOp.class */
public abstract class AbstractBufferedImageOp implements BufferedImageOp, Cloneable {
    public Object clone() {
        Object obj;
        try {
            obj = super.clone();
        } catch (CloneNotSupportedException e) {
            obj = null;
        }
        return obj;
    }

    public BufferedImage createCompatibleDestImage(BufferedImage bufferedImage, ColorModel colorModel) {
        ColorModel colorModel2 = colorModel;
        if (colorModel == null) {
            colorModel2 = bufferedImage.getColorModel();
        }
        return new BufferedImage(colorModel2, colorModel2.createCompatibleWritableRaster(bufferedImage.getWidth(), bufferedImage.getHeight()), colorModel2.isAlphaPremultiplied(), (Hashtable) null);
    }

    public Rectangle2D getBounds2D(BufferedImage bufferedImage) {
        return new Rectangle(0, 0, bufferedImage.getWidth(), bufferedImage.getHeight());
    }

    public Point2D getPoint2D(Point2D point2D, Point2D point2D2) {
        Point2D point2D3 = point2D2;
        if (point2D2 == null) {
            point2D3 = new Point2D.Double();
        }
        point2D3.setLocation(point2D.getX(), point2D.getY());
        return point2D3;
    }

    public int[] getRGB(BufferedImage bufferedImage, int i, int i2, int i3, int i4, int[] iArr) {
        int type = bufferedImage.getType();
        return (type == 2 || type == 1) ? (int[]) bufferedImage.getRaster().getDataElements(i, i2, i3, i4, iArr) : bufferedImage.getRGB(i, i2, i3, i4, iArr, 0, i3);
    }

    public RenderingHints getRenderingHints() {
        return null;
    }

    public void setRGB(BufferedImage bufferedImage, int i, int i2, int i3, int i4, int[] iArr) {
        int type = bufferedImage.getType();
        if (type == 2 || type == 1) {
            bufferedImage.getRaster().setDataElements(i, i2, i3, i4, iArr);
        } else {
            bufferedImage.setRGB(i, i2, i3, i4, iArr, 0, i3);
        }
    }
}
