package org.jivesoftware.smackx.workgroup.ext.macros;

import java.io.StringReader;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/macros/Macros.class */
public class Macros extends IQ {
    public static final String ELEMENT_NAME = "macros";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private boolean personal;
    private MacroGroup personalMacroGroup;
    private MacroGroup rootGroup;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            Macros macros = new Macros();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("model")) {
                        macros.setRootGroup(parseMacroGroups(xmlPullParser.nextText()));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(Macros.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return macros;
        }

        public Macro parseMacro(XmlPullParser xmlPullParser) throws Exception {
            Macro macro = new Macro();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("title")) {
                        xmlPullParser.next();
                        macro.setTitle(xmlPullParser.getText());
                    } else if (xmlPullParser.getName().equals("description")) {
                        macro.setDescription(xmlPullParser.nextText());
                    } else if (xmlPullParser.getName().equals("response")) {
                        macro.setResponse(xmlPullParser.nextText());
                    } else if (xmlPullParser.getName().equals("type")) {
                        macro.setType(Integer.valueOf(xmlPullParser.nextText()).intValue());
                    }
                } else if (next == 3 && xmlPullParser.getName().equals("macro")) {
                    z = true;
                }
            }
            return macro;
        }

        public MacroGroup parseMacroGroup(XmlPullParser xmlPullParser) throws Exception {
            MacroGroup macroGroup = new MacroGroup();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("macrogroup")) {
                        macroGroup.addMacroGroup(parseMacroGroup(xmlPullParser));
                    }
                    if (xmlPullParser.getName().equals("title")) {
                        macroGroup.setTitle(xmlPullParser.nextText());
                    }
                    if (xmlPullParser.getName().equals("macro")) {
                        macroGroup.addMacro(parseMacro(xmlPullParser));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals("macrogroup")) {
                    z = true;
                }
            }
            return macroGroup;
        }

        public MacroGroup parseMacroGroups(String str) throws Exception {
            MXParser mXParser = new MXParser();
            mXParser.setInput(new StringReader(str));
            int eventType = mXParser.getEventType();
            MacroGroup macroGroup = null;
            while (eventType != 1) {
                int next = mXParser.next();
                eventType = next;
                if (next == 2) {
                    eventType = next;
                    if (mXParser.getName().equals("macrogroup")) {
                        macroGroup = parseMacroGroup(mXParser);
                        eventType = next;
                    }
                }
            }
            return macroGroup;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\">");
        if (isPersonal()) {
            sb.append("<personal>true</personal>");
        }
        if (getPersonalMacroGroup() != null) {
            sb.append("<personalMacro>");
            sb.append(StringUtils.escapeForXML(getPersonalMacroGroup().toXML()));
            sb.append("</personalMacro>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public MacroGroup getPersonalMacroGroup() {
        return this.personalMacroGroup;
    }

    public MacroGroup getRootGroup() {
        return this.rootGroup;
    }

    public boolean isPersonal() {
        return this.personal;
    }

    public void setPersonal(boolean z) {
        this.personal = z;
    }

    public void setPersonalMacroGroup(MacroGroup macroGroup) {
        this.personalMacroGroup = macroGroup;
    }

    public void setRootGroup(MacroGroup macroGroup) {
        this.rootGroup = macroGroup;
    }
}
