.class public Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;
.super Ljava/lang/Object;
.source "URLResolver.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;


# instance fields
.field private destdir:Ljava/io/File;

.field private destfile:Ljava/io/File;

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getDest()Ljava/io/File;
    .locals 6

    .prologue
    .line 88
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destfile:Ljava/io/File;

    if-eqz v4, :cond_0

    .line 89
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destfile:Ljava/io/File;

    .line 104
    .local v3, "result":Ljava/io/File;
    :goto_0
    return-object v3

    .line 91
    .end local v3    # "result":Ljava/io/File;
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "file":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-gt v4, v5, :cond_2

    .line 94
    :cond_1
    const-string/jumbo v1, "default.file"

    .line 102
    .local v1, "filename":Ljava/lang/String;
    :goto_1
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destdir:Ljava/io/File;

    invoke-direct {v3, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v3    # "result":Ljava/io/File;
    goto :goto_0

    .line 96
    .end local v1    # "filename":Ljava/lang/String;
    .end local v3    # "result":Ljava/io/File;
    :cond_2
    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 97
    .local v2, "index":I
    const/4 v4, -0x1

    if-ne v4, v2, :cond_3

    .line 98
    const/4 v2, 0x0

    .line 100
    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "filename":Ljava/lang/String;
    goto :goto_1
.end method

.method private validate()V
    .locals 3

    .prologue
    .line 111
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->url:Ljava/net/URL;

    if-nez v1, :cond_0

    .line 112
    const-string/jumbo v0, "Must specify URL"

    .line 113
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must specify URL"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destdir:Ljava/io/File;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destfile:Ljava/io/File;

    if-nez v1, :cond_1

    .line 117
    const-string/jumbo v0, "Must specify destination file or directory"

    .line 118
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must specify destination file or directory"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 119
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destdir:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destfile:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 120
    const-string/jumbo v0, "Must not specify both destination file or directory"

    .line 121
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must not specify both destination file or directory"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 123
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public resolve(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Lorg/apache/tools/ant/Project;)Ljava/io/File;
    .locals 3
    .param p1, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->validate()V

    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->getDest()Ljava/io/File;

    move-result-object v0

    .line 74
    .local v0, "file":Ljava/io/File;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Get;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Get;-><init>()V

    .line 75
    .local v1, "get":Lorg/apache/tools/ant/taskdefs/Get;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/taskdefs/Get;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 76
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Get;->setDest(Ljava/io/File;)V

    .line 77
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->url:Ljava/net/URL;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Get;->setSrc(Ljava/net/URL;)V

    .line 78
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Get;->execute()V

    .line 80
    return-object v0
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destdir"    # Ljava/io/File;

    .prologue
    .line 58
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destdir:Ljava/io/File;

    .line 59
    return-void
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "destfile"    # Ljava/io/File;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->destfile:Ljava/io/File;

    .line 51
    return-void
.end method

.method public setUrl(Ljava/net/URL;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->url:Ljava/net/URL;

    .line 43
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 130
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "URL["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;->url:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
