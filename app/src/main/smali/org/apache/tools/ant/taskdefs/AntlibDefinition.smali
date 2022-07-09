.class public Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
.super Lorg/apache/tools/ant/Task;
.source "AntlibDefinition.java"


# instance fields
.field private antlibClassLoader:Ljava/lang/ClassLoader;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 33
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->uri:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAntlibClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->antlibClassLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public setAntlibClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->antlibClassLoader:Ljava/lang/ClassLoader;

    .line 71
    return-void
.end method

.method public setURI(Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 47
    const-string/jumbo v0, "antlib:org.apache.tools.ant"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const-string/jumbo p1, ""

    .line 50
    :cond_0
    const-string/jumbo v0, "ant:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 51
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Attempt to use a reserved URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->uri:Ljava/lang/String;

    .line 54
    return-void
.end method
