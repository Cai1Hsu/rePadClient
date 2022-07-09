.class public Lorg/apache/tools/ant/types/selectors/WritableSelector;
.super Ljava/lang/Object;
.source "WritableSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/FileSelector;
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 42
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
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 38
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v2, 0x0

    .line 42
    sget-object v1, Lorg/apache/tools/ant/types/selectors/WritableSelector;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/types/selectors/WritableSelector;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/selectors/WritableSelector;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 43
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_1

    .line 44
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0, v2, v2, v1}, Lorg/apache/tools/ant/types/selectors/WritableSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v1

    .line 46
    :goto_1
    return v1

    .line 42
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/types/selectors/WritableSelector;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 46
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method
