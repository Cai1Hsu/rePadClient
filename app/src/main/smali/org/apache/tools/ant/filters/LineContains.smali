.class public final Lorg/apache/tools/ant/filters/LineContains;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "LineContains.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/filters/LineContains$Contains;
    }
.end annotation


# static fields
.field private static final CONTAINS_KEY:Ljava/lang/String; = "contains"

.field private static final NEGATE_KEY:Ljava/lang/String; = "negate"


# instance fields
.field private contains:Ljava/util/Vector;

.field private line:Ljava/lang/String;

.field private negate:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 58
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/LineContains;->negate:Z

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 58
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/LineContains;->negate:Z

    .line 86
    return-void
.end method

.method private getContains()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    return-object v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 204
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 205
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_2

    .line 206
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 207
    const-string/jumbo v2, "contains"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 208
    iget-object v2, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 206
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 209
    :cond_1
    const-string/jumbo v2, "negate"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 210
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/LineContains;->setNegate(Z)V

    goto :goto_1

    .line 214
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private setContains(Ljava/util/Vector;)V
    .locals 0
    .param p1, "contains"    # Ljava/util/Vector;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    .line 168
    return-void
.end method


# virtual methods
.method public addConfiguredContains(Lorg/apache/tools/ant/filters/LineContains$Contains;)V
    .locals 2
    .param p1, "contains"    # Lorg/apache/tools/ant/filters/LineContains$Contains;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/LineContains$Contains;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 194
    new-instance v0, Lorg/apache/tools/ant/filters/LineContains;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/LineContains;-><init>(Ljava/io/Reader;)V

    .line 195
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/LineContains;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/LineContains;->getContains()Ljava/util/Vector;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/filters/LineContains;->setContains(Ljava/util/Vector;)V

    .line 196
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->isNegated()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/LineContains;->setNegate(Z)V

    .line 197
    return-object v0
.end method

.method public isNegated()Z
    .locals 1

    .prologue
    .line 156
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/LineContains;->negate:Z

    return v0
.end method

.method public read()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->getInitialized()Z

    move-result v7

    if-nez v7, :cond_0

    .line 100
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/LineContains;->initialize()V

    .line 101
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/filters/LineContains;->setInitialized(Z)V

    .line 104
    :cond_0
    const/4 v0, -0x1

    .line 106
    .local v0, "ch":I
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    if-eqz v7, :cond_3

    .line 107
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 108
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v5, :cond_2

    .line 109
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    :cond_1
    :goto_0
    move v5, v0

    .line 130
    :goto_1
    return v5

    .line 111
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    goto :goto_0

    .line 114
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v1

    .line 116
    .local v1, "containsSize":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->readLine()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    :goto_2
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    if-eqz v7, :cond_6

    .line 117
    const/4 v4, 0x1

    .line 118
    .local v4, "matches":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    if-eqz v4, :cond_5

    if-ge v3, v1, :cond_5

    .line 119
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->contains:Ljava/util/Vector;

    invoke-virtual {v7, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 120
    .local v2, "containsStr":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ltz v7, :cond_4

    move v4, v5

    .line 118
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_4
    move v4, v6

    .line 120
    goto :goto_4

    .line 122
    .end local v2    # "containsStr":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->isNegated()Z

    move-result v7

    xor-int/2addr v7, v4

    if-eqz v7, :cond_7

    .line 126
    .end local v3    # "i":I
    .end local v4    # "matches":Z
    :cond_6
    iget-object v5, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->read()I

    move-result v5

    goto :goto_1

    .line 116
    .restart local v3    # "i":I
    .restart local v4    # "matches":Z
    :cond_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/LineContains;->readLine()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/filters/LineContains;->line:Ljava/lang/String;

    goto :goto_2
.end method

.method public setNegate(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 148
    iput-boolean p1, p0, Lorg/apache/tools/ant/filters/LineContains;->negate:Z

    .line 149
    return-void
.end method
