.class public Lorg/apache/tools/ant/TaskAdapter;
.super Lorg/apache/tools/ant/Task;
.source "TaskAdapter.java"

# interfaces
.implements Lorg/apache/tools/ant/TypeAdapter;


# static fields
.field static class$org$apache$tools$ant$Location:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;

.field static class$org$apache$tools$ant$dispatch$Dispatchable:Ljava/lang/Class;


# instance fields
.field private proxy:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "proxy"    # Ljava/lang/Object;

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/TaskAdapter;-><init>()V

    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/TaskAdapter;->setProxy(Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public static checkTaskClass(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)V
    .locals 6
    .param p0, "taskClass"    # Ljava/lang/Class;
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v5, 0x0

    .line 79
    sget-object v3, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$dispatch$Dispatchable:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.dispatch.Dispatchable"

    invoke-static {v3}, Lorg/apache/tools/ant/TaskAdapter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$dispatch$Dispatchable:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v3, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 83
    :try_start_0
    const-string/jumbo v4, "execute"

    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Class;

    invoke-virtual {p0, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 88
    .local v1, "executeM":Ljava/lang/reflect/Method;
    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 89
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "return type of execute() should be void but was \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\" in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 92
    .local v2, "message":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1

    .line 104
    .end local v1    # "executeM":Ljava/lang/reflect/Method;
    .end local v2    # "message":Ljava/lang/String;
    :cond_0
    return-void

    .line 79
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$dispatch$Dispatchable:Ljava/lang/Class;

    goto :goto_0

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "No public execute() in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 96
    .restart local v2    # "message":Ljava/lang/String;
    invoke-virtual {p1, v2, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 97
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "message":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/LinkageError;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Could not load "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 100
    .restart local v2    # "message":Ljava/lang/String;
    invoke-virtual {p1, v2, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 101
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 79
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
.method public checkProxyClass(Ljava/lang/Class;)V
    .locals 1
    .param p1, "proxyClass"    # Ljava/lang/Class;

    .prologue
    .line 113
    invoke-virtual {p0}, Lorg/apache/tools/ant/TaskAdapter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/apache/tools/ant/TaskAdapter;->checkTaskClass(Ljava/lang/Class;Lorg/apache/tools/ant/Project;)V

    .line 114
    return-void
.end method

.method public execute()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 124
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string/jumbo v6, "setLocation"

    const/4 v4, 0x1

    new-array v7, v4, [Ljava/lang/Class;

    const/4 v8, 0x0

    sget-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Location:Ljava/lang/Class;

    if-nez v4, :cond_2

    const-string/jumbo v4, "org.apache.tools.ant.Location"

    invoke-static {v4}, Lorg/apache/tools/ant/TaskAdapter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Location:Ljava/lang/Class;

    :goto_0
    aput-object v4, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 126
    .local v2, "setLocationM":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 127
    iget-object v4, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Lorg/apache/tools/ant/TaskAdapter;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .end local v2    # "setLocationM":Ljava/lang/reflect/Method;
    :cond_0
    :goto_1
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string/jumbo v6, "setProject"

    const/4 v4, 0x1

    new-array v7, v4, [Ljava/lang/Class;

    const/4 v8, 0x0

    sget-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v4, :cond_3

    const-string/jumbo v4, "org.apache.tools.ant.Project"

    invoke-static {v4}, Lorg/apache/tools/ant/TaskAdapter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_2
    aput-object v4, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 141
    .local v3, "setProjectM":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_1

    .line 142
    iget-object v4, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p0}, Lorg/apache/tools/ant/TaskAdapter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 154
    .end local v3    # "setProjectM":Ljava/lang/reflect/Method;
    :cond_1
    :goto_3
    :try_start_2
    iget-object v4, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-static {v4}, Lorg/apache/tools/ant/dispatch/DispatchUtils;->execute(Ljava/lang/Object;)V
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 161
    return-void

    .line 124
    :cond_2
    :try_start_3
    sget-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Location:Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 132
    :catch_0
    move-exception v1

    .line 133
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Error setting location in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v9}, Lorg/apache/tools/ant/TaskAdapter;->log(Ljava/lang/String;I)V

    .line 135
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 139
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_3
    :try_start_4
    sget-object v4, Lorg/apache/tools/ant/TaskAdapter;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 147
    :catch_1
    move-exception v1

    .line 148
    .restart local v1    # "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Error setting project in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v9}, Lorg/apache/tools/ant/TaskAdapter;->log(Ljava/lang/String;I)V

    .line 150
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 155
    .end local v1    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 156
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    throw v0

    .line 157
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    :catch_3
    move-exception v1

    .line 158
    .restart local v1    # "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Error in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/TaskAdapter;->log(Ljava/lang/String;I)V

    .line 159
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 144
    .end local v1    # "ex":Ljava/lang/Exception;
    :catch_4
    move-exception v4

    goto :goto_3

    .line 129
    :catch_5
    move-exception v4

    goto/16 :goto_1
.end method

.method public getProxy()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    return-object v0
.end method

.method public setProxy(Ljava/lang/Object;)V
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 169
    iput-object p1, p0, Lorg/apache/tools/ant/TaskAdapter;->proxy:Ljava/lang/Object;

    .line 170
    return-void
.end method
