.class public Lorg/apache/commons/compress/changes/ChangeSetPerformer;
.super Ljava/lang/Object;
.source "ChangeSetPerformer.java"


# instance fields
.field private final changes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/changes/Change;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/commons/compress/changes/ChangeSet;)V
    .locals 1
    .param p1, "changeSet"    # Lorg/apache/commons/compress/changes/ChangeSet;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-virtual {p1}, Lorg/apache/commons/compress/changes/ChangeSet;->getChanges()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->changes:Ljava/util/Set;

    .line 50
    return-void
.end method

.method private copyStream(Ljava/io/InputStream;Lorg/apache/commons/compress/archivers/ArchiveOutputStream;Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
    .param p3, "entry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-virtual {p2, p3}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;->putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 176
    invoke-static {p1, p2}, Lorg/apache/commons/compress/utils/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 177
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;->closeArchiveEntry()V

    .line 178
    return-void
.end method

.method private isDeletedLater(Ljava/util/Set;Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z
    .locals 8
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/changes/Change;",
            ">;",
            "Lorg/apache/commons/compress/archivers/ArchiveEntry;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "workingSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/apache/commons/compress/changes/Change;>;"
    const/4 v5, 0x1

    .line 143
    invoke-interface {p2}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 145
    .local v2, "source":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 146
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 147
    .local v0, "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v4

    .line 148
    .local v4, "type":I
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->targetFile()Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "target":Ljava/lang/String;
    if-ne v4, v5, :cond_1

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 158
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "target":Ljava/lang/String;
    .end local v4    # "type":I
    :goto_0
    return v5

    .line 153
    .restart local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "target":Ljava/lang/String;
    .restart local v4    # "type":I
    :cond_1
    const/4 v6, 0x4

    if-ne v4, v6, :cond_0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_0

    .line 158
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "target":Ljava/lang/String;
    .end local v4    # "type":I
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method


# virtual methods
.method public perform(Lorg/apache/commons/compress/archivers/ArchiveInputStream;Lorg/apache/commons/compress/archivers/ArchiveOutputStream;)Lorg/apache/commons/compress/changes/ChangeSetResults;
    .locals 11
    .param p1, "in"    # Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    .param p2, "out"    # Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    .line 69
    new-instance v5, Lorg/apache/commons/compress/changes/ChangeSetResults;

    invoke-direct {v5}, Lorg/apache/commons/compress/changes/ChangeSetResults;-><init>()V

    .line 71
    .local v5, "results":Lorg/apache/commons/compress/changes/ChangeSetResults;
    new-instance v7, Ljava/util/LinkedHashSet;

    iget-object v8, p0, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->changes:Ljava/util/Set;

    invoke-direct {v7, v8}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 73
    .local v7, "workingSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/apache/commons/compress/changes/Change;>;"
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/commons/compress/changes/Change;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 74
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 76
    .local v0, "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v8

    if-ne v8, v10, :cond_0

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->isReplaceMode()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 77
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getInput()Ljava/io/InputStream;

    move-result-object v8

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v9

    invoke-direct {p0, v8, p2, v9}, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->copyStream(Ljava/io/InputStream;Lorg/apache/commons/compress/archivers/ArchiveOutputStream;Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 78
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 79
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/commons/compress/changes/ChangeSetResults;->addedFromChangeSet(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    :cond_1
    const/4 v2, 0x0

    .line 84
    .local v2, "entry":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 85
    const/4 v1, 0x1

    .line 87
    .local v1, "copy":Z
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 90
    .restart local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v6

    .line 91
    .local v6, "type":I
    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "name":Ljava/lang/String;
    const/4 v8, 0x1

    if-ne v6, v8, :cond_5

    if-eqz v4, :cond_5

    .line 93
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->targetFile()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 94
    const/4 v1, 0x0

    .line 95
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 96
    invoke-virtual {v5, v4}, Lorg/apache/commons/compress/changes/ChangeSetResults;->deleted(Ljava/lang/String;)V

    .line 109
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "type":I
    :cond_4
    :goto_2
    if-eqz v1, :cond_2

    invoke-direct {p0, v7, v2}, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->isDeletedLater(Ljava/util/Set;Lorg/apache/commons/compress/archivers/ArchiveEntry;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/commons/compress/changes/ChangeSetResults;->hasBeenAdded(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 112
    invoke-direct {p0, p1, p2, v2}, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->copyStream(Ljava/io/InputStream;Lorg/apache/commons/compress/archivers/ArchiveOutputStream;Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 113
    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/commons/compress/changes/ChangeSetResults;->addedFromStream(Ljava/lang/String;)V

    goto :goto_1

    .line 99
    .restart local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v6    # "type":I
    :cond_5
    const/4 v8, 0x4

    if-ne v6, v8, :cond_3

    if-eqz v4, :cond_3

    .line 101
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->targetFile()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 102
    const/4 v1, 0x0

    .line 103
    invoke-virtual {v5, v4}, Lorg/apache/commons/compress/changes/ChangeSetResults;->deleted(Ljava/lang/String;)V

    goto :goto_2

    .line 118
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    .end local v1    # "copy":Z
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "type":I
    :cond_6
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 119
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/changes/Change;

    .line 121
    .restart local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->type()I

    move-result v8

    if-ne v8, v10, :cond_7

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->isReplaceMode()Z

    move-result v8

    if-nez v8, :cond_7

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/commons/compress/changes/ChangeSetResults;->hasBeenAdded(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 124
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getInput()Ljava/io/InputStream;

    move-result-object v8

    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v9

    invoke-direct {p0, v8, p2, v9}, Lorg/apache/commons/compress/changes/ChangeSetPerformer;->copyStream(Ljava/io/InputStream;Lorg/apache/commons/compress/archivers/ArchiveOutputStream;Lorg/apache/commons/compress/archivers/ArchiveEntry;)V

    .line 125
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 126
    invoke-virtual {v0}, Lorg/apache/commons/compress/changes/Change;->getEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/commons/compress/changes/ChangeSetResults;->addedFromChangeSet(Ljava/lang/String;)V

    goto :goto_3

    .line 129
    .end local v0    # "change":Lorg/apache/commons/compress/changes/Change;
    :cond_8
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;->finish()V

    .line 130
    return-object v5
.end method
