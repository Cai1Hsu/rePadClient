package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.commands.AdHocCommand;
import org.jivesoftware.smackx.commands.AdHocCommandNote;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/AdHocCommandData.class */
public class AdHocCommandData extends IQ {
    private AdHocCommand.Action action;
    private AdHocCommand.Action executeAction;
    private DataForm form;
    private String id;
    private String lang;
    private String name;
    private String node;
    private String sessionID;
    private AdHocCommand.Status status;
    private List<AdHocCommandNote> notes = new ArrayList();
    private ArrayList<AdHocCommand.Action> actions = new ArrayList<>();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/AdHocCommandData$SpecificError.class */
    public static class SpecificError implements PacketExtension {
        public static final String namespace = "http://jabber.org/protocol/commands";
        public AdHocCommand.SpecificErrorCondition condition;

        public SpecificError(AdHocCommand.SpecificErrorCondition specificErrorCondition) {
            this.condition = specificErrorCondition;
        }

        public AdHocCommand.SpecificErrorCondition getCondition() {
            return this.condition;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return this.condition.toString();
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return namespace;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName());
            sb.append(" xmlns=\"").append(getNamespace()).append("\"/>");
            return sb.toString();
        }
    }

    public void addAction(AdHocCommand.Action action) {
        this.actions.add(action);
    }

    public void addNote(AdHocCommandNote adHocCommandNote) {
        this.notes.add(adHocCommandNote);
    }

    public AdHocCommand.Action getAction() {
        return this.action;
    }

    public List<AdHocCommand.Action> getActions() {
        return this.actions;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<command xmlns=\"http://jabber.org/protocol/commands\"");
        sb.append(" node=\"").append(this.node).append("\"");
        if (this.sessionID != null && !this.sessionID.equals("")) {
            sb.append(" sessionid=\"").append(this.sessionID).append("\"");
        }
        if (this.status != null) {
            sb.append(" status=\"").append(this.status).append("\"");
        }
        if (this.action != null) {
            sb.append(" action=\"").append(this.action).append("\"");
        }
        if (this.lang != null && !this.lang.equals("")) {
            sb.append(" lang=\"").append(this.lang).append("\"");
        }
        sb.append(">");
        if (getType() == IQ.Type.RESULT) {
            sb.append("<actions");
            if (this.executeAction != null) {
                sb.append(" execute=\"").append(this.executeAction).append("\"");
            }
            if (this.actions.size() == 0) {
                sb.append("/>");
            } else {
                sb.append(">");
                Iterator<AdHocCommand.Action> it = this.actions.iterator();
                while (it.hasNext()) {
                    sb.append("<").append(it.next()).append("/>");
                }
                sb.append("</actions>");
            }
        }
        if (this.form != null) {
            sb.append(this.form.toXML());
        }
        for (AdHocCommandNote adHocCommandNote : this.notes) {
            sb.append("<note type=\"").append(adHocCommandNote.getType().toString()).append("\">");
            sb.append(adHocCommandNote.getValue());
            sb.append("</note>");
        }
        sb.append("</command>");
        return sb.toString();
    }

    public AdHocCommand.Action getExecuteAction() {
        return this.executeAction;
    }

    public DataForm getForm() {
        return this.form;
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getNode() {
        return this.node;
    }

    public List<AdHocCommandNote> getNotes() {
        return this.notes;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public AdHocCommand.Status getStatus() {
        return this.status;
    }

    public void remveNote(AdHocCommandNote adHocCommandNote) {
        this.notes.remove(adHocCommandNote);
    }

    public void setAction(AdHocCommand.Action action) {
        this.action = action;
    }

    public void setExecuteAction(AdHocCommand.Action action) {
        this.executeAction = action;
    }

    public void setForm(DataForm dataForm) {
        this.form = dataForm;
    }

    public void setId(String str) {
        this.id = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setNode(String str) {
        this.node = str;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
    }

    public void setStatus(AdHocCommand.Status status) {
        this.status = status;
    }
}
