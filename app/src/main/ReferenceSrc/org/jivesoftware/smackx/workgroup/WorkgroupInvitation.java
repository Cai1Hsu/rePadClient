package org.jivesoftware.smackx.workgroup;

import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/WorkgroupInvitation.class */
public class WorkgroupInvitation {
    protected String groupChatName;
    protected String invitationSender;
    protected String issuingWorkgroupName;
    protected String messageBody;
    protected Map<String, List<String>> metaData;
    protected String sessionID;
    protected String uniqueID;

    public WorkgroupInvitation(String str, String str2, String str3, String str4, String str5, String str6) {
        this(str, str2, str3, str4, str5, str6, null);
    }

    public WorkgroupInvitation(String str, String str2, String str3, String str4, String str5, String str6, Map<String, List<String>> map) {
        this.uniqueID = str;
        this.sessionID = str4;
        this.groupChatName = str2;
        this.issuingWorkgroupName = str3;
        this.messageBody = str5;
        this.invitationSender = str6;
        this.metaData = map;
    }

    public String getGroupChatName() {
        return this.groupChatName;
    }

    public String getInvitationSender() {
        return this.invitationSender;
    }

    public String getMessageBody() {
        return this.messageBody;
    }

    public Map<String, List<String>> getMetaData() {
        return this.metaData;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public String getUniqueID() {
        return this.uniqueID;
    }

    public String getWorkgroupName() {
        return this.issuingWorkgroupName;
    }
}
