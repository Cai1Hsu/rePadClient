package org.jivesoftware.smackx.muc;

import java.util.Date;
import org.jivesoftware.smackx.packet.MUCInitialPresence;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/DiscussionHistory.class */
public class DiscussionHistory {
    private int maxChars = -1;
    private int maxStanzas = -1;
    private int seconds = -1;
    private Date since;

    private boolean isConfigured() {
        return this.maxChars > -1 || this.maxStanzas > -1 || this.seconds > -1 || this.since != null;
    }

    MUCInitialPresence.History getMUCHistory() {
        MUCInitialPresence.History history;
        if (!isConfigured()) {
            history = null;
        } else {
            MUCInitialPresence.History history2 = new MUCInitialPresence.History();
            if (this.maxChars > -1) {
                history2.setMaxChars(this.maxChars);
            }
            if (this.maxStanzas > -1) {
                history2.setMaxStanzas(this.maxStanzas);
            }
            if (this.seconds > -1) {
                history2.setSeconds(this.seconds);
            }
            history = history2;
            if (this.since != null) {
                history2.setSince(this.since);
                history = history2;
            }
        }
        return history;
    }

    public int getMaxChars() {
        return this.maxChars;
    }

    public int getMaxStanzas() {
        return this.maxStanzas;
    }

    public int getSeconds() {
        return this.seconds;
    }

    public Date getSince() {
        return this.since;
    }

    public void setMaxChars(int i) {
        this.maxChars = i;
    }

    public void setMaxStanzas(int i) {
        this.maxStanzas = i;
    }

    public void setSeconds(int i) {
        this.seconds = i;
    }

    public void setSince(Date date) {
        this.since = date;
    }
}
