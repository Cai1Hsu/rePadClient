.class public Lorg/apache/tools/ant/types/Environment$Variable;
.super Ljava/lang/Object;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Environment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Variable"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Environment$Variable;->validate()V

    .line 117
    new-instance v0, Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/tools/ant/types/Environment$Variable;->key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 118
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 105
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/types/Environment$Variable;->key:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 97
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public validate()V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->key:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment$Variable;->value:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 128
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "key and value must be specified for environment variables."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_1
    return-void
.end method
