package org.jivesoftware.smackx.jingle.media;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/PayloadType.class */
public class PayloadType {
    public static final String NODENAME = "payload-type";
    private int channels;
    private int id;
    private String name;
    public static int MAX_FIXED_PT = 95;
    public static int INVALID_PT = 65535;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/PayloadType$Audio.class */
    public static class Audio extends PayloadType {
        private int clockRate;

        public Audio() {
            this.clockRate = 0;
        }

        public Audio(int i, String str) {
            super(i, str);
            this.clockRate = 0;
        }

        public Audio(int i, String str, int i2) {
            super(i, str);
            this.clockRate = i2;
        }

        public Audio(int i, String str, int i2, int i3) {
            super(i, str, i2);
            this.clockRate = i3;
        }

        public Audio(Audio audio) {
            super(audio);
            this.clockRate = audio.getClockRate();
        }

        public Audio(PayloadType payloadType) {
            super(payloadType);
            this.clockRate = 0;
        }

        @Override // org.jivesoftware.smackx.jingle.media.PayloadType
        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (!super.equals(obj)) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else if (getClockRate() != ((Audio) obj).getClockRate()) {
                    z = false;
                }
            }
            return z;
        }

        public int getClockRate() {
            return this.clockRate;
        }

        @Override // org.jivesoftware.smackx.jingle.media.PayloadType
        public int hashCode() {
            return (super.hashCode() * 31) + getClockRate();
        }

        public void setClockRate(int i) {
            this.clockRate = i;
        }
    }

    public PayloadType() {
        this(INVALID_PT, null, 1);
    }

    public PayloadType(int i, String str) {
        this(i, str, 1);
    }

    public PayloadType(int i, String str, int i2) {
        this.id = i;
        this.name = str;
        this.channels = i2;
    }

    public PayloadType(PayloadType payloadType) {
        this(payloadType.getId(), payloadType.getName(), payloadType.getChannels());
    }

    public static String getElementName() {
        return "payload-type";
    }

    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else if (obj == null) {
            z = false;
        } else if (getClass() != obj.getClass()) {
            z = false;
        } else {
            PayloadType payloadType = (PayloadType) obj;
            if (getChannels() != payloadType.getChannels()) {
                z = false;
            } else if (getId() != payloadType.getId()) {
                z = false;
            } else {
                z = true;
                if (getId() > MAX_FIXED_PT) {
                    if (getName() == null) {
                        z = true;
                        if (payloadType.getName() != null) {
                            z = false;
                        }
                    } else {
                        z = true;
                        if (!getName().equals(payloadType.getName())) {
                            z = false;
                        }
                    }
                }
            }
        }
        return z;
    }

    public int getChannels() {
        return this.channels;
    }

    protected String getChildAttributes() {
        StringBuilder sb = new StringBuilder();
        if (this instanceof Audio) {
            sb.append(" clockrate=\"").append(((Audio) this).getClockRate()).append("\" ");
        }
        return sb.toString();
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public int hashCode() {
        int channels = getChannels();
        return ((((channels + 31) * 31) + getId()) * 31) + (getName() == null ? 0 : getName().hashCode());
    }

    public boolean isNull() {
        boolean z = true;
        if (getId() != INVALID_PT && getName() != null) {
            z = false;
        }
        return z;
    }

    public void setChannels(int i) {
        this.channels = i;
    }

    public void setId(int i) {
        this.id = i;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" ");
        if (getId() != INVALID_PT) {
            sb.append(" id=\"").append(getId()).append("\"");
        }
        if (getName() != null) {
            sb.append(" name=\"").append(getName()).append("\"");
        }
        if (getChannels() != 0) {
            sb.append(" channels=\"").append(getChannels()).append("\"");
        }
        if (getChildAttributes() != null) {
            sb.append(getChildAttributes());
        }
        sb.append("/>");
        return sb.toString();
    }
}
