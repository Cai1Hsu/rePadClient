.class public Lorg/apache/tools/ant/taskdefs/condition/IsSigned;
.super Lorg/apache/tools/ant/types/DataType;
.source "IsSigned.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final SHORT_SIG_LIMIT:I = 0x8

.field private static final SIG_END:Ljava/lang/String; = ".SF"

.field private static final SIG_START:Ljava/lang/String; = "META-INF/"


# instance fields
.field private file:Ljava/io/File;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    return-void
.end method

.method public static isSigned(Ljava/io/File;Ljava/lang/String;)Z
    .locals 11
    .param p0, "zipFile"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x8

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 74
    const/4 v2, 0x0

    .line 76
    .local v2, "jarFile":Lorg/apache/tools/zip/ZipFile;
    :try_start_0
    new-instance v3, Lorg/apache/tools/zip/ZipFile;

    invoke-direct {v3, p0}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .end local v2    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    .local v3, "jarFile":Lorg/apache/tools/zip/ZipFile;
    if-nez p1, :cond_2

    .line 78
    :try_start_1
    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v1

    .line 79
    .local v1, "entries":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 80
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/zip/ZipEntry;

    invoke-virtual {v6}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "eName":Ljava/lang/String;
    const-string/jumbo v6, "META-INF/"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string/jumbo v6, ".SF"

    invoke-virtual {v0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v6

    if-eqz v6, :cond_0

    .line 102
    invoke-static {v3}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    move v8, v7

    .end local v0    # "eName":Ljava/lang/String;
    .end local v1    # "entries":Ljava/util/Enumeration;
    :goto_0
    return v8

    .restart local v1    # "entries":Ljava/util/Enumeration;
    :cond_1
    invoke-static {v3}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    goto :goto_0

    .line 88
    .end local v1    # "entries":Ljava/util/Enumeration;
    :cond_2
    :try_start_2
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->replaceInvalidChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 89
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "META-INF/"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v9, ".SF"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v6

    if-eqz v6, :cond_6

    move v5, v7

    .line 92
    .local v5, "shortSig":Z
    :goto_1
    const/4 v4, 0x0

    .line 93
    .local v4, "longSig":Z
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v10, :cond_3

    .line 94
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "META-INF/"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const/4 v9, 0x0

    const/16 v10, 0x8

    invoke-virtual {p1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v9, ".SF"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v6

    if-eqz v6, :cond_7

    move v4, v7

    .line 100
    :cond_3
    :goto_2
    if-nez v5, :cond_4

    if-eqz v4, :cond_5

    :cond_4
    move v8, v7

    .line 102
    :cond_5
    invoke-static {v3}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    goto :goto_0

    .end local v4    # "longSig":Z
    .end local v5    # "shortSig":Z
    :cond_6
    move v5, v8

    .line 89
    goto :goto_1

    .restart local v4    # "longSig":Z
    .restart local v5    # "shortSig":Z
    :cond_7
    move v4, v8

    .line 94
    goto :goto_2

    .line 102
    .end local v3    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    .end local v4    # "longSig":Z
    .end local v5    # "shortSig":Z
    .restart local v2    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    :catchall_0
    move-exception v6

    :goto_3
    invoke-static {v2}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    throw v6

    .end local v2    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    .restart local v3    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    :catchall_1
    move-exception v6

    move-object v2, v3

    .end local v3    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    .restart local v2    # "jarFile":Lorg/apache/tools/zip/ZipFile;
    goto :goto_3
.end method

.method private static replaceInvalidChars(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 138
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 139
    .local v4, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 140
    .local v3, "len":I
    const/4 v1, 0x0

    .line 141
    .local v1, "changes":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 142
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 143
    .local v0, "ch":C
    const-string/jumbo v5, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"

    invoke-virtual {v5, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_0

    .line 144
    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    const/4 v1, 0x1

    .line 141
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 147
    :cond_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 150
    .end local v0    # "ch":C
    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0    # "name":Ljava/lang/String;
    :cond_2
    return-object p0
.end method


# virtual methods
.method public eval()Z
    .locals 5

    .prologue
    const/4 v4, 0x3

    .line 113
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    if-nez v2, :cond_0

    .line 114
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The file attribute must be set."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 116
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 117
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The file \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" does not exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->log(Ljava/lang/String;I)V

    .line 119
    const/4 v1, 0x0

    .line 134
    :cond_1
    :goto_0
    return v1

    .line 122
    :cond_2
    const/4 v1, 0x0

    .line 124
    .local v1, "r":Z
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->isSigned(Ljava/io/File;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 130
    :goto_1
    if-eqz v1, :cond_1

    .line 131
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "File \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" is signed."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Got IOException reading file \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->file:Ljava/io/File;

    .line 53
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->name:Ljava/lang/String;

    .line 61
    return-void
.end method
