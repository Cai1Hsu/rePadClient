package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.jingle.media.ContentInfo;
import org.jivesoftware.smackx.packet.JingleContentInfo;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider.class */
public class JingleContentInfoProvider implements PacketExtensionProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio.class */
    public static class Audio extends JingleContentInfoProvider {
        private PacketExtension audioInfo;

        /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio$Busy.class */
        public static class Busy extends Audio {
            public Busy() {
                super(new JingleContentInfo.Audio.Busy());
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio$Hold.class */
        public static class Hold extends Audio {
            public Hold() {
                super(new JingleContentInfo.Audio.Hold());
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio$Mute.class */
        public static class Mute extends Audio {
            public Mute() {
                super(new JingleContentInfo.Audio.Mute());
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio$Queued.class */
        public static class Queued extends Audio {
            public Queued() {
                super(new JingleContentInfo.Audio.Queued());
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/provider/JingleContentInfoProvider$Audio$Ringing.class */
        public static class Ringing extends Audio {
            public Ringing() {
                super(new JingleContentInfo.Audio.Ringing());
            }
        }

        public Audio() {
            this(null);
        }

        public Audio(PacketExtension packetExtension) {
            this.audioInfo = packetExtension;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v11, types: [org.jivesoftware.smack.packet.PacketExtension] */
        @Override // org.jivesoftware.smackx.provider.JingleContentInfoProvider, org.jivesoftware.smack.provider.PacketExtensionProvider
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

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        return null;
    }
}
