package org.jivesoftware.smackx.muc;

import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.packet.DiscoverInfo;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/RoomInfo.class */
public class RoomInfo {
    private String description;
    private boolean membersOnly;
    private boolean moderated;
    private boolean nonanonymous;
    private int occupantsCount;
    private boolean passwordProtected;
    private boolean persistent;
    private String room;
    private String subject;

    RoomInfo(DiscoverInfo discoverInfo) {
        this.description = "";
        this.subject = "";
        this.occupantsCount = -1;
        this.room = discoverInfo.getFrom();
        this.membersOnly = discoverInfo.containsFeature("muc_membersonly");
        this.moderated = discoverInfo.containsFeature("muc_moderated");
        this.nonanonymous = discoverInfo.containsFeature("muc_nonanonymous");
        this.passwordProtected = discoverInfo.containsFeature("muc_passwordprotected");
        this.persistent = discoverInfo.containsFeature("muc_persistent");
        Form formFrom = Form.getFormFrom(discoverInfo);
        if (formFrom != null) {
            FormField field = formFrom.getField("muc#roominfo_description");
            this.description = (field == null || !field.getValues().hasNext()) ? "" : field.getValues().next();
            FormField field2 = formFrom.getField("muc#roominfo_subject");
            this.subject = (field2 == null || !field2.getValues().hasNext()) ? "" : field2.getValues().next();
            FormField field3 = formFrom.getField("muc#roominfo_occupants");
            this.occupantsCount = field3 == null ? -1 : Integer.parseInt(field3.getValues().next());
        }
    }

    public String getDescription() {
        return this.description;
    }

    public int getOccupantsCount() {
        return this.occupantsCount;
    }

    public String getRoom() {
        return this.room;
    }

    public String getSubject() {
        return this.subject;
    }

    public boolean isMembersOnly() {
        return this.membersOnly;
    }

    public boolean isModerated() {
        return this.moderated;
    }

    public boolean isNonanonymous() {
        return this.nonanonymous;
    }

    public boolean isPasswordProtected() {
        return this.passwordProtected;
    }

    public boolean isPersistent() {
        return this.persistent;
    }
}
