.class public Lorg/apache/tools/ant/util/UnPackageNameMapper;
.super Lorg/apache/tools/ant/util/GlobPatternMapper;
.source "UnPackageNameMapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/util/GlobPatternMapper;-><init>()V

    return-void
.end method


# virtual methods
.method protected extractVariablePart(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    iget v1, p0, Lorg/apache/tools/ant/util/UnPackageNameMapper;->prefixLength:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lorg/apache/tools/ant/util/UnPackageNameMapper;->postfixLength:I

    sub-int/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "var":Ljava/lang/String;
    const/16 v1, 0x2e

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
