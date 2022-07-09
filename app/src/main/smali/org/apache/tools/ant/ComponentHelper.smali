.class public Lorg/apache/tools/ant/ComponentHelper;
.super Ljava/lang/Object;
.source "ComponentHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;
    }
.end annotation


# static fields
.field private static final ANT_PROPERTY_TASK:Ljava/lang/String; = "property"

.field private static final BUILD_SYSCLASSPATH_ONLY:Ljava/lang/String; = "only"

.field public static final COMPONENT_HELPER_REFERENCE:Ljava/lang/String; = "ant.ComponentHelper"

.field private static final ERROR_NO_TASK_LIST_LOAD:Ljava/lang/String; = "Can\'t load default task list"

.field private static final ERROR_NO_TYPE_LIST_LOAD:Ljava/lang/String; = "Can\'t load default type list"

.field static class$org$apache$tools$ant$ComponentHelper:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Task:Ljava/lang/Class;

.field static class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$Property:Ljava/lang/Class;

.field private static defaultDefinitions:[Ljava/util/Properties;


# instance fields
.field private antLibCurrentUri:Ljava/lang/String;

.field private antLibStack:Ljava/util/Stack;

.field private antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

.field private final checkedNamespaces:Ljava/util/HashSet;

.field private next:Lorg/apache/tools/ant/ComponentHelper;

.field private project:Lorg/apache/tools/ant/Project;

.field private rebuildTaskClassDefinitions:Z

.field private rebuildTypeClassDefinitions:Z

.field private restrictedDefinitions:Ljava/util/Map;

.field private final taskClassDefinitions:Ljava/util/Hashtable;

.field private final typeClassDefinitions:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 129
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/util/Properties;

    sput-object v0, Lorg/apache/tools/ant/ComponentHelper;->defaultDefinitions:[Ljava/util/Properties;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    .line 68
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->taskClassDefinitions:Ljava/util/Hashtable;

    .line 71
    iput-boolean v1, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTaskClassDefinitions:Z

    .line 74
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->typeClassDefinitions:Ljava/util/Hashtable;

    .line 77
    iput-boolean v1, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTypeClassDefinitions:Z

    .line 80
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->checkedNamespaces:Ljava/util/HashSet;

    .line 86
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibStack:Ljava/util/Stack;

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibCurrentUri:Ljava/lang/String;

    .line 165
    return-void
.end method

.method private declared-synchronized checkNamespace(Ljava/lang/String;)V
    .locals 4
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 847
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 848
    .local v1, "uri":Ljava/lang/String;
    const-string/jumbo v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 849
    const-string/jumbo v1, "antlib:org.apache.tools.ant"

    .line 851
    :cond_0
    const-string/jumbo v2, "antlib:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_2

    .line 878
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 854
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->checkedNamespaces:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 857
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->checkedNamespaces:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 859
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->size()I

    move-result v2

    if-nez v2, :cond_3

    .line 864
    invoke-virtual {p0}, Lorg/apache/tools/ant/ComponentHelper;->initDefaultDefinitions()V

    .line 866
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Typedef;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Typedef;-><init>()V

    .line 867
    .local v0, "definer":Lorg/apache/tools/ant/taskdefs/Typedef;
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Typedef;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 868
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Typedef;->init()V

    .line 869
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Typedef;->setURI(Ljava/lang/String;)V

    .line 871
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Typedef;->setTaskName(Ljava/lang/String;)V

    .line 874
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Definer;->makeResourceFromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Typedef;->setResource(Ljava/lang/String;)V

    .line 876
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Definer$OnError;

    const-string/jumbo v3, "ignore"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/Definer$OnError;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Typedef;->setOnError(Lorg/apache/tools/ant/taskdefs/Definer$OnError;)V

    .line 877
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Typedef;->execute()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 847
    .end local v0    # "definer":Lorg/apache/tools/ant/taskdefs/Typedef;
    .end local v1    # "uri":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 346
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

.method private createNewTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;
    .locals 6
    .param p1, "taskType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 547
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->getComponentClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 548
    .local v0, "c":Ljava/lang/Class;
    if-eqz v0, :cond_0

    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.Task"

    invoke-static {v3}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 566
    :cond_0
    :goto_1
    return-object v2

    .line 548
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_0

    .line 551
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 552
    .local v1, "obj":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 555
    instance-of v3, v1, Lorg/apache/tools/ant/Task;

    if-nez v3, :cond_3

    .line 556
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Expected a Task from \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' but got an instance of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " instead"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_3
    move-object v2, v1

    .line 559
    check-cast v2, Lorg/apache/tools/ant/Task;

    .line 560
    .local v2, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/Task;->setTaskType(Ljava/lang/String;)V

    .line 563
    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 565
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "   +Task: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method private declared-synchronized getCheckedNamespace()Ljava/util/Set;
    .locals 1

    .prologue
    .line 199
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->checkedNamespaces:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;
    .locals 3
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 780
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v2, "build.sysclasspath"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 781
    .local v0, "buildSysclasspath":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getCoreLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "only"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 783
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getCoreLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    .line 785
    :cond_0
    return-object p1
.end method

.method public static getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 146
    if-nez p0, :cond_1

    .line 147
    const/4 v0, 0x0

    .line 158
    :cond_0
    :goto_0
    return-object v0

    .line 150
    :cond_1
    const-string/jumbo v1, "ant.ComponentHelper"

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ComponentHelper;

    .line 151
    .local v0, "ph":Lorg/apache/tools/ant/ComponentHelper;
    if-nez v0, :cond_0

    .line 154
    new-instance v0, Lorg/apache/tools/ant/ComponentHelper;

    .end local v0    # "ph":Lorg/apache/tools/ant/ComponentHelper;
    invoke-direct {v0}, Lorg/apache/tools/ant/ComponentHelper;-><init>()V

    .line 155
    .restart local v0    # "ph":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/ComponentHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 157
    const-string/jumbo v1, "ant.ComponentHelper"

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static declared-synchronized getDefaultDefinitions(Z)Ljava/util/Properties;
    .locals 8
    .param p0, "type"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 799
    const-class v7, Lorg/apache/tools/ant/ComponentHelper;

    monitor-enter v7

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    .line 800
    .local v2, "idx":I
    :goto_0
    :try_start_0
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->defaultDefinitions:[Ljava/util/Properties;

    aget-object v6, v6, v2

    if-nez v6, :cond_5

    .line 801
    if-eqz p0, :cond_1

    const-string/jumbo v5, "/org/apache/tools/ant/types/defaults.properties"

    .line 803
    .local v5, "resource":Ljava/lang/String;
    :goto_1
    if-eqz p0, :cond_2

    const-string/jumbo v1, "Can\'t load default type list"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 804
    .local v1, "errorString":Ljava/lang/String;
    :goto_2
    const/4 v3, 0x0

    .line 806
    .local v3, "in":Ljava/io/InputStream;
    :try_start_1
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$ComponentHelper:Ljava/lang/Class;

    if-nez v6, :cond_3

    const-string/jumbo v6, "org.apache.tools.ant.ComponentHelper"

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$ComponentHelper:Ljava/lang/Class;

    :goto_3
    invoke-virtual {v6, v5}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 807
    if-nez v3, :cond_4

    .line 808
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 813
    :catch_0
    move-exception v0

    .line 814
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 816
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :try_start_3
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 799
    .end local v1    # "errorString":Ljava/lang/String;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v5    # "resource":Ljava/lang/String;
    :catchall_1
    move-exception v6

    monitor-exit v7

    throw v6

    .end local v2    # "idx":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 801
    .restart local v2    # "idx":I
    :cond_1
    :try_start_4
    const-string/jumbo v5, "/org/apache/tools/ant/taskdefs/defaults.properties"

    goto :goto_1

    .line 803
    .restart local v5    # "resource":Ljava/lang/String;
    :cond_2
    const-string/jumbo v1, "Can\'t load default task list"
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    .line 806
    .restart local v1    # "errorString":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/InputStream;
    :cond_3
    :try_start_5
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$ComponentHelper:Ljava/lang/Class;

    goto :goto_3

    .line 810
    :cond_4
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 811
    .local v4, "p":Ljava/util/Properties;
    invoke-virtual {v4, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 812
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->defaultDefinitions:[Ljava/util/Properties;

    aput-object v4, v6, v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 816
    :try_start_6
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 819
    .end local v1    # "errorString":Ljava/lang/String;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "p":Ljava/util/Properties;
    .end local v5    # "resource":Ljava/lang/String;
    :cond_5
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->defaultDefinitions:[Ljava/util/Properties;

    aget-object v6, v6, v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    monitor-exit v7

    return-object v6
.end method

.method public static getElementName(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 1
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "brief"    # Z

    .prologue
    .line 643
    if-nez p0, :cond_0

    .line 644
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;

    move-result-object p0

    .line 646
    :cond_0
    if-nez p0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/tools/ant/ComponentHelper;->getUnmappedElementName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->getElementName(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getRestrictedDefinition()Ljava/util/Map;
    .locals 8

    .prologue
    .line 206
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 207
    .local v5, "result":Ljava/util/Map;
    iget-object v7, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    monitor-enter v7

    .line 208
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 209
    .local v4, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 210
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 211
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 212
    .local v2, "entryVal":Ljava/util/List;
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 215
    .end local v2    # "entryVal":Ljava/util/List;
    .local v3, "entryVal":Ljava/util/List;
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 216
    :try_start_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 217
    .local v1, "entryKey":Ljava/lang/Object;
    invoke-interface {v5, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 219
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v1    # "entryKey":Ljava/lang/Object;
    .end local v3    # "entryVal":Ljava/util/List;
    .end local v4    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v6

    .line 215
    .restart local v0    # "entry":Ljava/util/Map$Entry;
    .restart local v2    # "entryVal":Ljava/util/List;
    .restart local v4    # "i":Ljava/util/Iterator;
    :catchall_1
    move-exception v6

    move-object v3, v2

    .end local v2    # "entryVal":Ljava/util/List;
    .restart local v3    # "entryVal":Ljava/util/List;
    :goto_1
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :try_start_5
    throw v6

    .line 219
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "entryVal":Ljava/util/List;
    :cond_0
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 220
    return-object v5

    .line 215
    .restart local v0    # "entry":Ljava/util/Map$Entry;
    .restart local v3    # "entryVal":Ljava/util/List;
    :catchall_2
    move-exception v6

    goto :goto_1
.end method

.method private static getUnmappedElementName(Ljava/lang/Class;Z)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "brief"    # Z

    .prologue
    .line 651
    if-eqz p1, :cond_0

    .line 652
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 653
    .local v0, "name":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 655
    .end local v0    # "name":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private initTasks()V
    .locals 7

    .prologue
    .line 763
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/ComponentHelper;->getClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v0

    .line 764
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    const/4 v6, 0x0

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->getDefaultDefinitions(Z)Ljava/util/Properties;

    move-result-object v5

    .line 765
    .local v5, "props":Ljava/util/Properties;
    invoke-virtual {v5}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v3

    .line 766
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 767
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 768
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 769
    .local v1, "className":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v2}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 770
    .local v2, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 771
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassName(Ljava/lang/String;)V

    .line 772
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 773
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v6, :cond_0

    const-string/jumbo v6, "org.apache.tools.ant.Task"

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdaptToClass(Ljava/lang/Class;)V

    .line 774
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    if-nez v6, :cond_1

    const-string/jumbo v6, "org.apache.tools.ant.TaskAdapter"

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdapterClass(Ljava/lang/Class;)V

    .line 775
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v6, v4, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 773
    :cond_0
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1

    .line 774
    :cond_1
    sget-object v6, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    goto :goto_2

    .line 777
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v4    # "name":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private initTypes()V
    .locals 7

    .prologue
    .line 826
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/ComponentHelper;->getClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v0

    .line 827
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    const/4 v6, 0x1

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->getDefaultDefinitions(Z)Ljava/util/Properties;

    move-result-object v5

    .line 828
    .local v5, "props":Ljava/util/Properties;
    invoke-virtual {v5}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v3

    .line 829
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 830
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 831
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 832
    .local v1, "className":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v2}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 833
    .local v2, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 834
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassName(Ljava/lang/String;)V

    .line 835
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 836
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v6, v4, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 838
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v4    # "name":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private printClassNotFound(Ljava/io/PrintWriter;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "optional"    # Z
    .param p4, "dirListing"    # Ljava/lang/String;

    .prologue
    .line 1057
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Cause: the class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " was not found."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1058
    if-eqz p3, :cond_0

    .line 1059
    const-string/jumbo v0, "        This looks like one of Ant\'s optional components."

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1060
    const-string/jumbo v0, "Action: Check that the appropriate optional JAR exists in"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1061
    invoke-virtual {p1, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1067
    :goto_0
    return-void

    .line 1063
    :cond_0
    const-string/jumbo v0, "Action: Check that the component has been correctly declared"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1064
    const-string/jumbo v0, "        and that the implementing JAR is in one of:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1065
    invoke-virtual {p1, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private printNotLoadDependentClass(Ljava/io/PrintWriter;ZLjava/lang/NoClassDefFoundError;Ljava/lang/String;)V
    .locals 2
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "optional"    # Z
    .param p3, "ncdfe"    # Ljava/lang/NoClassDefFoundError;
    .param p4, "dirListing"    # Ljava/lang/String;

    .prologue
    .line 1074
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Cause: Could not load a dependent class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p3}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1076
    if-eqz p2, :cond_0

    .line 1077
    const-string/jumbo v0, "       It is not enough to have Ant\'s optional JARs"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1078
    const-string/jumbo v0, "       you need the JAR files that the optional tasks depend upon."

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1079
    const-string/jumbo v0, "       Ant\'s optional task dependencies are listed in the manual."

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1083
    :goto_0
    const-string/jumbo v0, "Action: Determine what extra JAR files are needed, and place them in one of:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1085
    invoke-virtual {p1, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1086
    return-void

    .line 1081
    :cond_0
    const-string/jumbo v0, "       This class may be in a separate JAR that is not installed."

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private printUnknownDefinition(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "componentName"    # Ljava/lang/String;
    .param p3, "dirListing"    # Ljava/lang/String;

    .prologue
    .line 1023
    const-string/jumbo v6, "antlib:"

    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_0

    const/4 v1, 0x1

    .line 1024
    .local v1, "isAntlib":Z
    :goto_0
    invoke-static {p2}, Lorg/apache/tools/ant/ProjectHelper;->extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1025
    .local v5, "uri":Ljava/lang/String;
    const-string/jumbo v6, "Cause: The name is undefined."

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1026
    const-string/jumbo v6, "Action: Check the spelling."

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1027
    const-string/jumbo v6, "Action: Check that any custom tasks/types have been declared."

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1028
    const-string/jumbo v6, "Action: Check that any <presetdef>/<macrodef> declarations have taken place."

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1030
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 1031
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->findMatches(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 1032
    .local v4, "matches":Ljava/util/List;
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_1

    .line 1033
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1034
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "The definitions in the namespace "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " are:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1035
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1036
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 1037
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/tools/ant/ProjectHelper;->extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1038
    .local v3, "local":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "    "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 1023
    .end local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v1    # "isAntlib":Z
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "local":Ljava/lang/String;
    .end local v4    # "matches":Ljava/util/List;
    .end local v5    # "uri":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1041
    .restart local v1    # "isAntlib":Z
    .restart local v4    # "matches":Ljava/util/List;
    .restart local v5    # "uri":Ljava/lang/String;
    :cond_1
    const-string/jumbo v6, "No types or tasks have been defined in this namespace yet"

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1042
    if-eqz v1, :cond_2

    .line 1043
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 1044
    const-string/jumbo v6, "This appears to be an antlib declaration. "

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1045
    const-string/jumbo v6, "Action: Check that the implementing library exists in one of:"

    invoke-virtual {p1, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1046
    invoke-virtual {p1, p3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1050
    .end local v4    # "matches":Ljava/util/List;
    :cond_2
    return-void
.end method

.method private sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/AntTypeDefinition;)Z
    .locals 5
    .param p1, "def"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "old"    # Lorg/apache/tools/ant/AntTypeDefinition;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 675
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->validDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)Z

    move-result v0

    .line 676
    .local v0, "defValid":Z
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/ComponentHelper;->validDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)Z

    move-result v4

    if-ne v0, v4, :cond_1

    move v1, v2

    .line 678
    .local v1, "sameValidity":Z
    :goto_0
    if-eqz v1, :cond_2

    if-eqz v0, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p1, p2, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_0
    :goto_1
    return v2

    .end local v1    # "sameValidity":Z
    :cond_1
    move v1, v3

    .line 676
    goto :goto_0

    .restart local v1    # "sameValidity":Z
    :cond_2
    move v2, v3

    .line 678
    goto :goto_1
.end method

.method private updateDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V
    .locals 9
    .param p1, "def"    # Lorg/apache/tools/ant/AntTypeDefinition;

    .prologue
    const/4 v4, 0x1

    .line 715
    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v1

    .line 716
    .local v1, "name":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    monitor-enter v6

    .line 717
    const/4 v5, 0x1

    :try_start_0
    iput-boolean v5, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTaskClassDefinitions:Z

    .line 718
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTypeClassDefinitions:Z

    .line 719
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v5, v1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v2

    .line 720
    .local v2, "old":Lorg/apache/tools/ant/AntTypeDefinition;
    if-eqz v2, :cond_2

    .line 721
    invoke-direct {p0, p1, v2}, Lorg/apache/tools/ant/ComponentHelper;->sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/AntTypeDefinition;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 722
    monitor-exit v6

    .line 733
    :goto_0
    return-void

    .line 724
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v5, v1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getExposedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 725
    .local v3, "oldClass":Ljava/lang/Class;
    if-eqz v3, :cond_4

    sget-object v5, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v5, :cond_3

    const-string/jumbo v5, "org.apache.tools.ant.Task"

    invoke-static {v5}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v5, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v0, v4

    .line 726
    .local v0, "isTask":Z
    :goto_2
    iget-object v7, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Trying to override old definition of "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    if-eqz v0, :cond_5

    const-string/jumbo v5, "task "

    :goto_3
    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p1, v2, v8}, Lorg/apache/tools/ant/AntTypeDefinition;->similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v4, 0x3

    :cond_1
    invoke-virtual {v7, v5, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 730
    .end local v0    # "isTask":Z
    .end local v3    # "oldClass":Ljava/lang/Class;
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, " +Datatype "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x4

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 731
    iget-object v4, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v4, v1, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 732
    monitor-exit v6

    goto :goto_0

    .end local v2    # "old":Lorg/apache/tools/ant/AntTypeDefinition;
    :catchall_0
    move-exception v4

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 725
    .restart local v2    # "old":Lorg/apache/tools/ant/AntTypeDefinition;
    .restart local v3    # "oldClass":Ljava/lang/Class;
    :cond_3
    :try_start_1
    sget-object v5, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    goto :goto_2

    .line 726
    .restart local v0    # "isTask":Z
    :cond_5
    const-string/jumbo v5, "datatype "
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3
.end method

.method private updateRestrictedDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V
    .locals 8
    .param p1, "def"    # Lorg/apache/tools/ant/AntTypeDefinition;

    .prologue
    .line 686
    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v5

    .line 687
    .local v5, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 688
    .local v3, "list":Ljava/util/List;
    iget-object v7, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    monitor-enter v7

    .line 689
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/util/List;

    move-object v3, v0

    .line 690
    if-nez v3, :cond_0

    .line 691
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 692
    .end local v3    # "list":Ljava/util/List;
    .local v4, "list":Ljava/util/List;
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-object v3, v4

    .line 694
    .end local v4    # "list":Ljava/util/List;
    .restart local v3    # "list":Ljava/util/List;
    :cond_0
    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 697
    monitor-enter v3

    .line 698
    :try_start_3
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 699
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 700
    .local v1, "current":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 701
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 705
    .end local v1    # "current":Lorg/apache/tools/ant/AntTypeDefinition;
    :cond_2
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 706
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 707
    return-void

    .line 694
    .end local v2    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    :goto_0
    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v6

    .line 706
    :catchall_1
    move-exception v6

    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v6

    .line 694
    .end local v3    # "list":Ljava/util/List;
    .restart local v4    # "list":Ljava/util/List;
    :catchall_2
    move-exception v6

    move-object v3, v4

    .end local v4    # "list":Ljava/util/List;
    .restart local v3    # "list":Ljava/util/List;
    goto :goto_0
.end method

.method private validDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)Z
    .locals 1
    .param p1, "def"    # Lorg/apache/tools/ant/AntTypeDefinition;

    .prologue
    .line 665
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addDataTypeDefinition(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 4
    .param p1, "typeName"    # Ljava/lang/String;
    .param p2, "typeClass"    # Ljava/lang/Class;

    .prologue
    .line 477
    new-instance v0, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v0}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 478
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 479
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->setClass(Ljava/lang/Class;)V

    .line 480
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/ComponentHelper;->updateDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 481
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, " +User datatype: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "     "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 483
    return-void
.end method

.method public addDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V
    .locals 1
    .param p1, "def"    # Lorg/apache/tools/ant/AntTypeDefinition;

    .prologue
    .line 491
    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->isRestrict()Z

    move-result v0

    if-nez v0, :cond_0

    .line 492
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->updateDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 496
    :goto_0
    return-void

    .line 494
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->updateRestrictedDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    goto :goto_0
.end method

.method public addTaskDefinition(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 2
    .param p1, "taskName"    # Ljava/lang/String;
    .param p2, "taskClass"    # Ljava/lang/Class;

    .prologue
    .line 341
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/ComponentHelper;->checkTaskClass(Ljava/lang/Class;)V

    .line 342
    new-instance v0, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v0}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 343
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 345
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->setClass(Ljava/lang/Class;)V

    .line 346
    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.TaskAdapter"

    invoke-static {v1}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdapterClass(Ljava/lang/Class;)V

    .line 347
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassName(Ljava/lang/String;)V

    .line 348
    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.Task"

    invoke-static {v1}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdaptToClass(Ljava/lang/Class;)V

    .line 349
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/ComponentHelper;->updateDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 350
    return-void

    .line 346
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    goto :goto_0

    .line 348
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1
.end method

.method public checkTaskClass(Ljava/lang/Class;)V
    .locals 5
    .param p1, "taskClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 365
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 366
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 367
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 368
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 370
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 371
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is abstract"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 372
    .restart local v1    # "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 373
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 376
    .end local v1    # "message":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    :try_start_0
    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    sget-object v2, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v2, :cond_3

    const-string/jumbo v2, "org.apache.tools.ant.Task"

    invoke-static {v2}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 385
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-static {p1, v2}, Lorg/apache/tools/ant/TaskAdapter;->checkTaskClass(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)V

    .line 387
    :cond_2
    return-void

    .line 379
    :catch_0
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "No public no-arg constructor in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 381
    .restart local v1    # "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 382
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 384
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    sget-object v2, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_0
.end method

.method public createComponent(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v0

    .line 286
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public createComponent(Lorg/apache/tools/ant/UnknownElement;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "ue"    # Lorg/apache/tools/ant/UnknownElement;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "componentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 264
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 265
    .local v0, "component":Ljava/lang/Object;
    instance-of v2, v0, Lorg/apache/tools/ant/Task;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 266
    check-cast v1, Lorg/apache/tools/ant/Task;

    .line 267
    .local v1, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Task;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 268
    invoke-virtual {v1, p3}, Lorg/apache/tools/ant/Task;->setTaskType(Ljava/lang/String;)V

    .line 269
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 270
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Task;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 271
    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->init()V

    .line 273
    .end local v1    # "task":Lorg/apache/tools/ant/Task;
    :cond_0
    return-object v0
.end method

.method public createDataType(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "typeName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 582
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;
    .locals 3
    .param p1, "taskType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 524
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createNewTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 525
    .local v0, "task":Lorg/apache/tools/ant/Task;
    if-nez v0, :cond_0

    const-string/jumbo v1, "property"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 528
    const-string/jumbo v2, "property"

    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$taskdefs$Property:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.taskdefs.Property"

    invoke-static {v1}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$taskdefs$Property:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/ComponentHelper;->addTaskDefinition(Ljava/lang/String;Ljava/lang/Class;)V

    .line 529
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createNewTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 531
    :cond_0
    return-object v0

    .line 528
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$taskdefs$Property:Ljava/lang/Class;

    goto :goto_0
.end method

.method public diagnoseCreationFailure(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 29
    .param p1, "componentName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 887
    new-instance v15, Ljava/io/StringWriter;

    invoke-direct {v15}, Ljava/io/StringWriter;-><init>()V

    .line 888
    .local v15, "errorText":Ljava/io/StringWriter;
    new-instance v23, Ljava/io/PrintWriter;

    move-object/from16 v0, v23

    invoke-direct {v0, v15}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 889
    .local v23, "out":Ljava/io/PrintWriter;
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Problem: failed to create "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 891
    const/16 v20, 0x0

    .line 892
    .local v20, "lowlevel":Z
    const/16 v18, 0x0

    .line 893
    .local v18, "jars":Z
    const/4 v11, 0x0

    .line 895
    .local v11, "definitions":Z
    const-string/jumbo v27, "user.home"

    invoke-static/range {v27 .. v27}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 896
    .local v17, "home":Ljava/lang/String;
    new-instance v19, Ljava/io/File;

    sget-object v27, Lorg/apache/tools/ant/launch/Launcher;->USER_LIBDIR:Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 898
    .local v19, "libDir":Ljava/io/File;
    const/16 v24, 0x0

    .line 899
    .local v24, "probablyIDE":Z
    const-string/jumbo v27, "ant.home"

    invoke-static/range {v27 .. v27}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 900
    .local v7, "anthome":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 901
    new-instance v5, Ljava/io/File;

    const-string/jumbo v27, "lib"

    move-object/from16 v0, v27

    invoke-direct {v5, v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 902
    .local v5, "antHomeLibDir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 908
    .end local v5    # "antHomeLibDir":Ljava/io/File;
    .local v4, "antHomeLib":Ljava/lang/String;
    :goto_0
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    .line 909
    .local v13, "dirListingText":Ljava/lang/StringBuffer;
    const-string/jumbo v26, "        -"

    .line 910
    .local v26, "tab":Ljava/lang/String;
    const-string/jumbo v27, "        -"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 911
    invoke-virtual {v13, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 912
    const/16 v27, 0xa

    move/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 913
    if-eqz v24, :cond_1

    .line 914
    const-string/jumbo v27, "        -"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 915
    const-string/jumbo v27, "the IDE Ant configuration dialogs"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 923
    :goto_1
    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    .line 926
    .local v12, "dirListing":Ljava/lang/String;
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v10

    .line 927
    .local v10, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v10, :cond_2

    .line 929
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v12}, Lorg/apache/tools/ant/ComponentHelper;->printUnknownDefinition(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;)V

    .line 930
    const/4 v11, 0x1

    .line 1014
    :goto_2
    invoke-virtual/range {v23 .. v23}, Ljava/io/PrintWriter;->flush()V

    .line 1015
    invoke-virtual/range {v23 .. v23}, Ljava/io/PrintWriter;->close()V

    .line 1016
    invoke-virtual {v15}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v27

    return-object v27

    .line 905
    .end local v4    # "antHomeLib":Ljava/lang/String;
    .end local v10    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v12    # "dirListing":Ljava/lang/String;
    .end local v13    # "dirListingText":Ljava/lang/StringBuffer;
    .end local v26    # "tab":Ljava/lang/String;
    :cond_0
    const/16 v24, 0x1

    .line 906
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "ANT_HOME"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    sget-char v28, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, "lib"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "antHomeLib":Ljava/lang/String;
    goto :goto_0

    .line 917
    .restart local v13    # "dirListingText":Ljava/lang/StringBuffer;
    .restart local v26    # "tab":Ljava/lang/String;
    :cond_1
    const-string/jumbo v27, "        -"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 918
    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 919
    const/16 v27, 0xa

    move/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 920
    const-string/jumbo v27, "        -"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 921
    const-string/jumbo v27, "a directory added on the command line with the -lib argument"

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 933
    .restart local v10    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .restart local v12    # "dirListing":Ljava/lang/String;
    :cond_2
    invoke-virtual {v10}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v8

    .line 934
    .local v8, "classname":Ljava/lang/String;
    const-string/jumbo v27, "org.apache.tools.ant."

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    .line 935
    .local v6, "antTask":Z
    const-string/jumbo v27, "org.apache.tools.ant.taskdefs.optional"

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    .line 936
    .local v22, "optional":Z
    const-string/jumbo v27, "org.apache.tools.ant.types.optional"

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v27

    or-int v22, v22, v27

    .line 939
    const/4 v9, 0x0

    .line 941
    .local v9, "clazz":Ljava/lang/Class;
    :try_start_0
    invoke-virtual {v10}, Lorg/apache/tools/ant/AntTypeDefinition;->innerGetTypeClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v9

    .line 953
    :goto_3
    if-eqz v9, :cond_3

    .line 956
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v10, v9, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->innerCreateAndSet(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    .line 958
    const-string/jumbo v27, "The component could be instantiated."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_6

    .line 988
    :cond_3
    :goto_4
    invoke-virtual/range {v23 .. v23}, Ljava/io/PrintWriter;->println()V

    .line 989
    const-string/jumbo v27, "Do not panic, this is a common problem."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 990
    if-eqz v11, :cond_4

    .line 991
    const-string/jumbo v27, "It may just be a typographical error in the build file or the task/type declaration."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 994
    :cond_4
    if-eqz v18, :cond_5

    .line 995
    const-string/jumbo v27, "The commonest cause is a missing JAR."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 997
    :cond_5
    if-eqz v20, :cond_8

    .line 998
    const-string/jumbo v27, "This is quite a low level problem, which may need consultation with the author of the task."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1000
    if-eqz v6, :cond_7

    .line 1001
    const-string/jumbo v27, "This may be the Ant team. Please file a defect or contact the developer team."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 942
    :catch_0
    move-exception v14

    .line 943
    .local v14, "e":Ljava/lang/ClassNotFoundException;
    const/16 v18, 0x1

    .line 944
    if-nez v22, :cond_6

    .line 945
    const/4 v11, 0x1

    .line 947
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v22

    invoke-direct {v0, v1, v8, v2, v12}, Lorg/apache/tools/ant/ComponentHelper;->printClassNotFound(Ljava/io/PrintWriter;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_3

    .line 948
    .end local v14    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v21

    .line 949
    .local v21, "ncdfe":Ljava/lang/NoClassDefFoundError;
    const/16 v18, 0x1

    .line 950
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v22

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3, v12}, Lorg/apache/tools/ant/ComponentHelper;->printNotLoadDependentClass(Ljava/io/PrintWriter;ZLjava/lang/NoClassDefFoundError;Ljava/lang/String;)V

    goto :goto_3

    .line 959
    .end local v21    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    :catch_2
    move-exception v14

    .line 960
    .local v14, "e":Ljava/lang/NoSuchMethodException;
    const/16 v20, 0x1

    .line 961
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Cause: The class "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " has no compatible constructor."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 964
    .end local v14    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v14

    .line 965
    .local v14, "e":Ljava/lang/InstantiationException;
    const/16 v20, 0x1

    .line 966
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Cause: The class "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " is abstract and cannot be instantiated."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 968
    .end local v14    # "e":Ljava/lang/InstantiationException;
    :catch_4
    move-exception v14

    .line 969
    .local v14, "e":Ljava/lang/IllegalAccessException;
    const/16 v20, 0x1

    .line 970
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Cause: The constructor for "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " is private and cannot be invoked."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 972
    .end local v14    # "e":Ljava/lang/IllegalAccessException;
    :catch_5
    move-exception v16

    .line 973
    .local v16, "ex":Ljava/lang/reflect/InvocationTargetException;
    const/16 v20, 0x1

    .line 974
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v25

    .line 975
    .local v25, "t":Ljava/lang/Throwable;
    const-string/jumbo v27, "Cause: The constructor threw the exception"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 976
    invoke-virtual/range {v25 .. v25}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 977
    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    goto/16 :goto_4

    .line 978
    .end local v16    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v25    # "t":Ljava/lang/Throwable;
    :catch_6
    move-exception v21

    .line 979
    .restart local v21    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    const/16 v18, 0x1

    .line 980
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Cause:  A class needed by class "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " cannot be found: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 982
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "       "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v21 .. v21}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 983
    const-string/jumbo v27, "Action: Determine what extra JAR files are needed, and place them in:"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 985
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1004
    .end local v21    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    :cond_7
    const-string/jumbo v27, "This does not appear to be a task bundled with Ant."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1005
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Please take it up with the supplier of the third-party "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, "."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1007
    const-string/jumbo v27, "If you have written it yourself, you probably have a bug to fix."

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1010
    :cond_8
    invoke-virtual/range {v23 .. v23}, Ljava/io/PrintWriter;->println()V

    .line 1011
    const-string/jumbo v27, "This is not a bug; it is a configuration problem"

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public enterAntLib(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 740
    iput-object p1, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibCurrentUri:Ljava/lang/String;

    .line 741
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibStack:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 742
    return-void
.end method

.method public exitAntLib()V
    .locals 1

    .prologue
    .line 755
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 756
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibCurrentUri:Ljava/lang/String;

    .line 757
    return-void

    .line 756
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method public getAntTypeTable()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    return-object v0
.end method

.method public getComponentClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 298
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v0

    .line 299
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0
.end method

.method public getCurrentAntlibUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 748
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antLibCurrentUri:Ljava/lang/String;

    return-object v0
.end method

.method public getDataTypeDefinitions()Ljava/util/Hashtable;
    .locals 7

    .prologue
    .line 427
    iget-object v4, p0, Lorg/apache/tools/ant/ComponentHelper;->typeClassDefinitions:Ljava/util/Hashtable;

    monitor-enter v4

    .line 428
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 429
    :try_start_1
    iget-boolean v3, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTypeClassDefinitions:Z

    if-eqz v3, :cond_3

    .line 430
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->typeClassDefinitions:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->clear()V

    .line 431
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v3}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 432
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 433
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getExposedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 434
    .local v0, "clazz":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 437
    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.Task"

    invoke-static {v3}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 438
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->typeClassDefinitions:Ljava/util/Hashtable;

    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v6, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getTypeClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v3, v2, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 443
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v3

    .line 444
    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    .line 437
    .restart local v0    # "clazz":Ljava/lang/Class;
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_1
    :try_start_3
    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1

    .line 441
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v2    # "name":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTypeClassDefinitions:Z

    .line 443
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 444
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 445
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->typeClassDefinitions:Ljava/util/Hashtable;

    return-object v3
.end method

.method public getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;
    .locals 1
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ComponentHelper;->checkNamespace(Ljava/lang/String;)V

    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v0

    return-object v0
.end method

.method public getElementName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 598
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/ComponentHelper;->getElementName(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getElementName(Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "brief"    # Z

    .prologue
    .line 617
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 618
    .local v1, "elementClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 619
    .local v2, "elementClassname":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    monitor-enter v6

    .line 620
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v5}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 621
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 622
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v5

    if-ne v1, v5, :cond_0

    .line 624
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v4

    .line 625
    .local v4, "name":Ljava/lang/String;
    if-eqz p2, :cond_1

    move-object v5, v4

    :goto_0
    monitor-exit v6

    .line 629
    .end local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v4    # "name":Ljava/lang/String;
    :goto_1
    return-object v5

    .line 625
    .restart local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .restart local v4    # "name":Ljava/lang/String;
    :cond_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "The <"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v7, "> type"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 628
    .end local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v4    # "name":Ljava/lang/String;
    :cond_2
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 629
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, p2}, Lorg/apache/tools/ant/ComponentHelper;->getUnmappedElementName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 628
    .end local v3    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method public getNext()Lorg/apache/tools/ant/ComponentHelper;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->next:Lorg/apache/tools/ant/ComponentHelper;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getRestrictedDefinitions(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "componentName"    # Ljava/lang/String;

    .prologue
    .line 458
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    monitor-enter v1

    .line 459
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    monitor-exit v1

    return-object v0

    .line 460
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getTaskDefinitions()Ljava/util/Hashtable;
    .locals 7

    .prologue
    .line 398
    iget-object v4, p0, Lorg/apache/tools/ant/ComponentHelper;->taskClassDefinitions:Ljava/util/Hashtable;

    monitor-enter v4

    .line 399
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    monitor-enter v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 400
    :try_start_1
    iget-boolean v3, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTaskClassDefinitions:Z

    if-eqz v3, :cond_3

    .line 401
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->taskClassDefinitions:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->clear()V

    .line 402
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v3}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 403
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 404
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getExposedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 405
    .local v0, "clazz":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 408
    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.Task"

    invoke-static {v3}, Lorg/apache/tools/ant/ComponentHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 409
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->taskClassDefinitions:Ljava/util/Hashtable;

    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v6, v2}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getTypeClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v3, v2, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 414
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v3

    .line 415
    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    .line 408
    .restart local v0    # "clazz":Ljava/lang/Class;
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_1
    :try_start_3
    sget-object v3, Lorg/apache/tools/ant/ComponentHelper;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1

    .line 412
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v2    # "name":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/tools/ant/ComponentHelper;->rebuildTaskClassDefinitions:Z

    .line 414
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 415
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 416
    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper;->taskClassDefinitions:Ljava/util/Hashtable;

    return-object v3
.end method

.method public initDefaultDefinitions()V
    .locals 0

    .prologue
    .line 318
    invoke-direct {p0}, Lorg/apache/tools/ant/ComponentHelper;->initTasks()V

    .line 319
    invoke-direct {p0}, Lorg/apache/tools/ant/ComponentHelper;->initTypes()V

    .line 320
    return-void
.end method

.method public initSubProject(Lorg/apache/tools/ant/ComponentHelper;)V
    .locals 8
    .param p1, "helper"    # Lorg/apache/tools/ant/ComponentHelper;

    .prologue
    .line 232
    iget-object v5, p1, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v5}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    .line 233
    .local v4, "typeTable":Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    monitor-enter v6

    .line 234
    :try_start_0
    invoke-virtual {v4}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 235
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 236
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7, v0}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 238
    .end local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .restart local v1    # "i":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 240
    invoke-direct {p1}, Lorg/apache/tools/ant/ComponentHelper;->getCheckedNamespace()Ljava/util/Set;

    move-result-object v2

    .line 241
    .local v2, "inheritedCheckedNamespace":Ljava/util/Set;
    monitor-enter p0

    .line 242
    :try_start_2
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->checkedNamespaces:Ljava/util/HashSet;

    invoke-virtual {v5, v2}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 243
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 244
    invoke-direct {p1}, Lorg/apache/tools/ant/ComponentHelper;->getRestrictedDefinition()Ljava/util/Map;

    move-result-object v3

    .line 245
    .local v3, "inheritedRestrictedDef":Ljava/util/Map;
    iget-object v6, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    monitor-enter v6

    .line 246
    :try_start_3
    iget-object v5, p0, Lorg/apache/tools/ant/ComponentHelper;->restrictedDefinitions:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 247
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 248
    return-void

    .line 243
    .end local v3    # "inheritedRestrictedDef":Ljava/util/Map;
    :catchall_1
    move-exception v5

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v5

    .line 247
    .restart local v3    # "inheritedRestrictedDef":Ljava/util/Map;
    :catchall_2
    move-exception v5

    :try_start_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v5
.end method

.method public setNext(Lorg/apache/tools/ant/ComponentHelper;)V
    .locals 0
    .param p1, "next"    # Lorg/apache/tools/ant/ComponentHelper;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/tools/ant/ComponentHelper;->next:Lorg/apache/tools/ant/ComponentHelper;

    .line 174
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 191
    iput-object p1, p0, Lorg/apache/tools/ant/ComponentHelper;->project:Lorg/apache/tools/ant/Project;

    .line 192
    new-instance v0, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/ComponentHelper;->antTypeTable:Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;

    .line 193
    return-void
.end method
