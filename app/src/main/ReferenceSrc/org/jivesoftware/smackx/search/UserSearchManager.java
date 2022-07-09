package org.jivesoftware.smackx.search;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/search/UserSearchManager.class */
public class UserSearchManager {
    private Connection con;
    private UserSearch userSearch = new UserSearch();

    public UserSearchManager(Connection connection) {
        this.con = connection;
    }

    public Form getSearchForm(String str) throws XMPPException {
        return this.userSearch.getSearchForm(this.con, str);
    }

    public ReportedData getSearchResults(Form form, String str) throws XMPPException {
        return this.userSearch.sendSearchForm(this.con, form, str);
    }

    public Collection<String> getSearchServices() throws XMPPException {
        ArrayList arrayList = new ArrayList();
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.con);
        Iterator<DiscoverItems.Item> items = instanceFor.discoverItems(this.con.getServiceName()).getItems();
        while (items.hasNext()) {
            DiscoverItems.Item next = items.next();
            try {
                try {
                    if (instanceFor.discoverInfo(next.getEntityID()).containsFeature("jabber:iq:search")) {
                        arrayList.add(next.getEntityID());
                    }
                } catch (XMPPException e) {
                }
            } catch (Exception e2) {
            }
        }
        return arrayList;
    }
}
