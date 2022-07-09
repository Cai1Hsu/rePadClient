.class public final Lorg/apache/tools/ant/filters/ClassConstants;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "ClassConstants.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final JAVA_CLASS_HELPER:Ljava/lang/String; = "org.apache.tools.ant.filters.util.JavaClassHelper"

.field static array$B:Ljava/lang/Class;


# instance fields
.field private queuedData:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    .line 76
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 113
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
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 161
    new-instance v0, Lorg/apache/tools/ant/filters/ClassConstants;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/ClassConstants;-><init>(Ljava/io/Reader;)V

    .line 162
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/ClassConstants;
    return-object v0
.end method

.method public read()I
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 90
    const/4 v2, -0x1

    .line 92
    .local v2, "ch":I
    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    if-eqz v10, :cond_0

    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_0

    .line 93
    iput-object v13, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    .line 96
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    if-eqz v10, :cond_2

    .line 97
    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 98
    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    .line 99
    iget-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_1

    .line 100
    iput-object v13, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    :cond_1
    :goto_0
    move v10, v2

    .line 147
    :goto_1
    return v10

    .line 103
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ClassConstants;->readFully()Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "clazz":Ljava/lang/String;
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_4

    .line 105
    :cond_3
    const/4 v2, -0x1

    goto :goto_0

    .line 107
    :cond_4
    const-string/jumbo v10, "ISO-8859-1"

    invoke-virtual {v3, v10}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 109
    .local v1, "bytes":[B
    :try_start_0
    const-string/jumbo v10, "org.apache.tools.ant.filters.util.JavaClassHelper"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 111
    .local v6, "javaClassHelper":Ljava/lang/Class;
    if-eqz v6, :cond_1

    .line 112
    const/4 v10, 0x1

    new-array v7, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v10, Lorg/apache/tools/ant/filters/ClassConstants;->array$B:Ljava/lang/Class;

    if-nez v10, :cond_5

    const-string/jumbo v10, "[B"

    invoke-static {v10}, Lorg/apache/tools/ant/filters/ClassConstants;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/filters/ClassConstants;->array$B:Ljava/lang/Class;

    :goto_2
    aput-object v10, v7, v11

    .line 115
    .local v7, "params":[Ljava/lang/Class;
    const-string/jumbo v10, "getConstants"

    invoke-virtual {v6, v10, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 117
    .local v5, "getConstants":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    new-array v0, v10, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v0, v10

    .line 122
    .local v0, "args":[Ljava/lang/Object;
    const/4 v10, 0x0

    invoke-virtual {v5, v10, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/StringBuffer;

    .line 124
    .local v8, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-lez v10, :cond_1

    .line 125
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/filters/ClassConstants;->queuedData:Ljava/lang/String;

    .line 126
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ClassConstants;->read()I

    move-result v10

    goto :goto_1

    .line 112
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v5    # "getConstants":Ljava/lang/reflect/Method;
    .end local v7    # "params":[Ljava/lang/Class;
    .end local v8    # "sb":Ljava/lang/StringBuffer;
    :cond_5
    sget-object v10, Lorg/apache/tools/ant/filters/ClassConstants;->array$B:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_2

    .line 129
    .end local v6    # "javaClassHelper":Ljava/lang/Class;
    :catch_0
    move-exception v4

    .line 130
    .local v4, "ex":Ljava/lang/NoClassDefFoundError;
    throw v4

    .line 131
    .end local v4    # "ex":Ljava/lang/NoClassDefFoundError;
    :catch_1
    move-exception v4

    .line 132
    .local v4, "ex":Ljava/lang/RuntimeException;
    throw v4

    .line 133
    .end local v4    # "ex":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v4

    .line 134
    .local v4, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v4}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v9

    .line 135
    .local v9, "t":Ljava/lang/Throwable;
    instance-of v10, v9, Ljava/lang/NoClassDefFoundError;

    if-eqz v10, :cond_6

    .line 136
    check-cast v9, Ljava/lang/NoClassDefFoundError;

    .end local v9    # "t":Ljava/lang/Throwable;
    throw v9

    .line 138
    .restart local v9    # "t":Ljava/lang/Throwable;
    :cond_6
    instance-of v10, v9, Ljava/lang/RuntimeException;

    if-eqz v10, :cond_7

    .line 139
    check-cast v9, Ljava/lang/RuntimeException;

    .end local v9    # "t":Ljava/lang/Throwable;
    throw v9

    .line 141
    .restart local v9    # "t":Ljava/lang/Throwable;
    :cond_7
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 142
    .end local v4    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v9    # "t":Ljava/lang/Throwable;
    :catch_3
    move-exception v4

    .line 143
    .local v4, "ex":Ljava/lang/Exception;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v10
.end method
