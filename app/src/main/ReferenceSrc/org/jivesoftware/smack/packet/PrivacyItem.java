package org.jivesoftware.smack.packet;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/PrivacyItem.class */
public class PrivacyItem {
    private boolean allow;
    private boolean filterIQ = false;
    private boolean filterMessage = false;
    private boolean filterPresence_in = false;
    private boolean filterPresence_out = false;
    private int order;
    private PrivacyRule rule;

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/PrivacyItem$PrivacyRule.class */
    public static class PrivacyRule {
        public static final String SUBSCRIPTION_BOTH = "both";
        public static final String SUBSCRIPTION_FROM = "from";
        public static final String SUBSCRIPTION_NONE = "none";
        public static final String SUBSCRIPTION_TO = "to";
        private Type type;
        private String value;

        protected static PrivacyRule fromString(String str) {
            PrivacyRule privacyRule;
            if (str == null) {
                privacyRule = null;
            } else {
                PrivacyRule privacyRule2 = new PrivacyRule();
                privacyRule2.setType(Type.valueOf(str.toLowerCase()));
                privacyRule = privacyRule2;
            }
            return privacyRule;
        }

        private void setSuscriptionValue(String str) {
            if (str == null) {
            }
            this.value = SUBSCRIPTION_BOTH.equalsIgnoreCase(str) ? SUBSCRIPTION_BOTH : "to".equalsIgnoreCase(str) ? "to" : SUBSCRIPTION_FROM.equalsIgnoreCase(str) ? SUBSCRIPTION_FROM : "none".equalsIgnoreCase(str) ? "none" : null;
        }

        private void setType(Type type) {
            this.type = type;
        }

        public Type getType() {
            return this.type;
        }

        public String getValue() {
            return this.value;
        }

        public boolean isSuscription() {
            return getType() == Type.subscription;
        }

        protected void setValue(String str) {
            if (isSuscription()) {
                setSuscriptionValue(str);
            } else {
                this.value = str;
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/PrivacyItem$Type.class */
    public enum Type {
        group,
        jid,
        subscription
    }

    public PrivacyItem(String str, boolean z, int i) {
        setRule(PrivacyRule.fromString(str));
        setAllow(z);
        setOrder(i);
    }

    private PrivacyRule getRule() {
        return this.rule;
    }

    private void setAllow(boolean z) {
        this.allow = z;
    }

    private void setRule(PrivacyRule privacyRule) {
        this.rule = privacyRule;
    }

    public int getOrder() {
        return this.order;
    }

    public Type getType() {
        return getRule() == null ? null : getRule().getType();
    }

    public String getValue() {
        return getRule() == null ? null : getRule().getValue();
    }

    public boolean isAllow() {
        return this.allow;
    }

    public boolean isFilterEverything() {
        return !isFilterIQ() && !isFilterMessage() && !isFilterPresence_in() && !isFilterPresence_out();
    }

    public boolean isFilterIQ() {
        return this.filterIQ;
    }

    public boolean isFilterMessage() {
        return this.filterMessage;
    }

    public boolean isFilterPresence_in() {
        return this.filterPresence_in;
    }

    public boolean isFilterPresence_out() {
        return this.filterPresence_out;
    }

    public void setFilterIQ(boolean z) {
        this.filterIQ = z;
    }

    public void setFilterMessage(boolean z) {
        this.filterMessage = z;
    }

    public void setFilterPresence_in(boolean z) {
        this.filterPresence_in = z;
    }

    public void setFilterPresence_out(boolean z) {
        this.filterPresence_out = z;
    }

    public void setOrder(int i) {
        this.order = i;
    }

    public void setValue(String str) {
        if (getRule() == null && str == null) {
            return;
        }
        getRule().setValue(str);
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<item");
        if (isAllow()) {
            sb.append(" action=\"allow\"");
        } else {
            sb.append(" action=\"deny\"");
        }
        sb.append(" order=\"").append(getOrder()).append("\"");
        if (getType() != null) {
            sb.append(" type=\"").append(getType()).append("\"");
        }
        if (getValue() != null) {
            sb.append(" value=\"").append(getValue()).append("\"");
        }
        if (isFilterEverything()) {
            sb.append("/>");
        } else {
            sb.append(">");
            if (isFilterIQ()) {
                sb.append("<iq/>");
            }
            if (isFilterMessage()) {
                sb.append("<message/>");
            }
            if (isFilterPresence_in()) {
                sb.append("<presence-in/>");
            }
            if (isFilterPresence_out()) {
                sb.append("<presence-out/>");
            }
            sb.append("</item>");
        }
        return sb.toString();
    }
}
