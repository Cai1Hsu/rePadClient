package org.jivesoftware.smackx.commands;

import org.jivesoftware.smackx.packet.AdHocCommandData;

/* loaded from: classes.jar:org/jivesoftware/smackx/commands/LocalCommand.class */
public abstract class LocalCommand extends AdHocCommand {
    private long creationDate = System.currentTimeMillis();
    private int currenStage = -1;
    private String ownerJID;
    private String sessionID;

    void decrementStage() {
        this.currenStage--;
    }

    public long getCreationDate() {
        return this.creationDate;
    }

    public int getCurrentStage() {
        return this.currenStage;
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public String getOwnerJID() {
        return this.ownerJID;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public abstract boolean hasPermission(String str);

    void incrementStage() {
        this.currenStage++;
    }

    public abstract boolean isLastStage();

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    void setData(AdHocCommandData adHocCommandData) {
        adHocCommandData.setSessionID(this.sessionID);
        super.setData(adHocCommandData);
    }

    public void setOwnerJID(String str) {
        this.ownerJID = str;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
        getData().setSessionID(str);
    }
}
