package org.apache.tools.zip;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;

/* loaded from: classes.jar:org/apache/tools/zip/NioZipEncoding.class */
class NioZipEncoding implements ZipEncoding {
    private final Charset charset;

    public NioZipEncoding(Charset charset) {
        this.charset = charset;
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public boolean canEncode(String str) {
        CharsetEncoder newEncoder = this.charset.newEncoder();
        newEncoder.onMalformedInput(CodingErrorAction.REPORT);
        newEncoder.onUnmappableCharacter(CodingErrorAction.REPORT);
        return newEncoder.canEncode(str);
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public String decode(byte[] bArr) throws IOException {
        return this.charset.newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bArr)).toString();
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public ByteBuffer encode(String str) {
        CharsetEncoder newEncoder = this.charset.newEncoder();
        newEncoder.onMalformedInput(CodingErrorAction.REPORT);
        newEncoder.onUnmappableCharacter(CodingErrorAction.REPORT);
        CharBuffer wrap = CharBuffer.wrap(str);
        ByteBuffer allocate = ByteBuffer.allocate(str.length() + ((str.length() + 1) / 2));
        while (true) {
            if (wrap.remaining() <= 0) {
                break;
            }
            CoderResult encode = newEncoder.encode(wrap, allocate, true);
            if (encode.isUnmappable() || encode.isMalformed()) {
                ByteBuffer byteBuffer = allocate;
                if (encode.length() * 6 > allocate.remaining()) {
                    byteBuffer = ZipEncodingHelper.growBuffer(allocate, allocate.position() + (encode.length() * 6));
                }
                int i = 0;
                while (true) {
                    allocate = byteBuffer;
                    if (i < encode.length()) {
                        ZipEncodingHelper.appendSurrogate(byteBuffer, wrap.get());
                        i++;
                    }
                }
            } else if (encode.isOverflow()) {
                allocate = ZipEncodingHelper.growBuffer(allocate, 0);
            } else if (encode.isUnderflow()) {
                newEncoder.flush(allocate);
                break;
            }
        }
        allocate.limit(allocate.position());
        allocate.rewind();
        return allocate;
    }
}
