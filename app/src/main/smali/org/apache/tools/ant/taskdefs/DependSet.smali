.class public Lorg/apache/tools/ant/taskdefs/DependSet;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "DependSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/DependSet$1;,
        Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;,
        Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;
    }
.end annotation


# static fields
.field private static final DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

.field private static final NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

.field private static final REVERSE_DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;


# instance fields
.field private sources:Lorg/apache/tools/ant/types/resources/Union;

.field private targets:Lorg/apache/tools/ant/types/Path;

.field private verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 85
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Not;

    new-instance v1, Lorg/apache/tools/ant/types/resources/selectors/Exists;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/selectors/Exists;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Not;-><init>(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .line 86
    new-instance v0, Lorg/apache/tools/ant/types/resources/comparators/Date;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/comparators/Date;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .line 88
    new-instance v0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/DependSet;->DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;-><init>(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->REVERSE_DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 120
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    .line 121
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    return-void
.end method

.method static access$000()Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;
    .locals 1

    .prologue
    .line 83
    sget-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->NOT_EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    return-object v0
.end method

.method private getNewest(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/Resource;
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 281
    sget-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/DependSet;->getXest(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    return-object v0
.end method

.method private getOldest(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/Resource;
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 277
    sget-object v0, Lorg/apache/tools/ant/taskdefs/DependSet;->REVERSE_DATE:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/DependSet;->getXest(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    return-object v0
.end method

.method private getXest(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)Lorg/apache/tools/ant/types/Resource;
    .locals 4
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 261
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 262
    .local v0, "i":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 263
    const/4 v2, 0x0

    .line 273
    :cond_0
    return-object v2

    .line 266
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 267
    .local v2, "xest":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 268
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 269
    .local v1, "next":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p2, v2, v1}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-gez v3, :cond_2

    .line 270
    move-object v2, v1

    goto :goto_0
.end method

.method private logFuture(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 4
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "rsel"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 252
    new-instance v1, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 253
    .local v1, "r":Lorg/apache/tools/ant/types/resources/Restrict;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 254
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 255
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Restrict;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 256
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Warning: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " modified in the future."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 258
    :cond_0
    return-void
.end method

.method private logMissing(Lorg/apache/tools/ant/types/ResourceCollection;Ljava/lang/String;)V
    .locals 4
    .param p1, "missing"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "what"    # Ljava/lang/String;

    .prologue
    .line 291
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->verbose:Z

    if-eqz v2, :cond_0

    .line 292
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 293
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 294
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is missing."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 298
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_0
    return-void
.end method

.method private logWithModificationTime(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;)V
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "what"    # Ljava/lang/String;

    .prologue
    .line 285
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ", modified at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->verbose:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;I)V

    .line 288
    return-void

    .line 285
    :cond_0
    const/4 v0, 0x3

    goto :goto_0
.end method

.method private uptodate(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/ResourceCollection;)Z
    .locals 12
    .param p1, "src"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "target"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x3

    const/4 v7, 0x0

    .line 218
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Date;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/selectors/Date;-><init>()V

    .line 220
    .local v0, "datesel":Lorg/apache/tools/ant/types/resources/selectors/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setMillis(J)V

    .line 221
    sget-object v8, Lorg/apache/tools/ant/types/TimeComparison;->AFTER:Lorg/apache/tools/ant/types/TimeComparison;

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V

    .line 224
    const-wide/16 v8, 0x0

    invoke-virtual {v0, v8, v9}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setGranularity(J)V

    .line 225
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, v8, v0}, Lorg/apache/tools/ant/taskdefs/DependSet;->logFuture(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 227
    new-instance v2, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-direct {v2, v8, v11}, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/DependSet$1;)V

    .line 228
    .local v2, "missingTargets":Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;->size()I

    move-result v4

    .line 229
    .local v4, "neTargets":I
    if-lez v4, :cond_1

    .line 230
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " nonexistent targets"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;I)V

    .line 231
    const-string/jumbo v8, "target"

    invoke-direct {p0, v2, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->logMissing(Lorg/apache/tools/ant/types/ResourceCollection;Ljava/lang/String;)V

    .line 248
    :cond_0
    :goto_0
    return v7

    .line 234
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->getOldest(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v6

    .line 235
    .local v6, "oldestTarget":Lorg/apache/tools/ant/types/Resource;
    const-string/jumbo v8, "oldest target file"

    invoke-direct {p0, v6, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->logWithModificationTime(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;)V

    .line 237
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {p0, v8, v0}, Lorg/apache/tools/ant/taskdefs/DependSet;->logFuture(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 239
    new-instance v1, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v1, v8, v11}, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/DependSet$1;)V

    .line 240
    .local v1, "missingSources":Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;->size()I

    move-result v3

    .line 241
    .local v3, "neSources":I
    if-lez v3, :cond_2

    .line 242
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " nonexistent sources"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;I)V

    .line 243
    const-string/jumbo v8, "source"

    invoke-direct {p0, v1, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->logMissing(Lorg/apache/tools/ant/types/ResourceCollection;Ljava/lang/String;)V

    goto :goto_0

    .line 246
    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {p0, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->getNewest(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    .line 247
    .local v5, "newestSource":Lorg/apache/tools/ant/types/Resource;
    const-string/jumbo v8, "newest source"

    invoke-direct {p0, v5, v8}, Lorg/apache/tools/ant/taskdefs/DependSet;->logWithModificationTime(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;)V

    .line 248
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v8

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-ltz v8, :cond_0

    const/4 v7, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addSrcfilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 1
    .param p1, "fl"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DependSet;->createSources()Lorg/apache/tools/ant/types/resources/Union;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 148
    return-void
.end method

.method public addSrcfileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DependSet;->createSources()Lorg/apache/tools/ant/types/resources/Union;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 140
    return-void
.end method

.method public addTargetfilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 1
    .param p1, "fl"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 172
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DependSet;->createTargets()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 173
    return-void
.end method

.method public addTargetfileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 3
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DependSet;->createTargets()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    new-instance v1, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;-><init>(Lorg/apache/tools/ant/types/FileSet;Lorg/apache/tools/ant/taskdefs/DependSet$1;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 165
    return-void
.end method

.method public declared-synchronized createSources()Lorg/apache/tools/ant/types/resources/Union;
    .locals 1

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    .line 131
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 130
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createTargets()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DependSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    .line 156
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 155
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 193
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v3, :cond_0

    .line 194
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "At least one set of source resources must be specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 197
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    if-nez v3, :cond_1

    .line 198
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "At least one set of target files must be specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 202
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v3

    if-lez v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v3

    if-lez v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->sources:Lorg/apache/tools/ant/types/resources/Union;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/DependSet;->uptodate(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 203
    const-string/jumbo v3, "Deleting all target files."

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;I)V

    .line 204
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->verbose:Z

    if-eqz v3, :cond_2

    .line 205
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 206
    .local v2, "t":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 207
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Deleting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/DependSet;->log(Ljava/lang/String;)V

    .line 206
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 210
    .end local v1    # "i":I
    .end local v2    # "t":[Ljava/lang/String;
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Delete;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Delete;-><init>()V

    .line 211
    .local v0, "delete":Lorg/apache/tools/ant/taskdefs/Delete;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/taskdefs/Delete;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 212
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->targets:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Delete;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 213
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Delete;->perform()V

    .line 215
    .end local v0    # "delete":Lorg/apache/tools/ant/taskdefs/Delete;
    :cond_3
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 185
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/DependSet;->verbose:Z

    .line 186
    return-void
.end method
