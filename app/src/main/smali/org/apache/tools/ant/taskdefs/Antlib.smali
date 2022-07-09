.class public Lorg/apache/tools/ant/taskdefs/Antlib;
.super Lorg/apache/tools/ant/Task;
.source "Antlib.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# static fields
.field public static final TAG:Ljava/lang/String; = "antlib"

.field static class$org$apache$tools$ant$taskdefs$Antlib:Ljava/lang/Class;


# instance fields
.field private classLoader:Ljava/lang/ClassLoader;

.field private tasks:Ljava/util/List;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 115
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->uri:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->tasks:Ljava/util/List;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 139
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

.method public static createAntlib(Lorg/apache/tools/ant/Project;Ljava/net/URL;Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Antlib;
    .locals 12
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "antlibUrl"    # Ljava/net/URL;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 66
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URLConnection;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v4

    .line 73
    .local v4, "helper":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {v4, p2}, Lorg/apache/tools/ant/ComponentHelper;->enterAntLib(Ljava/lang/String;)V

    .line 74
    new-instance v2, Lorg/apache/tools/ant/types/resources/URLResource;

    invoke-direct {v2, p1}, Lorg/apache/tools/ant/types/resources/URLResource;-><init>(Ljava/net/URL;)V

    .line 77
    .local v2, "antlibResource":Lorg/apache/tools/ant/types/resources/URLResource;
    const/4 v7, 0x0

    .line 78
    .local v7, "parser":Lorg/apache/tools/ant/ProjectHelper;
    :try_start_1
    const-string/jumbo v9, "ant.projectHelper"

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 80
    .local v6, "p":Ljava/lang/Object;
    instance-of v9, v6, Lorg/apache/tools/ant/ProjectHelper;

    if-eqz v9, :cond_0

    .line 81
    move-object v0, v6

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    move-object v7, v0

    .line 82
    invoke-virtual {v7, v2}, Lorg/apache/tools/ant/ProjectHelper;->canParseAntlibDescriptor(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 83
    const/4 v7, 0x0

    .line 86
    :cond_0
    if-nez v7, :cond_1

    .line 87
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v5

    .line 89
    .local v5, "helperRepository":Lorg/apache/tools/ant/ProjectHelperRepository;
    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperForAntlib(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/ProjectHelper;

    move-result-object v7

    .line 91
    .end local v5    # "helperRepository":Lorg/apache/tools/ant/ProjectHelperRepository;
    :cond_1
    invoke-virtual {v7, p0, v2}, Lorg/apache/tools/ant/ProjectHelper;->parseAntlibDescriptor(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v8

    .line 94
    .local v8, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v8}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "antlib"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 95
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Unexpected tag "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v8}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " expecting "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "antlib"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .end local v6    # "p":Ljava/lang/Object;
    .end local v8    # "ue":Lorg/apache/tools/ant/UnknownElement;
    :catchall_0
    move-exception v9

    invoke-virtual {v4}, Lorg/apache/tools/ant/ComponentHelper;->exitAntLib()V

    throw v9

    .line 67
    .end local v2    # "antlibResource":Lorg/apache/tools/ant/types/resources/URLResource;
    .end local v4    # "helper":Lorg/apache/tools/ant/ComponentHelper;
    .end local v7    # "parser":Lorg/apache/tools/ant/ProjectHelper;
    :catch_0
    move-exception v3

    .line 68
    .local v3, "ex":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Unable to find "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 99
    .end local v3    # "ex":Ljava/io/IOException;
    .restart local v2    # "antlibResource":Lorg/apache/tools/ant/types/resources/URLResource;
    .restart local v4    # "helper":Lorg/apache/tools/ant/ComponentHelper;
    .restart local v6    # "p":Ljava/lang/Object;
    .restart local v7    # "parser":Lorg/apache/tools/ant/ProjectHelper;
    .restart local v8    # "ue":Lorg/apache/tools/ant/UnknownElement;
    :cond_2
    :try_start_2
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Antlib;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Antlib;-><init>()V

    .line 100
    .local v1, "antlib":Lorg/apache/tools/ant/taskdefs/Antlib;
    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/taskdefs/Antlib;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 101
    invoke-virtual {v8}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/apache/tools/ant/taskdefs/Antlib;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 102
    const-string/jumbo v9, "antlib"

    invoke-virtual {v1, v9}, Lorg/apache/tools/ant/taskdefs/Antlib;->setTaskName(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Antlib;->init()V

    .line 104
    invoke-virtual {v8, v1}, Lorg/apache/tools/ant/UnknownElement;->configure(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    invoke-virtual {v4}, Lorg/apache/tools/ant/ComponentHelper;->exitAntLib()V

    return-object v1
.end method

.method private getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->classLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_0

    .line 139
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Antlib;->class$org$apache$tools$ant$taskdefs$Antlib:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.Antlib"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Antlib;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Antlib;->class$org$apache$tools$ant$taskdefs$Antlib:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->classLoader:Ljava/lang/ClassLoader;

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->classLoader:Ljava/lang/ClassLoader;

    return-object v0

    .line 139
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Antlib;->class$org$apache$tools$ant$taskdefs$Antlib:Ljava/lang/Class;

    goto :goto_0
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->tasks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    return-void
.end method

.method public execute()V
    .locals 7

    .prologue
    .line 158
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->tasks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 159
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/UnknownElement;

    .line 160
    .local v3, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Antlib;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 161
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->maybeConfigure()V

    .line 162
    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getRealThing()Ljava/lang/Object;

    move-result-object v0

    .line 163
    .local v0, "configuredObject":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 166
    instance-of v4, v0, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;

    if-nez v4, :cond_1

    .line 167
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Invalid task in antlib "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " does not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "extend org.apache.tools.ant.taskdefs.AntlibDefinition"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_1
    move-object v1, v0

    .line 172
    check-cast v1, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;

    .line 173
    .local v1, "def":Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->uri:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->setURI(Ljava/lang/String;)V

    .line 174
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Antlib;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->setAntlibClassLoader(Ljava/lang/ClassLoader;)V

    .line 175
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->init()V

    .line 176
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->execute()V

    goto :goto_0

    .line 178
    .end local v0    # "configuredObject":Ljava/lang/Object;
    .end local v1    # "def":Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
    .end local v3    # "ue":Lorg/apache/tools/ant/UnknownElement;
    :cond_2
    return-void
.end method

.method protected setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 126
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->classLoader:Ljava/lang/ClassLoader;

    .line 127
    return-void
.end method

.method protected setURI(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Antlib;->uri:Ljava/lang/String;

    .line 135
    return-void
.end method
