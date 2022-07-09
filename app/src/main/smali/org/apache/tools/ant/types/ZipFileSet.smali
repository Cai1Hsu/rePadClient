.class public Lorg/apache/tools/ant/types/ZipFileSet;
.super Lorg/apache/tools/ant/types/ArchiveFileSet;
.source "ZipFileSet.java"


# instance fields
.field private encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    .line 41
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    .line 49
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>(Lorg/apache/tools/ant/types/ArchiveFileSet;)V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    .line 57
    iget-object v0, p1, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    .line 58
    return-void
.end method

.method private checkZipFileSetAttributesAllowed()V
    .locals 2

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v0, :cond_1

    .line 143
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->checkAttributesAllowed()V

    .line 145
    :cond_1
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ZipFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 127
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 77
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    .line 78
    .local v0, "ref":Lorg/apache/tools/ant/types/AbstractFileSet;
    instance-of v1, v0, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v1, :cond_0

    .line 79
    check-cast v0, Lorg/apache/tools/ant/types/ZipFileSet;

    .end local v0    # "ref":Lorg/apache/tools/ant/types/AbstractFileSet;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ZipFileSet;->getEncoding()Ljava/lang/String;

    move-result-object v1

    .line 84
    :goto_0
    return-object v1

    .line 81
    .restart local v0    # "ref":Lorg/apache/tools/ant/types/AbstractFileSet;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 84
    .end local v0    # "ref":Lorg/apache/tools/ant/types/AbstractFileSet;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    goto :goto_0
.end method

.method protected getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 104
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ZipFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 105
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    .line 106
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v3, :cond_0

    .line 107
    check-cast v1, Lorg/apache/tools/ant/types/AbstractFileSet;

    .line 111
    .end local v1    # "o":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 108
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v3, v1, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v3, :cond_1

    .line 109
    new-instance v2, Lorg/apache/tools/ant/types/ZipFileSet;

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-direct {v2, v1}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 110
    .local v2, "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/ZipFileSet;->configureFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)V

    move-object v1, v2

    .line 111
    goto :goto_0

    .line 113
    .end local v2    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " doesn\'t denote a zipfileset or a fileset"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected newArchiveScanner()Lorg/apache/tools/ant/types/ArchiveScanner;
    .locals 2

    .prologue
    .line 92
    new-instance v0, Lorg/apache/tools/ant/types/ZipScanner;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/ZipScanner;-><init>()V

    .line 93
    .local v0, "zs":Lorg/apache/tools/ant/types/ZipScanner;
    iget-object v1, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipScanner;->setEncoding(Ljava/lang/String;)V

    .line 94
    return-object v0
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "enc"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ZipFileSet;->checkZipFileSetAttributesAllowed()V

    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/types/ZipFileSet;->encoding:Ljava/lang/String;

    .line 68
    return-void
.end method
