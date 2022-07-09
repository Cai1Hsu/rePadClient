package org.apache.tools.ant.types;

import java.io.File;
import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/types/FilterSet.class */
public class FilterSet extends DataType implements Cloneable {
    public static final String DEFAULT_TOKEN_END = "@";
    public static final String DEFAULT_TOKEN_START = "@";
    static Class class$org$apache$tools$ant$types$FilterSet;
    private boolean duplicateToken;
    private String endOfToken;
    private Hashtable filterHash;
    private Vector filters;
    private Vector filtersFiles;
    private OnMissing onMissingFiltersFile;
    private Vector passedTokens;
    private boolean readingFiles;
    private boolean recurse;
    private int recurseDepth;
    private String startOfToken;

    /* loaded from: classes.jar:org/apache/tools/ant/types/FilterSet$Filter.class */
    public static class Filter {
        String token;
        String value;

        public Filter() {
        }

        public Filter(String str, String str2) {
            setToken(str);
            setValue(str2);
        }

        public String getToken() {
            return this.token;
        }

        public String getValue() {
            return this.value;
        }

        public void setToken(String str) {
            this.token = str;
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/FilterSet$FiltersFile.class */
    public class FiltersFile {
        private final FilterSet this$0;

        public FiltersFile(FilterSet filterSet) {
            this.this$0 = filterSet;
        }

        public void setFile(File file) {
            this.this$0.filtersFiles.add(file);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/FilterSet$OnMissing.class */
    public static class OnMissing extends EnumeratedAttribute {
        private static final int FAIL_INDEX = 0;
        private static final int IGNORE_INDEX = 2;
        private static final int WARN_INDEX = 1;
        private static final String[] VALUES = {"fail", "warn", Definer.OnError.POLICY_IGNORE};
        public static final OnMissing FAIL = new OnMissing("fail");
        public static final OnMissing WARN = new OnMissing("warn");
        public static final OnMissing IGNORE = new OnMissing(Definer.OnError.POLICY_IGNORE);

        public OnMissing() {
        }

        public OnMissing(String str) {
            setValue(str);
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return VALUES;
        }
    }

    public FilterSet() {
        this.startOfToken = "@";
        this.endOfToken = "@";
        this.duplicateToken = false;
        this.recurse = true;
        this.filterHash = null;
        this.filtersFiles = new Vector();
        this.onMissingFiltersFile = OnMissing.FAIL;
        this.readingFiles = false;
        this.recurseDepth = 0;
        this.filters = new Vector();
    }

    protected FilterSet(FilterSet filterSet) {
        this.startOfToken = "@";
        this.endOfToken = "@";
        this.duplicateToken = false;
        this.recurse = true;
        this.filterHash = null;
        this.filtersFiles = new Vector();
        this.onMissingFiltersFile = OnMissing.FAIL;
        this.readingFiles = false;
        this.recurseDepth = 0;
        this.filters = new Vector();
        this.filters = (Vector) filterSet.getFilters().clone();
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void handleMissingFile(String str) {
        switch (this.onMissingFiltersFile.getIndex()) {
            case 0:
                throw new BuildException(str);
            case 1:
                log(str, 1);
                return;
            case 2:
                return;
            default:
                throw new BuildException("Invalid value for onMissingFiltersFile");
        }
    }

    private String iReplaceTokens(String str) {
        String str2;
        synchronized (this) {
            String beginToken = getBeginToken();
            String endToken = getEndToken();
            int indexOf = str.indexOf(beginToken);
            str2 = str;
            if (indexOf > -1) {
                Hashtable filterHash = getFilterHash();
                try {
                    StringBuffer stringBuffer = new StringBuffer();
                    int i = 0;
                    while (indexOf > -1) {
                        int indexOf2 = str.indexOf(endToken, beginToken.length() + indexOf + 1);
                        if (indexOf2 == -1) {
                            break;
                        }
                        String substring = str.substring(beginToken.length() + indexOf, indexOf2);
                        stringBuffer.append(str.substring(i, indexOf));
                        if (filterHash.containsKey(substring)) {
                            String str3 = (String) filterHash.get(substring);
                            String str4 = str3;
                            if (this.recurse) {
                                str4 = str3;
                                if (!str3.equals(substring)) {
                                    str4 = replaceTokens(str3, substring);
                                }
                            }
                            log(new StringBuffer().append("Replacing: ").append(beginToken).append(substring).append(endToken).append(" -> ").append(str4).toString(), 3);
                            stringBuffer.append(str4);
                            i = beginToken.length() + indexOf + substring.length() + endToken.length();
                        } else {
                            stringBuffer.append(beginToken.charAt(0));
                            i = indexOf + 1;
                        }
                        indexOf = str.indexOf(beginToken, i);
                    }
                    stringBuffer.append(str.substring(i));
                    str2 = stringBuffer.toString();
                } catch (StringIndexOutOfBoundsException e) {
                    str2 = str;
                }
            }
        }
        return str2;
    }

    private String replaceTokens(String str, String str2) throws BuildException {
        String str3;
        synchronized (this) {
            String beginToken = getBeginToken();
            String endToken = getEndToken();
            if (this.recurseDepth == 0) {
                this.passedTokens = new VectorSet();
            }
            this.recurseDepth++;
            if (!this.passedTokens.contains(str2) || this.duplicateToken) {
                this.passedTokens.addElement(str2);
                String iReplaceTokens = iReplaceTokens(str);
                if (iReplaceTokens.indexOf(beginToken) == -1 && !this.duplicateToken && this.recurseDepth == 1) {
                    this.passedTokens = null;
                    str3 = iReplaceTokens;
                } else if (this.duplicateToken) {
                    str3 = iReplaceTokens;
                    if (this.passedTokens.size() > 0) {
                        String str4 = (String) this.passedTokens.remove(this.passedTokens.size() - 1);
                        str3 = str4;
                        if (this.passedTokens.size() == 0) {
                            str3 = new StringBuffer().append(beginToken).append(str4).append(endToken).toString();
                            this.duplicateToken = false;
                        }
                    }
                } else {
                    str3 = iReplaceTokens;
                    if (this.passedTokens.size() > 0) {
                        this.passedTokens.remove(this.passedTokens.size() - 1);
                        str3 = iReplaceTokens;
                    }
                }
                this.recurseDepth--;
            } else {
                this.duplicateToken = true;
                System.out.println(new StringBuffer().append("Infinite loop in tokens. Currently known tokens : ").append(this.passedTokens.toString()).append("\nProblem token : ").append(beginToken).append(str2).append(endToken).append(" called from ").append(beginToken).append(this.passedTokens.lastElement().toString()).append(endToken).toString());
                this.recurseDepth--;
                str3 = str2;
            }
        }
        return str3;
    }

    public void addConfiguredFilterSet(FilterSet filterSet) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            Enumeration elements = filterSet.getFilters().elements();
            while (elements.hasMoreElements()) {
                addFilter((Filter) elements.nextElement());
            }
        }
    }

    public void addFilter(String str, String str2) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            addFilter(new Filter(str, str2));
        }
    }

    public void addFilter(Filter filter) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.filters.addElement(filter);
            this.filterHash = null;
        }
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() throws BuildException {
        FilterSet filterSet;
        synchronized (this) {
            if (isReference()) {
                filterSet = getRef().clone();
            } else {
                try {
                    FilterSet filterSet2 = (FilterSet) super.clone();
                    filterSet2.filters = (Vector) getFilters().clone();
                    filterSet2.setProject(getProject());
                    filterSet = filterSet2;
                } catch (CloneNotSupportedException e) {
                    throw new BuildException(e);
                }
            }
        }
        return filterSet;
    }

    public FiltersFile createFiltersfile() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        return new FiltersFile(this);
    }

    public String getBeginToken() {
        return isReference() ? getRef().getBeginToken() : this.startOfToken;
    }

    public String getEndToken() {
        return isReference() ? getRef().getEndToken() : this.endOfToken;
    }

    public Hashtable getFilterHash() {
        Hashtable hashtable;
        synchronized (this) {
            if (isReference()) {
                hashtable = getRef().getFilterHash();
            } else {
                dieOnCircularReference();
                if (this.filterHash == null) {
                    this.filterHash = new Hashtable(getFilters().size());
                    Enumeration elements = getFilters().elements();
                    while (elements.hasMoreElements()) {
                        Filter filter = (Filter) elements.nextElement();
                        this.filterHash.put(filter.getToken(), filter.getValue());
                    }
                }
                hashtable = this.filterHash;
            }
        }
        return hashtable;
    }

    protected Vector getFilters() {
        Vector vector;
        synchronized (this) {
            if (isReference()) {
                vector = getRef().getFilters();
            } else {
                dieOnCircularReference();
                if (!this.readingFiles) {
                    this.readingFiles = true;
                    int size = this.filtersFiles.size();
                    for (int i = 0; i < size; i++) {
                        readFiltersFromFile((File) this.filtersFiles.get(i));
                    }
                    this.filtersFiles.clear();
                    this.readingFiles = false;
                }
                vector = this.filters;
            }
        }
        return vector;
    }

    public OnMissing getOnMissingFiltersFile() {
        return this.onMissingFiltersFile;
    }

    protected FilterSet getRef() {
        Class cls;
        if (class$org$apache$tools$ant$types$FilterSet == null) {
            cls = class$("org.apache.tools.ant.types.FilterSet");
            class$org$apache$tools$ant$types$FilterSet = cls;
        } else {
            cls = class$org$apache$tools$ant$types$FilterSet;
        }
        return (FilterSet) getCheckedRef(cls, "filterset");
    }

    public boolean hasFilters() {
        boolean z;
        synchronized (this) {
            z = getFilters().size() > 0;
        }
        return z;
    }

    public boolean isRecurse() {
        return this.recurse;
    }

    public void readFiltersFromFile(File file) throws BuildException {
        FileInputStream fileInputStream;
        Throwable th;
        Properties properties;
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            if (!file.exists()) {
                handleMissingFile(new StringBuffer().append("Could not read filters from file ").append(file).append(" as it doesn't exist.").toString());
            }
            if (file.isFile()) {
                log(new StringBuffer().append("Reading filters from ").append(file).toString(), 3);
                FileInputStream fileInputStream2 = null;
                try {
                    try {
                        properties = new Properties();
                        fileInputStream = new FileInputStream(file);
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } catch (Exception e) {
                    e = e;
                    fileInputStream = null;
                }
                try {
                    properties.load(fileInputStream);
                    Enumeration<?> propertyNames = properties.propertyNames();
                    Vector filters = getFilters();
                    while (propertyNames.hasMoreElements()) {
                        String str = (String) propertyNames.nextElement();
                        filters.addElement(new Filter(str, properties.getProperty(str)));
                    }
                    FileUtils.close(fileInputStream);
                } catch (Exception e2) {
                    e = e2;
                    FileInputStream fileInputStream3 = fileInputStream;
                    FileInputStream fileInputStream4 = fileInputStream;
                    FileInputStream fileInputStream5 = fileInputStream;
                    FileInputStream fileInputStream6 = fileInputStream;
                    throw new BuildException(new StringBuffer().append("Could not read filters from file: ").append(file).toString(), e);
                } catch (Throwable th3) {
                    th = th3;
                    fileInputStream2 = fileInputStream;
                    FileUtils.close(fileInputStream2);
                    throw th;
                }
            } else {
                handleMissingFile(new StringBuffer().append("Must specify a file rather than a directory in the filtersfile attribute:").append(file).toString());
            }
            this.filterHash = null;
        }
    }

    public String replaceTokens(String str) {
        String iReplaceTokens;
        synchronized (this) {
            iReplaceTokens = iReplaceTokens(str);
        }
        return iReplaceTokens;
    }

    public void setBeginToken(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (str == null || "".equals(str)) {
            throw new BuildException("beginToken must not be empty");
        }
        this.startOfToken = str;
    }

    public void setEndToken(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (str == null || "".equals(str)) {
            throw new BuildException("endToken must not be empty");
        }
        this.endOfToken = str;
    }

    public void setFiltersfile(File file) throws BuildException {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.filtersFiles.add(file);
    }

    public void setOnMissingFiltersFile(OnMissing onMissing) {
        this.onMissingFiltersFile = onMissing;
    }

    public void setRecurse(boolean z) {
        this.recurse = z;
    }
}
