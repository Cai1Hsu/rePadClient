.class public Lorg/apache/tools/ant/types/resources/FileResourceIterator;
.super Ljava/lang/Object;
.source "FileResourceIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private basedir:Ljava/io/File;

.field private files:[Ljava/lang/String;

.field private pos:I

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->pos:I

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/File;[Ljava/lang/String;)V
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filenames"    # [Ljava/lang/String;

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->pos:I

    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->project:Lorg/apache/tools/ant/Project;

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "basedir"    # Ljava/io/File;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 71
    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->basedir:Ljava/io/File;

    .line 72
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "basedir"    # Ljava/io/File;
    .param p3, "filenames"    # [Ljava/lang/String;

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    .line 95
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->addFiles([Ljava/lang/String;)V

    .line 96
    return-void
.end method


# virtual methods
.method public addFiles([Ljava/lang/String;)V
    .locals 5
    .param p1, "s"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 103
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    if-nez v3, :cond_1

    move v1, v2

    .line 104
    .local v1, "start":I
    :goto_0
    array-length v3, p1

    add-int/2addr v3, v1

    new-array v0, v3, [Ljava/lang/String;

    .line 105
    .local v0, "newfiles":[Ljava/lang/String;
    if-lez v1, :cond_0

    .line 106
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    :cond_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    .line 109
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    array-length v4, p1

    invoke-static {p1, v2, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    return-void

    .line 103
    .end local v0    # "newfiles":[Ljava/lang/String;
    .end local v1    # "start":I
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    array-length v1, v3

    goto :goto_0
.end method

.method public hasNext()Z
    .locals 2

    .prologue
    .line 117
    iget v0, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->pos:I

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->nextResource()Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v0

    return-object v0
.end method

.method public nextResource()Lorg/apache/tools/ant/types/resources/FileResource;
    .locals 5

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 141
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 143
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->basedir:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->files:[Ljava/lang/String;

    iget v3, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->pos:I

    aget-object v2, v2, v3

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 144
    .local v0, "result":Lorg/apache/tools/ant/types/resources/FileResource;
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 145
    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 132
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
