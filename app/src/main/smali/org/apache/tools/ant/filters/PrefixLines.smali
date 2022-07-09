.class public final Lorg/apache/tools/ant/filters/PrefixLines;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "PrefixLines.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final PREFIX_KEY:Ljava/lang/String; = "prefix"


# instance fields
.field private prefix:Ljava/lang/String;

.field private queuedData:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 66
    return-void
.end method

.method private getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 154
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_0

    .line 155
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 156
    const-string/jumbo v2, "prefix"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 157
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    .line 162
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 155
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 143
    new-instance v0, Lorg/apache/tools/ant/filters/PrefixLines;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/PrefixLines;-><init>(Ljava/io/Reader;)V

    .line 144
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/PrefixLines;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/PrefixLines;->setPrefix(Ljava/lang/String;)V

    .line 145
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/PrefixLines;->setInitialized(Z)V

    .line 146
    return-object v0
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 82
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->initialize()V

    .line 83
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/filters/PrefixLines;->setInitialized(Z)V

    .line 86
    :cond_0
    const/4 v0, -0x1

    .line 88
    .local v0, "ch":I
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 89
    iput-object v4, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 92
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 93
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 94
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 95
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 96
    iput-object v4, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    :cond_2
    :goto_0
    move v1, v0

    .line 109
    :goto_1
    return v1

    .line 99
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->readLine()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 100
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 101
    const/4 v0, -0x1

    goto :goto_0

    .line 103
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 104
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->queuedData:Ljava/lang/String;

    .line 106
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/PrefixLines;->read()I

    move-result v1

    goto :goto_1
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lorg/apache/tools/ant/filters/PrefixLines;->prefix:Ljava/lang/String;

    .line 121
    return-void
.end method
