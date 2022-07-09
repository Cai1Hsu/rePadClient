.class public final Lorg/apache/tools/ant/filters/ConcatFilter;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "ConcatFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# instance fields
.field private append:Ljava/io/File;

.field private appendReader:Ljava/io/Reader;

.field private prepend:Ljava/io/File;

.field private prependReader:Ljava/io/Reader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 55
    iput-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    .line 58
    iput-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 55
    iput-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    .line 58
    iput-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    .line 77
    return-void
.end method

.method private initialize()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 190
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_2

    .line 191
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 192
    const-string/jumbo v2, "prepend"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 193
    new-instance v2, Ljava/io/File;

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/ConcatFilter;->setPrepend(Ljava/io/File;)V

    .line 191
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 196
    :cond_1
    const-string/jumbo v2, "append"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    new-instance v2, Ljava/io/File;

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/ConcatFilter;->setAppend(Ljava/io/File;)V

    goto :goto_1

    .line 202
    .end local v0    # "i":I
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    if-eqz v2, :cond_4

    .line 203
    iget-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isAbsolute()Z

    move-result v2

    if-nez v2, :cond_3

    .line 204
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    .line 206
    :cond_3
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    iget-object v4, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    .line 208
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    if-eqz v2, :cond_6

    .line 209
    iget-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isAbsolute()Z

    move-result v2

    if-nez v2, :cond_5

    .line 210
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    .line 212
    :cond_5
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    iget-object v4, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v2, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    .line 214
    :cond_6
    return-void
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 172
    new-instance v0, Lorg/apache/tools/ant/filters/ConcatFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/ConcatFilter;-><init>(Ljava/io/Reader;)V

    .line 173
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/ConcatFilter;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getPrepend()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ConcatFilter;->setPrepend(Ljava/io/File;)V

    .line 174
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getAppend()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ConcatFilter;->setAppend(Ljava/io/File;)V

    .line 179
    return-object v0
.end method

.method public getAppend()Ljava/io/File;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    return-object v0
.end method

.method public getPrepend()Ljava/io/File;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    return-object v0
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/ConcatFilter;->initialize()V

    .line 95
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/ConcatFilter;->setInitialized(Z)V

    .line 98
    :cond_0
    const/4 v0, -0x1

    .line 102
    .local v0, "ch":I
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    if-eqz v1, :cond_1

    .line 103
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 104
    if-ne v0, v2, :cond_1

    .line 106
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    .line 107
    iput-object v3, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prependReader:Ljava/io/Reader;

    .line 110
    :cond_1
    if-ne v0, v2, :cond_2

    .line 111
    invoke-super {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;->read()I

    move-result v0

    .line 113
    :cond_2
    if-ne v0, v2, :cond_3

    .line 116
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    if-eqz v1, :cond_3

    .line 117
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 118
    if-ne v0, v2, :cond_3

    .line 120
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    .line 121
    iput-object v3, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->appendReader:Ljava/io/Reader;

    .line 126
    :cond_3
    return v0
.end method

.method public setAppend(Ljava/io/File;)V
    .locals 0
    .param p1, "append"    # Ljava/io/File;

    .prologue
    .line 150
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->append:Ljava/io/File;

    .line 151
    return-void
.end method

.method public setPrepend(Ljava/io/File;)V
    .locals 0
    .param p1, "prepend"    # Ljava/io/File;

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ConcatFilter;->prepend:Ljava/io/File;

    .line 135
    return-void
.end method
