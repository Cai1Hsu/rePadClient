.class public Lorg/apache/tools/ant/Project;
.super Ljava/lang/Object;
.source "Project.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/Project$AntRefTable;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final JAVA_1_0:Ljava/lang/String; = "1.0"

.field public static final JAVA_1_1:Ljava/lang/String; = "1.1"

.field public static final JAVA_1_2:Ljava/lang/String; = "1.2"

.field public static final JAVA_1_3:Ljava/lang/String; = "1.3"

.field public static final JAVA_1_4:Ljava/lang/String; = "1.4"

.field public static final MSG_DEBUG:I = 0x4

.field public static final MSG_ERR:I = 0x0

.field public static final MSG_INFO:I = 0x2

.field public static final MSG_VERBOSE:I = 0x3

.field public static final MSG_WARN:I = 0x1

.field public static final TOKEN_END:Ljava/lang/String; = "@"

.field public static final TOKEN_START:Ljava/lang/String; = "@"

.field private static final VISITED:Ljava/lang/String; = "VISITED"

.field private static final VISITING:Ljava/lang/String; = "VISITING"

.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Task:Ljava/lang/Class;

.field static class$org$apache$tools$ant$helper$DefaultExecutor:Ljava/lang/Class;


# instance fields
.field private baseDir:Ljava/io/File;

.field private coreLoader:Ljava/lang/ClassLoader;

.field private defaultInputStream:Ljava/io/InputStream;

.field private defaultTarget:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

.field private globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

.field private idReferences:Ljava/util/HashMap;

.field private inputHandler:Lorg/apache/tools/ant/input/InputHandler;

.field private final isLoggingMessage:Ljava/lang/ThreadLocal;

.field private keepGoingMode:Z

.field private volatile listeners:[Lorg/apache/tools/ant/BuildListener;

.field private final listenersLock:Ljava/lang/Object;

.field private name:Ljava/lang/String;

.field private parentIdProject:Lorg/apache/tools/ant/Project;

.field private references:Ljava/util/Hashtable;

.field private targets:Ljava/util/Hashtable;

.field private final threadGroupTasks:Ljava/util/Map;

.field private final threadTasks:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 129
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v0, Lorg/apache/tools/ant/Project$AntRefTable;

    invoke-direct {v0}, Lorg/apache/tools/ant/Project$AntRefTable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    .line 141
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->idReferences:Ljava/util/HashMap;

    .line 144
    iput-object v2, p0, Lorg/apache/tools/ant/Project;->parentIdProject:Lorg/apache/tools/ant/Project;

    .line 150
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    .line 152
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/types/FilterSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 163
    new-instance v0, Lorg/apache/tools/ant/types/FilterSetCollection;

    iget-object v1, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/FilterSetCollection;-><init>(Lorg/apache/tools/ant/types/FilterSet;)V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    .line 170
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->listenersLock:Ljava/lang/Object;

    .line 173
    new-array v0, v3, [Lorg/apache/tools/ant/BuildListener;

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 177
    new-instance v0, Lorg/apache/tools/ant/Project$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/Project$1;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->isLoggingMessage:Ljava/lang/ThreadLocal;

    .line 187
    iput-object v2, p0, Lorg/apache/tools/ant/Project;->coreLoader:Ljava/lang/ClassLoader;

    .line 190
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    .line 194
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->threadGroupTasks:Ljava/util/Map;

    .line 200
    iput-object v2, p0, Lorg/apache/tools/ant/Project;->inputHandler:Lorg/apache/tools/ant/input/InputHandler;

    .line 205
    iput-object v2, p0, Lorg/apache/tools/ant/Project;->defaultInputStream:Ljava/io/InputStream;

    .line 210
    iput-boolean v3, p0, Lorg/apache/tools/ant/Project;->keepGoingMode:Z

    .line 258
    new-instance v0, Lorg/apache/tools/ant/input/DefaultInputHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/input/DefaultInputHandler;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->inputHandler:Lorg/apache/tools/ant/input/InputHandler;

    .line 259
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 325
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

.method private fireMessageLoggedEvent(Lorg/apache/tools/ant/BuildEvent;Ljava/lang/String;I)V
    .locals 6
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 2225
    if-nez p2, :cond_0

    .line 2226
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 2228
    :cond_0
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2229
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    sget-object v4, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v1, v3, v4

    .line 2230
    .local v1, "endIndex":I
    const/4 v3, 0x0

    invoke-virtual {p2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, p3}, Lorg/apache/tools/ant/BuildEvent;->setMessage(Ljava/lang/String;I)V

    .line 2234
    .end local v1    # "endIndex":I
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->isLoggingMessage:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-eq v3, v4, :cond_2

    .line 2259
    :goto_1
    return-void

    .line 2232
    :cond_1
    invoke-virtual {p1, p2, p3}, Lorg/apache/tools/ant/BuildEvent;->setMessage(Ljava/lang/String;I)V

    goto :goto_0

    .line 2251
    :cond_2
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->isLoggingMessage:Ljava/lang/ThreadLocal;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 2252
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2253
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v3, v0

    if-ge v2, v3, :cond_3

    .line 2254
    aget-object v3, v0, v2

    invoke-interface {v3, p1}, Lorg/apache/tools/ant/BuildListener;->messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2253
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 2257
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->isLoggingMessage:Ljava/lang/ThreadLocal;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_1

    .end local v0    # "currListeners":[Lorg/apache/tools/ant/BuildListener;
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/apache/tools/ant/Project;->isLoggingMessage:Ljava/lang/ThreadLocal;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v3
.end method

.method public static getJavaVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 906
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;
    .locals 5
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 1731
    instance-of v1, p0, Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v1, :cond_0

    .line 1732
    check-cast p0, Lorg/apache/tools/ant/ProjectComponent;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    .line 1742
    .restart local p0    # "o":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 1735
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string/jumbo v4, "getProject"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1736
    .local v0, "m":Ljava/lang/reflect/Method;
    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.Project"

    invoke-static {v1}, Lorg/apache/tools/ant/Project;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    if-ne v1, v3, :cond_2

    .line 1737
    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/Project;

    goto :goto_0

    .line 1736
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1739
    .end local v0    # "m":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    :cond_2
    move-object v1, v2

    .line 1742
    goto :goto_0
.end method

.method private static makeCircularException(Ljava/lang/String;Ljava/util/Stack;)Lorg/apache/tools/ant/BuildException;
    .locals 4
    .param p0, "end"    # Ljava/lang/String;
    .param p1, "stk"    # Ljava/util/Stack;

    .prologue
    .line 1944
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, "Circular dependency: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1945
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1948
    :cond_0
    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1949
    .local v0, "c":Ljava/lang/String;
    const-string/jumbo v2, " <- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1950
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1951
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1952
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v2
.end method

.method private setAntLib()V
    .locals 3

    .prologue
    .line 324
    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.Project"

    invoke-static {v1}, Lorg/apache/tools/ant/Project;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_0
    invoke-static {v1}, Lorg/apache/tools/ant/launch/Locator;->getClassSource(Ljava/lang/Class;)Ljava/io/File;

    move-result-object v0

    .line 326
    .local v0, "antlib":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 327
    const-string/jumbo v1, "ant.core.lib"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/Project;->setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    :cond_0
    return-void

    .line 324
    .end local v0    # "antlib":Ljava/io/File;
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    goto :goto_0
.end method

.method private setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 594
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lorg/apache/tools/ant/PropertyHelper;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z

    .line 595
    return-void
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1719
    const-string/jumbo v0, "on"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "yes"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static translatePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "toProcess"    # Ljava/lang/String;

    .prologue
    .line 1498
    invoke-static {p0}, Lorg/apache/tools/ant/util/FileUtils;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private tsort(Ljava/lang/String;Ljava/util/Hashtable;Ljava/util/Hashtable;Ljava/util/Stack;Ljava/util/Vector;)V
    .locals 13
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "targetTable"    # Ljava/util/Hashtable;
    .param p3, "state"    # Ljava/util/Hashtable;
    .param p4, "visiting"    # Ljava/util/Stack;
    .param p5, "ret"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1893
    const-string/jumbo v1, "VISITING"

    move-object/from16 v0, p3

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1894
    move-object/from16 v0, p4

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1896
    invoke-virtual {p2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/ant/Target;

    .line 1899
    .local v12, "target":Lorg/apache/tools/ant/Target;
    if-nez v12, :cond_1

    .line 1900
    new-instance v11, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "Target \""

    invoke-direct {v11, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1901
    .local v11, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1902
    const-string/jumbo v1, "\" does not exist in the project \""

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1903
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->name:Ljava/lang/String;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1904
    const-string/jumbo v1, "\". "

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1905
    invoke-virtual/range {p4 .. p4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 1906
    invoke-virtual/range {p4 .. p4}, Ljava/util/Stack;->empty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1907
    invoke-virtual/range {p4 .. p4}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 1908
    .local v10, "parent":Ljava/lang/String;
    const-string/jumbo v1, "It is used from target \""

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1909
    invoke-virtual {v11, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1910
    const-string/jumbo v1, "\"."

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1912
    .end local v10    # "parent":Ljava/lang/String;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v11}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    invoke-direct {v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1914
    .end local v11    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    invoke-virtual {v12}, Lorg/apache/tools/ant/Target;->getDependencies()Ljava/util/Enumeration;

    move-result-object v7

    .local v7, "en":Ljava/util/Enumeration;
    :cond_2
    :goto_0
    invoke-interface {v7}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1915
    invoke-interface {v7}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1916
    .local v2, "cur":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1917
    .local v8, "m":Ljava/lang/String;
    if-nez v8, :cond_3

    move-object v1, p0

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    .line 1919
    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/Project;->tsort(Ljava/lang/String;Ljava/util/Hashtable;Ljava/util/Hashtable;Ljava/util/Stack;Ljava/util/Vector;)V

    goto :goto_0

    .line 1920
    :cond_3
    const-string/jumbo v1, "VISITING"

    if-ne v8, v1, :cond_2

    .line 1922
    move-object/from16 v0, p4

    invoke-static {v2, v0}, Lorg/apache/tools/ant/Project;->makeCircularException(Ljava/lang/String;Ljava/util/Stack;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 1925
    .end local v2    # "cur":Ljava/lang/String;
    .end local v8    # "m":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p4 .. p4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 1926
    .local v9, "p":Ljava/lang/String;
    if-eq p1, v9, :cond_5

    .line 1927
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unexpected internal error: expected to pop "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " but got "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1930
    :cond_5
    const-string/jumbo v1, "VISITED"

    move-object/from16 v0, p3

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1931
    move-object/from16 v0, p5

    invoke-virtual {v0, v12}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1932
    return-void
.end method


# virtual methods
.method public addBuildListener(Lorg/apache/tools/ant/BuildListener;)V
    .locals 7
    .param p1, "listener"    # Lorg/apache/tools/ant/BuildListener;

    .prologue
    .line 388
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->listenersLock:Ljava/lang/Object;

    monitor-enter v3

    .line 390
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 391
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    aget-object v2, v2, v0

    if-ne v2, p1, :cond_0

    .line 392
    monitor-exit v3

    .line 402
    :goto_1
    return-void

    .line 390
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 396
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    new-array v1, v2, [Lorg/apache/tools/ant/BuildListener;

    .line 398
    .local v1, "newListeners":[Lorg/apache/tools/ant/BuildListener;
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v6, v6

    invoke-static {v2, v4, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 399
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    aput-object p1, v1, v2

    .line 400
    iput-object v1, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 401
    monitor-exit v3

    goto :goto_1

    .end local v1    # "newListeners":[Lorg/apache/tools/ant/BuildListener;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public addDataTypeDefinition(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "typeName"    # Ljava/lang/String;
    .param p2, "typeClass"    # Ljava/lang/Class;

    .prologue
    .line 1057
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->addDataTypeDefinition(Ljava/lang/String;Ljava/lang/Class;)V

    .line 1059
    return-void
.end method

.method public addFilter(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 796
    if-nez p1, :cond_0

    .line 800
    :goto_0
    return-void

    .line 799
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    new-instance v1, Lorg/apache/tools/ant/types/FilterSet$Filter;

    invoke-direct {v1, p1, p2}, Lorg/apache/tools/ant/types/FilterSet$Filter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterSet;->addFilter(Lorg/apache/tools/ant/types/FilterSet$Filter;)V

    goto :goto_0
.end method

.method public addIdReference(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1970
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->idReferences:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1971
    return-void
.end method

.method public addOrReplaceTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V
    .locals 3
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 1140
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, " +Target: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1141
    .local v0, "msg":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1142
    invoke-virtual {p2, p0}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 1143
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1144
    return-void
.end method

.method public addOrReplaceTarget(Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 1127
    invoke-virtual {p1}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/Project;->addOrReplaceTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 1128
    return-void
.end method

.method public addReference(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "referenceName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1980
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    check-cast v1, Lorg/apache/tools/ant/Project$AntRefTable;

    invoke-static {v1, p1}, Lorg/apache/tools/ant/Project$AntRefTable;->access$000(Lorg/apache/tools/ant/Project$AntRefTable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1981
    .local v0, "old":Ljava/lang/Object;
    if-ne v0, p2, :cond_0

    .line 1991
    :goto_0
    return-void

    .line 1985
    :cond_0
    if-eqz v0, :cond_1

    instance-of v1, v0, Lorg/apache/tools/ant/UnknownElement;

    if-nez v1, :cond_1

    .line 1986
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Overriding previous definition of reference to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1989
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Adding reference: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1990
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public addTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V
    .locals 3
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "target"    # Lorg/apache/tools/ant/Target;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1113
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1114
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Duplicate target: `"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1116
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/Project;->addOrReplaceTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 1117
    return-void
.end method

.method public addTarget(Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1096
    invoke-virtual {p1}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/Project;->addTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 1097
    return-void
.end method

.method public addTaskDefinition(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "taskName"    # Ljava/lang/String;
    .param p2, "taskClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 971
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ComponentHelper;->addTaskDefinition(Ljava/lang/String;Ljava/lang/Class;)V

    .line 973
    return-void
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

    .line 988
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/ComponentHelper;->checkTaskClass(Ljava/lang/Class;)V

    .line 990
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 991
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 992
    .local v1, "message":Ljava/lang/String;
    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 993
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 995
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 996
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is abstract"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 997
    .restart local v1    # "message":Ljava/lang/String;
    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 998
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1001
    .end local v1    # "message":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    :try_start_0
    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1

    .line 1014
    sget-object v2, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v2, :cond_3

    const-string/jumbo v2, "org.apache.tools.ant.Task"

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1015
    invoke-static {p1, p0}, Lorg/apache/tools/ant/TaskAdapter;->checkTaskClass(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)V

    .line 1017
    :cond_2
    return-void

    .line 1004
    :catch_0
    move-exception v0

    .line 1005
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

    .line 1007
    .restart local v1    # "message":Ljava/lang/String;
    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1008
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1009
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local v1    # "message":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 1010
    .local v0, "e":Ljava/lang/LinkageError;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Could not load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1011
    .restart local v1    # "message":Ljava/lang/String;
    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1012
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1014
    .end local v0    # "e":Ljava/lang/LinkageError;
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    sget-object v2, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_0
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1608
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 1609
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Z)V
    .locals 2
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1628
    sget-object v1, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;)V

    .line 1630
    return-void

    .line 1628
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;ZZ)V
    .locals 2
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1652
    sget-object v1, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    invoke-virtual {v1, p1, p2, v0, p4}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Z)V

    .line 1654
    return-void

    .line 1652
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;ZZZ)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1682
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 1684
    return-void

    .line 1682
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1516
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 1517
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filtering"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1536
    sget-object v1, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;)V

    .line 1538
    return-void

    .line 1536
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1560
    sget-object v1, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    invoke-virtual {v1, p1, p2, v0, p4}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;Z)V

    .line 1562
    return-void

    .line 1560
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1590
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    if-eqz p3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/Project;->globalFilters:Lorg/apache/tools/ant/types/FilterSetCollection;

    :goto_0
    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 1592
    return-void

    .line 1590
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public copyInheritedProperties(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 697
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/PropertyHelper;->copyInheritedProperties(Lorg/apache/tools/ant/Project;)V

    .line 698
    return-void
.end method

.method public copyUserProperties(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 681
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/PropertyHelper;->copyUserProperties(Lorg/apache/tools/ant/Project;)V

    .line 682
    return-void
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 354
    const/4 v0, 0x1

    invoke-static {p1, p0, p2, v0}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;
    .locals 2
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 339
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p0, p1, v1}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

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
    .line 1195
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createDataType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public createSubProject()Lorg/apache/tools/ant/Project;
    .locals 3

    .prologue
    .line 269
    const/4 v1, 0x0

    .line 271
    .local v1, "subProject":Lorg/apache/tools/ant/Project;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "subProject":Lorg/apache/tools/ant/Project;
    check-cast v1, Lorg/apache/tools/ant/Project;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    .restart local v1    # "subProject":Lorg/apache/tools/ant/Project;
    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->initSubProject(Lorg/apache/tools/ant/Project;)V

    .line 276
    return-object v1

    .line 272
    .end local v1    # "subProject":Lorg/apache/tools/ant/Project;
    :catch_0
    move-exception v0

    .line 273
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/apache/tools/ant/Project;

    invoke-direct {v1}, Lorg/apache/tools/ant/Project;-><init>()V

    .restart local v1    # "subProject":Lorg/apache/tools/ant/Project;
    goto :goto_0
.end method

.method public createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;
    .locals 1
    .param p1, "taskType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1179
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ComponentHelper;->createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    return-object v0
.end method

.method public defaultInput([BII)I
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1292
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->defaultInputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 1293
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 1294
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->defaultInputStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0

    .line 1296
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    const-string/jumbo v1, "No input provided for project"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public demuxFlush(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "output"    # Ljava/lang/String;
    .param p2, "isError"    # Z

    .prologue
    .line 1334
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->getThreadTask(Ljava/lang/Thread;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 1335
    .local v0, "task":Lorg/apache/tools/ant/Task;
    if-nez v0, :cond_1

    .line 1336
    if-eqz p2, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0, p0, p1, v1}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Project;Ljava/lang/String;I)V

    .line 1344
    :goto_1
    return-void

    .line 1336
    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    .line 1338
    :cond_1
    if-eqz p2, :cond_2

    .line 1339
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_1

    .line 1341
    :cond_2
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public demuxInput([BII)I
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1314
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->getThreadTask(Ljava/lang/Thread;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 1315
    .local v0, "task":Lorg/apache/tools/ant/Task;
    if-nez v0, :cond_0

    .line 1316
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->defaultInput([BII)I

    move-result v1

    .line 1318
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v1

    goto :goto_0
.end method

.method public demuxOutput(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "output"    # Ljava/lang/String;
    .param p2, "isWarning"    # Z

    .prologue
    .line 1265
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->getThreadTask(Ljava/lang/Thread;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 1266
    .local v0, "task":Lorg/apache/tools/ant/Task;
    if-nez v0, :cond_1

    .line 1267
    if-eqz p2, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p0, p1, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1275
    :goto_1
    return-void

    .line 1267
    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    .line 1269
    :cond_1
    if-eqz p2, :cond_2

    .line 1270
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_1

    .line 1272
    :cond_2
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public executeSortedTargets(Ljava/util/Vector;)V
    .locals 12
    .param p1, "sortedTargets"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 1378
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 1379
    .local v7, "succeededTargets":Ljava/util/Set;
    const/4 v0, 0x0

    .line 1380
    .local v0, "buildException":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .line 1381
    .local v6, "iter":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 1382
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/Target;

    .line 1383
    .local v2, "curtarget":Lorg/apache/tools/ant/Target;
    const/4 v1, 0x1

    .line 1384
    .local v1, "canExecute":Z
    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getDependencies()Ljava/util/Enumeration;

    move-result-object v3

    .line 1385
    .local v3, "depIter":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1386
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1387
    .local v4, "dependencyName":Ljava/lang/String;
    invoke-interface {v7, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 1388
    const/4 v1, 0x0

    .line 1389
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Cannot execute \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' - \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' failed or was not executed."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v2, v9, v11}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    .line 1396
    .end local v4    # "dependencyName":Ljava/lang/String;
    :cond_2
    if-eqz v1, :cond_0

    .line 1397
    const/4 v8, 0x0

    .line 1399
    .local v8, "thrownException":Ljava/lang/Throwable;
    :try_start_0
    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->performTasks()V

    .line 1400
    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 1412
    :goto_1
    if-eqz v8, :cond_0

    .line 1413
    instance-of v9, v8, Lorg/apache/tools/ant/BuildException;

    if-eqz v9, :cond_5

    .line 1414
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Target \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' failed with message \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v8}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\'."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v2, v9, v11}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    .line 1419
    if-nez v0, :cond_0

    move-object v0, v8

    .line 1420
    check-cast v0, Lorg/apache/tools/ant/BuildException;

    goto/16 :goto_0

    .line 1401
    :catch_0
    move-exception v5

    .line 1402
    .local v5, "ex":Ljava/lang/RuntimeException;
    iget-boolean v9, p0, Lorg/apache/tools/ant/Project;->keepGoingMode:Z

    if-nez v9, :cond_3

    .line 1403
    throw v5

    .line 1405
    :cond_3
    move-object v8, v5

    .line 1411
    goto :goto_1

    .line 1406
    .end local v5    # "ex":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v5

    .line 1407
    .local v5, "ex":Ljava/lang/Throwable;
    iget-boolean v9, p0, Lorg/apache/tools/ant/Project;->keepGoingMode:Z

    if-nez v9, :cond_4

    .line 1408
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 1410
    :cond_4
    move-object v8, v5

    goto :goto_1

    .line 1423
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_5
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Target \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' failed with message \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v8}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\'."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v2, v9, v11}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    .line 1427
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v8, v9}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 1428
    if-nez v0, :cond_0

    .line 1429
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    .end local v0    # "buildException":Lorg/apache/tools/ant/BuildException;
    invoke-direct {v0, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .restart local v0    # "buildException":Lorg/apache/tools/ant/BuildException;
    goto/16 :goto_0

    .line 1436
    .end local v1    # "canExecute":Z
    .end local v2    # "curtarget":Lorg/apache/tools/ant/Target;
    .end local v3    # "depIter":Ljava/util/Enumeration;
    .end local v8    # "thrownException":Ljava/lang/Throwable;
    :cond_6
    if-eqz v0, :cond_7

    .line 1437
    throw v0

    .line 1439
    :cond_7
    return-void
.end method

.method public executeTarget(Ljava/lang/String;)V
    .locals 3
    .param p1, "targetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1359
    if-nez p1, :cond_0

    .line 1360
    const-string/jumbo v0, "No target specified"

    .line 1361
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1368
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Lorg/apache/tools/ant/Project;->topoSort(Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->executeSortedTargets(Ljava/util/Vector;)V

    .line 1369
    return-void
.end method

.method public executeTargets(Ljava/util/Vector;)V
    .locals 2
    .param p1, "names"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1249
    const-string/jumbo v0, "ant.project.invoked-targets"

    invoke-static {p1}, Lorg/apache/tools/ant/util/CollectionUtils;->flattenToString(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1251
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getExecutor()Lorg/apache/tools/ant/Executor;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-interface {v1, p0, v0}, Lorg/apache/tools/ant/Executor;->executeTargets(Lorg/apache/tools/ant/Project;[Ljava/lang/String;)V

    .line 1253
    return-void
.end method

.method public fireBuildFinished(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 2089
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 2090
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2091
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2092
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2093
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->buildFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2092
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2096
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/IntrospectionHelper;->clearCache()V

    .line 2097
    return-void
.end method

.method public fireBuildStarted()V
    .locals 4

    .prologue
    .line 2074
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 2075
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2076
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2077
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->buildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2076
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2079
    :cond_0
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Project;Ljava/lang/String;I)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 2272
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 2273
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "priority"    # I

    .prologue
    .line 2288
    new-instance v0, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 2289
    .local v0, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2290
    invoke-direct {p0, v0, p2, p4}, Lorg/apache/tools/ant/Project;->fireMessageLoggedEvent(Lorg/apache/tools/ant/BuildEvent;Ljava/lang/String;I)V

    .line 2291
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 2304
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Target;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 2305
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Target;Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "priority"    # I

    .prologue
    .line 2320
    new-instance v0, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Target;)V

    .line 2321
    .local v0, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2322
    invoke-direct {p0, v0, p2, p4}, Lorg/apache/tools/ant/Project;->fireMessageLoggedEvent(Lorg/apache/tools/ant/BuildEvent;Ljava/lang/String;I)V

    .line 2323
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Task;Ljava/lang/String;I)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 2335
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 2336
    return-void
.end method

.method protected fireMessageLogged(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "priority"    # I

    .prologue
    .line 2351
    new-instance v0, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 2352
    .local v0, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2353
    invoke-direct {p0, v0, p2, p4}, Lorg/apache/tools/ant/Project;->fireMessageLoggedEvent(Lorg/apache/tools/ant/BuildEvent;Ljava/lang/String;I)V

    .line 2354
    return-void
.end method

.method public fireSubBuildFinished(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 2125
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 2126
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2127
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2128
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 2129
    aget-object v3, v0, v2

    instance-of v3, v3, Lorg/apache/tools/ant/SubBuildListener;

    if-eqz v3, :cond_0

    .line 2130
    aget-object v3, v0, v2

    check-cast v3, Lorg/apache/tools/ant/SubBuildListener;

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/SubBuildListener;->subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2128
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2133
    :cond_1
    return-void
.end method

.method public fireSubBuildStarted()V
    .locals 4

    .prologue
    .line 2106
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 2107
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2108
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 2109
    aget-object v3, v0, v2

    instance-of v3, v3, Lorg/apache/tools/ant/SubBuildListener;

    if-eqz v3, :cond_0

    .line 2110
    aget-object v3, v0, v2

    check-cast v3, Lorg/apache/tools/ant/SubBuildListener;

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/SubBuildListener;->subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2108
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2113
    :cond_1
    return-void
.end method

.method protected fireTargetFinished(Lorg/apache/tools/ant/Target;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .param p2, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 2162
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Target;)V

    .line 2163
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2164
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2165
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2166
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->targetFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2165
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2169
    :cond_0
    return-void
.end method

.method protected fireTargetStarted(Lorg/apache/tools/ant/Target;)V
    .locals 4
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 2143
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Target;)V

    .line 2144
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2145
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2146
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->targetStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2145
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2149
    :cond_0
    return-void
.end method

.method protected fireTaskFinished(Lorg/apache/tools/ant/Task;Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 2199
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/Project;->registerThreadTask(Ljava/lang/Thread;Lorg/apache/tools/ant/Task;)V

    .line 2200
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/io/PrintStream;->flush()V

    .line 2201
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/io/PrintStream;->flush()V

    .line 2202
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 2203
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/BuildEvent;->setException(Ljava/lang/Throwable;)V

    .line 2204
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2205
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2206
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->taskFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2205
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2209
    :cond_0
    return-void
.end method

.method protected fireTaskStarted(Lorg/apache/tools/ant/Task;)V
    .locals 4
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 2180
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {p0, v3, p1}, Lorg/apache/tools/ant/Project;->registerThreadTask(Ljava/lang/Thread;Lorg/apache/tools/ant/Task;)V

    .line 2181
    new-instance v1, Lorg/apache/tools/ant/BuildEvent;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/BuildEvent;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 2182
    .local v1, "event":Lorg/apache/tools/ant/BuildEvent;
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 2183
    .local v0, "currListeners":[Lorg/apache/tools/ant/BuildListener;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 2184
    aget-object v3, v0, v2

    invoke-interface {v3, v1}, Lorg/apache/tools/ant/BuildListener;->taskStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 2183
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2186
    :cond_0
    return-void
.end method

.method public getBaseDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 864
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    if-nez v1, :cond_0

    .line 866
    :try_start_0
    const-string/jumbo v1, "."

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 871
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    return-object v1

    .line 867
    :catch_0
    move-exception v0

    .line 868
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->printStackTrace()V

    goto :goto_0
.end method

.method public getBuildListeners()Ljava/util/Vector;
    .locals 4

    .prologue
    .line 434
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->listenersLock:Ljava/lang/Object;

    monitor-enter v3

    .line 435
    :try_start_0
    new-instance v1, Ljava/util/Vector;

    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    invoke-direct {v1, v2}, Ljava/util/Vector;-><init>(I)V

    .line 436
    .local v1, "r":Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 437
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 436
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 439
    :cond_0
    monitor-exit v3

    return-object v1

    .line 440
    .end local v0    # "i":I
    .end local v1    # "r":Ljava/util/Vector;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getCopyOfDataTypeDefinitions()Ljava/util/Map;
    .locals 2

    .prologue
    .line 1082
    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getCopyOfReferences()Ljava/util/Map;
    .locals 2

    .prologue
    .line 2022
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getCopyOfTargets()Ljava/util/Map;
    .locals 2

    .prologue
    .line 1162
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getCopyOfTaskDefinitions()Ljava/util/Map;
    .locals 2

    .prologue
    .line 1040
    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getTaskDefinitions()Ljava/util/Hashtable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getCoreLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->coreLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public getDataTypeDefinitions()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 1069
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/ComponentHelper;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->defaultInputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getDefaultTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 721
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->defaultTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 776
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->description:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 777
    invoke-static {p0}, Lorg/apache/tools/ant/types/Description;->getDescription(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/Project;->description:Ljava/lang/String;

    .line 779
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getElementName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 2066
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ComponentHelper;->getElementName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExecutor()Lorg/apache/tools/ant/Executor;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1211
    const-string/jumbo v4, "ant.executor"

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1212
    .local v2, "o":Ljava/lang/Object;
    if-nez v2, :cond_3

    .line 1213
    const-string/jumbo v4, "ant.executor.class"

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1214
    .local v0, "classname":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1215
    sget-object v4, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$helper$DefaultExecutor:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "org.apache.tools.ant.helper.DefaultExecutor"

    invoke-static {v4}, Lorg/apache/tools/ant/Project;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$helper$DefaultExecutor:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1217
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Attempting to create object of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1219
    const/4 v4, 0x1

    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/Project;->coreLoader:Ljava/lang/ClassLoader;

    invoke-static {v0, v4, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 1230
    :goto_1
    if-nez v2, :cond_2

    .line 1231
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Unable to obtain a Target Executor instance."

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1215
    :cond_1
    sget-object v4, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$helper$DefaultExecutor:Ljava/lang/Class;

    goto :goto_0

    .line 1220
    :catch_0
    move-exception v3

    .line 1223
    .local v3, "seaEnEfEx":Ljava/lang/ClassNotFoundException;
    :try_start_1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto :goto_1

    .line 1224
    :catch_1
    move-exception v1

    .line 1225
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 1227
    .end local v1    # "ex":Ljava/lang/Exception;
    .end local v3    # "seaEnEfEx":Ljava/lang/ClassNotFoundException;
    :catch_2
    move-exception v1

    .line 1228
    .restart local v1    # "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1

    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_2
    move-object v4, v2

    .line 1234
    check-cast v4, Lorg/apache/tools/ant/Executor;

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/Project;->setExecutor(Lorg/apache/tools/ant/Executor;)V

    .line 1236
    .end local v0    # "classname":Ljava/lang/String;
    :cond_3
    check-cast v2, Lorg/apache/tools/ant/Executor;

    .end local v2    # "o":Ljava/lang/Object;
    return-object v2
.end method

.method public getFilters()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 816
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FilterSet;->getFilterHash()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->globalFilterSet:Lorg/apache/tools/ant/types/FilterSet;

    return-object v0
.end method

.method public getInheritedProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 665
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/PropertyHelper;->getInheritedProperties()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getInputHandler()Lorg/apache/tools/ant/input/InputHandler;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->inputHandler:Lorg/apache/tools/ant/input/InputHandler;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 756
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 648
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/PropertyHelper;->getProperties()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 607
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 608
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getReference(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 2035
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2036
    .local v0, "ret":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 2049
    :cond_0
    :goto_0
    return-object v0

    .line 2039
    :cond_1
    const-string/jumbo v1, "ant.PropertyHelper"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2041
    :try_start_0
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/PropertyHelper;->containsProperties(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2042
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unresolvable reference "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " might be a misuse of property expansion syntax."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2045
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getReferences()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 2000
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    return-object v0
.end method

.method public getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2474
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getTargets()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 1152
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->targets:Ljava/util/Hashtable;

    return-object v0
.end method

.method public getTaskDefinitions()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 1027
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/ComponentHelper;->getTaskDefinitions()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getThreadTask(Ljava/lang/Thread;)Lorg/apache/tools/ant/Task;
    .locals 4
    .param p1, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 2384
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    monitor-enter v3

    .line 2385
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/Task;

    .line 2386
    .local v1, "task":Lorg/apache/tools/ant/Task;
    if-nez v1, :cond_0

    .line 2387
    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v0

    .line 2388
    .local v0, "group":Ljava/lang/ThreadGroup;
    :goto_0
    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 2389
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->threadGroupTasks:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "task":Lorg/apache/tools/ant/Task;
    check-cast v1, Lorg/apache/tools/ant/Task;

    .line 2390
    .restart local v1    # "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {v0}, Ljava/lang/ThreadGroup;->getParent()Ljava/lang/ThreadGroup;

    move-result-object v0

    goto :goto_0

    .line 2393
    .end local v0    # "group":Ljava/lang/ThreadGroup;
    :cond_0
    monitor-exit v3

    return-object v1

    .line 2394
    .end local v1    # "task":Lorg/apache/tools/ant/Task;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getUserProperties()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 656
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/PropertyHelper;->getUserProperties()Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method

.method public getUserProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 639
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/PropertyHelper;->getUserProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hasReference(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 2009
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->references:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public inheritIDReferences(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "parent"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 1960
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->parentIdProject:Lorg/apache/tools/ant/Project;

    .line 1961
    return-void
.end method

.method public init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->initProperties()V

    .line 302
    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/ComponentHelper;->initDefaultDefinitions()V

    .line 303
    return-void
.end method

.method public initProperties()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 311
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->setJavaVersionProperty()V

    .line 312
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->setSystemProperties()V

    .line 313
    const-string/jumbo v0, "ant.version"

    invoke-static {}, Lorg/apache/tools/ant/Main;->getAntVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/Project;->setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    invoke-direct {p0}, Lorg/apache/tools/ant/Project;->setAntLib()V

    .line 315
    return-void
.end method

.method public initSubProject(Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "subProject"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 284
    invoke-static {p1}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    invoke-static {p0}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/ComponentHelper;->initSubProject(Lorg/apache/tools/ant/ComponentHelper;)V

    .line 286
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getDefaultInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->setDefaultInputStream(Ljava/io/InputStream;)V

    .line 287
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->isKeepGoingMode()Z

    move-result v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->setKeepGoingMode(Z)V

    .line 288
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getExecutor()Lorg/apache/tools/ant/Executor;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/Executor;->getSubProjectExecutor()Lorg/apache/tools/ant/Executor;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->setExecutor(Lorg/apache/tools/ant/Executor;)V

    .line 289
    return-void
.end method

.method public isKeepGoingMode()Z
    .locals 1

    .prologue
    .line 895
    iget-boolean v0, p0, Lorg/apache/tools/ant/Project;->keepGoingMode:Z

    return v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 450
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 451
    return-void
.end method

.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "msgLevel"    # I

    .prologue
    .line 459
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 460
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .param p3, "msgLevel"    # I

    .prologue
    .line 470
    invoke-virtual {p0, p0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 471
    return-void
.end method

.method public log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "msgLevel"    # I

    .prologue
    .line 503
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 504
    return-void
.end method

.method public log(Lorg/apache/tools/ant/Target;Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 0
    .param p1, "target"    # Lorg/apache/tools/ant/Target;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "msgLevel"    # I

    .prologue
    .line 517
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Target;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 518
    return-void
.end method

.method public log(Lorg/apache/tools/ant/Task;Ljava/lang/String;I)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "msgLevel"    # I

    .prologue
    .line 480
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 481
    return-void
.end method

.method public log(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;
    .param p4, "msgLevel"    # I

    .prologue
    .line 492
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/Project;->fireMessageLogged(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 493
    return-void
.end method

.method public registerThreadTask(Ljava/lang/Thread;Lorg/apache/tools/ant/Task;)V
    .locals 3
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 2365
    iget-object v1, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    monitor-enter v1

    .line 2366
    if-eqz p2, :cond_0

    .line 2367
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2368
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->threadGroupTasks:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v2

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2373
    :goto_0
    monitor-exit v1

    .line 2374
    return-void

    .line 2370
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->threadTasks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2371
    iget-object v0, p0, Lorg/apache/tools/ant/Project;->threadGroupTasks:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2373
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeBuildListener(Lorg/apache/tools/ant/BuildListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/apache/tools/ant/BuildListener;

    .prologue
    .line 412
    iget-object v3, p0, Lorg/apache/tools/ant/Project;->listenersLock:Ljava/lang/Object;

    monitor-enter v3

    .line 414
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 415
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    aget-object v2, v2, v0

    if-ne v2, p1, :cond_1

    .line 416
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    new-array v1, v2, [Lorg/apache/tools/ant/BuildListener;

    .line 418
    .local v1, "newListeners":[Lorg/apache/tools/ant/BuildListener;
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 419
    iget-object v2, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    add-int/lit8 v4, v0, 0x1

    iget-object v5, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    array-length v5, v5

    sub-int/2addr v5, v0

    add-int/lit8 v5, v5, -0x1

    invoke-static {v2, v4, v1, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 421
    iput-object v1, p0, Lorg/apache/tools/ant/Project;->listeners:[Lorg/apache/tools/ant/BuildListener;

    .line 425
    .end local v1    # "newListeners":[Lorg/apache/tools/ant/BuildListener;
    :cond_0
    monitor-exit v3

    .line 426
    return-void

    .line 414
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 425
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public replaceProperties(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 626
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, v1, p1, v1}, Lorg/apache/tools/ant/PropertyHelper;->replaceProperties(Ljava/lang/String;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public resolveFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 1475
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v1, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public resolveFile(Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "rootDir"    # Ljava/io/File;

    .prologue
    .line 1459
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p2, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public setBaseDir(Ljava/io/File;)V
    .locals 4
    .param p1, "baseDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 842
    sget-object v1, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 843
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 844
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Basedir "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 847
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_1

    .line 848
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Basedir "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 851
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    .line 852
    const-string/jumbo v1, "basedir"

    iget-object v2, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/Project;->setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 853
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Project base dir set to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/Project;->baseDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 854
    .local v0, "msg":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 855
    return-void
.end method

.method public setBasedir(Ljava/lang/String;)V
    .locals 1
    .param p1, "baseD"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 829
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Project;->setBaseDir(Ljava/io/File;)V

    .line 830
    return-void
.end method

.method public setCoreLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "coreLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 365
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->coreLoader:Ljava/lang/ClassLoader;

    .line 366
    return-void
.end method

.method public setDefault(Ljava/lang/String;)V
    .locals 1
    .param p1, "defaultTarget"    # Ljava/lang/String;

    .prologue
    .line 732
    if-eqz p1, :cond_0

    .line 733
    const-string/jumbo v0, "ant.project.default-target"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->defaultTarget:Ljava/lang/String;

    .line 736
    return-void
.end method

.method public setDefaultInputStream(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "defaultInputStream"    # Ljava/io/InputStream;

    .prologue
    .line 231
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->defaultInputStream:Ljava/io/InputStream;

    .line 232
    return-void
.end method

.method public setDefaultTarget(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultTarget"    # Ljava/lang/String;

    .prologue
    .line 712
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/Project;->setDefault(Ljava/lang/String;)V

    .line 713
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 766
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->description:Ljava/lang/String;

    .line 767
    return-void
.end method

.method public setExecutor(Lorg/apache/tools/ant/Executor;)V
    .locals 1
    .param p1, "e"    # Lorg/apache/tools/ant/Executor;

    .prologue
    .line 1203
    const-string/jumbo v0, "ant.executor"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1204
    return-void
.end method

.method public setFileLastModified(Ljava/io/File;J)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "time"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1703
    sget-object v0, Lorg/apache/tools/ant/Project;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V

    .line 1704
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Setting modification time for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1705
    return-void
.end method

.method public setInheritedProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 582
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setInheritedProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 583
    return-void
.end method

.method public setInputHandler(Lorg/apache/tools/ant/input/InputHandler;)V
    .locals 0
    .param p1, "handler"    # Lorg/apache/tools/ant/input/InputHandler;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->inputHandler:Lorg/apache/tools/ant/input/InputHandler;

    .line 219
    return-void
.end method

.method public setJavaVersionProperty()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    .line 920
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaVersion()Ljava/lang/String;

    move-result-object v0

    .line 921
    .local v0, "javaVersion":Ljava/lang/String;
    const-string/jumbo v1, "ant.java.version"

    invoke-direct {p0, v1, v0}, Lorg/apache/tools/ant/Project;->setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 924
    const-string/jumbo v1, "1.4"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isAtLeastJavaVersion(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 925
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Ant cannot work on Java prior to 1.4"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 927
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Detected Java version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " in: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "java.home"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 930
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Detected OS: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "os.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 931
    return-void
.end method

.method public setKeepGoingMode(Z)V
    .locals 0
    .param p1, "keepGoingMode"    # Z

    .prologue
    .line 884
    iput-boolean p1, p0, Lorg/apache/tools/ant/Project;->keepGoingMode:Z

    .line 885
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 746
    const-string/jumbo v0, "ant.project.name"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    iput-object p1, p0, Lorg/apache/tools/ant/Project;->name:Ljava/lang/String;

    .line 748
    return-void
.end method

.method public setNewProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 553
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 554
    return-void
.end method

.method public final setProjectReference(Ljava/lang/Object;)V
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 2448
    instance-of v1, p1, Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v1, :cond_1

    .line 2449
    check-cast p1, Lorg/apache/tools/ant/ProjectComponent;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/ProjectComponent;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 2464
    :cond_0
    :goto_0
    return-void

    .line 2453
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "setProject"

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.tools.ant.Project"

    invoke-static {v1}, Lorg/apache/tools/ant/Project;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_1
    aput-object v1, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 2456
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_0

    .line 2457
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2459
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 2453
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/Project;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 538
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lorg/apache/tools/ant/PropertyHelper;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z

    .line 539
    return-void
.end method

.method public setSystemProperties()V
    .locals 5

    .prologue
    .line 938
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    .line 939
    .local v2, "systemP":Ljava/util/Properties;
    invoke-virtual {v2}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 940
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 941
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 942
    .local v1, "propertyName":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 943
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 944
    invoke-direct {p0, v1, v3}, Lorg/apache/tools/ant/Project;->setPropertyInternal(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 947
    .end local v1    # "propertyName":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public setUserProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 566
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setUserProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 567
    return-void
.end method

.method public final topoSort(Ljava/lang/String;Ljava/util/Hashtable;)Ljava/util/Vector;
    .locals 3
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "targetTable"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1761
    new-array v0, v2, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, v2}, Lorg/apache/tools/ant/Project;->topoSort([Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public final topoSort(Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;
    .locals 2
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "targetTable"    # Ljava/util/Hashtable;
    .param p3, "returnAll"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1783
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/tools/ant/Project;->topoSort([Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public final topoSort([Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;
    .locals 18
    .param p1, "root"    # [Ljava/lang/String;
    .param p2, "targetTable"    # Ljava/util/Hashtable;
    .param p3, "returnAll"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1805
    new-instance v6, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v6}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    .line 1806
    .local v6, "ret":Ljava/util/Vector;
    new-instance v4, Ljava/util/Hashtable;

    invoke-direct {v4}, Ljava/util/Hashtable;-><init>()V

    .line 1807
    .local v4, "state":Ljava/util/Hashtable;
    new-instance v5, Ljava/util/Stack;

    invoke-direct {v5}, Ljava/util/Stack;-><init>()V

    .line 1817
    .local v5, "visiting":Ljava/util/Stack;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v1, v0

    if-ge v15, v1, :cond_2

    .line 1818
    aget-object v1, p1, v15

    invoke-virtual {v4, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 1819
    .local v17, "st":Ljava/lang/String;
    if-nez v17, :cond_1

    .line 1820
    aget-object v2, p1, v15

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/Project;->tsort(Ljava/lang/String;Ljava/util/Hashtable;Ljava/util/Hashtable;Ljava/util/Stack;Ljava/util/Vector;)V

    .line 1817
    :cond_0
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 1821
    :cond_1
    const-string/jumbo v1, "VISITING"

    move-object/from16 v0, v17

    if-ne v0, v1, :cond_0

    .line 1822
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unexpected node in visiting state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p1, v15

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1826
    .end local v17    # "st":Ljava/lang/String;
    :cond_2
    new-instance v13, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "Build sequence for target(s)"

    invoke-direct {v13, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1828
    .local v13, "buf":Ljava/lang/StringBuffer;
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_1
    move-object/from16 v0, p1

    array-length v1, v0

    move/from16 v0, v16

    if-ge v0, v1, :cond_4

    .line 1829
    if-nez v16, :cond_3

    const-string/jumbo v1, " `"

    :goto_2
    invoke-virtual {v13, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    aget-object v2, p1, v16

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1828
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 1829
    :cond_3
    const-string/jumbo v1, ", `"

    goto :goto_2

    .line 1831
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, " is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1832
    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1834
    if-eqz p3, :cond_6

    move-object v12, v6

    .line 1835
    .local v12, "complete":Ljava/util/Vector;
    :goto_3
    invoke-virtual/range {p2 .. p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v14

    .local v14, "en":Ljava/util/Enumeration;
    :cond_5
    :goto_4
    invoke-interface {v14}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1836
    invoke-interface {v14}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1837
    .local v8, "curTarget":Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 1838
    .restart local v17    # "st":Ljava/lang/String;
    if-nez v17, :cond_7

    move-object/from16 v7, p0

    move-object/from16 v9, p2

    move-object v10, v4

    move-object v11, v5

    .line 1839
    invoke-direct/range {v7 .. v12}, Lorg/apache/tools/ant/Project;->tsort(Ljava/lang/String;Ljava/util/Hashtable;Ljava/util/Hashtable;Ljava/util/Stack;Ljava/util/Vector;)V

    goto :goto_4

    .line 1834
    .end local v8    # "curTarget":Ljava/lang/String;
    .end local v12    # "complete":Ljava/util/Vector;
    .end local v14    # "en":Ljava/util/Enumeration;
    .end local v17    # "st":Ljava/lang/String;
    :cond_6
    new-instance v12, Ljava/util/Vector;

    invoke-direct {v12, v6}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    goto :goto_3

    .line 1840
    .restart local v8    # "curTarget":Ljava/lang/String;
    .restart local v12    # "complete":Ljava/util/Vector;
    .restart local v14    # "en":Ljava/util/Enumeration;
    .restart local v17    # "st":Ljava/lang/String;
    :cond_7
    const-string/jumbo v1, "VISITING"

    move-object/from16 v0, v17

    if-ne v0, v1, :cond_5

    .line 1841
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unexpected node in visiting state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1845
    .end local v8    # "curTarget":Ljava/lang/String;
    .end local v17    # "st":Ljava/lang/String;
    :cond_8
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Complete build sequence is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1846
    return-object v6
.end method
