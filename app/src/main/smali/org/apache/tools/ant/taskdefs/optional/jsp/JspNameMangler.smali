.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;
.super Ljava/lang/Object;
.source "JspNameMangler.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;


# static fields
.field public static final keywords:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 36
    const/16 v0, 0x30

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "assert"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "abstract"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "boolean"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "break"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "byte"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "case"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "catch"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "char"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "class"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "const"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "continue"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "default"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "do"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "double"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "else"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "extends"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "final"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "finally"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string/jumbo v2, "float"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string/jumbo v2, "for"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string/jumbo v2, "goto"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string/jumbo v2, "if"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string/jumbo v2, "implements"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string/jumbo v2, "import"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string/jumbo v2, "instanceof"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string/jumbo v2, "int"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string/jumbo v2, "interface"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string/jumbo v2, "long"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string/jumbo v2, "native"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string/jumbo v2, "new"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string/jumbo v2, "package"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string/jumbo v2, "private"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string/jumbo v2, "protected"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string/jumbo v2, "public"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string/jumbo v2, "return"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string/jumbo v2, "short"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string/jumbo v2, "static"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string/jumbo v2, "super"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string/jumbo v2, "switch"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string/jumbo v2, "synchronized"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string/jumbo v2, "this"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string/jumbo v2, "throw"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string/jumbo v2, "throws"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string/jumbo v2, "transient"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string/jumbo v2, "try"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string/jumbo v2, "void"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string/jumbo v2, "volatile"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string/jumbo v2, "while"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->keywords:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static mangleChar(C)Ljava/lang/String;
    .locals 9
    .param p0, "ch"    # C

    .prologue
    const/4 v8, 0x6

    .line 126
    sget-char v6, Ljava/io/File;->separatorChar:C

    if-ne p0, v6, :cond_0

    .line 127
    const/16 p0, 0x2f

    .line 129
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 130
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    rsub-int/lit8 v1, v6, 0x5

    .line 131
    .local v1, "nzeros":I
    new-array v2, v8, [C

    .line 132
    .local v2, "result":[C
    const/4 v6, 0x0

    const/16 v7, 0x5f

    aput-char v7, v2, v6

    .line 133
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-gt v0, v1, :cond_1

    .line 134
    const/16 v6, 0x30

    aput-char v6, v2, v0

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    :cond_1
    const/4 v3, 0x0

    .line 137
    .local v3, "resultIndex":I
    add-int/lit8 v0, v1, 0x1

    move v4, v3

    .end local v3    # "resultIndex":I
    .local v4, "resultIndex":I
    :goto_1
    if-ge v0, v8, :cond_2

    .line 138
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "resultIndex":I
    .restart local v3    # "resultIndex":I
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    aput-char v6, v2, v0

    .line 137
    add-int/lit8 v0, v0, 0x1

    move v4, v3

    .end local v3    # "resultIndex":I
    .restart local v4    # "resultIndex":I
    goto :goto_1

    .line 140
    :cond_2
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v2}, Ljava/lang/String;-><init>([C)V

    return-object v6
.end method

.method private mapJspToBaseName(Ljava/io/File;)Ljava/lang/String;
    .locals 7
    .param p1, "jspFile"    # Ljava/io/File;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->stripExtension(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "className":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->keywords:[Ljava/lang/String;

    array-length v5, v5

    if-ge v2, v5, :cond_0

    .line 79
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->keywords:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 80
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 88
    .local v3, "modifiedClassName":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 89
    .local v1, "firstChar":C
    invoke-static {v1}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 90
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 95
    :goto_1
    const/4 v2, 0x1

    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 97
    .local v4, "subChar":C
    invoke-static {v4}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 98
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 95
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 78
    .end local v1    # "firstChar":C
    .end local v3    # "modifiedClassName":Ljava/lang/StringBuffer;
    .end local v4    # "subChar":C
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 92
    .restart local v1    # "firstChar":C
    .restart local v3    # "modifiedClassName":Ljava/lang/StringBuffer;
    :cond_2
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->mangleChar(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 100
    .restart local v4    # "subChar":C
    :cond_3
    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->mangleChar(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 103
    .end local v4    # "subChar":C
    :cond_4
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private stripExtension(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p1, "jspFile"    # Ljava/io/File;

    .prologue
    .line 114
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ".jsp"

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/StringUtils;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public mapJspToJavaName(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p1, "jspFile"    # Ljava/io/File;

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;->mapJspToBaseName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ".java"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public mapPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 152
    const/4 v0, 0x0

    return-object v0
.end method
