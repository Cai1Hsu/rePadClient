.class public final Lorg/apache/tools/ant/filters/ReplaceTokens;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "ReplaceTokens.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/filters/ReplaceTokens$Token;
    }
.end annotation


# static fields
.field private static final DEFAULT_BEGIN_TOKEN:C = '@'

.field private static final DEFAULT_END_TOKEN:C = '@'


# instance fields
.field private beginToken:C

.field private endToken:C

.field private hash:Ljava/util/Hashtable;

.field private queueIndex:I

.field private queuedData:Ljava/lang/String;

.field private replaceData:Ljava/lang/String;

.field private replaceIndex:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x40

    const/4 v0, -0x1

    .line 87
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 61
    iput-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    .line 64
    iput-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceData:Ljava/lang/String;

    .line 67
    iput v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    .line 70
    iput v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    .line 73
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    .line 76
    iput-char v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    .line 79
    iput-char v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 3
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x40

    const/4 v0, -0x1

    .line 97
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 61
    iput-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    .line 64
    iput-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceData:Ljava/lang/String;

    .line 67
    iput v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    .line 70
    iput v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    .line 73
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    .line 76
    iput-char v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    .line 79
    iput-char v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    .line 98
    return-void
.end method

.method private getBeginToken()C
    .locals 1

    .prologue
    .line 202
    iget-char v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    return v0
.end method

.method private getEndToken()C
    .locals 1

    .prologue
    .line 220
    iget-char v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    return v0
.end method

.method private getNextChar()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 101
    iget v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    if-eq v1, v4, :cond_1

    .line 102
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    iget v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 103
    .local v0, "ch":I
    iget v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    iget-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 104
    iput v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    .line 109
    .end local v0    # "ch":I
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_0
.end method

.method private getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 249
    const/4 v0, 0x0

    .line 250
    .local v0, "in":Ljava/io/InputStream;
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 252
    .local v2, "props":Ljava/util/Properties;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 253
    invoke-virtual {v2, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 260
    :goto_0
    return-object v2

    .line 254
    :catch_0
    move-exception v1

    .line 255
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 257
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v3
.end method

.method private getTokens()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    return-object v0
.end method

.method private initialize()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 306
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v2

    .line 307
    .local v2, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v2, :cond_6

    .line 308
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v2

    if-ge v0, v5, :cond_6

    .line 309
    aget-object v5, v2, v0

    if-eqz v5, :cond_1

    .line 310
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v3

    .line 311
    .local v3, "type":Ljava/lang/String;
    const-string/jumbo v5, "tokenchar"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 312
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 313
    .local v1, "name":Ljava/lang/String;
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 314
    .local v4, "value":Ljava/lang/String;
    const-string/jumbo v5, "begintoken"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 315
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 316
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Begin token cannot be empty"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 319
    :cond_0
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    .line 308
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "type":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 320
    .restart local v1    # "name":Ljava/lang/String;
    .restart local v3    # "type":Ljava/lang/String;
    .restart local v4    # "value":Ljava/lang/String;
    :cond_2
    const-string/jumbo v5, "endtoken"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 321
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3

    .line 322
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "End token cannot be empty"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 325
    :cond_3
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    iput-char v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    goto :goto_1

    .line 327
    .end local v1    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_4
    const-string/jumbo v5, "token"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 328
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v1

    .line 329
    .restart local v1    # "name":Ljava/lang/String;
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 330
    .restart local v4    # "value":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    invoke-virtual {v5, v1, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 331
    .end local v1    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_5
    const-string/jumbo v5, "propertiesfile"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 332
    new-instance v5, Lorg/apache/tools/ant/types/resources/FileResource;

    new-instance v6, Ljava/io/File;

    aget-object v7, v2, v0

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/filters/ReplaceTokens;->makeTokensFromProperties(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_1

    .line 338
    .end local v0    # "i":I
    .end local v3    # "type":Ljava/lang/String;
    :cond_6
    return-void
.end method

.method private makeTokensFromProperties(Lorg/apache/tools/ant/types/Resource;)V
    .locals 5
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 341
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;

    move-result-object v2

    .line 342
    .local v2, "props":Ljava/util/Properties;
    invoke-virtual {v2}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 343
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 344
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 345
    .local v3, "value":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    invoke-virtual {v4, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 347
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private setTokens(Ljava/util/Hashtable;)V
    .locals 0
    .param p1, "hash"    # Ljava/util/Hashtable;

    .prologue
    .line 270
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    .line 271
    return-void
.end method


# virtual methods
.method public addConfiguredToken(Lorg/apache/tools/ant/filters/ReplaceTokens$Token;)V
    .locals 3
    .param p1, "token"    # Lorg/apache/tools/ant/filters/ReplaceTokens$Token;

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 294
    new-instance v0, Lorg/apache/tools/ant/filters/ReplaceTokens;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/ReplaceTokens;-><init>(Ljava/io/Reader;)V

    .line 295
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/ReplaceTokens;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getBeginToken()C

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->setBeginToken(C)V

    .line 296
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getEndToken()C

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->setEndToken(C)V

    .line 297
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getTokens()Ljava/util/Hashtable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->setTokens(Ljava/util/Hashtable;)V

    .line 298
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->setInitialized(Z)V

    .line 299
    return-object v0
.end method

.method public read()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getInitialized()Z

    move-result v4

    if-nez v4, :cond_0

    .line 124
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->initialize()V

    .line 125
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/filters/ReplaceTokens;->setInitialized(Z)V

    .line 128
    :cond_0
    iget v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    if-eq v4, v7, :cond_2

    .line 129
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceData:Ljava/lang/String;

    iget v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 130
    .local v0, "ch":I
    iget v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    iget-object v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceData:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v4, v5, :cond_1

    .line 131
    iput v7, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    :cond_1
    move v4, v0

    .line 184
    :goto_0
    return v4

    .line 136
    .end local v0    # "ch":I
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getNextChar()I

    move-result v0

    .line 138
    .restart local v0    # "ch":I
    iget-char v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    if-ne v0, v4, :cond_d

    .line 139
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v4, ""

    invoke-direct {v1, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 141
    .local v1, "key":Ljava/lang/StringBuffer;
    :cond_3
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->getNextChar()I

    move-result v0

    .line 142
    if-eq v0, v7, :cond_4

    .line 143
    int-to-char v4, v0

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 147
    iget-char v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    if-ne v0, v4, :cond_3

    .line 149
    :cond_4
    if-ne v0, v7, :cond_8

    .line 150
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    if-eqz v4, :cond_5

    iget v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    if-ne v4, v7, :cond_6

    .line 151
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    .line 156
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_7

    .line 157
    iput v8, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    .line 161
    :goto_2
    iget-char v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    goto :goto_0

    .line 153
    :cond_6
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    iget v6, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    goto :goto_1

    .line 159
    :cond_7
    iput v7, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    goto :goto_2

    .line 163
    :cond_8
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 165
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->hash:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 166
    .local v3, "replaceWith":Ljava/lang/String;
    if-eqz v3, :cond_a

    .line 167
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9

    .line 168
    iput-object v3, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceData:Ljava/lang/String;

    .line 169
    iput v8, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->replaceIndex:I

    .line 171
    :cond_9
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ReplaceTokens;->read()I

    move-result v4

    goto/16 :goto_0

    .line 173
    :cond_a
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-char v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 174
    .local v2, "newData":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    if-eqz v4, :cond_b

    iget v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    if-ne v4, v7, :cond_c

    .line 175
    :cond_b
    iput-object v2, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    .line 179
    :goto_3
    iput v8, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    .line 180
    iget-char v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    goto/16 :goto_0

    .line 177
    :cond_c
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    iget v6, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queueIndex:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->queuedData:Ljava/lang/String;

    goto :goto_3

    .end local v1    # "key":Ljava/lang/StringBuffer;
    .end local v2    # "newData":Ljava/lang/String;
    .end local v3    # "replaceWith":Ljava/lang/String;
    :cond_d
    move v4, v0

    .line 184
    goto/16 :goto_0
.end method

.method public setBeginToken(C)V
    .locals 0
    .param p1, "beginToken"    # C

    .prologue
    .line 193
    iput-char p1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->beginToken:C

    .line 194
    return-void
.end method

.method public setEndToken(C)V
    .locals 0
    .param p1, "endToken"    # C

    .prologue
    .line 211
    iput-char p1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens;->endToken:C

    .line 212
    return-void
.end method

.method public setPropertiesResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 230
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/ReplaceTokens;->makeTokensFromProperties(Lorg/apache/tools/ant/types/Resource;)V

    .line 231
    return-void
.end method
