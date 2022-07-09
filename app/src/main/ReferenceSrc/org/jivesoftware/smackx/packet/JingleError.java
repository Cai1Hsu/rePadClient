package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.jingle.media.ContentInfo;
import org.jivesoftware.smackx.packet.JingleContentInfo;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleError.class */
public class JingleError implements PacketExtension {
    private String message;
    public static String NAMESPACE = "urn:xmpp:tmp:jingle:errors";
    public static final JingleError OUT_OF_ORDER = new JingleError("out-of-order");
    public static final JingleError UNKNOWN_SESSION = new JingleError("unknown-session");
    public static final JingleError UNSUPPORTED_CONTENT = new JingleError("unsupported-content");
    public static final JingleError UNSUPPORTED_TRANSPORTS = new JingleError("unsupported-transports");
    public static final JingleError NO_COMMON_PAYLOAD = new JingleError("unsupported-codecs");
    public static final JingleError NEGOTIATION_ERROR = new JingleError("negotiation-error");
    public static final JingleError MALFORMED_STANZA = new JingleError("malformed-stanza");

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleError$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        private PacketExtension audioInfo;

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v11, types: [org.jivesoftware.smack.packet.PacketExtension] */
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            JingleContentInfo.Audio audio;
            if (this.audioInfo != null) {
                audio = this.audioInfo;
            } else {
                ContentInfo fromString = ContentInfo.Audio.fromString(xmlPullParser.getName());
                audio = null;
                if (fromString != null) {
                    audio = new JingleContentInfo.Audio(fromString);
                }
            }
            return audio;
        }
    }

    public JingleError(String str) {
        this.message = str;
    }

    public static JingleError fromString(String str) {
        JingleError jingleError;
        if (str != null) {
            String lowerCase = str.toLowerCase();
            if (lowerCase.equals("out-of-order")) {
                jingleError = OUT_OF_ORDER;
            } else if (lowerCase.equals("unknown-session")) {
                jingleError = UNKNOWN_SESSION;
            } else if (lowerCase.equals("unsupported-content")) {
                jingleError = UNSUPPORTED_CONTENT;
            } else if (lowerCase.equals("unsupported-transports")) {
                jingleError = UNSUPPORTED_TRANSPORTS;
            } else if (lowerCase.equals("unsupported-codecs")) {
                jingleError = NO_COMMON_PAYLOAD;
            } else if (lowerCase.equals("negotiation-error")) {
                jingleError = NEGOTIATION_ERROR;
            } else if (lowerCase.equals("malformed-stanza")) {
                jingleError = MALFORMED_STANZA;
            }
            return jingleError;
        }
        jingleError = null;
        return jingleError;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.message;
    }

    public String getMessage() {
        return this.message;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    public String toString() {
        return getMessage();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        if (this.message != null) {
            sb.append("<error type=\"cancel\">");
            sb.append("<").append(this.message).append(" xmlns=\"").append(NAMESPACE).append("\"/>");
            sb.append("</error>");
        }
        return sb.toString();
    }
}
