.class public Lorg/apache/tools/ant/AntTypeDefinition;
.super Ljava/lang/Object;
.source "AntTypeDefinition.java"


# static fields
.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;


# instance fields
.field private adaptToClass:Ljava/lang/Class;

.field private adapterClass:Ljava/lang/Class;

.field private classLoader:Ljava/lang/ClassLoader;

.field private className:Ljava/lang/String;

.field private clazz:Ljava/lang/Class;

.field private name:Ljava/lang/String;

.field private restrict:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 324
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

.method private createAndSet(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 10
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "c"    # Ljava/lang/Class;

    .prologue
    .line 274
    :try_start_0
    invoke-virtual {p0, p2, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->innerCreateAndSet(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v5

    .line 275
    .local v5, "o":Ljava/lang/Object;
    return-object v5

    .line 276
    .end local v5    # "o":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 277
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v6

    .line 278
    .local v6, "t":Ljava/lang/Throwable;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not create type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " due to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 280
    .end local v1    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v6    # "t":Ljava/lang/Throwable;
    :catch_1
    move-exception v3

    .line 281
    .local v3, "ncdfe":Ljava/lang/NoClassDefFoundError;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": A class needed by class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " cannot be found: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 283
    .local v2, "msg":Ljava/lang/String;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 284
    .end local v2    # "msg":Ljava/lang/String;
    .end local v3    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    :catch_2
    move-exception v4

    .line 285
    .local v4, "nsme":Ljava/lang/NoSuchMethodException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not create type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " as the class "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " has no compatible constructor"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 287
    .end local v4    # "nsme":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v4

    .line 288
    .local v4, "nsme":Ljava/lang/InstantiationException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not create type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " as the class "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " is abstract"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 290
    .end local v4    # "nsme":Ljava/lang/InstantiationException;
    :catch_4
    move-exception v0

    .line 291
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not create type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " as the constructor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " is not accessible"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 293
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_5
    move-exception v6

    .line 294
    .restart local v6    # "t":Ljava/lang/Throwable;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Could not create type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " due to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method private extractClassname(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    .line 386
    if-nez p1, :cond_0

    const-string/jumbo v0, "<null>"

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private icreate(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 6
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v3, 0x0

    .line 215
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    .line 216
    .local v1, "c":Ljava/lang/Class;
    if-nez v1, :cond_1

    move-object v2, v3

    .line 234
    :cond_0
    :goto_0
    return-object v2

    .line 219
    :cond_1
    invoke-direct {p0, p1, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->createAndSet(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 220
    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    if-eqz v4, :cond_0

    .line 223
    iget-object v4, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    if-eqz v4, :cond_2

    .line 224
    iget-object v4, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 228
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    invoke-direct {p0, p1, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->createAndSet(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/TypeAdapter;

    .line 230
    .local v0, "adapterObject":Lorg/apache/tools/ant/TypeAdapter;
    if-nez v0, :cond_3

    move-object v2, v3

    .line 231
    goto :goto_0

    .line 233
    :cond_3
    invoke-interface {v0, v2}, Lorg/apache/tools/ant/TypeAdapter;->setProxy(Ljava/lang/Object;)V

    move-object v2, v0

    .line 234
    goto :goto_0
.end method


# virtual methods
.method public checkClass(Lorg/apache/tools/ant/Project;)V
    .locals 4
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 248
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    if-nez v1, :cond_0

    .line 249
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    .line 250
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    if-nez v1, :cond_0

    .line 251
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to create class for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 256
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    iget-object v2, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 258
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    invoke-direct {p0, p1, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->createAndSet(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/TypeAdapter;

    .line 260
    .local v0, "adapter":Lorg/apache/tools/ant/TypeAdapter;
    if-nez v0, :cond_2

    .line 261
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unable to create adapter object"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 263
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    invoke-interface {v0, v1}, Lorg/apache/tools/ant/TypeAdapter;->checkProxyClass(Ljava/lang/Class;)V

    .line 265
    .end local v0    # "adapter":Lorg/apache/tools/ant/TypeAdapter;
    :cond_3
    return-void
.end method

.method public create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 206
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->icreate(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 152
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    if-eqz v1, :cond_1

    .line 153
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    .line 154
    .local v0, "z":Ljava/lang/Class;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 158
    .end local v0    # "z":Ljava/lang/Class;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    if-nez v1, :cond_2

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    :goto_1
    move-object v0, v1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    goto :goto_1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;
    .locals 5
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v4, 0x4

    .line 168
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/AntTypeDefinition;->innerGetTypeClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 177
    :goto_0
    return-object v2

    .line 169
    :catch_0
    move-exception v1

    .line 170
    .local v1, "ncdfe":Ljava/lang/NoClassDefFoundError;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Could not load a dependent class ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ") for type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 177
    .end local v1    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 173
    :catch_1
    move-exception v0

    .line 174
    .local v0, "cnfe":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Could not load class ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ") for type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method public innerCreateAndSet(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 8
    .param p1, "newclass"    # Ljava/lang/Class;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 315
    const/4 v0, 0x0

    .line 316
    .local v0, "ctor":Ljava/lang/reflect/Constructor;
    const/4 v1, 0x0

    .line 320
    .local v1, "noArg":Z
    const/4 v4, 0x0

    :try_start_0
    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {p1, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 321
    const/4 v1, 0x1

    .line 328
    :goto_0
    if-eqz v1, :cond_1

    new-array v4, v6, [Ljava/lang/Object;

    :goto_1
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 332
    .local v3, "o":Ljava/lang/Object;
    invoke-virtual {p2, v3}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 333
    return-object v3

    .line 322
    .end local v3    # "o":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 324
    .local v2, "nse":Ljava/lang/NoSuchMethodException;
    new-array v5, v7, [Ljava/lang/Class;

    sget-object v4, Lorg/apache/tools/ant/AntTypeDefinition;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v4, :cond_0

    const-string/jumbo v4, "org.apache.tools.ant.Project"

    invoke-static {v4}, Lorg/apache/tools/ant/AntTypeDefinition;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/AntTypeDefinition;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_2
    aput-object v4, v5, v6

    invoke-virtual {p1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 325
    const/4 v1, 0x0

    goto :goto_0

    .line 324
    :cond_0
    sget-object v4, Lorg/apache/tools/ant/AntTypeDefinition;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    goto :goto_2

    .line 328
    .end local v2    # "nse":Ljava/lang/NoSuchMethodException;
    :cond_1
    new-array v4, v7, [Ljava/lang/Object;

    aput-object p2, v4, v6

    goto :goto_1
.end method

.method public innerGetTypeClass()Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    .line 196
    :goto_0
    return-object v0

    .line 191
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_1

    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    .line 196
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    goto :goto_0

    .line 194
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    goto :goto_1
.end method

.method public isRestrict()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    return v0
.end method

.method public sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 2
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 344
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p1, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    iget-boolean v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    iget-object v1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAdaptToClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "adaptToClass"    # Ljava/lang/Class;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    .line 123
    return-void
.end method

.method public setAdapterClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "adapterClass"    # Ljava/lang/Class;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    .line 114
    return-void
.end method

.method public setClass(Ljava/lang/Class;)V
    .locals 1
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 81
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->clazz:Ljava/lang/Class;

    .line 82
    if-nez p1, :cond_0

    .line 88
    :goto_0
    return-void

    .line 85
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    .line 87
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    if-nez v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    goto :goto_1

    .line 87
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    goto :goto_2
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->classLoader:Ljava/lang/ClassLoader;

    .line 132
    return-void
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->className:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->name:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setRestrict(Z)V
    .locals 0
    .param p1, "restrict"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    .line 49
    return-void
.end method

.method public similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 5
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v2, 0x0

    .line 364
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/AntTypeDefinition;->extractClassname(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lorg/apache/tools/ant/AntTypeDefinition;->adapterClass:Ljava/lang/Class;

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->extractClassname(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/AntTypeDefinition;->extractClassname(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lorg/apache/tools/ant/AntTypeDefinition;->adaptToClass:Ljava/lang/Class;

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/AntTypeDefinition;->extractClassname(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    iget-boolean v4, p1, Lorg/apache/tools/ant/AntTypeDefinition;->restrict:Z

    if-eq v3, v4, :cond_1

    .line 378
    :cond_0
    :goto_0
    return v2

    .line 376
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 377
    .local v1, "oldLoader":Ljava/lang/ClassLoader;
    invoke-virtual {p0}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 378
    .local v0, "newLoader":Ljava/lang/ClassLoader;
    if-eq v1, v0, :cond_2

    instance-of v3, v1, Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_0

    instance-of v3, v0, Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_0

    check-cast v1, Lorg/apache/tools/ant/AntClassLoader;

    .end local v1    # "oldLoader":Ljava/lang/ClassLoader;
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntClassLoader;->getClasspath()Ljava/lang/String;

    move-result-object v3

    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    .end local v0    # "newLoader":Ljava/lang/ClassLoader;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->getClasspath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method
