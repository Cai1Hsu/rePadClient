.class public Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
.super Ljava/lang/Object;
.source "SQLExec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/SQLExec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Transaction"
.end annotation


# instance fields
.field private tSqlCommand:Ljava/lang/String;

.field private tSrcResource:Lorg/apache/tools/ant/types/Resource;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/SQLExec;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/SQLExec;

    .prologue
    .line 985
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 986
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    .line 987
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSqlCommand:Ljava/lang/String;

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;Ljava/io/PrintStream;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;
    .param p1, "x1"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 985
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->runTransaction(Ljava/io/PrintStream;)V

    return-void
.end method

.method private runTransaction(Ljava/io/PrintStream;)V
    .locals 6
    .param p1, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 1041
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSqlCommand:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 1042
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    const-string/jumbo v3, "Executing commands"

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 1043
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    new-instance v3, Ljava/io/StringReader;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSqlCommand:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, p1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->runStatements(Ljava/io/Reader;Ljava/io/PrintStream;)V

    .line 1046
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v2, :cond_1

    .line 1047
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Executing resource: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/taskdefs/SQLExec;->log(Ljava/lang/String;I)V

    .line 1049
    const/4 v0, 0x0

    .line 1050
    .local v0, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 1052
    .local v1, "reader":Ljava/io/Reader;
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 1053
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/SQLExec;->access$100(Lorg/apache/tools/ant/taskdefs/SQLExec;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object v1, v2

    .line 1055
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    invoke-virtual {v2, v1, p1}, Lorg/apache/tools/ant/taskdefs/SQLExec;->runStatements(Ljava/io/Reader;Ljava/io/PrintStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1057
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 1058
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 1061
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "reader":Ljava/io/Reader;
    :cond_1
    return-void

    .line 1053
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v1    # "reader":Ljava/io/Reader;
    :cond_2
    :try_start_1
    new-instance v2, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->this$0:Lorg/apache/tools/ant/taskdefs/SQLExec;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/SQLExec;->access$100(Lorg/apache/tools/ant/taskdefs/SQLExec;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v2

    goto :goto_0

    .line 1057
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 1058
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v2
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 1029
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 1030
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1033
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 1034
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 1018
    if-eqz p1, :cond_0

    .line 1019
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSqlCommand:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSqlCommand:Ljava/lang/String;

    .line 1021
    :cond_0
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 996
    if-eqz p1, :cond_0

    .line 997
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 999
    :cond_0
    return-void
.end method

.method public setSrcResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 1007
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 1008
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only one resource per transaction"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1010
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SQLExec$Transaction;->tSrcResource:Lorg/apache/tools/ant/types/Resource;

    .line 1011
    return-void
.end method
