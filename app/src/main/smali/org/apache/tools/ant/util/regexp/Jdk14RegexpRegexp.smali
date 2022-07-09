.class public Lorg/apache/tools/ant/util/regexp/Jdk14RegexpRegexp;
.super Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;
.source "Jdk14RegexpRegexp.java"

# interfaces
.implements Lorg/apache/tools/ant/util/regexp/Regexp;


# static fields
.field private static final DECIMAL:I = 0xa


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;-><init>()V

    .line 34
    return-void
.end method


# virtual methods
.method protected getSubsOptions(I)I
    .locals 2
    .param p1, "options"    # I

    .prologue
    .line 43
    const/4 v0, 0x1

    .line 44
    .local v0, "subsOptions":I
    const/16 v1, 0x10

    invoke-static {p1, v1}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    const/16 v0, 0x10

    .line 47
    :cond_0
    return v0
.end method

.method public substitute(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 12
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "argument"    # Ljava/lang/String;
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x24

    const/16 v10, 0x5c

    .line 61
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 62
    .local v7, "subst":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v1, v9, :cond_4

    .line 63
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 64
    .local v0, "c":C
    if-ne v0, v11, :cond_0

    .line 65
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 66
    invoke-virtual {v7, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 62
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 67
    :cond_0
    if-ne v0, v10, :cond_3

    .line 68
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v1, v9, :cond_2

    .line 69
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 70
    const/16 v9, 0xa

    invoke-static {v0, v9}, Ljava/lang/Character;->digit(CI)I

    move-result v8

    .line 71
    .local v8, "value":I
    const/4 v9, -0x1

    if-le v8, v9, :cond_1

    .line 72
    const-string/jumbo v9, "$"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 74
    :cond_1
    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 78
    .end local v8    # "value":I
    :cond_2
    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 81
    :cond_3
    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 84
    .end local v0    # "c":C
    :cond_4
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 86
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpRegexp;->getSubsOptions(I)I

    move-result v5

    .line 87
    .local v5, "sOptions":I
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpRegexp;->getCompiledPattern(I)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 88
    .local v3, "p":Ljava/util/regex/Pattern;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 90
    .local v6, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 91
    .local v2, "m":Ljava/util/regex/Matcher;
    const/16 v9, 0x10

    invoke-static {v5, v9}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->hasFlag(II)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 92
    invoke-virtual {v2, p2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    :goto_2
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    return-object v9

    .line 94
    :cond_5
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    .line 95
    .local v4, "res":Z
    if-eqz v4, :cond_6

    .line 96
    invoke-virtual {v2, v6, p2}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    .line 97
    invoke-virtual {v2, v6}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 99
    :cond_6
    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2
.end method
