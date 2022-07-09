package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder.class */
public interface ImageDecoder {
    BufferedImage decode(ByteArrayInputStream byteArrayInputStream) throws IOException;
}
