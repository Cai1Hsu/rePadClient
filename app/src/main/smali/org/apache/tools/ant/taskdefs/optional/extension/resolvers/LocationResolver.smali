.class public Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;
.super Ljava/lang/Object;
.source "LocationResolver.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;


# instance fields
.field private location:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    .line 50
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;->location:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 51
    const-string/jumbo v0, "No location specified for resolver"

    .line 52
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No location specified for resolver"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;->location:Ljava/lang/String;

    invoke-virtual {p2, v1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;->location:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Location["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;->location:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
