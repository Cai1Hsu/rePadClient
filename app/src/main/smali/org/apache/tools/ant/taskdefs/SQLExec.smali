.class public Lorg/apache/tools/ant/taskdefs/SQLExec;
.super Lorg/apache/tools/ant/taskdefs/JDBCTask;
.source "SQLExec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;,
        Lorg/apache/tools/ant/taskdefs/SQLExec$OnError;,
        Lorg/apache/tools/ant/taskdefs/SQLExec$DelimiterType;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private append:Z

.field private conn:Ljava/sql/Connection;

.field private csvColumnSep:Ljava/lang/String;

.field private csvQuoteChar:Ljava/lang/String;

.field private delimiter:Ljava/lang/String;

.field private delimiterType:Ljava/lang/String;

.field private encoding:Ljava/lang/String;

.field private errorProperty:Ljava/lang/String;

.field private escapeProcessing:Z

.field private expandProperties:Z

.field private goodSql:I

.field private keepformat:Z

.field private onError:Ljava/lang/String;

.field private output:Lorg/apache/tools/ant/types/Resource;

.field private print:Z

.field private rawBlobs:Z

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private rowCountProperty:Ljava/lang/String;

.field private showWarnings:Z

.field private showheaders:Z

.field private showtrailers:Z

.field private sqlCommand:Ljava/lang/String;

.field private srcFile:Ljava/io/File;

.field private statement:Ljava/sql/Statement;

.field private strictDelimiterMatching:Z

.field private totalSql:I

.field private transactions:Ljava/util/Vector;

.field private treatWarningsAsErrors:Z

.field private warningProperty:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;-><init>()V

    .line 100
    iput v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->goodSql:I

    .line 102
    iput v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->totalSql:I

    .line 107
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    .line 117
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->statement:Ljava/sql/Statement;

    .line 122
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    .line 127
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    .line 132
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    .line 137
    const-string/jumbo v0, ";"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    .line 143
    const-string/jumbo v0, "normal"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiterType:Ljava/lang/String;

    .line 148
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->print:Z

    .line 153
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showheaders:Z

    .line 158
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showtrailers:Z

    .line 163
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    .line 168
    const-string/jumbo v0, "abort"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    .line 173
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->encoding:Ljava/lang/String;

    .line 178
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->append:Z

    .line 183
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    .line 190
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->escapeProcessing:Z

    .line 198
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->expandProperties:Z

    .line 210
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->strictDelimiterMatching:Z

    .line 216
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showWarnings:Z

    .line 225
    const-string/jumbo v0, ","

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvColumnSep:Ljava/lang/String;

    .line 245
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    .line 251
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->treatWarningsAsErrors:Z

    .line 257
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->errorProperty:Ljava/lang/String;

    .line 263
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->warningProperty:Ljava/lang/String;

    .line 270
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->rowCountProperty:Ljava/lang/String;

    .line 985
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/SQLExec;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/SQLExec;

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 626
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private closeQuietly()V
    .locals 2

    .prologue
    .line 919
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->isAutocommit()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    const-string/jumbo v1, "abort"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 921
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v0

    invoke-interface {v0}, Ljava/sql/Connection;->rollback()V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 926
    :cond_0
    :goto_0
    return-void

    .line 922
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private maybeQuote(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v6, -0x1

    .line 895
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    if-eqz v5, :cond_0

    if-eqz p1, :cond_0

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvColumnSep:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v6, :cond_1

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v6, :cond_1

    .line 910
    .end local p1    # "s":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 900
    .restart local p1    # "s":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 901
    .local v4, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 902
    .local v2, "len":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 903
    .local v3, "q":C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_3

    .line 904
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 905
    .local v0, "c":C
    if-ne v0, v3, :cond_2

    .line 906
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 908
    :cond_2
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 903
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 910
    .end local v0    # "c":C
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private printValue(Ljava/sql/ResultSet;ILjava/io/PrintStream;)V
    .locals 3
    .param p1, "rs"    # Ljava/sql/ResultSet;
    .param p2, "col"    # I
    .param p3, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 884
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->rawBlobs:Z

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/sql/ResultSetMetaData;->getColumnType(I)I

    move-result v1

    const/16 v2, 0x7d4

    if-ne v1, v2, :cond_1

    .line 885
    invoke-interface {p1, p2}, Ljava/sql/ResultSet;->getBlob(I)Ljava/sql/Blob;

    move-result-object v0

    .line 886
    .local v0, "blob":Ljava/sql/Blob;
    if-eqz v0, :cond_0

    .line 887
    new-instance v1, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    invoke-interface {p1, p2}, Ljava/sql/ResultSet;->getBlob(I)Ljava/sql/Blob;

    move-result-object v2

    invoke-interface {v2}, Ljava/sql/Blob;->getBinaryStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2, p3}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->run()V

    .line 892
    .end local v0    # "blob":Ljava/sql/Blob;
    :cond_0
    :goto_0
    return-void

    .line 890
    :cond_1
    invoke-interface {p1, p2}, Ljava/sql/ResultSet;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->maybeQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private printWarnings(Ljava/sql/SQLWarning;Z)V
    .locals 3
    .param p1, "warning"    # Ljava/sql/SQLWarning;
    .param p2, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 1107
    move-object v0, p1

    .line 1108
    .local v0, "initialWarning":Ljava/sql/SQLWarning;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showWarnings:Z

    if-nez v1, :cond_0

    if-eqz p2, :cond_2

    .line 1109
    :cond_0
    :goto_0
    if-eqz p1, :cond_2

    .line 1110
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " sql warning"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showWarnings:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 1112
    invoke-virtual {p1}, Ljava/sql/SQLWarning;->getNextWarning()Ljava/sql/SQLWarning;

    move-result-object p1

    goto :goto_0

    .line 1110
    :cond_1
    const/4 v1, 0x3

    goto :goto_1

    .line 1115
    :cond_2
    if-eqz v0, :cond_3

    .line 1116
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setWarningProperty()V

    .line 1118
    :cond_3
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->treatWarningsAsErrors:Z

    if-eqz v1, :cond_4

    if-eqz v0, :cond_4

    .line 1119
    throw v0

    .line 1121
    :cond_4
    return-void
.end method

.method private setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1136
    if-eqz p1, :cond_0

    .line 1137
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1139
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 329
    if-nez p1, :cond_0

    .line 330
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot add null ResourceCollection"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 332
    :cond_0
    monitor-enter p0

    .line 333
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    .line 334
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 336
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 337
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 338
    return-void

    .line 336
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 319
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 320
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 310
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    .line 311
    return-void
.end method

.method public createTransaction()Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    .locals 2

    .prologue
    .line 345
    new-instance v0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;-><init>(Lorg/apache/tools/ant/taskdefs/SQLExec;)V

    .line 346
    .local v0, "t":Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 347
    return-object v0
.end method

.method protected execSQL(Ljava/lang/String;Ljava/io/PrintStream;)V
    .locals 9
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 763
    const-string/jumbo v6, ""

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 826
    :cond_0
    :goto_0
    return-void

    .line 767
    :cond_1
    const/4 v1, 0x0

    .line 769
    .local v1, "resultSet":Ljava/sql/ResultSet;
    :try_start_0
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->totalSql:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->totalSql:I

    .line 770
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "SQL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 773
    const/4 v3, 0x0

    .local v3, "updateCount":I
    const/4 v4, 0x0

    .line 775
    .local v4, "updateCountTotal":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6, p1}, Ljava/sql/Statement;->execute(Ljava/lang/String;)Z

    move-result v2

    .line 776
    .local v2, "ret":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->getUpdateCount()I

    move-result v3

    .line 778
    :cond_2
    if-eq v3, v8, :cond_3

    .line 779
    add-int/2addr v4, v3

    .line 781
    :cond_3
    if-eqz v2, :cond_4

    .line 782
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v1

    .line 783
    invoke-interface {v1}, Ljava/sql/ResultSet;->getWarnings()Ljava/sql/SQLWarning;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printWarnings(Ljava/sql/SQLWarning;Z)V

    .line 784
    invoke-interface {v1}, Ljava/sql/ResultSet;->clearWarnings()V

    .line 785
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->print:Z

    if-eqz v6, :cond_4

    .line 786
    invoke-virtual {p0, v1, p2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printResults(Ljava/sql/ResultSet;Ljava/io/PrintStream;)V

    .line 789
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->getMoreResults()Z

    move-result v2

    .line 790
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->getUpdateCount()I

    move-result v3

    .line 791
    if-nez v2, :cond_2

    if-ne v3, v8, :cond_2

    .line 793
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->getWarnings()Ljava/sql/SQLWarning;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printWarnings(Ljava/sql/SQLWarning;Z)V

    .line 794
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Statement;->clearWarnings()V

    .line 796
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " rows affected"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 797
    if-eq v4, v8, :cond_5

    .line 798
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setRowCountProperty(I)V

    .line 801
    :cond_5
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->print:Z

    if-eqz v6, :cond_6

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showtrailers:Z

    if-eqz v6, :cond_6

    .line 802
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " rows affected"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 804
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Connection;->getWarnings()Ljava/sql/SQLWarning;

    move-result-object v5

    .line 805
    .local v5, "warning":Ljava/sql/SQLWarning;
    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printWarnings(Ljava/sql/SQLWarning;Z)V

    .line 806
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v6

    invoke-interface {v6}, Ljava/sql/Connection;->clearWarnings()V

    .line 807
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->goodSql:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->goodSql:I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 818
    if-eqz v1, :cond_0

    .line 820
    :try_start_1
    invoke-interface {v1}, Ljava/sql/ResultSet;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 821
    .end local v2    # "ret":Z
    .end local v3    # "updateCount":I
    .end local v4    # "updateCountTotal":I
    .end local v5    # "warning":Ljava/sql/SQLWarning;
    :catch_0
    move-exception v6

    goto/16 :goto_0

    .line 808
    :catch_1
    move-exception v0

    .line 809
    .local v0, "e":Ljava/sql/SQLException;
    :try_start_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Failed to execute: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 810
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setErrorProperty()V

    .line 811
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    const-string/jumbo v7, "abort"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 812
    invoke-virtual {v0}, Ljava/sql/SQLException;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 814
    :cond_7
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    const-string/jumbo v7, "continue"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 815
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 818
    .end local v0    # "e":Ljava/sql/SQLException;
    :catchall_0
    move-exception v6

    if-eqz v1, :cond_8

    .line 820
    :try_start_3
    invoke-interface {v1}, Ljava/sql/ResultSet;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_2

    .line 818
    :cond_8
    :goto_1
    throw v6

    .line 821
    :catch_2
    move-exception v7

    goto :goto_1

    .line 818
    .restart local v0    # "e":Ljava/sql/SQLException;
    :cond_9
    if-eqz v1, :cond_0

    .line 820
    :try_start_4
    invoke-interface {v1}, Ljava/sql/ResultSet;->close()V
    :try_end_4
    .catch Ljava/sql/SQLException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0
.end method

.method public execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 579
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Vector;

    .line 580
    .local v9, "savedTransaction":Ljava/util/Vector;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    .line 582
    .local v8, "savedSqlCommand":Ljava/lang/String;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    .line 585
    :try_start_0
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    if-nez v11, :cond_0

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_0

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v11, :cond_0

    .line 586
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v11

    if-nez v11, :cond_0

    .line 587
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "Source file or resource collection, transactions or sql statement must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 693
    :catchall_0
    move-exception v11

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    .line 694
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    throw v11

    .line 593
    :cond_0
    :try_start_1
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    if-eqz v11, :cond_1

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->isFile()Z

    move-result v11

    if-nez v11, :cond_1

    .line 594
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Source file "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " is not a file!"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 598
    :cond_1
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v11, :cond_2

    .line 600
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 601
    .local v3, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 602
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/Resource;

    .line 604
    .local v7, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->createTransaction()Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;

    move-result-object v10

    .line 605
    .local v10, "t":Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    invoke-virtual {v10, v7}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 610
    .end local v3    # "iter":Ljava/util/Iterator;
    .end local v7    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v10    # "t":Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->createTransaction()Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;

    move-result-object v10

    .line 611
    .restart local v10    # "t":Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->setSrc(Ljava/io/File;)V

    .line 612
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->addText(Ljava/lang/String;)V

    .line 614
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v11

    if-nez v11, :cond_3

    .line 693
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    .line 694
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    .line 696
    :goto_1
    return-void

    .line 620
    :cond_3
    :try_start_2
    invoke-static {}, Lorg/apache/tools/ant/util/KeepAliveOutputStream;->wrapSystemOut()Ljava/io/PrintStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v5

    .line 622
    .local v5, "out":Ljava/io/PrintStream;
    :try_start_3
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    if-eqz v11, :cond_5

    .line 623
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Opening PrintStream to output Resource "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 624
    const/4 v4, 0x0

    .line 625
    .local v4, "os":Ljava/io/OutputStream;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    sget-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v11, :cond_9

    const-string/jumbo v11, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v11}, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    sput-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v12, v11}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 627
    .local v2, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v2, :cond_a

    .line 628
    new-instance v4, Ljava/io/FileOutputStream;

    .end local v4    # "os":Ljava/io/OutputStream;
    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v11

    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->append:Z

    invoke-direct {v4, v11, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 646
    .restart local v4    # "os":Ljava/io/OutputStream;
    :cond_4
    :goto_3
    new-instance v6, Ljava/io/PrintStream;

    new-instance v11, Ljava/io/BufferedOutputStream;

    invoke-direct {v11, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v6, v11}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .end local v5    # "out":Ljava/io/PrintStream;
    .local v6, "out":Ljava/io/PrintStream;
    move-object v5, v6

    .line 650
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v4    # "os":Ljava/io/OutputStream;
    .end local v6    # "out":Ljava/io/PrintStream;
    .restart local v5    # "out":Ljava/io/PrintStream;
    :cond_5
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 651
    .local v1, "e":Ljava/util/Enumeration;
    :cond_6
    :goto_4
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_d

    .line 653
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;

    invoke-static {v11, v5}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->access$000(Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;Ljava/io/PrintStream;)V

    .line 654
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->isAutocommit()Z

    move-result v11

    if-nez v11, :cond_6

    .line 655
    const-string/jumbo v11, "Committing transaction"

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 656
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Connection;->commit()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_4

    .line 660
    .end local v1    # "e":Ljava/util/Enumeration;
    :catchall_1
    move-exception v11

    :try_start_4
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v11
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/sql/SQLException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 662
    .end local v5    # "out":Ljava/io/PrintStream;
    :catch_0
    move-exception v1

    .line 663
    .local v1, "e":Ljava/io/IOException;
    :try_start_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->closeQuietly()V

    .line 664
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setErrorProperty()V

    .line 665
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    const-string/jumbo v12, "abort"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 666
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v1, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 675
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_2
    move-exception v11

    .line 676
    :try_start_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v12

    if-eqz v12, :cond_7

    .line 677
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v12

    invoke-interface {v12}, Ljava/sql/Statement;->close()V
    :try_end_6
    .catch Ljava/sql/SQLException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 683
    :cond_7
    :goto_5
    :try_start_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v12

    if-eqz v12, :cond_8

    .line 684
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v12

    invoke-interface {v12}, Ljava/sql/Connection;->close()V
    :try_end_7
    .catch Ljava/sql/SQLException; {:try_start_7 .. :try_end_7} :catch_6
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 675
    :cond_8
    :goto_6
    :try_start_8
    throw v11
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 625
    .restart local v4    # "os":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/PrintStream;
    :cond_9
    :try_start_9
    sget-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto/16 :goto_2

    .line 630
    .restart local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_a
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->append:Z

    if-eqz v11, :cond_b

    .line 631
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    sget-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    if-nez v11, :cond_c

    const-string/jumbo v11, "org.apache.tools.ant.types.resources.Appendable"

    invoke-static {v11}, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    sput-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    :goto_7
    invoke-virtual {v12, v11}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Appendable;

    .line 633
    .local v0, "a":Lorg/apache/tools/ant/types/resources/Appendable;
    if-eqz v0, :cond_b

    .line 634
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/Appendable;->getAppendOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 637
    .end local v0    # "a":Lorg/apache/tools/ant/types/resources/Appendable;
    :cond_b
    if-nez v4, :cond_4

    .line 638
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 639
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->append:Z

    if-eqz v11, :cond_4

    .line 640
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Ignoring append=true for non-appendable resource "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    goto/16 :goto_3

    .line 631
    :cond_c
    sget-object v11, Lorg/apache/tools/ant/taskdefs/SQLExec;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_7

    .line 660
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v4    # "os":Ljava/io/OutputStream;
    .local v1, "e":Ljava/util/Enumeration;
    :cond_d
    :try_start_a
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/sql/SQLException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 676
    :try_start_b
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    if-eqz v11, :cond_e

    .line 677
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Statement;->close()V
    :try_end_b
    .catch Ljava/sql/SQLException; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 683
    :cond_e
    :goto_8
    :try_start_c
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    if-eqz v11, :cond_f

    .line 684
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Connection;->close()V
    :try_end_c
    .catch Ljava/sql/SQLException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 691
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v5    # "out":Ljava/io/PrintStream;
    :cond_f
    :goto_9
    :try_start_d
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    iget v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->goodSql:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " of "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget v12, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->totalSql:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " SQL statements executed successfully"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 693
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->transactions:Ljava/util/Vector;

    .line 694
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->sqlCommand:Ljava/lang/String;

    goto/16 :goto_1

    .line 668
    :catch_1
    move-exception v1

    .line 669
    .local v1, "e":Ljava/sql/SQLException;
    :try_start_e
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->closeQuietly()V

    .line 670
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setErrorProperty()V

    .line 671
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    const-string/jumbo v12, "abort"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_12

    .line 672
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v1, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 676
    .local v1, "e":Ljava/io/IOException;
    :cond_10
    :try_start_f
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    if-eqz v11, :cond_11

    .line 677
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Statement;->close()V
    :try_end_f
    .catch Ljava/sql/SQLException; {:try_start_f .. :try_end_f} :catch_5
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 683
    :cond_11
    :goto_a
    :try_start_10
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    if-eqz v11, :cond_f

    .line 684
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Connection;->close()V
    :try_end_10
    .catch Ljava/sql/SQLException; {:try_start_10 .. :try_end_10} :catch_2
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto :goto_9

    .line 686
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v11

    goto :goto_9

    .line 676
    .local v1, "e":Ljava/sql/SQLException;
    :cond_12
    :try_start_11
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    if-eqz v11, :cond_13

    .line 677
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Statement;->close()V
    :try_end_11
    .catch Ljava/sql/SQLException; {:try_start_11 .. :try_end_11} :catch_4
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 683
    :cond_13
    :goto_b
    :try_start_12
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    if-eqz v11, :cond_f

    .line 684
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v11

    invoke-interface {v11}, Ljava/sql/Connection;->close()V
    :try_end_12
    .catch Ljava/sql/SQLException; {:try_start_12 .. :try_end_12} :catch_2
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto :goto_9

    .line 679
    .local v1, "e":Ljava/util/Enumeration;
    .restart local v5    # "out":Ljava/io/PrintStream;
    :catch_3
    move-exception v11

    goto/16 :goto_8

    .end local v5    # "out":Ljava/io/PrintStream;
    .local v1, "e":Ljava/sql/SQLException;
    :catch_4
    move-exception v11

    goto :goto_b

    .local v1, "e":Ljava/io/IOException;
    :catch_5
    move-exception v11

    goto :goto_a

    .line 686
    .end local v1    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v12

    goto/16 :goto_6

    .line 679
    :catch_7
    move-exception v12

    goto/16 :goto_5
.end method

.method protected getConnection()Ljava/sql/Connection;
    .locals 1

    .prologue
    .line 941
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    if-nez v0, :cond_0

    .line 942
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/JDBCTask;->getConnection()Ljava/sql/Connection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    .line 943
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->isValidRdbms(Ljava/sql/Connection;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 944
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    .line 947
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->conn:Ljava/sql/Connection;

    return-object v0
.end method

.method public getExpandProperties()Z
    .locals 1

    .prologue
    .line 298
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->expandProperties:Z

    return v0
.end method

.method protected getStatement()Ljava/sql/Statement;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 960
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->statement:Ljava/sql/Statement;

    if-nez v0, :cond_0

    .line 961
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getConnection()Ljava/sql/Connection;

    move-result-object v0

    invoke-interface {v0}, Ljava/sql/Connection;->createStatement()Ljava/sql/Statement;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->statement:Ljava/sql/Statement;

    .line 962
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->statement:Ljava/sql/Statement;

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->escapeProcessing:Z

    invoke-interface {v0, v1}, Ljava/sql/Statement;->setEscapeProcessing(Z)V

    .line 965
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->statement:Ljava/sql/Statement;

    return-object v0
.end method

.method public lastDelimiterPosition(Ljava/lang/StringBuffer;Ljava/lang/String;)I
    .locals 6
    .param p1, "buf"    # Ljava/lang/StringBuffer;
    .param p2, "currentLine"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    .line 1065
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->strictDelimiterMatching:Z

    if-eqz v4, :cond_3

    .line 1066
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiterType:Ljava/lang/String;

    const-string/jumbo v5, "normal"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/apache/tools/ant/util/StringUtils;->endsWith(Ljava/lang/StringBuffer;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiterType:Ljava/lang/String;

    const-string/jumbo v5, "row"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1070
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    .line 1099
    :cond_2
    :goto_0
    return v3

    .line 1075
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 1076
    .local v1, "d":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiterType:Ljava/lang/String;

    const-string/jumbo v5, "normal"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1079
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .line 1080
    .local v2, "endIndex":I
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 1082
    .local v0, "bufferIndex":I
    :goto_1
    if-ltz v0, :cond_4

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1083
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1085
    :cond_4
    if-lt v0, v2, :cond_2

    .line 1088
    :goto_2
    if-ltz v2, :cond_5

    .line 1089
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p1, v0, v4}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_2

    .line 1094
    add-int/lit8 v0, v0, -0x1

    .line 1095
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 1097
    :cond_5
    add-int/lit8 v3, v0, 0x1

    goto :goto_0

    .line 1099
    .end local v0    # "bufferIndex":I
    .end local v2    # "endIndex":I
    :cond_6
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    goto :goto_0
.end method

.method protected printResults(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 837
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getStatement()Ljava/sql/Statement;

    move-result-object v1

    invoke-interface {v1}, Ljava/sql/Statement;->getResultSet()Ljava/sql/ResultSet;

    move-result-object v0

    .line 839
    .local v0, "rs":Ljava/sql/ResultSet;
    :try_start_0
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printResults(Ljava/sql/ResultSet;Ljava/io/PrintStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 841
    if-eqz v0, :cond_0

    .line 842
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V

    .line 845
    :cond_0
    return-void

    .line 841
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 842
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V

    :cond_1
    throw v1
.end method

.method protected printResults(Ljava/sql/ResultSet;Ljava/io/PrintStream;)V
    .locals 6
    .param p1, "rs"    # Ljava/sql/ResultSet;
    .param p2, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 855
    if-eqz p1, :cond_3

    .line 856
    const-string/jumbo v3, "Processing new result set."

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 857
    invoke-interface {p1}, Ljava/sql/ResultSet;->getMetaData()Ljava/sql/ResultSetMetaData;

    move-result-object v2

    .line 858
    .local v2, "md":Ljava/sql/ResultSetMetaData;
    invoke-interface {v2}, Ljava/sql/ResultSetMetaData;->getColumnCount()I

    move-result v1

    .line 859
    .local v1, "columnCount":I
    if-lez v1, :cond_3

    .line 860
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showheaders:Z

    if-eqz v3, :cond_1

    .line 861
    invoke-interface {v2, v5}, Ljava/sql/ResultSetMetaData;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 862
    const/4 v0, 0x2

    .local v0, "col":I
    :goto_0
    if-gt v0, v1, :cond_0

    .line 863
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvColumnSep:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 864
    invoke-interface {v2, v0}, Ljava/sql/ResultSetMetaData;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/SQLExec;->maybeQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 862
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 866
    :cond_0
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 868
    .end local v0    # "col":I
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/sql/ResultSet;->next()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 869
    invoke-direct {p0, p1, v5, p2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printValue(Ljava/sql/ResultSet;ILjava/io/PrintStream;)V

    .line 870
    const/4 v0, 0x2

    .restart local v0    # "col":I
    :goto_2
    if-gt v0, v1, :cond_2

    .line 871
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvColumnSep:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 872
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printValue(Ljava/sql/ResultSet;ILjava/io/PrintStream;)V

    .line 870
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 874
    :cond_2
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 875
    invoke-interface {p1}, Ljava/sql/ResultSet;->getWarnings()Ljava/sql/SQLWarning;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/SQLExec;->printWarnings(Ljava/sql/SQLWarning;Z)V

    goto :goto_1

    .line 879
    .end local v0    # "col":I
    .end local v1    # "columnCount":I
    .end local v2    # "md":Ljava/sql/ResultSetMetaData;
    :cond_3
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 880
    return-void
.end method

.method protected runStatements(Ljava/io/Reader;Ljava/io/PrintStream;)V
    .locals 9
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 707
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 710
    .local v3, "sql":Ljava/lang/StringBuffer;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 712
    .local v0, "in":Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_6

    .line 713
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    if-nez v6, :cond_1

    .line 714
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 716
    :cond_1
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->expandProperties:Z

    if-eqz v6, :cond_2

    .line 717
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 719
    :cond_2
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    if-nez v6, :cond_3

    .line 720
    const-string/jumbo v6, "//"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 723
    const-string/jumbo v6, "--"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 726
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 727
    .local v4, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 728
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 729
    .local v5, "token":Ljava/lang/String;
    const-string/jumbo v6, "REM"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 735
    .end local v4    # "st":Ljava/util/StringTokenizer;
    .end local v5    # "token":Ljava/lang/String;
    :cond_3
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    if-eqz v6, :cond_5

    const-string/jumbo v6, "\n"

    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 740
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    if-nez v6, :cond_4

    const-string/jumbo v6, "--"

    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_4

    .line 741
    const-string/jumbo v6, "\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 743
    :cond_4
    invoke-virtual {p0, v3, v2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->lastDelimiterPosition(Ljava/lang/StringBuffer;Ljava/lang/String;)I

    move-result v1

    .line 744
    .local v1, "lastDelimPos":I
    const/4 v6, -0x1

    if-le v1, v6, :cond_0

    .line 745
    invoke-virtual {v3, v8, v1}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, p2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->execSQL(Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 746
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    const-string/jumbo v7, ""

    invoke-virtual {v3, v8, v6, v7}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    .line 735
    .end local v1    # "lastDelimPos":I
    :cond_5
    const-string/jumbo v6, " "

    goto :goto_1

    .line 750
    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-lez v6, :cond_7

    .line 751
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, p2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->execSQL(Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 753
    :cond_7
    return-void
.end method

.method public setAppend(Z)V
    .locals 0
    .param p1, "append"    # Z

    .prologue
    .line 439
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->append:Z

    .line 440
    return-void
.end method

.method public setCsvColumnSeparator(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 514
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvColumnSep:Ljava/lang/String;

    .line 515
    return-void
.end method

.method public setCsvQuoteCharacter(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 536
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 537
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The quote character must be a single character."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 540
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->csvQuoteChar:Ljava/lang/String;

    .line 541
    return-void
.end method

.method public setDelimiter(Ljava/lang/String;)V
    .locals 0
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 368
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiter:Ljava/lang/String;

    .line 369
    return-void
.end method

.method public setDelimiterType(Lorg/apache/tools/ant/taskdefs/SQLExec$DelimiterType;)V
    .locals 1
    .param p1, "delimiterType"    # Lorg/apache/tools/ant/taskdefs/SQLExec$DelimiterType;

    .prologue
    .line 381
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/SQLExec$DelimiterType;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->delimiterType:Ljava/lang/String;

    .line 382
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 356
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->encoding:Ljava/lang/String;

    .line 357
    return-void
.end method

.method protected final setErrorProperty()V
    .locals 2

    .prologue
    .line 1124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->errorProperty:Ljava/lang/String;

    const-string/jumbo v1, "true"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    return-void
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 551
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->errorProperty:Ljava/lang/String;

    .line 552
    return-void
.end method

.method public setEscapeProcessing(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 468
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->escapeProcessing:Z

    .line 469
    return-void
.end method

.method public setExpandProperties(Z)V
    .locals 0
    .param p1, "expandProperties"    # Z

    .prologue
    .line 288
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->expandProperties:Z

    .line 289
    return-void
.end method

.method public setKeepformat(Z)V
    .locals 0
    .param p1, "keepformat"    # Z

    .prologue
    .line 459
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->keepformat:Z

    .line 460
    return-void
.end method

.method public setOnerror(Lorg/apache/tools/ant/taskdefs/SQLExec$OnError;)V
    .locals 1
    .param p1, "action"    # Lorg/apache/tools/ant/taskdefs/SQLExec$OnError;

    .prologue
    .line 449
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/SQLExec$OnError;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->onError:Ljava/lang/String;

    .line 450
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 2
    .param p1, "output"    # Ljava/io/File;

    .prologue
    .line 418
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setOutput(Lorg/apache/tools/ant/types/Resource;)V

    .line 419
    return-void
.end method

.method public setOutput(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "output"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 428
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->output:Lorg/apache/tools/ant/types/Resource;

    .line 429
    return-void
.end method

.method public setPrint(Z)V
    .locals 0
    .param p1, "print"    # Z

    .prologue
    .line 390
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->print:Z

    .line 391
    return-void
.end method

.method public setRawBlobs(Z)V
    .locals 0
    .param p1, "rawBlobs"    # Z

    .prologue
    .line 477
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->rawBlobs:Z

    .line 478
    return-void
.end method

.method protected final setRowCountProperty(I)V
    .locals 2
    .param p1, "rowCount"    # I

    .prologue
    .line 1132
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->rowCountProperty:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1133
    return-void
.end method

.method public setRowCountProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "rowCountProperty"    # Ljava/lang/String;

    .prologue
    .line 571
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->rowCountProperty:Ljava/lang/String;

    .line 572
    return-void
.end method

.method public setShowWarnings(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 495
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showWarnings:Z

    .line 496
    return-void
.end method

.method public setShowheaders(Z)V
    .locals 0
    .param p1, "showheaders"    # Z

    .prologue
    .line 399
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showheaders:Z

    .line 400
    return-void
.end method

.method public setShowtrailers(Z)V
    .locals 0
    .param p1, "showtrailers"    # Z

    .prologue
    .line 409
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->showtrailers:Z

    .line 410
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "srcFile"    # Ljava/io/File;

    .prologue
    .line 278
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->srcFile:Ljava/io/File;

    .line 279
    return-void
.end method

.method public setStrictDelimiterMatching(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 487
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->strictDelimiterMatching:Z

    .line 488
    return-void
.end method

.method public setTreatWarningsAsErrors(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 503
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->treatWarningsAsErrors:Z

    .line 504
    return-void
.end method

.method protected final setWarningProperty()V
    .locals 2

    .prologue
    .line 1128
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->warningProperty:Ljava/lang/String;

    const-string/jumbo v1, "true"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1129
    return-void
.end method

.method public setWarningProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "warningProperty"    # Ljava/lang/String;

    .prologue
    .line 562
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec;->warningProperty:Ljava/lang/String;

    .line 563
    return-void
.end method
