.class public Lorg/apache/tools/ant/types/FilterSet;
.super Lorg/apache/tools/ant/types/DataType;
.source "FilterSet.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/FilterSet$OnMissing;,
        Lorg/apache/tools/ant/types/FilterSet$FiltersFile;,
        Lorg/apache/tools/ant/types/FilterSet$Filter;
    }
.end annotation


# static fields
.field public static final DEFAULT_TOKEN_END:Ljava/lang/String; = "@"

.field public static final DEFAULT_TOKEN_START:Ljava/lang/String; = "@"

.field static class$org$apache$tools$ant$types$FilterSet:Ljava/lang/Class;


# instance fields
.field private duplicateToken:Z

.field private endOfToken:Ljava/lang/String;

.field private filterHash:Ljava/util/Hashtable;

.field private filters:Ljava/util/Vector;

.field private filtersFiles:Ljava/util/Vector;

.field private onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

.field private passedTokens:Ljava/util/Vector;

.field private readingFiles:Z

.field private recurse:Z

.field private recurseDepth:I

.field private startOfToken:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 200
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 176
    const-string/jumbo v0, "@"

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->startOfToken:Ljava/lang/String;

    .line 177
    const-string/jumbo v0, "@"

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->endOfToken:Ljava/lang/String;

    .line 182
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/FilterSet;->recurse:Z

    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;

    .line 186
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    .line 187
    sget-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->FAIL:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .line 188
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/FilterSet;->readingFiles:Z

    .line 190
    iput v1, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    .line 195
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;

    .line 201
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FilterSet;)V
    .locals 2
    .param p1, "filterset"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    const/4 v1, 0x0

    .line 209
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 176
    const-string/jumbo v0, "@"

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->startOfToken:Ljava/lang/String;

    .line 177
    const-string/jumbo v0, "@"

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->endOfToken:Ljava/lang/String;

    .line 182
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/FilterSet;->recurse:Z

    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;

    .line 186
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    .line 187
    sget-object v0, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->FAIL:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .line 188
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/FilterSet;->readingFiles:Z

    .line 190
    iput v1, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    .line 195
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;

    .line 210
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;

    .line 211
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/types/FilterSet;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 242
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private handleMissingFile(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 616
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FilterSet$OnMissing;->getIndex()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 625
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Invalid value for onMissingFiltersFile"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 620
    :pswitch_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 622
    :pswitch_1
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/types/FilterSet;->log(Ljava/lang/String;I)V

    .line 623
    :pswitch_2
    return-void

    .line 616
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private declared-synchronized iReplaceTokens(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v12, -0x1

    .line 513
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getBeginToken()Ljava/lang/String;

    move-result-object v1

    .line 514
    .local v1, "beginToken":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getEndToken()Ljava/lang/String;

    move-result-object v4

    .line 515
    .local v4, "endToken":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 517
    .local v6, "index":I
    if-le v6, v12, :cond_1

    .line 518
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilterHash()Ljava/util/Hashtable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 520
    .local v8, "tokens":Ljava/util/Hashtable;
    :try_start_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 521
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 522
    .local v5, "i":I
    const/4 v7, 0x0

    .line 523
    .local v7, "token":Ljava/lang/String;
    const/4 v9, 0x0

    .line 525
    .local v9, "value":Ljava/lang/String;
    :goto_0
    if-le v6, v12, :cond_0

    .line 527
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v10, v6

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {p1, v4, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 529
    .local v3, "endIndex":I
    if-ne v3, v12, :cond_2

    .line 558
    .end local v3    # "endIndex":I
    :cond_0
    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 559
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object p1

    .line 564
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v5    # "i":I
    .end local v7    # "token":Ljava/lang/String;
    .end local v8    # "tokens":Ljava/util/Hashtable;
    .end local v9    # "value":Ljava/lang/String;
    .end local p1    # "line":Ljava/lang/String;
    :cond_1
    :goto_1
    monitor-exit p0

    return-object p1

    .line 532
    .restart local v0    # "b":Ljava/lang/StringBuffer;
    .restart local v3    # "endIndex":I
    .restart local v5    # "i":I
    .restart local v7    # "token":Ljava/lang/String;
    .restart local v8    # "tokens":Ljava/util/Hashtable;
    .restart local v9    # "value":Ljava/lang/String;
    .restart local p1    # "line":Ljava/lang/String;
    :cond_2
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v10, v6

    invoke-virtual {p1, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 534
    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 535
    invoke-virtual {v8, v7}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 536
    invoke-virtual {v8, v7}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "value":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 537
    .restart local v9    # "value":Ljava/lang/String;
    iget-boolean v10, p0, Lorg/apache/tools/ant/types/FilterSet;->recurse:Z

    if-eqz v10, :cond_3

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 539
    invoke-direct {p0, v9, v7}, Lorg/apache/tools/ant/types/FilterSet;->replaceTokens(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 541
    :cond_3
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Replacing: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " -> "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/types/FilterSet;->log(Ljava/lang/String;I)V

    .line 543
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 544
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v10, v6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v10, v11

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v11

    add-int v5, v10, v11

    .line 555
    :goto_2
    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_0

    .line 552
    :cond_4
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 553
    add-int/lit8 v5, v6, 0x1

    goto :goto_2

    .line 560
    .end local v0    # "b":Ljava/lang/StringBuffer;
    .end local v3    # "endIndex":I
    .end local v5    # "i":I
    .end local v7    # "token":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 561
    .local v2, "e":Ljava/lang/StringIndexOutOfBoundsException;
    goto :goto_1

    .line 513
    .end local v1    # "beginToken":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/StringIndexOutOfBoundsException;
    .end local v4    # "endToken":Ljava/lang/String;
    .end local v6    # "index":I
    .end local v8    # "tokens":Ljava/util/Hashtable;
    :catchall_0
    move-exception v10

    monitor-exit p0

    throw v10
.end method

.method private declared-synchronized replaceTokens(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "parent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 577
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getBeginToken()Ljava/lang/String;

    move-result-object v0

    .line 578
    .local v0, "beginToken":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getEndToken()Ljava/lang/String;

    move-result-object v1

    .line 579
    .local v1, "endToken":Ljava/lang/String;
    iget v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    if-nez v3, :cond_0

    .line 580
    new-instance v3, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v3}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    .line 582
    :cond_0
    iget v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    .line 583
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v3, p2}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    if-nez v3, :cond_1

    .line 584
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    .line 585
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Infinite loop in tokens. Currently known tokens : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\nProblem token : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " called from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 590
    iget v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 612
    .end local p2    # "parent":Ljava/lang/String;
    :goto_0
    monitor-exit p0

    return-object p2

    .line 593
    .restart local p2    # "parent":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v3, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 594
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FilterSet;->iReplaceTokens(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 595
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_3

    iget-boolean v3, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    if-nez v3, :cond_3

    iget v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    if-ne v3, v5, :cond_3

    .line 597
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    .line 611
    :cond_2
    :goto_1
    iget v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/tools/ant/types/FilterSet;->recurseDepth:I

    move-object p2, v2

    .line 612
    goto :goto_0

    .line 598
    :cond_3
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z

    if-eqz v3, :cond_4

    .line 600
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 601
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "value":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 602
    .restart local v2    # "value":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 603
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 604
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/tools/ant/types/FilterSet;->duplicateToken:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 577
    .end local v0    # "beginToken":Ljava/lang/String;
    .end local v1    # "endToken":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 607
    .restart local v0    # "beginToken":Ljava/lang/String;
    .restart local v1    # "endToken":Ljava/lang/String;
    .restart local v2    # "value":Ljava/lang/String;
    :cond_4
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 609
    iget-object v3, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/types/FilterSet;->passedTokens:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized addConfiguredFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V
    .locals 2
    .param p1, "filterSet"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    .line 450
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 451
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 450
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 453
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 454
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet$Filter;

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/FilterSet;->addFilter(Lorg/apache/tools/ant/types/FilterSet$Filter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 456
    :cond_1
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized addFilter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 438
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 439
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 438
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 441
    :cond_0
    :try_start_1
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet$Filter;

    invoke-direct {v0, p1, p2}, Lorg/apache/tools/ant/types/FilterSet$Filter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterSet;->addFilter(Lorg/apache/tools/ant/types/FilterSet$Filter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 442
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized addFilter(Lorg/apache/tools/ant/types/FilterSet$Filter;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/types/FilterSet$Filter;

    .prologue
    .line 412
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 413
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 412
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 415
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 416
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 417
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized clone()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 475
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 476
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getRef()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/FilterSet;->clone()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 482
    :goto_0
    monitor-exit p0

    return-object v1

    .line 479
    :cond_0
    :try_start_1
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet;

    .line 480
    .local v1, "fs":Lorg/apache/tools/ant/types/FilterSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v1, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;

    .line 481
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/FilterSet;->setProject(Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 483
    .end local v1    # "fs":Lorg/apache/tools/ant/types/FilterSet;
    :catch_0
    move-exception v0

    .line 484
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 475
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public createFiltersfile()Lorg/apache/tools/ant/types/FilterSet$FiltersFile;
    .locals 1

    .prologue
    .line 425
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 426
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 428
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet$FiltersFile;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/FilterSet$FiltersFile;-><init>(Lorg/apache/tools/ant/types/FilterSet;)V

    return-object v0
.end method

.method public getBeginToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getRef()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FilterSet;->getBeginToken()Ljava/lang/String;

    move-result-object v0

    .line 303
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->startOfToken:Ljava/lang/String;

    goto :goto_0
.end method

.method public getEndToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 327
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 328
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getRef()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FilterSet;->getEndToken()Ljava/lang/String;

    move-result-object v0

    .line 330
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->endOfToken:Ljava/lang/String;

    goto :goto_0
.end method

.method public declared-synchronized getFilterHash()Ljava/util/Hashtable;
    .locals 5

    .prologue
    .line 251
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 252
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getRef()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/FilterSet;->getFilterHash()Ljava/util/Hashtable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 262
    :goto_0
    monitor-exit p0

    return-object v2

    .line 254
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->dieOnCircularReference()V

    .line 255
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;

    if-nez v2, :cond_1

    .line 256
    new-instance v2, Ljava/util/Hashtable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;

    .line 257
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 258
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet$Filter;

    .line 259
    .local v1, "filter":Lorg/apache/tools/ant/types/FilterSet$Filter;
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FilterSet$Filter;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FilterSet$Filter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 251
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "filter":Lorg/apache/tools/ant/types/FilterSet$Filter;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 262
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected declared-synchronized getFilters()Ljava/util/Vector;
    .locals 3

    .prologue
    .line 219
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getRef()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 233
    :goto_0
    monitor-exit p0

    return-object v2

    .line 222
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->dieOnCircularReference()V

    .line 224
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/FilterSet;->readingFiles:Z

    if-nez v2, :cond_2

    .line 225
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/FilterSet;->readingFiles:Z

    .line 226
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v1

    .line 227
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 228
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/FilterSet;->readFiltersFromFile(Ljava/io/File;)V

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 230
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clear()V

    .line 231
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/FilterSet;->readingFiles:Z

    .line 233
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterSet;->filters:Ljava/util/Vector;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 219
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getOnMissingFiltersFile()Lorg/apache/tools/ant/types/FilterSet$OnMissing;
    .locals 1

    .prologue
    .line 501
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    return-object v0
.end method

.method protected getRef()Lorg/apache/tools/ant/types/FilterSet;
    .locals 2

    .prologue
    .line 242
    sget-object v0, Lorg/apache/tools/ant/types/FilterSet;->class$org$apache$tools$ant$types$FilterSet:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.types.FilterSet"

    invoke-static {v0}, Lorg/apache/tools/ant/types/FilterSet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/FilterSet;->class$org$apache$tools$ant$types$FilterSet:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v1, "filterset"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/FilterSet;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FilterSet;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/FilterSet;->class$org$apache$tools$ant$types$FilterSet:Ljava/lang/Class;

    goto :goto_0
.end method

.method public declared-synchronized hasFilters()Z
    .locals 1

    .prologue
    .line 464
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isRecurse()Z
    .locals 1

    .prologue
    .line 346
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/FilterSet;->recurse:Z

    return v0
.end method

.method public declared-synchronized readFiltersFromFile(Ljava/io/File;)V
    .locals 11
    .param p1, "filtersFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 356
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 357
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v8

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 356
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 359
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1

    .line 360
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not read filters from file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " as it doesn\'t exist."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/apache/tools/ant/types/FilterSet;->handleMissingFile(Ljava/lang/String;)V

    .line 363
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 364
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Reading filters from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/types/FilterSet;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    const/4 v3, 0x0

    .line 367
    .local v3, "in":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v5, Ljava/util/Properties;

    invoke-direct {v5}, Ljava/util/Properties;-><init>()V

    .line 368
    .local v5, "props":Ljava/util/Properties;
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 369
    .end local v3    # "in":Ljava/io/FileInputStream;
    .local v4, "in":Ljava/io/FileInputStream;
    :try_start_3
    invoke-virtual {v5, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 371
    invoke-virtual {v5}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 372
    .local v0, "e":Ljava/util/Enumeration;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->getFilters()Ljava/util/Vector;

    move-result-object v2

    .line 373
    .local v2, "filts":Ljava/util/Vector;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 374
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 375
    .local v6, "strPropName":Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 376
    .local v7, "strValue":Ljava/lang/String;
    new-instance v8, Lorg/apache/tools/ant/types/FilterSet$Filter;

    invoke-direct {v8, v6, v7}, Lorg/apache/tools/ant/types/FilterSet$Filter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_0

    .line 378
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "filts":Ljava/util/Vector;
    .end local v6    # "strPropName":Ljava/lang/String;
    .end local v7    # "strValue":Ljava/lang/String;
    :catch_0
    move-exception v1

    move-object v3, v4

    .line 379
    .end local v4    # "in":Ljava/io/FileInputStream;
    .end local v5    # "props":Ljava/util/Properties;
    .local v1, "ex":Ljava/lang/Exception;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    :goto_1
    :try_start_4
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Could not read filters from file: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 382
    .end local v1    # "ex":Ljava/lang/Exception;
    :catchall_1
    move-exception v8

    :goto_2
    :try_start_5
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v8

    .end local v3    # "in":Ljava/io/FileInputStream;
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v2    # "filts":Ljava/util/Vector;
    .restart local v4    # "in":Ljava/io/FileInputStream;
    .restart local v5    # "props":Ljava/util/Properties;
    :cond_2
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 389
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "filts":Ljava/util/Vector;
    .end local v4    # "in":Ljava/io/FileInputStream;
    .end local v5    # "props":Ljava/util/Properties;
    :goto_3
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/apache/tools/ant/types/FilterSet;->filterHash:Ljava/util/Hashtable;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 390
    monitor-exit p0

    return-void

    .line 385
    :cond_3
    :try_start_6
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Must specify a file rather than a directory in the filtersfile attribute:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/apache/tools/ant/types/FilterSet;->handleMissingFile(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    .line 382
    .restart local v4    # "in":Ljava/io/FileInputStream;
    .restart local v5    # "props":Ljava/util/Properties;
    :catchall_2
    move-exception v8

    move-object v3, v4

    .end local v4    # "in":Ljava/io/FileInputStream;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    goto :goto_2

    .line 378
    .end local v5    # "props":Ljava/util/Properties;
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public declared-synchronized replaceTokens(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 403
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FilterSet;->iReplaceTokens(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setBeginToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "startOfToken"    # Ljava/lang/String;

    .prologue
    .line 285
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 288
    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 289
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "beginToken must not be empty"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 291
    :cond_2
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet;->startOfToken:Ljava/lang/String;

    .line 292
    return-void
.end method

.method public setEndToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "endOfToken"    # Ljava/lang/String;

    .prologue
    .line 312
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 313
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 315
    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 316
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "endToken must not be empty"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_2
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet;->endOfToken:Ljava/lang/String;

    .line 319
    return-void
.end method

.method public setFiltersfile(Ljava/io/File;)V
    .locals 1
    .param p1, "filtersFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 276
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet;->filtersFiles:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 277
    return-void
.end method

.method public setOnMissingFiltersFile(Lorg/apache/tools/ant/types/FilterSet$OnMissing;)V
    .locals 0
    .param p1, "onMissingFiltersFile"    # Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .prologue
    .line 493
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet;->onMissingFiltersFile:Lorg/apache/tools/ant/types/FilterSet$OnMissing;

    .line 494
    return-void
.end method

.method public setRecurse(Z)V
    .locals 0
    .param p1, "recurse"    # Z

    .prologue
    .line 338
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/FilterSet;->recurse:Z

    .line 339
    return-void
.end method
