.class public Lorg/apache/tools/ant/types/selectors/DepthSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "DepthSelector.java"


# static fields
.field public static final MAX_KEY:Ljava/lang/String; = "max"

.field public static final MIN_KEY:Ljava/lang/String; = "min"


# instance fields
.field public max:I

.field public min:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 38
    iput v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    .line 40
    iput v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    .line 54
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 10
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    const/4 v7, 0x0

    const/4 v9, -0x1

    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->validate()V

    .line 149
    const/4 v3, -0x1

    .line 151
    .local v3, "depth":I
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "absBase":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "absFile":Ljava/lang/String;
    new-instance v5, Ljava/util/StringTokenizer;

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-direct {v5, v0, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .local v5, "tokBase":Ljava/util/StringTokenizer;
    new-instance v6, Ljava/util/StringTokenizer;

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-direct {v6, v1, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .local v6, "tokFile":Ljava/util/StringTokenizer;
    :cond_0
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 158
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 159
    .local v4, "filetoken":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 160
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 162
    .local v2, "basetoken":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 163
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "File "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " does not appear within "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "directory"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 168
    .end local v2    # "basetoken":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 169
    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    if-le v8, v9, :cond_0

    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    if-le v3, v8, :cond_0

    .line 181
    .end local v4    # "filetoken":Ljava/lang/String;
    :cond_2
    :goto_0
    return v7

    .line 174
    :cond_3
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 175
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "File "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " is outside of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "directory tree"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 178
    :cond_4
    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    if-le v8, v9, :cond_5

    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    if-lt v3, v8, :cond_2

    .line 181
    :cond_5
    const/4 v7, 0x1

    goto :goto_0
.end method

.method public setMax(I)V
    .locals 0
    .param p1, "max"    # I

    .prologue
    .line 83
    iput p1, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    .line 84
    return-void
.end method

.method public setMin(I)V
    .locals 0
    .param p1, "min"    # I

    .prologue
    .line 74
    iput p1, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    .line 75
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 5
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 93
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 94
    if-eqz p1, :cond_2

    .line 95
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 96
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "paramname":Ljava/lang/String;
    const-string/jumbo v3, "min"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    :try_start_0
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setMin(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 100
    :catch_0
    move-exception v1

    .line 101
    .local v1, "nfe1":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid minimum value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 104
    .end local v1    # "nfe1":Ljava/lang/NumberFormatException;
    :cond_0
    const-string/jumbo v3, "max"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 106
    :try_start_1
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setMax(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 107
    :catch_1
    move-exception v1

    .line 108
    .restart local v1    # "nfe1":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid maximum value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 112
    .end local v1    # "nfe1":Ljava/lang/NumberFormatException;
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 116
    .end local v0    # "i":I
    .end local v2    # "paramname":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{depthselector min: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 61
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget v1, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 62
    const-string/jumbo v1, " max: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 63
    iget v1, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 64
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 2

    .prologue
    .line 123
    iget v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    if-gez v0, :cond_0

    iget v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    if-gez v0, :cond_0

    .line 124
    const-string/jumbo v0, "You must set at least one of the min or the max levels."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setError(Ljava/lang/String;)V

    .line 127
    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    iget v1, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->min:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Lorg/apache/tools/ant/types/selectors/DepthSelector;->max:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 128
    const-string/jumbo v0, "The maximum depth is lower than the minimum."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/DepthSelector;->setError(Ljava/lang/String;)V

    .line 130
    :cond_1
    return-void
.end method
