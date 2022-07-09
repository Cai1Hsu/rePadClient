package org.jivesoftware.smackx.search;

import java.util.ArrayList;
import java.util.Iterator;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/search/SimpleUserSearch.class */
class SimpleUserSearch extends IQ {
    private ReportedData data;
    private Form form;

    SimpleUserSearch() {
    }

    private String getItemsToSearch() {
        String sb;
        StringBuilder sb2 = new StringBuilder();
        if (this.form == null) {
            this.form = Form.getFormFrom(this);
        }
        if (this.form == null) {
            sb = "";
        } else {
            Iterator<FormField> fields = this.form.getFields();
            while (fields.hasNext()) {
                FormField next = fields.next();
                String variable = next.getVariable();
                String singleValue = getSingleValue(next);
                if (singleValue.trim().length() > 0) {
                    sb2.append("<").append(variable).append(">").append(singleValue).append("</").append(variable).append(">");
                }
            }
            sb = sb2.toString();
        }
        return sb;
    }

    private static String getSingleValue(FormField formField) {
        Iterator<String> values = formField.getValues();
        return values.hasNext() ? values.next() : "";
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<query xmlns=\"jabber:iq:search\">" + getItemsToSearch() + "</query>";
    }

    public ReportedData getReportedData() {
        return this.data;
    }

    protected void parseItems(XmlPullParser xmlPullParser) throws Exception {
        ReportedData reportedData = new ReportedData();
        reportedData.addColumn(new ReportedData.Column("JID", "jid", FormField.TYPE_TEXT_SINGLE));
        boolean z = false;
        ArrayList arrayList = new ArrayList();
        while (!z) {
            if (xmlPullParser.getAttributeCount() > 0) {
                String attributeValue = xmlPullParser.getAttributeValue("", "jid");
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(attributeValue);
                arrayList.add(new ReportedData.Field("jid", arrayList2));
            }
            int next = xmlPullParser.next();
            if (next == 2 && xmlPullParser.getName().equals("item")) {
                arrayList = new ArrayList();
            } else if (next == 3 && xmlPullParser.getName().equals("item")) {
                reportedData.addRow(new ReportedData.Row(arrayList));
            } else if (next == 2) {
                String name = xmlPullParser.getName();
                String nextText = xmlPullParser.nextText();
                ArrayList arrayList3 = new ArrayList();
                arrayList3.add(nextText);
                arrayList.add(new ReportedData.Field(name, arrayList3));
                boolean z2 = false;
                Iterator<ReportedData.Column> columns = reportedData.getColumns();
                while (columns.hasNext()) {
                    if (columns.next().getVariable().equals(name)) {
                        z2 = true;
                    }
                }
                if (!z2) {
                    reportedData.addColumn(new ReportedData.Column(name, name, FormField.TYPE_TEXT_SINGLE));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                z = true;
            }
        }
        this.data = reportedData;
    }

    public void setForm(Form form) {
        this.form = form;
    }
}
