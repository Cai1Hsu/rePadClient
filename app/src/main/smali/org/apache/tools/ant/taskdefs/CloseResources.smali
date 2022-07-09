.class public Lorg/apache/tools/ant/taskdefs/CloseResources;
.super Lorg/apache/tools/ant/Task;
.source "CloseResources.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;


# instance fields
.field private resources:Lorg/apache/tools/ant/types/resources/Union;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CloseResources;->resources:Lorg/apache/tools/ant/types/resources/Union;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 49
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


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CloseResources;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 44
    return-void
.end method

.method public execute()V
    .locals 5

    .prologue
    .line 47
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/CloseResources;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 49
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/CloseResources;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/CloseResources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/taskdefs/CloseResources;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 50
    .local v3, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    if-eqz v3, :cond_0

    .line 51
    invoke-interface {v3}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v2

    .line 53
    .local v2, "u":Ljava/net/URL;
    :try_start_0
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/net/URLConnection;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 54
    :catch_0
    move-exception v4

    goto :goto_0

    .line 49
    .end local v2    # "u":Ljava/net/URL;
    .end local v3    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_1
    sget-object v4, Lorg/apache/tools/ant/taskdefs/CloseResources;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_1

    .line 59
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    return-void
.end method
