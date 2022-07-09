.class public Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;
.super Ljava/lang/Object;
.source "ChangeLogWriter.java"


# static fields
.field private static final DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

.field private static final OUTPUT_DATE:Ljava/text/SimpleDateFormat;

.field private static final OUTPUT_TIME:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_DATE:Ljava/text/SimpleDateFormat;

    .line 41
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "HH:mm"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_TIME:Ljava/text/SimpleDateFormat;

    .line 44
    new-instance v1, Lorg/apache/tools/ant/util/DOMElementWriter;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    .line 47
    const-string/jumbo v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 48
    .local v0, "utc":Ljava/util/TimeZone;
    sget-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 49
    sget-object v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_TIME:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 50
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private printEntry(Lorg/w3c/dom/Document;Ljava/io/PrintWriter;Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V
    .locals 8
    .param p1, "doc"    # Lorg/w3c/dom/Document;
    .param p2, "output"    # Ljava/io/PrintWriter;
    .param p3, "entry"    # Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    const-string/jumbo v5, "entry"

    invoke-interface {p1, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 90
    .local v0, "ent":Lorg/w3c/dom/Element;
    const-string/jumbo v5, "date"

    sget-object v6, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_DATE:Ljava/text/SimpleDateFormat;

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getDate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    const-string/jumbo v5, "time"

    sget-object v6, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->OUTPUT_TIME:Ljava/text/SimpleDateFormat;

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getDate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string/jumbo v5, "author"

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getAuthor()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendCDATAElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getFiles()Ljava/util/Vector;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 98
    .local v1, "enumeration":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 99
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;

    .line 101
    .local v3, "file":Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;
    const-string/jumbo v5, "file"

    invoke-static {v0, v5}, Lorg/apache/tools/ant/util/DOMUtils;->createChildElement(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 102
    .local v2, "f":Lorg/w3c/dom/Element;
    const-string/jumbo v5, "name"

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendCDATAElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const-string/jumbo v5, "revision"

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;->getRevision()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;->getPreviousRevision()Ljava/lang/String;

    move-result-object v4

    .line 106
    .local v4, "previousRevision":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 107
    const-string/jumbo v5, "prevrevision"

    invoke-static {v2, v5, v4}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 111
    .end local v2    # "f":Lorg/w3c/dom/Element;
    .end local v3    # "file":Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;
    .end local v4    # "previousRevision":Ljava/lang/String;
    :cond_1
    const-string/jumbo v5, "msg"

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getComment()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lorg/apache/tools/ant/util/DOMUtils;->appendCDATAElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    sget-object v5, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v6, 0x1

    const-string/jumbo v7, "\t"

    invoke-virtual {v5, v0, p2, v6, v7}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 113
    return-void
.end method


# virtual methods
.method public printChangeLog(Ljava/io/PrintWriter;[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V
    .locals 10
    .param p1, "output"    # Ljava/io/PrintWriter;
    .param p2, "entries"    # [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .prologue
    .line 61
    :try_start_0
    const-string/jumbo v0, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 62
    invoke-static {}, Lorg/apache/tools/ant/util/DOMUtils;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v6

    .line 63
    .local v6, "doc":Lorg/w3c/dom/Document;
    const-string/jumbo v0, "changelog"

    invoke-interface {v6, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 64
    .local v1, "root":Lorg/w3c/dom/Element;
    sget-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v2, 0x0

    const-string/jumbo v3, "\t"

    invoke-virtual {v0, v1, p1, v2, v3}, Lorg/apache/tools/ant/util/DOMElementWriter;->openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 65
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 66
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    array-length v0, p2

    if-ge v9, v0, :cond_0

    .line 67
    aget-object v8, p2, v9

    .line 69
    .local v8, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    invoke-direct {p0, v6, p1, v8}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->printEntry(Lorg/w3c/dom/Document;Ljava/io/PrintWriter;Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V

    .line 66
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 71
    .end local v8    # "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v3, 0x0

    const-string/jumbo v4, "\t"

    const/4 v5, 0x1

    move-object v2, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/DOMElementWriter;->closeElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V

    .line 72
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 73
    invoke-virtual {p1}, Ljava/io/PrintWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-void

    .line 74
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v6    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "i":I
    :catch_0
    move-exception v7

    .line 75
    .local v7, "e":Ljava/io/IOException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
