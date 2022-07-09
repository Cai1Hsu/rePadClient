package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.packet.DataForm;

/* loaded from: classes.jar:org/jivesoftware/smackx/ReportedData.class */
public class ReportedData {
    private List<Column> columns;
    private List<Row> rows;
    private String title;

    /* loaded from: classes.jar:org/jivesoftware/smackx/ReportedData$Column.class */
    public static class Column {
        private String label;
        private String type;
        private String variable;

        public Column(String str, String str2, String str3) {
            this.label = str;
            this.variable = str2;
            this.type = str3;
        }

        public String getLabel() {
            return this.label;
        }

        public String getType() {
            return this.type;
        }

        public String getVariable() {
            return this.variable;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/ReportedData$Field.class */
    public static class Field {
        private List<String> values;
        private String variable;

        public Field(String str, List<String> list) {
            this.variable = str;
            this.values = list;
        }

        public Iterator<String> getValues() {
            return Collections.unmodifiableList(this.values).iterator();
        }

        public String getVariable() {
            return this.variable;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/ReportedData$Row.class */
    public static class Row {
        private List<Field> fields;

        public Row(List<Field> list) {
            this.fields = new ArrayList();
            this.fields = list;
        }

        private Iterator<Field> getFields() {
            return Collections.unmodifiableList(new ArrayList(this.fields)).iterator();
        }

        public Iterator<String> getValues(String str) {
            Iterator<String> it;
            Iterator<Field> fields = getFields();
            while (true) {
                if (!fields.hasNext()) {
                    it = null;
                    break;
                }
                Field next = fields.next();
                if (str.equalsIgnoreCase(next.getVariable())) {
                    it = next.getValues();
                    break;
                }
            }
            return it;
        }
    }

    public ReportedData() {
        this.columns = new ArrayList();
        this.rows = new ArrayList();
        this.title = "";
    }

    private ReportedData(DataForm dataForm) {
        this.columns = new ArrayList();
        this.rows = new ArrayList();
        this.title = "";
        Iterator<FormField> fields = dataForm.getReportedData().getFields();
        while (fields.hasNext()) {
            FormField next = fields.next();
            this.columns.add(new Column(next.getLabel(), next.getVariable(), next.getType()));
        }
        Iterator<DataForm.Item> items = dataForm.getItems();
        while (items.hasNext()) {
            DataForm.Item next2 = items.next();
            ArrayList arrayList = new ArrayList(this.columns.size());
            Iterator<FormField> fields2 = next2.getFields();
            while (fields2.hasNext()) {
                FormField next3 = fields2.next();
                ArrayList arrayList2 = new ArrayList();
                Iterator<String> values = next3.getValues();
                while (values.hasNext()) {
                    arrayList2.add(values.next());
                }
                arrayList.add(new Field(next3.getVariable(), arrayList2));
            }
            this.rows.add(new Row(arrayList));
        }
        this.title = dataForm.getTitle();
    }

    public static ReportedData getReportedDataFrom(Packet packet) {
        ReportedData reportedData;
        PacketExtension extension = packet.getExtension("x", Form.NAMESPACE);
        if (extension != null) {
            DataForm dataForm = (DataForm) extension;
            if (dataForm.getReportedData() != null) {
                reportedData = new ReportedData(dataForm);
                return reportedData;
            }
        }
        reportedData = null;
        return reportedData;
    }

    public void addColumn(Column column) {
        this.columns.add(column);
    }

    public void addRow(Row row) {
        this.rows.add(row);
    }

    public Iterator<Column> getColumns() {
        return Collections.unmodifiableList(new ArrayList(this.columns)).iterator();
    }

    public Iterator<Row> getRows() {
        return Collections.unmodifiableList(new ArrayList(this.rows)).iterator();
    }

    public String getTitle() {
        return this.title;
    }
}
