package org.jivesoftware.smack.packet;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Privacy.class */
public class Privacy extends IQ {
    private String activeName;
    private String defaultName;
    private boolean declineActiveList = false;
    private boolean declineDefaultList = false;
    private Map<String, List<PrivacyItem>> itemLists = new HashMap();

    public boolean changeDefaultList(String str) {
        boolean z;
        if (getItemLists().containsKey(str)) {
            setDefaultName(str);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public void deleteList(String str) {
        getItemLists().remove(str);
    }

    public void deletePrivacyList(String str) {
        getItemLists().remove(str);
        if (getDefaultName() == null || !str.equals(getDefaultName())) {
            return;
        }
        setDefaultName(null);
    }

    public String getActiveName() {
        return this.activeName;
    }

    public List<PrivacyItem> getActivePrivacyList() {
        return getActiveName() == null ? null : getItemLists().get(getActiveName());
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:privacy\">");
        if (isDeclineActiveList()) {
            sb.append("<active/>");
        } else if (getActiveName() != null) {
            sb.append("<active name=\"").append(getActiveName()).append("\"/>");
        }
        if (isDeclineDefaultList()) {
            sb.append("<default/>");
        } else if (getDefaultName() != null) {
            sb.append("<default name=\"").append(getDefaultName()).append("\"/>");
        }
        for (Map.Entry<String, List<PrivacyItem>> entry : getItemLists().entrySet()) {
            String key = entry.getKey();
            List<PrivacyItem> value = entry.getValue();
            if (value.isEmpty()) {
                sb.append("<list name=\"").append(key).append("\"/>");
            } else {
                sb.append("<list name=\"").append(key).append("\">");
            }
            for (PrivacyItem privacyItem : value) {
                sb.append(privacyItem.toXML());
            }
            if (!value.isEmpty()) {
                sb.append("</list>");
            }
        }
        sb.append(getExtensionsXML());
        sb.append("</query>");
        return sb.toString();
    }

    public String getDefaultName() {
        return this.defaultName;
    }

    public List<PrivacyItem> getDefaultPrivacyList() {
        return getDefaultName() == null ? null : getItemLists().get(getDefaultName());
    }

    public PrivacyItem getItem(String str, int i) {
        Iterator<PrivacyItem> it = getPrivacyList(str).iterator();
        PrivacyItem privacyItem = null;
        while (privacyItem == null && it.hasNext()) {
            PrivacyItem next = it.next();
            if (next.getOrder() == i) {
                privacyItem = next;
            }
        }
        return privacyItem;
    }

    public Map<String, List<PrivacyItem>> getItemLists() {
        return this.itemLists;
    }

    public List<PrivacyItem> getPrivacyList(String str) {
        return getItemLists().get(str);
    }

    public Set<String> getPrivacyListNames() {
        return this.itemLists.keySet();
    }

    public boolean isDeclineActiveList() {
        return this.declineActiveList;
    }

    public boolean isDeclineDefaultList() {
        return this.declineDefaultList;
    }

    public void setActiveName(String str) {
        this.activeName = str;
    }

    public List<PrivacyItem> setActivePrivacyList() {
        setActiveName(getDefaultName());
        return getItemLists().get(getActiveName());
    }

    public void setDeclineActiveList(boolean z) {
        this.declineActiveList = z;
    }

    public void setDeclineDefaultList(boolean z) {
        this.declineDefaultList = z;
    }

    public void setDefaultName(String str) {
        this.defaultName = str;
    }

    public List<PrivacyItem> setPrivacyList(String str, List<PrivacyItem> list) {
        getItemLists().put(str, list);
        return list;
    }
}
