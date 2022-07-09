package org.apache.tools.ant.taskdefs.cvslib;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.TimeZone;
import org.apache.tools.ant.taskdefs.AbstractCvsTask;
import org.apache.tools.ant.util.CollectionUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/ChangeLogParser.class */
class ChangeLogParser {
    private static final int GET_COMMENT = 3;
    private static final int GET_DATE = 2;
    private static final int GET_FILE = 1;
    private static final int GET_PREVIOUS_REV = 5;
    private static final int GET_REVISION = 4;
    private String author;
    private String comment;
    private String date;
    private final Hashtable entries;
    private String file;
    private final int[] moduleNameLengths;
    private final String[] moduleNames;
    private String previousRevision;
    private final boolean remote;
    private String revision;
    private int status;
    private static final SimpleDateFormat INPUT_DATE = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.US);
    private static final SimpleDateFormat CVS1129_INPUT_DATE = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z", Locale.US);

    static {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        INPUT_DATE.setTimeZone(timeZone);
        CVS1129_INPUT_DATE.setTimeZone(timeZone);
    }

    public ChangeLogParser() {
        this(false, "", CollectionUtils.EMPTY_LIST);
    }

    public ChangeLogParser(boolean z, String str, List list) {
        this.status = 1;
        this.entries = new Hashtable();
        this.remote = z;
        ArrayList arrayList = new ArrayList();
        if (str != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(str);
            while (stringTokenizer.hasMoreTokens()) {
                arrayList.add(stringTokenizer.nextToken());
            }
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((AbstractCvsTask.Module) it.next()).getName());
        }
        this.moduleNames = (String[]) arrayList.toArray(new String[arrayList.size()]);
        this.moduleNameLengths = new int[this.moduleNames.length];
        for (int i = 0; i < this.moduleNames.length; i++) {
            this.moduleNameLengths[i] = this.moduleNames[i].length();
        }
    }

    private Date parseDate(String str) {
        Date parse;
        try {
            parse = INPUT_DATE.parse(str);
        } catch (ParseException e) {
            try {
                parse = CVS1129_INPUT_DATE.parse(str);
            } catch (ParseException e2) {
                throw new IllegalStateException(new StringBuffer().append("Invalid date format: ").append(str).toString());
            }
        }
        return parse;
    }

    private void processComment(String str) {
        String property = System.getProperty("line.separator");
        if (str.equals("=============================================================================")) {
            this.comment = this.comment.substring(0, this.comment.length() - property.length());
            saveEntry();
            this.status = 1;
        } else if (!str.equals("----------------------------")) {
            this.comment = new StringBuffer().append(this.comment).append(str).append(property).toString();
        } else {
            this.comment = this.comment.substring(0, this.comment.length() - property.length());
            this.status = 5;
        }
    }

    private void processDate(String str) {
        if (str.startsWith("date:")) {
            int indexOf = str.indexOf(59);
            this.date = str.substring("date: ".length(), indexOf);
            int indexOf2 = str.indexOf("author: ", indexOf + 1);
            this.author = str.substring("author: ".length() + indexOf2, str.indexOf(59, indexOf2 + 1));
            this.status = 3;
            this.comment = "";
        }
    }

    private void processFile(String str) {
        int i;
        if (!this.remote && str.startsWith("Working file:")) {
            this.file = str.substring(14, str.length());
            this.status = 4;
        } else if (!this.remote || !str.startsWith("RCS file:")) {
        } else {
            int i2 = 0;
            while (true) {
                i = 0;
                if (i2 >= this.moduleNames.length) {
                    break;
                }
                int indexOf = str.indexOf(this.moduleNames[i2]);
                if (indexOf >= 0) {
                    i = this.moduleNameLengths[i2] + indexOf + 1;
                    break;
                }
                i2++;
            }
            int indexOf2 = str.indexOf(",v");
            if (indexOf2 == -1) {
                this.file = str.substring(i);
            } else {
                this.file = str.substring(i, indexOf2);
            }
            this.status = 4;
        }
    }

    private void processGetPreviousRevision(String str) {
        if (!str.startsWith("revision ")) {
            throw new IllegalStateException(new StringBuffer().append("Unexpected line from CVS: ").append(str).toString());
        }
        this.previousRevision = str.substring("revision ".length());
        saveEntry();
        this.revision = this.previousRevision;
        this.status = 2;
    }

    private void processRevision(String str) {
        if (str.startsWith("revision")) {
            this.revision = str.substring(9);
            this.status = 2;
        } else if (!str.startsWith("======")) {
        } else {
            this.status = 1;
        }
    }

    private void saveEntry() {
        CVSEntry cVSEntry;
        String stringBuffer = new StringBuffer().append(this.date).append(this.author).append(this.comment).toString();
        if (!this.entries.containsKey(stringBuffer)) {
            cVSEntry = new CVSEntry(parseDate(this.date), this.author, this.comment);
            this.entries.put(stringBuffer, cVSEntry);
        } else {
            cVSEntry = (CVSEntry) this.entries.get(stringBuffer);
        }
        cVSEntry.addFile(this.file, this.revision, this.previousRevision);
    }

    public CVSEntry[] getEntrySetAsArray() {
        CVSEntry[] cVSEntryArr = new CVSEntry[this.entries.size()];
        int i = 0;
        Enumeration elements = this.entries.elements();
        while (elements.hasMoreElements()) {
            cVSEntryArr[i] = (CVSEntry) elements.nextElement();
            i++;
        }
        return cVSEntryArr;
    }

    public void reset() {
        this.file = null;
        this.date = null;
        this.author = null;
        this.comment = null;
        this.revision = null;
        this.previousRevision = null;
    }

    public void stdout(String str) {
        switch (this.status) {
            case 1:
                reset();
                processFile(str);
                return;
            case 2:
                processDate(str);
                return;
            case 3:
                processComment(str);
                return;
            case 4:
                processRevision(str);
                return;
            case 5:
                processGetPreviousRevision(str);
                return;
            default:
                return;
        }
    }
}
