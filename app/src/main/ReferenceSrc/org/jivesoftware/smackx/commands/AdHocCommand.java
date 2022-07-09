package org.jivesoftware.smackx.commands;

import java.util.List;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.packet.AdHocCommandData;

/* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommand.class */
public abstract class AdHocCommand {
    private AdHocCommandData data = new AdHocCommandData();

    /* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommand$Action.class */
    public enum Action {
        execute,
        cancel,
        prev,
        next,
        complete,
        unknown
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommand$SpecificErrorCondition.class */
    public enum SpecificErrorCondition {
        badAction("bad-action"),
        malformedAction("malformed-action"),
        badLocale("bad-locale"),
        badPayload("bad-payload"),
        badSessionid("bad-sessionid"),
        sessionExpired("session-expired");
        
        private String value;

        SpecificErrorCondition(String str) {
            this.value = str;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.value;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/commands/AdHocCommand$Status.class */
    public enum Status {
        executing,
        completed,
        canceled
    }

    public static SpecificErrorCondition getSpecificErrorCondition(XMPPError xMPPError) {
        SpecificErrorCondition specificErrorCondition;
        SpecificErrorCondition[] values = SpecificErrorCondition.values();
        int length = values.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                specificErrorCondition = null;
                break;
            }
            SpecificErrorCondition specificErrorCondition2 = values[i];
            if (xMPPError.getExtension(specificErrorCondition2.toString(), AdHocCommandData.SpecificError.namespace) != null) {
                specificErrorCondition = specificErrorCondition2;
                break;
            }
            i++;
        }
        return specificErrorCondition;
    }

    protected void addActionAvailable(Action action) {
        this.data.addAction(action);
    }

    protected void addNote(AdHocCommandNote adHocCommandNote) {
        this.data.addNote(adHocCommandNote);
    }

    public abstract void cancel() throws XMPPException;

    public abstract void complete(Form form) throws XMPPException;

    public abstract void execute() throws XMPPException;

    protected List<Action> getActions() {
        return this.data.getActions();
    }

    AdHocCommandData getData() {
        return this.data;
    }

    protected Action getExecuteAction() {
        return this.data.getExecuteAction();
    }

    public Form getForm() {
        return this.data.getForm() == null ? null : new Form(this.data.getForm());
    }

    public String getName() {
        return this.data.getName();
    }

    public String getNode() {
        return this.data.getNode();
    }

    public List<AdHocCommandNote> getNotes() {
        return this.data.getNotes();
    }

    public abstract String getOwnerJID();

    public String getRaw() {
        return this.data.getChildElementXML();
    }

    public Status getStatus() {
        return this.data.getStatus();
    }

    protected boolean isValidAction(Action action) {
        return getActions().contains(action) || Action.cancel.equals(action);
    }

    public abstract void next(Form form) throws XMPPException;

    public abstract void prev() throws XMPPException;

    void setData(AdHocCommandData adHocCommandData) {
        this.data = adHocCommandData;
    }

    protected void setExecuteAction(Action action) {
        this.data.setExecuteAction(action);
    }

    protected void setForm(Form form) {
        this.data.setForm(form.getDataFormToSend());
    }

    public void setName(String str) {
        this.data.setName(str);
    }

    public void setNode(String str) {
        this.data.setNode(str);
    }
}
