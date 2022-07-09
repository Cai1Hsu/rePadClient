.class public final Lorg/apache/tools/ant/filters/TabsToSpaces;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "TabsToSpaces.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final DEFAULT_TAB_LENGTH:I = 0x8

.field private static final TAB_LENGTH_KEY:Ljava/lang/String; = "tablength"


# instance fields
.field private spacesRemaining:I

.field private tabLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 48
    const/16 v0, 0x8

    iput v0, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 48
    const/16 v0, 0x8

    iput v0, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    .line 70
    return-void
.end method

.method private getTablength()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    return v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TabsToSpaces;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 143
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_0

    .line 144
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 145
    aget-object v2, v1, v0

    if-eqz v2, :cond_1

    .line 146
    const-string/jumbo v2, "tablength"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 147
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    .line 153
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 144
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
    .line 132
    new-instance v0, Lorg/apache/tools/ant/filters/TabsToSpaces;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/TabsToSpaces;-><init>(Ljava/io/Reader;)V

    .line 133
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/TabsToSpaces;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TabsToSpaces;->getTablength()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/TabsToSpaces;->setTablength(I)V

    .line 134
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/TabsToSpaces;->setInitialized(Z)V

    .line 135
    return-object v0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TabsToSpaces;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 84
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TabsToSpaces;->initialize()V

    .line 85
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/TabsToSpaces;->setInitialized(Z)V

    .line 88
    :cond_0
    const/4 v0, -0x1

    .line 90
    .local v0, "ch":I
    iget v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    if-lez v1, :cond_2

    .line 91
    iget v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    .line 92
    const/16 v0, 0x20

    .line 100
    :cond_1
    :goto_0
    return v0

    .line 94
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 95
    const/16 v1, 0x9

    if-ne v0, v1, :cond_1

    .line 96
    iget v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->spacesRemaining:I

    .line 97
    const/16 v0, 0x20

    goto :goto_0
.end method

.method public setTablength(I)V
    .locals 0
    .param p1, "tabLength"    # I

    .prologue
    .line 109
    iput p1, p0, Lorg/apache/tools/ant/filters/TabsToSpaces;->tabLength:I

    .line 110
    return-void
.end method
