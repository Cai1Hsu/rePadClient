.class public Lorg/apache/tools/ant/types/resources/Tokens;
.super Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;
.source "Tokens.java"


# instance fields
.field private encoding:Ljava/lang/String;

.field private tokenizer:Lorg/apache/tools/ant/util/Tokenizer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/util/Tokenizer;)V
    .locals 2
    .param p1, "tokenizer"    # Lorg/apache/tools/ant/util/Tokenizer;

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 101
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    if-eqz v0, :cond_1

    .line 102
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one nested tokenizer allowed."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Tokens;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    monitor-exit p0

    return-void
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 117
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 122
    :cond_1
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionWrapper;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    instance-of v0, v0, Lorg/apache/tools/ant/types/DataType;

    if-eqz v0, :cond_2

    .line 126
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    check-cast v0, Lorg/apache/tools/ant/types/DataType;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/Tokens;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 129
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Tokens;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getCollection()Ljava/util/Collection;
    .locals 9

    .prologue
    .line 51
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v2

    .line 52
    .local v2, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v7

    if-nez v7, :cond_1

    .line 53
    sget-object v5, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_0
    monitor-exit p0

    return-object v5

    .line 55
    :cond_1
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    if-nez v7, :cond_2

    .line 56
    new-instance v7, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct {v7}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    iput-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    .line 58
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 59
    .local v0, "cat":Lorg/apache/tools/ant/util/ConcatResourceInputStream;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 61
    const/4 v3, 0x0

    .line 62
    .local v3, "rdr":Ljava/io/InputStreamReader;
    iget-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->encoding:Ljava/lang/String;

    if-nez v7, :cond_3

    .line 63
    new-instance v3, Ljava/io/InputStreamReader;

    .end local v3    # "rdr":Ljava/io/InputStreamReader;
    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 71
    .restart local v3    # "rdr":Ljava/io/InputStreamReader;
    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    .local v5, "result":Ljava/util/ArrayList;
    :try_start_2
    iget-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    invoke-interface {v7, v3}, Lorg/apache/tools/ant/util/Tokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v6

    .local v6, "s":Ljava/lang/String;
    :goto_1
    if-eqz v6, :cond_0

    .line 74
    new-instance v4, Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-direct {v4, v6}, Lorg/apache/tools/ant/types/resources/StringResource;-><init>(Ljava/lang/String;)V

    .line 75
    .local v4, "resource":Lorg/apache/tools/ant/types/resources/StringResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Tokens;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/types/resources/StringResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 76
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->tokenizer:Lorg/apache/tools/ant/util/Tokenizer;

    invoke-interface {v7, v3}, Lorg/apache/tools/ant/util/Tokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    goto :goto_1

    .line 66
    .end local v4    # "resource":Lorg/apache/tools/ant/types/resources/StringResource;
    .end local v5    # "result":Ljava/util/ArrayList;
    .end local v6    # "s":Ljava/lang/String;
    :cond_3
    :try_start_3
    new-instance v3, Ljava/io/InputStreamReader;

    .end local v3    # "rdr":Ljava/io/InputStreamReader;
    iget-object v7, p0, Lorg/apache/tools/ant/types/resources/Tokens;->encoding:Ljava/lang/String;

    invoke-direct {v3, v0, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .restart local v3    # "rdr":Ljava/io/InputStreamReader;
    goto :goto_0

    .line 67
    .end local v3    # "rdr":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v1

    .line 68
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_4
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 51
    .end local v0    # "cat":Lorg/apache/tools/ant/util/ConcatResourceInputStream;
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 78
    .restart local v0    # "cat":Lorg/apache/tools/ant/util/ConcatResourceInputStream;
    .restart local v2    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .restart local v3    # "rdr":Ljava/io/InputStreamReader;
    .restart local v5    # "result":Ljava/util/ArrayList;
    :catch_1
    move-exception v1

    .line 79
    .local v1, "e":Ljava/io/IOException;
    :try_start_5
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Error reading tokens"

    invoke-direct {v7, v8, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public declared-synchronized setEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/Tokens;->encoding:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    monitor-exit p0

    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
