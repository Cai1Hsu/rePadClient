.class public Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;
.super Lorg/apache/commons/net/ftp/FTPFileEntryParserImpl;
.source "CompositeFileEntryParser.java"


# instance fields
.field private cachedFtpFileEntryParser:Lorg/apache/commons/net/ftp/FTPFileEntryParser;

.field private final ftpFileEntryParsers:[Lorg/apache/commons/net/ftp/FTPFileEntryParser;


# direct methods
.method public constructor <init>([Lorg/apache/commons/net/ftp/FTPFileEntryParser;)V
    .locals 1
    .param p1, "ftpFileEntryParsers"    # [Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPFileEntryParserImpl;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->cachedFtpFileEntryParser:Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    .line 43
    iput-object p1, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->ftpFileEntryParsers:[Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    .line 44
    return-void
.end method


# virtual methods
.method public parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;
    .locals 4
    .param p1, "listEntry"    # Ljava/lang/String;

    .prologue
    .line 48
    iget-object v3, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->cachedFtpFileEntryParser:Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    if-eqz v3, :cond_0

    .line 50
    iget-object v3, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->cachedFtpFileEntryParser:Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    invoke-interface {v3, p1}, Lorg/apache/commons/net/ftp/FTPFileEntryParser;->parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v2

    .line 51
    .local v2, "matched":Lorg/apache/commons/net/ftp/FTPFile;
    if-eqz v2, :cond_2

    .line 70
    .end local v2    # "matched":Lorg/apache/commons/net/ftp/FTPFile;
    :goto_0
    return-object v2

    .line 58
    :cond_0
    const/4 v1, 0x0

    .local v1, "iterParser":I
    :goto_1
    iget-object v3, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->ftpFileEntryParsers:[Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 60
    iget-object v3, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->ftpFileEntryParsers:[Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    aget-object v0, v3, v1

    .line 62
    .local v0, "ftpFileEntryParser":Lorg/apache/commons/net/ftp/FTPFileEntryParser;
    invoke-interface {v0, p1}, Lorg/apache/commons/net/ftp/FTPFileEntryParser;->parseFTPEntry(Ljava/lang/String;)Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v2

    .line 63
    .restart local v2    # "matched":Lorg/apache/commons/net/ftp/FTPFile;
    if-eqz v2, :cond_1

    .line 65
    iput-object v0, p0, Lorg/apache/commons/net/ftp/parser/CompositeFileEntryParser;->cachedFtpFileEntryParser:Lorg/apache/commons/net/ftp/FTPFileEntryParser;

    goto :goto_0

    .line 58
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 70
    .end local v0    # "ftpFileEntryParser":Lorg/apache/commons/net/ftp/FTPFileEntryParser;
    .end local v1    # "iterParser":I
    .end local v2    # "matched":Lorg/apache/commons/net/ftp/FTPFile;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method
