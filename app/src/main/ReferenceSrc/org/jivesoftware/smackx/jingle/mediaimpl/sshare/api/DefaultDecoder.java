package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import javax.imageio.ImageIO;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultDecoder.class */
public class DefaultDecoder implements ImageDecoder {
    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageDecoder
    public BufferedImage decode(ByteArrayInputStream byteArrayInputStream) throws IOException {
        return ImageIO.read(byteArrayInputStream);
    }
}
