package org.jivesoftware.smackx.jingle.media;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/ContentInfo.class */
public abstract class ContentInfo {

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/ContentInfo$Audio.class */
    public static class Audio extends ContentInfo {
        public static final Audio BUSY = new Audio("busy");
        public static final Audio HOLD = new Audio("hold");
        public static final Audio MUTE = new Audio("mute");
        public static final Audio QUEUED = new Audio("queued");
        public static final Audio RINGING = new Audio("ringing");
        private String value;

        public Audio(String str) {
            this.value = str;
        }

        public static ContentInfo fromString(String str) {
            String lowerCase = str.toLowerCase();
            return lowerCase.equals("busy") ? BUSY : lowerCase.equals("hold") ? HOLD : lowerCase.equals("mute") ? MUTE : lowerCase.equals("queued") ? QUEUED : lowerCase.equals("ringing") ? RINGING : null;
        }

        public String toString() {
            return this.value;
        }
    }
}
