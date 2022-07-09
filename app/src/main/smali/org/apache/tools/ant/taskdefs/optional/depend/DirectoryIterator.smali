.class public Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;
.super Ljava/lang/Object;
.source "DirectoryIterator.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileIterator;


# instance fields
.field private currentEnum:Ljava/util/Enumeration;

.field private enumStack:Ljava/util/Stack;


# direct methods
.method public constructor <init>(Ljava/io/File;Z)V
    .locals 2
    .param p1, "rootDirectory"    # Ljava/io/File;
    .param p2, "changeInto"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->enumStack:Ljava/util/Stack;

    .line 69
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->getDirectoryEntries(Ljava/io/File;)Ljava/util/Vector;

    move-result-object v0

    .line 71
    .local v0, "filesInRoot":Ljava/util/Vector;
    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;

    .line 72
    return-void
.end method

.method private getDirectoryEntries(Ljava/io/File;)Ljava/util/Vector;
    .locals 6
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 83
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 86
    .local v0, "files":Ljava/util/Vector;
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "filesInDir":[Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 89
    array-length v3, v1

    .line 91
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 92
    new-instance v4, Ljava/io/File;

    aget-object v5, v1, v2

    invoke-direct {v4, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 96
    .end local v2    # "i":I
    .end local v3    # "length":I
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getNextClassFile()Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    .locals 8

    .prologue
    .line 114
    const/4 v5, 0x0

    .line 117
    .local v5, "nextElement":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    :cond_0
    :goto_0
    if-nez v5, :cond_1

    .line 118
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;

    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 119
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;

    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 121
    .local v1, "element":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 125
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->enumStack:Ljava/util/Stack;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;

    invoke-virtual {v6, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->getDirectoryEntries(Ljava/io/File;)Ljava/util/Vector;

    move-result-object v2

    .line 129
    .local v2, "files":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;

    goto :goto_0

    .line 156
    .end local v1    # "element":Ljava/io/File;
    .end local v2    # "files":Ljava/util/Vector;
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Ljava/io/IOException;
    const/4 v5, 0x0

    .line 160
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    return-object v5

    .line 133
    .restart local v1    # "element":Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 136
    .local v3, "inFileStream":Ljava/io/FileInputStream;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".class"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 140
    new-instance v4, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;

    invoke-direct {v4}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;-><init>()V

    .line 142
    .local v4, "javaClass":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->read(Ljava/io/InputStream;)V

    .line 144
    move-object v5, v4

    goto :goto_0

    .line 149
    .end local v1    # "element":Ljava/io/File;
    .end local v3    # "inFileStream":Ljava/io/FileInputStream;
    .end local v4    # "javaClass":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->enumStack:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->empty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 152
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->enumStack:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Enumeration;

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator;->currentEnum:Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method
