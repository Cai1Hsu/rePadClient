.class public Lorg/apache/tools/ant/util/PackageNameMapper;
.super Lorg/apache/tools/ant/util/GlobPatternMapper;
.source "PackageNameMapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/util/GlobPatternMapper;-><init>()V

    return-void
.end method


# virtual methods
.method protected extractVariablePart(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x2e

    .line 41
    iget v1, p0, Lorg/apache/tools/ant/util/PackageNameMapper;->prefixLength:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lorg/apache/tools/ant/util/PackageNameMapper;->postfixLength:I

    sub-int/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "var":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/PackageNameMapper;->getHandleDirSep()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    const/16 v1, 0x2f

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5c

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 46
    :cond_0
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
