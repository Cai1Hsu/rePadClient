package org.jivesoftware.smackx.workgroup.packet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/Transcripts.class */
public class Transcripts extends IQ {
    private static final SimpleDateFormat UTC_FORMAT = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private List<TranscriptSummary> summaries;
    private String userID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail.class */
    public static class AgentDetail {
        private String agentJID;
        private Date joinTime;
        private Date leftTime;

        public AgentDetail(String str, Date date, Date date2) {
            this.agentJID = str;
            this.joinTime = date;
            this.leftTime = date2;
        }

        public String getAgentJID() {
            return this.agentJID;
        }

        public Date getJoinTime() {
            return this.joinTime;
        }

        public Date getLeftTime() {
            return this.leftTime;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<agent>");
            if (this.agentJID != null) {
                sb.append("<agentJID>").append(this.agentJID).append("</agentJID>");
            }
            if (this.joinTime != null) {
                sb.append("<joinTime>").append(Transcripts.UTC_FORMAT.format(this.joinTime)).append("</joinTime>");
            }
            if (this.leftTime != null) {
                sb.append("<leftTime>").append(Transcripts.UTC_FORMAT.format(this.leftTime)).append("</leftTime>");
            }
            sb.append("</agent>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary.class */
    public static class TranscriptSummary {
        private List<AgentDetail> agentDetails;
        private Date joinTime;
        private Date leftTime;
        private String sessionID;

        public TranscriptSummary(String str, Date date, Date date2, List<AgentDetail> list) {
            this.sessionID = str;
            this.joinTime = date;
            this.leftTime = date2;
            this.agentDetails = list;
        }

        public List<AgentDetail> getAgentDetails() {
            return this.agentDetails;
        }

        public Date getJoinTime() {
            return this.joinTime;
        }

        public Date getLeftTime() {
            return this.leftTime;
        }

        public String getSessionID() {
            return this.sessionID;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<transcript sessionID=\"").append(this.sessionID).append("\">");
            if (this.joinTime != null) {
                sb.append("<joinTime>").append(Transcripts.UTC_FORMAT.format(this.joinTime)).append("</joinTime>");
            }
            if (this.leftTime != null) {
                sb.append("<leftTime>").append(Transcripts.UTC_FORMAT.format(this.leftTime)).append("</leftTime>");
            }
            sb.append("<agents>");
            for (AgentDetail agentDetail : this.agentDetails) {
                sb.append(agentDetail.toXML());
            }
            sb.append("</agents></transcript>");
            return sb.toString();
        }
    }

    static {
        UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT+0"));
    }

    public Transcripts(String str) {
        this.userID = str;
        this.summaries = new ArrayList();
    }

    public Transcripts(String str, List<TranscriptSummary> list) {
        this.userID = str;
        this.summaries = list;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<transcripts xmlns=\"http://jivesoftware.com/protocol/workgroup\" userID=\"").append(this.userID).append("\">");
        for (TranscriptSummary transcriptSummary : this.summaries) {
            sb.append(transcriptSummary.toXML());
        }
        sb.append("</transcripts>");
        return sb.toString();
    }

    public List<TranscriptSummary> getSummaries() {
        return Collections.unmodifiableList(this.summaries);
    }

    public String getUserID() {
        return this.userID;
    }
}
