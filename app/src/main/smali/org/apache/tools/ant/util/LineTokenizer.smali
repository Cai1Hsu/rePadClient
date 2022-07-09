.class public Lorg/apache/tools/ant/util/LineTokenizer;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "LineTokenizer.java"

# interfaces
.implements Lorg/apache/tools/ant/util/Tokenizer;


# static fields
.field private static final NOT_A_CHAR:I = -0x2


# instance fields
.field private includeDelims:Z

.field private lineEnd:Ljava/lang/String;

.field private pushed:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 33
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    .line 34
    const/4 v0, -0x2

    iput v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->pushed:I

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->includeDelims:Z

    return-void
.end method


# virtual methods
.method public getPostToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->includeDelims:Z

    if-eqz v0, :cond_0

    .line 109
    const-string/jumbo v0, ""

    .line 111
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    goto :goto_0
.end method

.method public getToken(Ljava/io/Reader;)Ljava/lang/String;
    .locals 7
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0xa

    const/4 v5, -0x2

    const/4 v4, -0x1

    .line 57
    const/4 v0, -0x1

    .line 58
    .local v0, "ch":I
    iget v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->pushed:I

    if-eq v3, v5, :cond_0

    .line 59
    iget v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->pushed:I

    .line 60
    iput v5, p0, Lorg/apache/tools/ant/util/LineTokenizer;->pushed:I

    .line 64
    :goto_0
    if-ne v0, v4, :cond_1

    .line 65
    const/4 v3, 0x0

    .line 101
    :goto_1
    return-object v3

    .line 62
    :cond_0
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_0

    .line 68
    :cond_1
    const-string/jumbo v3, ""

    iput-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    .line 69
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 71
    .local v1, "line":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 72
    .local v2, "state":I
    :goto_2
    if-eq v0, v4, :cond_3

    .line 73
    if-nez v2, :cond_7

    .line 74
    const/16 v3, 0xd

    if-ne v0, v3, :cond_2

    .line 75
    const/4 v2, 0x1

    .line 92
    :goto_3
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_2

    .line 76
    :cond_2
    if-ne v0, v6, :cond_6

    .line 77
    const-string/jumbo v3, "\n"

    iput-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    .line 94
    :cond_3
    :goto_4
    if-ne v0, v4, :cond_4

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 95
    const-string/jumbo v3, "\r"

    iput-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    .line 98
    :cond_4
    iget-boolean v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->includeDelims:Z

    if-eqz v3, :cond_5

    .line 99
    iget-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 101
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 80
    :cond_6
    int-to-char v3, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 83
    :cond_7
    const/4 v2, 0x0

    .line 84
    if-ne v0, v6, :cond_8

    .line 85
    const-string/jumbo v3, "\r\n"

    iput-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    goto :goto_4

    .line 87
    :cond_8
    iput v0, p0, Lorg/apache/tools/ant/util/LineTokenizer;->pushed:I

    .line 88
    const-string/jumbo v3, "\r"

    iput-object v3, p0, Lorg/apache/tools/ant/util/LineTokenizer;->lineEnd:Ljava/lang/String;

    goto :goto_4
.end method

.method public setIncludeDelims(Z)V
    .locals 0
    .param p1, "includeDelims"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/LineTokenizer;->includeDelims:Z

    .line 47
    return-void
.end method
