.class public Lorg/apache/tools/ant/taskdefs/condition/HasMethod;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "HasMethod.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private classname:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private field:Ljava/lang/String;

.field private ignoreSystemClasses:Z

.field private loader:Lorg/apache/tools/ant/AntClassLoader;

.field private method:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->ignoreSystemClasses:Z

    return-void
.end method

.method private isFieldFound(Ljava/lang/Class;)Z
    .locals 5
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 171
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 172
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 173
    aget-object v0, v1, v2

    .line 174
    .local v0, "fieldEntry":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->field:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 175
    const/4 v3, 0x1

    .line 178
    .end local v0    # "fieldEntry":Ljava/lang/reflect/Field;
    :goto_1
    return v3

    .line 172
    .restart local v0    # "fieldEntry":Ljava/lang/reflect/Field;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    .end local v0    # "fieldEntry":Ljava/lang/reflect/Field;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private isMethodFound(Ljava/lang/Class;)Z
    .locals 5
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 183
    .local v2, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 184
    aget-object v1, v2, v0

    .line 185
    .local v1, "methodEntry":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 186
    const/4 v3, 0x1

    .line 189
    .end local v1    # "methodEntry":Ljava/lang/reflect/Method;
    :goto_1
    return v3

    .line 183
    .restart local v1    # "methodEntry":Ljava/lang/reflect/Method;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    .end local v1    # "methodEntry":Ljava/lang/reflect/Method;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 6
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 109
    :try_start_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->ignoreSystemClasses:Z

    if-eqz v3, :cond_0

    .line 110
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 111
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->setParentFirst(Z)V

    .line 112
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->addJavaLibraries()V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_2

    .line 114
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v3

    .line 133
    :goto_0
    return-object v3

    .line 115
    :catch_0
    move-exception v2

    .line 117
    .local v2, "se":Ljava/lang/SecurityException;
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "class \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" was found but a"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " SecurityException has been"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " raised while loading it"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_2

    .line 136
    .end local v2    # "se":Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "class \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" was not found"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 123
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_0
    :try_start_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_1

    .line 125
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 130
    .local v1, "l":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_2

    .line 131
    const/4 v3, 0x1

    invoke-static {p1, v3, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    goto :goto_0

    .line 133
    :cond_2
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v3

    goto :goto_0

    .line 139
    .end local v1    # "l":Ljava/lang/ClassLoader;
    :catch_2
    move-exception v0

    .line 140
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not load dependent class \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" for class \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 59
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public eval()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 149
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classname:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 150
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "No classname defined"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 152
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 154
    .local v1, "preLoadClass":Ljava/lang/ClassLoader;
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classname:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 155
    .local v0, "clazz":Ljava/lang/Class;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->method:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 156
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->isMethodFound(Ljava/lang/Class;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 163
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eq v1, v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_1

    .line 164
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 165
    :goto_0
    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 159
    :cond_1
    return v2

    .line 158
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->field:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 159
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->isFieldFound(Ljava/lang/Class;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    .line 163
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eq v1, v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_1

    .line 164
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 161
    :cond_3
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Neither method nor field defined"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 163
    .end local v0    # "clazz":Ljava/lang/Class;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eq v1, v3, :cond_4

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_4

    .line 164
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 165
    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 163
    :cond_4
    throw v2
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->classname:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 48
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 70
    return-void
.end method

.method public setField(Ljava/lang/String;)V
    .locals 0
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->field:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setIgnoreSystemClasses(Z)V
    .locals 0
    .param p1, "ignoreSystemClasses"    # Z

    .prologue
    .line 101
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->ignoreSystemClasses:Z

    .line 102
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasMethod;->method:Ljava/lang/String;

    .line 86
    return-void
.end method
