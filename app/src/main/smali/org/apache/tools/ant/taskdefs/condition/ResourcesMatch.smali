.class public Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;
.super Ljava/lang/Object;
.source "ResourcesMatch.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private asText:Z

.field private resources:Lorg/apache/tools/ant/types/resources/Union;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->asText:Z

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 56
    if-nez p1, :cond_0

    .line 61
    :goto_0
    return-void

    .line 59
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    goto :goto_1
.end method

.method public eval()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 69
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v5, :cond_0

    .line 70
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "You must specify one or more nested resource collections"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 73
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v5

    if-le v5, v4, :cond_1

    .line 74
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 75
    .local v0, "i":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 76
    .local v2, "r1":Lorg/apache/tools/ant/types/Resource;
    const/4 v3, 0x0

    .line 78
    .local v3, "r2":Lorg/apache/tools/ant/types/Resource;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "r2":Lorg/apache/tools/ant/types/Resource;
    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    .line 81
    .restart local v3    # "r2":Lorg/apache/tools/ant/types/Resource;
    :try_start_0
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->asText:Z

    invoke-static {v2, v3, v5}, Lorg/apache/tools/ant/util/ResourceUtils;->contentEquals(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_2

    .line 82
    const/4 v4, 0x0

    .line 91
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v2    # "r1":Lorg/apache/tools/ant/types/Resource;
    .end local v3    # "r2":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    return v4

    .line 84
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v2    # "r1":Lorg/apache/tools/ant/types/Resource;
    .restart local v3    # "r2":Lorg/apache/tools/ant/types/Resource;
    :catch_0
    move-exception v1

    .line 85
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "when comparing resources "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 88
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_2
    move-object v2, v3

    goto :goto_0
.end method

.method public setAsText(Z)V
    .locals 0
    .param p1, "asText"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourcesMatch;->asText:Z

    .line 49
    return-void
.end method
