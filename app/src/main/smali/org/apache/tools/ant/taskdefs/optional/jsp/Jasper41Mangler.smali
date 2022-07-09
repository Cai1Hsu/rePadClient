.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/Jasper41Mangler;
.super Ljava/lang/Object;
.source "Jasper41Mangler.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static mangleChar(C)Ljava/lang/String;
    .locals 8
    .param p0, "ch"    # C

    .prologue
    const/4 v7, 0x6

    .line 67
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    .line 68
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    rsub-int/lit8 v2, v5, 0x5

    .line 69
    .local v2, "nzeros":I
    new-array v3, v7, [C

    .line 70
    .local v3, "result":[C
    const/4 v5, 0x0

    const/16 v6, 0x5f

    aput-char v6, v3, v5

    .line 71
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-gt v0, v2, :cond_0

    .line 72
    const/16 v5, 0x30

    aput-char v5, v3, v0

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 74
    :cond_0
    add-int/lit8 v0, v2, 0x1

    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    if-ge v0, v7, :cond_1

    .line 75
    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v3, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 77
    :cond_1
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method


# virtual methods
.method public mapJspToJavaName(Ljava/io/File;)Ljava/lang/String;
    .locals 8
    .param p1, "jspFile"    # Ljava/io/File;

    .prologue
    const/16 v7, 0x5f

    .line 38
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 39
    .local v3, "jspUri":Ljava/lang/String;
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    add-int/lit8 v5, v6, 0x1

    .line 40
    .local v5, "start":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 42
    .local v1, "end":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v5

    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 43
    .local v4, "modifiedClassName":Ljava/lang/StringBuffer;
    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v7, :cond_1

    .line 47
    :cond_0
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 49
    :cond_1
    move v2, v5

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_4

    .line 50
    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 51
    .local v0, "ch":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 52
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 49
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    :cond_2
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_3

    .line 54
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 56
    :cond_3
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/Jasper41Mangler;->mangleChar(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 59
    .end local v0    # "ch":C
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public mapPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v0, 0x0

    return-object v0
.end method
