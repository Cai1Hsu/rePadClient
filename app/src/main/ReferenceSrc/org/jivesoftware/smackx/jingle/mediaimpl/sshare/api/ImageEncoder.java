package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder.class */
public interface ImageEncoder {
    ByteArrayOutputStream encode(BufferedImage bufferedImage);
}
