package org.jivesoftware.smackx.workgroup.ext.macros;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/macros/MacroGroup.class */
public class MacroGroup {
    private String title;
    private List<Macro> macros = new ArrayList();
    private List<MacroGroup> macroGroups = new ArrayList();

    public void addMacro(Macro macro) {
        this.macros.add(macro);
    }

    public void addMacroGroup(MacroGroup macroGroup) {
        this.macroGroups.add(macroGroup);
    }

    public Macro getMacro(int i) {
        return this.macros.get(i);
    }

    public Macro getMacroByTitle(String str) {
        Macro macro;
        Iterator it = Collections.unmodifiableList(this.macros).iterator();
        while (true) {
            if (!it.hasNext()) {
                macro = null;
                break;
            }
            Macro macro2 = (Macro) it.next();
            if (macro2.getTitle().equalsIgnoreCase(str)) {
                macro = macro2;
                break;
            }
        }
        return macro;
    }

    public MacroGroup getMacroGroup(int i) {
        return this.macroGroups.get(i);
    }

    public MacroGroup getMacroGroupByTitle(String str) {
        MacroGroup macroGroup;
        Iterator it = Collections.unmodifiableList(this.macroGroups).iterator();
        while (true) {
            if (!it.hasNext()) {
                macroGroup = null;
                break;
            }
            MacroGroup macroGroup2 = (MacroGroup) it.next();
            if (macroGroup2.getTitle().equalsIgnoreCase(str)) {
                macroGroup = macroGroup2;
                break;
            }
        }
        return macroGroup;
    }

    public List<MacroGroup> getMacroGroups() {
        return this.macroGroups;
    }

    public List<Macro> getMacros() {
        return this.macros;
    }

    public String getTitle() {
        return this.title;
    }

    public void removeMacro(Macro macro) {
        this.macros.remove(macro);
    }

    public void removeMacroGroup(MacroGroup macroGroup) {
        this.macroGroups.remove(macroGroup);
    }

    public void setMacroGroups(List<MacroGroup> list) {
        this.macroGroups = list;
    }

    public void setMacros(List<Macro> list) {
        this.macros = list;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<macrogroup>");
        sb.append("<title>" + getTitle() + "</title>");
        sb.append("<macros>");
        for (Macro macro : getMacros()) {
            sb.append("<macro>");
            sb.append("<title>" + macro.getTitle() + "</title>");
            sb.append("<type>" + macro.getType() + "</type>");
            sb.append("<description>" + macro.getDescription() + "</description>");
            sb.append("<response>" + macro.getResponse() + "</response>");
            sb.append("</macro>");
        }
        sb.append("</macros>");
        if (getMacroGroups().size() > 0) {
            sb.append("<macroGroups>");
            for (MacroGroup macroGroup : getMacroGroups()) {
                sb.append(macroGroup.toXML());
            }
            sb.append("</macroGroups>");
        }
        sb.append("</macrogroup>");
        return sb.toString();
    }
}
