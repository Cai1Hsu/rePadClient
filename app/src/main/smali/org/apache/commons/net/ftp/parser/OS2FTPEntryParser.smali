.class public Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;
.super Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;
.source "OS2FTPEntryParser.java"


# static fields
.field private static final DEFAULT_DATE_FORMAT:Ljava/lang/String; = "MM-dd-yy HH:mm"

.field private static final REGEX:Ljava/lang/String; = "\\s*([0-9]+)\\s*(\\s+|[A-Z]+)\\s*(DIR|\\s+)\\s*(\\S+)\\s+(\\S+)\\s+(\\S.*)"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;-><init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/net/ftp/FTPClientConfig;)V
    .locals 1
    .param p1, "config"    # Lorg/apache/commons/net/ftp/FTPClientConfig;

    .prologue
    .line 75
    const-string/jumbo v0, "\\s*([0-9]+)\\s*(\\s+|[A-Z]+)\\s*(DIR|\\s+)\\s*(\\S+)\\s+(\\S+)\\s+(\\S.*)"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;-><init>(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    .line 77
    return-void
.end method


# virtual methods
.method protected getDefaultConfiguration()Lorg/apache/commons/net/ftp/FTPClientConfig;
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 141
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClientConfig;

    const-string/jumbo v1, "OS/2"

    const-string/jumbo v2, "MM-dd-yy HH:mm"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;
    .locals 9
    .param p1, "entry"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 92
    new-instance v3, Lorg/apache/commons/net/ftp/FTPFile;

    invoke-direct {v3}, Lorg/apache/commons/net/ftp/FTPFile;-><init>()V

    .line 93
    .local v3, "f":Lorg/apache/commons/net/ftp/FTPFile;
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 95
    invoke-virtual {p0, v8}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, "size":Ljava/lang/String;
    const/4 v6, 0x2

    invoke-virtual {p0, v6}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "attrib":Ljava/lang/String;
    const/4 v6, 0x3

    invoke-virtual {p0, v6}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "dirString":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x4

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x5

    invoke-virtual {p0, v7}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "datestr":Ljava/lang/String;
    const/4 v6, 0x6

    invoke-virtual {p0, v6}, Lorg/apache/commons/net/ftp/parser/OS2FTPEntryParser;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, "name":Ljava/lang/String;
    :try_start_0
    invoke-super {p0, v1}, Lorg/apache/commons/net/ftp/parser/ConfigurableFTPFileEntryParserImpl;->parseTimestamp(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/commons/net/ftp/FTPFile;->setTimestamp(Ljava/util/Calendar;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "DIR"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "DIR"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 113
    :cond_0
    invoke-virtual {v3, v8}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    .line 122
    :goto_1
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/commons/net/ftp/FTPFile;->setName(Ljava/lang/String;)V

    .line 125
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Lorg/apache/commons/net/ftp/FTPFile;->setSize(J)V

    .line 129
    .end local v0    # "attrib":Ljava/lang/String;
    .end local v1    # "datestr":Ljava/lang/String;
    .end local v2    # "dirString":Ljava/lang/String;
    .end local v3    # "f":Lorg/apache/commons/net/ftp/FTPFile;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "size":Ljava/lang/String;
    :goto_2
    return-object v3

    .line 117
    .restart local v0    # "attrib":Ljava/lang/String;
    .restart local v1    # "datestr":Ljava/lang/String;
    .restart local v2    # "dirString":Ljava/lang/String;
    .restart local v3    # "f":Lorg/apache/commons/net/ftp/FTPFile;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "size":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Lorg/apache/commons/net/ftp/FTPFile;->setType(I)V

    goto :goto_1

    .line 129
    .end local v0    # "attrib":Ljava/lang/String;
    .end local v1    # "datestr":Ljava/lang/String;
    .end local v2    # "dirString":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "size":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    .line 104
    .restart local v0    # "attrib":Ljava/lang/String;
    .restart local v1    # "datestr":Ljava/lang/String;
    .restart local v2    # "dirString":Ljava/lang/String;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "size":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_0
.end method
