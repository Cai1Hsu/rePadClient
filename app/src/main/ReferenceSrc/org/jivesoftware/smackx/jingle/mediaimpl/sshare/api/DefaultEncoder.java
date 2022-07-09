package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.imageio.ImageIO;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultEncoder.class */
public class DefaultEncoder implements ImageEncoder {
    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageEncoder
    public ByteArrayOutputStream encode(BufferedImage bufferedImage) {
        ByteArrayOutputStream byteArrayOutputStream;
        ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
        try {
            ImageIO.write(bufferedImage, "png", byteArrayOutputStream2);
            byteArrayOutputStream = byteArrayOutputStream2;
        } catch (IOException e) {
            e.printStackTrace();
            byteArrayOutputStream = null;
        }
        return byteArrayOutputStream;
    }
}
