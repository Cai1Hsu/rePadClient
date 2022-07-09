.class public Lorg/jivesoftware/smackx/jingle/SmackLogger;
.super Ljava/lang/Object;
.source "SmackLogger.java"


# instance fields
.field private commonsLogger:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "classToLog":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->setupSmackLogger(Ljava/lang/Class;)V

    .line 58
    return-void
.end method

.method public static getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/jivesoftware/smackx/jingle/SmackLogger;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "classToLog":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/jivesoftware/smackx/jingle/SmackLogger;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method private setupSmackLogger(Ljava/lang/Class;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "classToLog":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    const-class v2, Lorg/jivesoftware/smackx/jingle/SmackLogger;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const-string/jumbo v3, "org.apache.commons.logging.LogFactory"

    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 69
    .local v0, "logFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v2, "getLog"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 71
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/logging/Log;

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .end local v0    # "logFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v2

    goto :goto_0

    .line 79
    :catch_1
    move-exception v2

    goto :goto_0

    .line 78
    :catch_2
    move-exception v2

    goto :goto_0

    .line 77
    :catch_3
    move-exception v2

    goto :goto_0

    .line 76
    :catch_4
    move-exception v2

    goto :goto_0

    .line 75
    :catch_5
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 136
    :goto_0
    return-void

    .line 134
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;
    .param p2, "inException"    # Ljava/lang/Exception;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 123
    :goto_0
    return-void

    .line 120
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 121
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public error(Ljava/lang/String;)V
    .locals 1
    .param p1, "inErrorMsg"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public error(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "inErrorMsg"    # Ljava/lang/String;
    .param p2, "inException"    # Ljava/lang/Exception;

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 96
    :goto_0
    return-void

    .line 93
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p2, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public info(Ljava/lang/String;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;

    .prologue
    .line 185
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 190
    :goto_0
    return-void

    .line 188
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public info(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;
    .param p2, "inException"    # Ljava/lang/Exception;

    .prologue
    .line 171
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 177
    :goto_0
    return-void

    .line 174
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 175
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 163
    :goto_0
    return-void

    .line 161
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "inDebugMsg"    # Ljava/lang/String;
    .param p2, "inException"    # Ljava/lang/Exception;

    .prologue
    .line 144
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/SmackLogger;->commonsLogger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 150
    :goto_0
    return-void

    .line 147
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method
