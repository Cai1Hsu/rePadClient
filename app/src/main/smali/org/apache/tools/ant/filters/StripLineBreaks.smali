.class public final Lorg/apache/tools/ant/filters/StripLineBreaks;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "StripLineBreaks.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final DEFAULT_LINE_BREAKS:Ljava/lang/String; = "\r\n"

.field private static final LINE_BREAKS_KEY:Ljava/lang/String; = "linebreaks"


# instance fields
.field private lineBreaks:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 50
    const-string/jumbo v0, "\r\n"

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 50
    const-string/jumbo v0, "\r\n"

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    .line 69
    return-void
.end method

.method private getLineBreaks()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    return-object v0
.end method

.method private initialize()V
    .locals 5

    .prologue
    .line 139
    const/4 v2, 0x0

    .line 140
    .local v2, "userDefinedLineBreaks":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineBreaks;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 141
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_0

    .line 142
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 143
    const-string/jumbo v3, "linebreaks"

    aget-object v4, v1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 144
    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 149
    .end local v0    # "i":I
    :cond_0
    if-eqz v2, :cond_1

    .line 150
    iput-object v2, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    .line 152
    :cond_1
    return-void

    .line 142
    .restart local v0    # "i":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 129
    new-instance v0, Lorg/apache/tools/ant/filters/StripLineBreaks;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/StripLineBreaks;-><init>(Ljava/io/Reader;)V

    .line 130
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/StripLineBreaks;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/StripLineBreaks;->getLineBreaks()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/StripLineBreaks;->setLineBreaks(Ljava/lang/String;)V

    .line 131
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/StripLineBreaks;->setInitialized(Z)V

    .line 132
    return-object v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 82
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineBreaks;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 83
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/StripLineBreaks;->initialize()V

    .line 84
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/StripLineBreaks;->setInitialized(Z)V

    .line 87
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 88
    .local v0, "ch":I
    :goto_0
    if-eq v0, v2, :cond_1

    .line 89
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 95
    :cond_1
    return v0

    .line 92
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_0
.end method

.method public setLineBreaks(Ljava/lang/String;)V
    .locals 0
    .param p1, "lineBreaks"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/tools/ant/filters/StripLineBreaks;->lineBreaks:Ljava/lang/String;

    .line 106
    return-void
.end method
