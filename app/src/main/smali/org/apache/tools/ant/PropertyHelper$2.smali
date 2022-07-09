.class Lorg/apache/tools/ant/PropertyHelper$2;
.super Ljava/lang/Object;
.source "PropertyHelper.java"

# interfaces
.implements Lorg/apache/tools/ant/property/PropertyExpander;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;Lorg/apache/tools/ant/property/ParseNextProperty;)Ljava/lang/String;
    .locals 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "notUsed"    # Lorg/apache/tools/ant/property/ParseNextProperty;

    .prologue
    .line 190
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v1

    .line 192
    .local v1, "index":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v1

    const/4 v4, 0x3

    if-lt v3, v4, :cond_2

    const/16 v3, 0x24

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v3, v4, :cond_2

    const/16 v3, 0x7b

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v3, v4, :cond_2

    .line 194
    add-int/lit8 v2, v1, 0x2

    .line 196
    .local v2, "start":I
    const/16 v3, 0x7d

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 197
    .local v0, "end":I
    if-gez v0, :cond_0

    .line 198
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Syntax error in property: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 201
    :cond_0
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p2, v3}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 202
    if-ne v2, v0, :cond_1

    const-string/jumbo v3, ""

    .line 204
    .end local v0    # "end":I
    .end local v2    # "start":I
    :goto_0
    return-object v3

    .line 202
    .restart local v0    # "end":I
    .restart local v2    # "start":I
    :cond_1
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 204
    .end local v0    # "end":I
    .end local v2    # "start":I
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method
