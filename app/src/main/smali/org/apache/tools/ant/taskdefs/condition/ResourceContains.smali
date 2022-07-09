.class public Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;
.super Ljava/lang/Object;
.source "ResourceContains.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private casesensitive:Z

.field private project:Lorg/apache/tools/ant/Project;

.field private refid:Ljava/lang/String;

.field private resource:Lorg/apache/tools/ant/types/Resource;

.field private substring:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->casesensitive:Z

    return-void
.end method

.method private resolveRefid()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 80
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    if-nez v3, :cond_0

    .line 81
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot retrieve refid; project unset"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    :catchall_0
    move-exception v3

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    throw v3

    .line 83
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 84
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/types/Resource;

    if-nez v3, :cond_1

    .line 85
    instance-of v3, v1, Lorg/apache/tools/ant/types/ResourceCollection;

    if-eqz v3, :cond_2

    .line 86
    move-object v0, v1

    check-cast v0, Lorg/apache/tools/ant/types/ResourceCollection;

    move-object v2, v0

    .line 87
    .local v2, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 88
    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 95
    .end local v2    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_1
    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .end local v1    # "o":Ljava/lang/Object;
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    .line 99
    return-void

    .line 91
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_2
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Illegal value at \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\': "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method private validate()V
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 119
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot set both resource and refid"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 122
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resolveRefid()V

    .line 124
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->substring:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 125
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "both resource and substring are required in <resourcecontains>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_3
    return-void
.end method


# virtual methods
.method public declared-synchronized eval()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 136
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->validate()V

    .line 138
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->substring:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 140
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    const-string/jumbo v7, "Substring is empty; returning true"

    const/4 v8, 0x3

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    :cond_0
    :goto_0
    monitor-exit p0

    return v5

    .line 145
    :cond_1
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Resource;->getSize()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-nez v7, :cond_2

    move v5, v6

    .line 146
    goto :goto_0

    .line 149
    :cond_2
    const/4 v2, 0x0

    .line 151
    .local v2, "reader":Ljava/io/BufferedReader;
    :try_start_2
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 152
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .local v3, "reader":Ljava/io/BufferedReader;
    :try_start_3
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->safeReadFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "contents":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->substring:Ljava/lang/String;

    .line 154
    .local v4, "sub":Ljava/lang/String;
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->casesensitive:Z

    if-nez v7, :cond_3

    .line 155
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 156
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 158
    :cond_3
    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result v7

    if-ltz v7, :cond_4

    .line 162
    :goto_1
    :try_start_4
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 136
    .end local v0    # "contents":Ljava/lang/String;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .end local v4    # "sub":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .restart local v0    # "contents":Ljava/lang/String;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "sub":Ljava/lang/String;
    :cond_4
    move v5, v6

    .line 158
    goto :goto_1

    .line 159
    .end local v0    # "contents":Ljava/lang/String;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .end local v4    # "sub":Ljava/lang/String;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 160
    .local v1, "e":Ljava/io/IOException;
    :goto_2
    :try_start_5
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "There was a problem accessing resource : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 162
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v5

    :goto_3
    :try_start_6
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catchall_2
    move-exception v5

    move-object v2, v3

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_3

    .line 159
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "casesensitive"    # Z

    .prologue
    .line 114
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->casesensitive:Z

    .line 115
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->project:Lorg/apache/tools/ant/Project;

    .line 51
    return-void
.end method

.method public setRefid(Ljava/lang/String;)V
    .locals 0
    .param p1, "refid"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->refid:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->resource:Lorg/apache/tools/ant/types/Resource;

    .line 67
    return-void
.end method

.method public setSubstring(Ljava/lang/String;)V
    .locals 0
    .param p1, "substring"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceContains;->substring:Ljava/lang/String;

    .line 107
    return-void
.end method
