package org.apache.tools.ant.taskdefs;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Appendable;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.KeepAliveOutputStream;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SQLExec.class */
public class SQLExec extends JDBCTask {
    static Class class$org$apache$tools$ant$types$resources$Appendable;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private boolean rawBlobs;
    private Union resources;
    private int goodSql = 0;
    private int totalSql = 0;
    private Connection conn = null;
    private Statement statement = null;
    private File srcFile = null;
    private String sqlCommand = "";
    private Vector transactions = new Vector();
    private String delimiter = ";";
    private String delimiterType = DelimiterType.NORMAL;
    private boolean print = false;
    private boolean showheaders = true;
    private boolean showtrailers = true;
    private Resource output = null;
    private String onError = "abort";
    private String encoding = null;
    private boolean append = false;
    private boolean keepformat = false;
    private boolean escapeProcessing = true;
    private boolean expandProperties = true;
    private boolean strictDelimiterMatching = true;
    private boolean showWarnings = false;
    private String csvColumnSep = ",";
    private String csvQuoteChar = null;
    private boolean treatWarningsAsErrors = false;
    private String errorProperty = null;
    private String warningProperty = null;
    private String rowCountProperty = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SQLExec$DelimiterType.class */
    public static class DelimiterType extends EnumeratedAttribute {
        public static final String NORMAL = "normal";
        public static final String ROW = "row";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{NORMAL, ROW};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SQLExec$OnError.class */
    public static class OnError extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"continue", "stop", "abort"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SQLExec$Transaction.class */
    public class Transaction {
        private final SQLExec this$0;
        private Resource tSrcResource = null;
        private String tSqlCommand = "";

        public Transaction(SQLExec sQLExec) {
            this.this$0 = sQLExec;
        }

        public void runTransaction(PrintStream printStream) throws IOException, SQLException {
            if (this.tSqlCommand.length() != 0) {
                this.this$0.log("Executing commands", 2);
                this.this$0.runStatements(new StringReader(this.tSqlCommand), printStream);
            }
            if (this.tSrcResource != null) {
                this.this$0.log(new StringBuffer().append("Executing resource: ").append(this.tSrcResource.toString()).toString(), 2);
                InputStream inputStream = null;
                InputStreamReader inputStreamReader = null;
                try {
                    InputStream inputStream2 = this.tSrcResource.getInputStream();
                    InputStreamReader inputStreamReader2 = this.this$0.encoding == null ? new InputStreamReader(inputStream2) : new InputStreamReader(inputStream2, this.this$0.encoding);
                    inputStream = inputStream2;
                    inputStreamReader = inputStreamReader2;
                    this.this$0.runStatements(inputStreamReader2, printStream);
                    FileUtils.close(inputStream2);
                    FileUtils.close(inputStreamReader2);
                } catch (Throwable th) {
                    FileUtils.close(inputStream);
                    FileUtils.close(inputStreamReader);
                    throw th;
                }
            }
        }

        public void addConfigured(ResourceCollection resourceCollection) {
            if (resourceCollection.size() != 1) {
                throw new BuildException("only single argument resource collections are supported.");
            }
            setSrcResource((Resource) resourceCollection.iterator().next());
        }

        public void addText(String str) {
            if (str != null) {
                this.tSqlCommand = new StringBuffer().append(this.tSqlCommand).append(str).toString();
            }
        }

        public void setSrc(File file) {
            if (file != null) {
                setSrcResource(new FileResource(file));
            }
        }

        public void setSrcResource(Resource resource) {
            if (this.tSrcResource != null) {
                throw new BuildException("only one resource per transaction");
            }
            this.tSrcResource = resource;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void closeQuietly() {
        if (isAutocommit() || getConnection() == null || !this.onError.equals("abort")) {
            return;
        }
        try {
            getConnection().rollback();
        } catch (SQLException e) {
        }
    }

    private String maybeQuote(String str) {
        String str2 = str;
        if (this.csvQuoteChar != null) {
            str2 = str;
            if (str != null) {
                if (str.indexOf(this.csvColumnSep) == -1 && str.indexOf(this.csvQuoteChar) == -1) {
                    str2 = str;
                } else {
                    StringBuffer stringBuffer = new StringBuffer(this.csvQuoteChar);
                    int length = str.length();
                    char charAt = this.csvQuoteChar.charAt(0);
                    for (int i = 0; i < length; i++) {
                        char charAt2 = str.charAt(i);
                        if (charAt2 == charAt) {
                            stringBuffer.append(charAt);
                        }
                        stringBuffer.append(charAt2);
                    }
                    str2 = stringBuffer.append(this.csvQuoteChar).toString();
                }
            }
        }
        return str2;
    }

    private void printValue(ResultSet resultSet, int i, PrintStream printStream) throws SQLException {
        if (!this.rawBlobs || resultSet.getMetaData().getColumnType(i) != 2004) {
            printStream.print(maybeQuote(resultSet.getString(i)));
        } else if (resultSet.getBlob(i) == null) {
        } else {
            new StreamPumper(resultSet.getBlob(i).getBinaryStream(), printStream).run();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x004c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void printWarnings(SQLWarning sQLWarning, boolean z) throws SQLException {
        SQLWarning sQLWarning2 = sQLWarning;
        if (!this.showWarnings) {
            if (z) {
                sQLWarning2 = sQLWarning;
            }
            if (sQLWarning != null) {
                setWarningProperty();
            }
            if (!this.treatWarningsAsErrors && sQLWarning != null) {
                throw sQLWarning;
            }
        }
        while (sQLWarning2 != null) {
            log(new StringBuffer().append(sQLWarning2).append(" sql warning").toString(), this.showWarnings ? 1 : 3);
            sQLWarning2 = sQLWarning2.getNextWarning();
        }
        if (sQLWarning != null) {
        }
        if (!this.treatWarningsAsErrors) {
        }
    }

    private void setProperty(String str, String str2) {
        if (str != null) {
            getProject().setNewProperty(str, str2);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        if (resourceCollection == null) {
            throw new BuildException("Cannot add null ResourceCollection");
        }
        synchronized (this) {
            if (this.resources == null) {
                this.resources = new Union();
            }
        }
        this.resources.add(resourceCollection);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    public void addText(String str) {
        this.sqlCommand = new StringBuffer().append(this.sqlCommand).append(str).toString();
    }

    public Transaction createTransaction() {
        Transaction transaction = new Transaction(this);
        this.transactions.addElement(transaction);
        return transaction;
    }

    protected void execSQL(String str, PrintStream printStream) throws SQLException {
        int i;
        ResultSet resultSet;
        if ("".equals(str.trim())) {
            return;
        }
        ResultSet resultSet2 = null;
        ResultSet resultSet3 = null;
        try {
            try {
                try {
                    this.totalSql++;
                    log(new StringBuffer().append("SQL: ").append(str).toString(), 3);
                    int i2 = 0;
                    boolean execute = getStatement().execute(str);
                    int updateCount = getStatement().getUpdateCount();
                    ResultSet resultSet4 = null;
                    while (true) {
                        i = i2;
                        if (updateCount != -1) {
                            i = i2 + updateCount;
                        }
                        resultSet = resultSet4;
                        if (execute) {
                            ResultSet resultSet5 = getStatement().getResultSet();
                            printWarnings(resultSet5.getWarnings(), false);
                            resultSet5.clearWarnings();
                            resultSet = resultSet5;
                            if (this.print) {
                                printResults(resultSet5, printStream);
                                resultSet = resultSet5;
                            }
                        }
                        boolean moreResults = getStatement().getMoreResults();
                        ResultSet resultSet6 = resultSet;
                        int updateCount2 = getStatement().getUpdateCount();
                        resultSet4 = resultSet;
                        execute = moreResults;
                        updateCount = updateCount2;
                        i2 = i;
                        if (!moreResults) {
                            resultSet4 = resultSet;
                            execute = moreResults;
                            updateCount = updateCount2;
                            i2 = i;
                            if (updateCount2 == -1) {
                                break;
                            }
                        }
                    }
                    printWarnings(getStatement().getWarnings(), false);
                    ResultSet resultSet7 = resultSet;
                    getStatement().clearWarnings();
                    ResultSet resultSet8 = resultSet;
                    ResultSet resultSet9 = resultSet;
                    ResultSet resultSet10 = resultSet;
                    log(new StringBuffer().append(i).append(" rows affected").toString(), 3);
                    if (i != -1) {
                        setRowCountProperty(i);
                    }
                    ResultSet resultSet11 = resultSet;
                    if (this.print) {
                        ResultSet resultSet12 = resultSet;
                        if (this.showtrailers) {
                            ResultSet resultSet13 = resultSet;
                            ResultSet resultSet14 = resultSet;
                            ResultSet resultSet15 = resultSet;
                            printStream.println(new StringBuffer().append(i).append(" rows affected").toString());
                        }
                    }
                    ResultSet resultSet16 = resultSet;
                    printWarnings(getConnection().getWarnings(), true);
                    ResultSet resultSet17 = resultSet;
                    getConnection().clearWarnings();
                    resultSet2 = resultSet;
                    this.goodSql++;
                    if (resultSet == null) {
                        return;
                    }
                    resultSet.close();
                } catch (SQLException e) {
                    ResultSet resultSet18 = resultSet2;
                    ResultSet resultSet19 = resultSet2;
                    log(new StringBuffer().append("Failed to execute: ").append(str).toString(), 0);
                    ResultSet resultSet20 = resultSet2;
                    setErrorProperty();
                    ResultSet resultSet21 = resultSet2;
                    if (!this.onError.equals("abort")) {
                        ResultSet resultSet22 = resultSet2;
                        log(e.toString(), 0);
                    }
                    ResultSet resultSet23 = resultSet2;
                    if (!this.onError.equals("continue")) {
                        resultSet3 = resultSet2;
                        throw e;
                    } else if (resultSet2 == null) {
                    } else {
                        resultSet2.close();
                    }
                }
            } catch (SQLException e2) {
            }
        } catch (Throwable th) {
            if (resultSet3 != null) {
                try {
                    resultSet3.close();
                } catch (SQLException e3) {
                }
            }
            throw th;
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:165:0x03b8 -> B:149:0x0338). Please submit an issue!!! */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        PrintStream printStream;
        PrintStream printStream2;
        Class cls;
        FileOutputStream fileOutputStream;
        Class cls2;
        Vector vector = (Vector) this.transactions.clone();
        String str = this.sqlCommand;
        this.sqlCommand = this.sqlCommand.trim();
        try {
            if (this.srcFile == null && this.sqlCommand.length() == 0 && this.resources == null && this.transactions.size() == 0) {
                throw new BuildException("Source file or resource collection, transactions or sql statement must be set!", getLocation());
            }
            if (this.srcFile != null && !this.srcFile.isFile()) {
                throw new BuildException(new StringBuffer().append("Source file ").append(this.srcFile).append(" is not a file!").toString(), getLocation());
            }
            if (this.resources != null) {
                Iterator it = this.resources.iterator();
                while (it.hasNext()) {
                    createTransaction().setSrcResource((Resource) it.next());
                }
            }
            Transaction createTransaction = createTransaction();
            createTransaction.setSrc(this.srcFile);
            createTransaction.addText(this.sqlCommand);
            if (getConnection() == null) {
                return;
            }
            try {
                PrintStream wrapSystemOut = KeepAliveOutputStream.wrapSystemOut();
                printStream = wrapSystemOut;
                printStream2 = wrapSystemOut;
            } catch (IOException e) {
                closeQuietly();
                setErrorProperty();
                if (this.onError.equals("abort")) {
                    throw new BuildException(e, getLocation());
                }
                try {
                    if (getStatement() != null) {
                        getStatement().close();
                    }
                } catch (SQLException e2) {
                }
                if (getConnection() != null) {
                    getConnection().close();
                }
            } catch (SQLException e3) {
                closeQuietly();
                setErrorProperty();
                if (this.onError.equals("abort")) {
                    throw new BuildException(e3, getLocation());
                }
                try {
                    if (getStatement() != null) {
                        getStatement().close();
                    }
                } catch (SQLException e4) {
                }
                if (getConnection() != null) {
                    getConnection().close();
                }
            }
            try {
                if (this.output != null) {
                    log(new StringBuffer().append("Opening PrintStream to output Resource ").append(this.output).toString(), 3);
                    Resource resource = this.output;
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    FileProvider fileProvider = (FileProvider) resource.as(cls);
                    if (fileProvider != null) {
                        fileOutputStream = new FileOutputStream(fileProvider.getFile(), this.append);
                    } else {
                        FileOutputStream fileOutputStream2 = null;
                        if (this.append) {
                            Resource resource2 = this.output;
                            if (class$org$apache$tools$ant$types$resources$Appendable == null) {
                                cls2 = class$("org.apache.tools.ant.types.resources.Appendable");
                                class$org$apache$tools$ant$types$resources$Appendable = cls2;
                            } else {
                                cls2 = class$org$apache$tools$ant$types$resources$Appendable;
                            }
                            Appendable appendable = (Appendable) resource2.as(cls2);
                            fileOutputStream2 = null;
                            if (appendable != null) {
                                fileOutputStream2 = appendable.getAppendOutputStream();
                            }
                        }
                        fileOutputStream = fileOutputStream2;
                        if (fileOutputStream2 == null) {
                            OutputStream outputStream = this.output.getOutputStream();
                            fileOutputStream = outputStream;
                            if (this.append) {
                                log(new StringBuffer().append("Ignoring append=true for non-appendable resource ").append(this.output).toString(), 1);
                                fileOutputStream = outputStream;
                            }
                        }
                    }
                    printStream = new PrintStream(new BufferedOutputStream(fileOutputStream));
                }
                Enumeration elements = this.transactions.elements();
                while (true) {
                    printStream2 = printStream2;
                    if (!elements.hasMoreElements()) {
                        break;
                    }
                    PrintStream printStream3 = printStream2;
                    ((Transaction) elements.nextElement()).runTransaction(printStream2);
                    PrintStream printStream4 = printStream2;
                    if (!isAutocommit()) {
                        PrintStream printStream5 = printStream2;
                        log("Committing transaction", 3);
                        PrintStream printStream6 = printStream2;
                        getConnection().commit();
                    }
                }
                try {
                    if (getStatement() != null) {
                        getStatement().close();
                    }
                } catch (SQLException e5) {
                }
                if (getConnection() != null) {
                    getConnection().close();
                }
                log(new StringBuffer().append(this.goodSql).append(" of ").append(this.totalSql).append(" SQL statements executed successfully").toString());
            } finally {
                FileUtils.close(printStream2);
            }
        } finally {
            this.transactions = vector;
            this.sqlCommand = str;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.JDBCTask
    protected Connection getConnection() {
        if (this.conn == null) {
            this.conn = super.getConnection();
            if (!isValidRdbms(this.conn)) {
                this.conn = null;
            }
        }
        return this.conn;
    }

    public boolean getExpandProperties() {
        return this.expandProperties;
    }

    protected Statement getStatement() throws SQLException {
        if (this.statement == null) {
            this.statement = getConnection().createStatement();
            this.statement.setEscapeProcessing(this.escapeProcessing);
        }
        return this.statement;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x003b, code lost:
        if (r7.equals(r5.delimiter) != false) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int lastDelimiterPosition(StringBuffer stringBuffer, String str) {
        int i;
        if (this.strictDelimiterMatching) {
            if (!this.delimiterType.equals(DelimiterType.NORMAL) || !StringUtils.endsWith(stringBuffer, this.delimiter)) {
                i = -1;
                if (this.delimiterType.equals(DelimiterType.ROW)) {
                    i = -1;
                }
            }
            i = stringBuffer.length() - this.delimiter.length();
        } else {
            String lowerCase = this.delimiter.trim().toLowerCase(Locale.ENGLISH);
            if (this.delimiterType.equals(DelimiterType.NORMAL)) {
                int length = this.delimiter.length() - 1;
                int length2 = stringBuffer.length() - 1;
                while (length2 >= 0 && Character.isWhitespace(stringBuffer.charAt(length2))) {
                    length2--;
                }
                i = -1;
                if (length2 >= length) {
                    while (true) {
                        if (length < 0) {
                            i = length2 + 1;
                            break;
                        }
                        i = -1;
                        if (stringBuffer.substring(length2, length2 + 1).toLowerCase(Locale.ENGLISH).charAt(0) != lowerCase.charAt(length)) {
                            break;
                        }
                        length2--;
                        length--;
                    }
                }
            } else {
                i = -1;
                if (str.trim().toLowerCase(Locale.ENGLISH).equals(lowerCase)) {
                    i = stringBuffer.length() - str.length();
                }
            }
        }
        return i;
    }

    protected void printResults(PrintStream printStream) throws SQLException {
        ResultSet resultSet = getStatement().getResultSet();
        try {
            printResults(resultSet, printStream);
            if (resultSet == null) {
                return;
            }
            resultSet.close();
        } catch (Throwable th) {
            if (resultSet != null) {
                resultSet.close();
            }
            throw th;
        }
    }

    protected void printResults(ResultSet resultSet, PrintStream printStream) throws SQLException {
        if (resultSet != null) {
            log("Processing new result set.", 3);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            if (columnCount > 0) {
                if (this.showheaders) {
                    printStream.print(metaData.getColumnName(1));
                    for (int i = 2; i <= columnCount; i++) {
                        printStream.print(this.csvColumnSep);
                        printStream.print(maybeQuote(metaData.getColumnName(i)));
                    }
                    printStream.println();
                }
                while (resultSet.next()) {
                    printValue(resultSet, 1, printStream);
                    for (int i2 = 2; i2 <= columnCount; i2++) {
                        printStream.print(this.csvColumnSep);
                        printValue(resultSet, i2, printStream);
                    }
                    printStream.println();
                    printWarnings(resultSet.getWarnings(), false);
                }
            }
        }
        printStream.println();
    }

    protected void runStatements(Reader reader, PrintStream printStream) throws SQLException, IOException {
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader bufferedReader = new BufferedReader(reader);
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                break;
            }
            String str = readLine;
            if (!this.keepformat) {
                str = readLine.trim();
            }
            String str2 = str;
            if (this.expandProperties) {
                str2 = getProject().replaceProperties(str);
            }
            if (!this.keepformat) {
                if (!str2.startsWith("//") && !str2.startsWith("--")) {
                    StringTokenizer stringTokenizer = new StringTokenizer(str2);
                    if (stringTokenizer.hasMoreTokens() && "REM".equalsIgnoreCase(stringTokenizer.nextToken())) {
                    }
                }
            }
            stringBuffer.append(this.keepformat ? "\n" : " ").append(str2);
            if (!this.keepformat && str2.indexOf("--") >= 0) {
                stringBuffer.append("\n");
            }
            int lastDelimiterPosition = lastDelimiterPosition(stringBuffer, str2);
            if (lastDelimiterPosition > -1) {
                execSQL(stringBuffer.substring(0, lastDelimiterPosition), printStream);
                stringBuffer.replace(0, stringBuffer.length(), "");
            }
        }
        if (stringBuffer.length() > 0) {
            execSQL(stringBuffer.toString(), printStream);
        }
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public void setCsvColumnSeparator(String str) {
        this.csvColumnSep = str;
    }

    public void setCsvQuoteCharacter(String str) {
        if (str == null || str.length() <= 1) {
            this.csvQuoteChar = str;
            return;
        }
        throw new BuildException("The quote character must be a single character.");
    }

    public void setDelimiter(String str) {
        this.delimiter = str;
    }

    public void setDelimiterType(DelimiterType delimiterType) {
        this.delimiterType = delimiterType.getValue();
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    protected final void setErrorProperty() {
        setProperty(this.errorProperty, "true");
    }

    public void setErrorProperty(String str) {
        this.errorProperty = str;
    }

    public void setEscapeProcessing(boolean z) {
        this.escapeProcessing = z;
    }

    public void setExpandProperties(boolean z) {
        this.expandProperties = z;
    }

    public void setKeepformat(boolean z) {
        this.keepformat = z;
    }

    public void setOnerror(OnError onError) {
        this.onError = onError.getValue();
    }

    public void setOutput(File file) {
        setOutput(new FileResource(getProject(), file));
    }

    public void setOutput(Resource resource) {
        this.output = resource;
    }

    public void setPrint(boolean z) {
        this.print = z;
    }

    public void setRawBlobs(boolean z) {
        this.rawBlobs = z;
    }

    protected final void setRowCountProperty(int i) {
        setProperty(this.rowCountProperty, Integer.toString(i));
    }

    public void setRowCountProperty(String str) {
        this.rowCountProperty = str;
    }

    public void setShowWarnings(boolean z) {
        this.showWarnings = z;
    }

    public void setShowheaders(boolean z) {
        this.showheaders = z;
    }

    public void setShowtrailers(boolean z) {
        this.showtrailers = z;
    }

    public void setSrc(File file) {
        this.srcFile = file;
    }

    public void setStrictDelimiterMatching(boolean z) {
        this.strictDelimiterMatching = z;
    }

    public void setTreatWarningsAsErrors(boolean z) {
        this.treatWarningsAsErrors = z;
    }

    protected final void setWarningProperty() {
        setProperty(this.warningProperty, "true");
    }

    public void setWarningProperty(String str) {
        this.warningProperty = str;
    }
}
