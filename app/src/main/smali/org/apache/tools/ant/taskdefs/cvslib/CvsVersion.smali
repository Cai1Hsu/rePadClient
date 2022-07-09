.class public Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;
.super Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;
.source "CvsVersion.java"


# static fields
.field static final MULTIPLY:J = 0x64L

.field static final VERSION_1_11_2:J = 0x2b5eL


# instance fields
.field private clientVersion:Ljava/lang/String;

.field private clientVersionProperty:Ljava/lang/String;

.field private serverVersion:Ljava/lang/String;

.field private serverVersionProperty:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 13

    .prologue
    .line 112
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 113
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setOutputStream(Ljava/io/OutputStream;)V

    .line 114
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 115
    .local v0, "berr":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setErrorStream(Ljava/io/OutputStream;)V

    .line 116
    const-string/jumbo v10, "version"

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setCommand(Ljava/lang/String;)V

    .line 117
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->execute()V

    .line 118
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v7

    .line 119
    .local v7, "output":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Received version response \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x4

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->log(Ljava/lang/String;I)V

    .line 121
    new-instance v9, Ljava/util/StringTokenizer;

    invoke-direct {v9, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 122
    .local v9, "st":Ljava/util/StringTokenizer;
    const/4 v3, 0x0

    .line 123
    .local v3, "client":Z
    const/4 v8, 0x0

    .line 124
    .local v8, "server":Z
    const/4 v5, 0x0

    .line 125
    .local v5, "cvs":Ljava/lang/String;
    const/4 v2, 0x0

    .line 126
    .local v2, "cachedVersion":Ljava/lang/String;
    const/4 v6, 0x0

    .line 127
    .end local v2    # "cachedVersion":Ljava/lang/String;
    .end local v3    # "client":Z
    .local v6, "haveReadAhead":Z
    :cond_0
    :goto_0
    if-nez v6, :cond_1

    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 128
    :cond_1
    if-eqz v6, :cond_3

    move-object v4, v2

    .line 129
    .local v4, "currentToken":Ljava/lang/String;
    :goto_1
    const/4 v6, 0x0

    .line 130
    const-string/jumbo v10, "Client:"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 131
    const/4 v3, 0x1

    .line 138
    :cond_2
    :goto_2
    if-nez v3, :cond_7

    if-nez v8, :cond_7

    if-eqz v5, :cond_7

    if-nez v2, :cond_7

    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 140
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 141
    .restart local v2    # "cachedVersion":Ljava/lang/String;
    const/4 v6, 0x1

    goto :goto_0

    .line 128
    .end local v2    # "cachedVersion":Ljava/lang/String;
    .end local v4    # "currentToken":Ljava/lang/String;
    :cond_3
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 132
    .restart local v4    # "currentToken":Ljava/lang/String;
    :cond_4
    const-string/jumbo v10, "Server:"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 133
    const/4 v8, 0x1

    goto :goto_2

    .line 134
    :cond_5
    const-string/jumbo v10, "(CVS"

    invoke-virtual {v4, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string/jumbo v10, ")"

    invoke-virtual {v4, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 136
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x5

    if-ne v10, v11, :cond_6

    const-string/jumbo v5, ""

    :goto_3
    goto :goto_2

    :cond_6
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 142
    :cond_7
    if-eqz v3, :cond_9

    if-eqz v5, :cond_9

    .line 143
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 144
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersion:Ljava/lang/String;

    .line 146
    :cond_8
    const/4 v3, 0x0

    .line 147
    .restart local v3    # "client":Z
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 148
    .end local v3    # "client":Z
    :cond_9
    if-eqz v8, :cond_b

    if-eqz v5, :cond_b

    .line 149
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_a

    .line 150
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    .line 152
    :cond_a
    const/4 v8, 0x0

    .line 153
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 154
    :cond_b
    const-string/jumbo v10, "(client/server)"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    if-eqz v5, :cond_0

    if-eqz v2, :cond_0

    if-nez v3, :cond_0

    if-nez v8, :cond_0

    .line 157
    const/4 v8, 0x1

    move v3, v8

    .line 158
    .local v3, "client":I
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersion:Ljava/lang/String;

    .line 159
    const/4 v5, 0x0

    move-object v2, v5

    .local v2, "cachedVersion":Ljava/lang/Object;
    goto/16 :goto_0

    .line 162
    .end local v2    # "cachedVersion":Ljava/lang/Object;
    .end local v3    # "client":I
    .end local v4    # "currentToken":Ljava/lang/String;
    :cond_c
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersionProperty:Ljava/lang/String;

    if-eqz v10, :cond_d

    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersionProperty:Ljava/lang/String;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersion:Ljava/lang/String;

    invoke-virtual {v10, v11, v12}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    :cond_d
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersionProperty:Ljava/lang/String;

    if-eqz v10, :cond_e

    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersionProperty:Ljava/lang/String;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    invoke-virtual {v10, v11, v12}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    :cond_e
    return-void
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getServerVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    return-object v0
.end method

.method public setClientVersionProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "clientVersionProperty"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->clientVersionProperty:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setServerVersionProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverVersionProperty"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersionProperty:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public supportsCvsLogWithSOption()Z
    .locals 12

    .prologue
    const/4 v8, 0x0

    .line 85
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    if-nez v9, :cond_1

    .line 106
    :cond_0
    :goto_0
    return v8

    .line 88
    :cond_1
    new-instance v5, Ljava/util/StringTokenizer;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->serverVersion:Ljava/lang/String;

    const-string/jumbo v10, "."

    invoke-direct {v5, v9, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .local v5, "tokenizer":Ljava/util/StringTokenizer;
    const-wide/16 v0, 0x2710

    .line 90
    .local v0, "counter":J
    const-wide/16 v6, 0x0

    .line 91
    .local v6, "version":J
    :goto_1
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 92
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 93
    .local v3, "s":Ljava/lang/String;
    const/4 v2, 0x0

    .line 94
    .local v2, "i":I
    const/4 v2, 0x0

    :goto_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v2, v9, :cond_2

    .line 95
    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-nez v9, :cond_4

    .line 99
    :cond_2
    invoke-virtual {v3, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 100
    .local v4, "s2":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    mul-long/2addr v10, v0

    add-long/2addr v6, v10

    .line 101
    const-wide/16 v10, 0x1

    cmp-long v9, v0, v10

    if-nez v9, :cond_5

    .line 106
    .end local v2    # "i":I
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "s2":Ljava/lang/String;
    :cond_3
    const-wide/16 v10, 0x2b5e

    cmp-long v9, v6, v10

    if-ltz v9, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    .line 94
    .restart local v2    # "i":I
    .restart local v3    # "s":Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 104
    .restart local v4    # "s2":Ljava/lang/String;
    :cond_5
    const-wide/16 v10, 0x64

    div-long/2addr v0, v10

    goto :goto_1
.end method
