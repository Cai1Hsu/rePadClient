.class public Lorg/apache/tools/ant/types/mappers/CutDirsMapper;
.super Ljava/lang/Object;
.source "CutDirsMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# instance fields
.field private dirs:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/types/mappers/CutDirsMapper;->dirs:I

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    const/4 v6, -0x1

    .line 60
    iget v4, p0, Lorg/apache/tools/ant/types/mappers/CutDirsMapper;->dirs:I

    if-gtz v4, :cond_0

    .line 61
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "dirs must be set to a positive number"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 63
    :cond_0
    sget-char v0, Ljava/io/File;->separatorChar:C

    .line 64
    .local v0, "fileSep":C
    const/16 v4, 0x2f

    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x5c

    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "fileSepCorrected":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 67
    .local v3, "nthMatch":I
    const/4 v2, 0x1

    .local v2, "n":I
    :goto_0
    if-le v3, v6, :cond_1

    iget v4, p0, Lorg/apache/tools/ant/types/mappers/CutDirsMapper;->dirs:I

    if-ge v2, v4, :cond_1

    .line 68
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v1, v0, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 67
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    :cond_1
    if-ne v3, v6, :cond_2

    .line 71
    const/4 v4, 0x0

    .line 73
    :goto_1
    return-object v4

    :cond_2
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    goto :goto_1
.end method

.method public setDirs(I)V
    .locals 0
    .param p1, "dirs"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/apache/tools/ant/types/mappers/CutDirsMapper;->dirs:I

    .line 42
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "ignore"    # Ljava/lang/String;

    .prologue
    .line 49
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "ignore"    # Ljava/lang/String;

    .prologue
    .line 56
    return-void
.end method
