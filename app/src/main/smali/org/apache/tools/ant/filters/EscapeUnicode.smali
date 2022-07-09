.class public Lorg/apache/tools/ant/filters/EscapeUnicode;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "EscapeUnicode.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# instance fields
.field private unicodeBuf:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 54
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 65
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    .line 66
    return-void
.end method

.method private initialize()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method


# virtual methods
.method public final chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 112
    new-instance v0, Lorg/apache/tools/ant/filters/EscapeUnicode;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/EscapeUnicode;-><init>(Ljava/io/Reader;)V

    .line 113
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/EscapeUnicode;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/EscapeUnicode;->setInitialized(Z)V

    .line 114
    return-object v0
.end method

.method public final read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/EscapeUnicode;->getInitialized()Z

    move-result v2

    if-nez v2, :cond_0

    .line 80
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/EscapeUnicode;->initialize()V

    .line 81
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/EscapeUnicode;->setInitialized(Z)V

    .line 84
    :cond_0
    const/4 v1, -0x1

    .line 85
    .local v1, "ch":I
    iget-object v2, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 86
    iget-object v2, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->in:Ljava/io/Reader;

    invoke-virtual {v2}, Ljava/io/Reader;->read()I

    move-result v1

    .line 87
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 88
    int-to-char v0, v1

    .line 89
    .local v0, "achar":C
    const/16 v2, 0x80

    if-lt v0, v2, :cond_1

    .line 90
    invoke-static {v0}, Lorg/apache/tools/ant/util/UnicodeUtil;->EscapeUnicode(C)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    .line 91
    const/16 v1, 0x5c

    .line 98
    .end local v0    # "achar":C
    :cond_1
    :goto_0
    return v1

    .line 95
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v1

    .line 96
    iget-object v2, p0, Lorg/apache/tools/ant/filters/EscapeUnicode;->unicodeBuf:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
