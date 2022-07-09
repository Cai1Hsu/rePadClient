.class public Lorg/apache/tools/ant/taskdefs/condition/IsReachable;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "IsReachable.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field public static final DEFAULT_TIMEOUT:I = 0x1e

.field public static final ERROR_BAD_TIMEOUT:Ljava/lang/String; = "Invalid timeout value"

.field public static final ERROR_BAD_URL:Ljava/lang/String; = "Bad URL "

.field public static final ERROR_BOTH_TARGETS:Ljava/lang/String; = "Both url and host have been specified"

.field public static final ERROR_NO_HOSTNAME:Ljava/lang/String; = "No hostname defined"

.field public static final ERROR_NO_HOST_IN_URL:Ljava/lang/String; = "No hostname in URL "

.field public static final ERROR_ON_NETWORK:Ljava/lang/String; = "network error to "

.field public static final METHOD_NAME:Ljava/lang/String; = "isReachable"

.field public static final MSG_NO_REACHABLE_TEST:Ljava/lang/String; = "cannot do a proper reachability test on this Java version"

.field private static final SECOND:I = 0x3e8

.field private static final WARN_UNKNOWN_HOST:Ljava/lang/String; = "Unknown host: "

.field static class$java$net$InetAddress:Ljava/lang/Class;

.field private static parameterTypes:[Ljava/lang/Class;


# instance fields
.field private host:Ljava/lang/String;

.field private timeout:I

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 132
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->parameterTypes:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 64
    const/16 v0, 0x1e

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->timeout:I

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 179
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

.method private empty(Ljava/lang/String;)Z
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 129
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public eval()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v12, 0x3

    .line 143
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->host:Ljava/lang/String;

    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->empty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->empty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 144
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "No hostname defined"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 146
    :cond_0
    iget v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->timeout:I

    if-gez v9, :cond_1

    .line 147
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Invalid timeout value"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 149
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->host:Ljava/lang/String;

    .line 150
    .local v8, "target":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->empty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 151
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->host:Ljava/lang/String;

    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->empty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 152
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Both url and host have been specified"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 156
    :cond_2
    :try_start_0
    new-instance v7, Ljava/net/URL;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    invoke-direct {v7, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 157
    .local v7, "realURL":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    .line 158
    invoke-direct {p0, v8}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->empty(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 159
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "No hostname in URL "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .end local v7    # "realURL":Ljava/net/URL;
    :catch_0
    move-exception v1

    .line 162
    .local v1, "e":Ljava/net/MalformedURLException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Bad URL "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 165
    .end local v1    # "e":Ljava/net/MalformedURLException;
    :cond_3
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Probing host "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v12}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;I)V

    .line 168
    :try_start_1
    invoke-static {v8}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 173
    .local v0, "address":Ljava/net/InetAddress;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Host address = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v12}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;I)V

    .line 177
    const/4 v6, 0x0

    .line 179
    .local v6, "reachableMethod":Ljava/lang/reflect/Method;
    :try_start_2
    sget-object v9, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->class$java$net$InetAddress:Ljava/lang/Class;

    if-nez v9, :cond_4

    const-string/jumbo v9, "java.net.InetAddress"

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->class$java$net$InetAddress:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v10, "isReachable"

    sget-object v11, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->parameterTypes:[Ljava/lang/Class;

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 181
    const/4 v9, 0x1

    new-array v4, v9, [Ljava/lang/Object;

    .line 182
    .local v4, "params":[Ljava/lang/Object;
    const/4 v9, 0x0

    new-instance v10, Ljava/lang/Integer;

    iget v11, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->timeout:I

    mul-int/lit16 v11, v11, 0x3e8

    invoke-direct {v10, v11}, Ljava/lang/Integer;-><init>(I)V

    aput-object v10, v4, v9
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_3

    .line 184
    :try_start_3
    invoke-virtual {v6, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_3

    move-result v5

    .line 204
    .end local v4    # "params":[Ljava/lang/Object;
    .local v5, "reachable":Z
    :goto_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "host is"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    if-eqz v5, :cond_5

    const-string/jumbo v9, ""

    :goto_2
    invoke-virtual {v10, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " reachable"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v12}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;I)V

    .line 205
    .end local v0    # "address":Ljava/net/InetAddress;
    .end local v5    # "reachable":Z
    .end local v6    # "reachableMethod":Ljava/lang/reflect/Method;
    :goto_3
    return v5

    .line 169
    :catch_1
    move-exception v2

    .line 170
    .local v2, "e1":Ljava/net/UnknownHostException;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unknown host: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;)V

    goto :goto_3

    .line 179
    .end local v2    # "e1":Ljava/net/UnknownHostException;
    .restart local v0    # "address":Ljava/net/InetAddress;
    .restart local v6    # "reachableMethod":Ljava/lang/reflect/Method;
    :cond_4
    :try_start_4
    sget-object v9, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->class$java$net$InetAddress:Ljava/lang/Class;

    goto :goto_0

    .line 186
    .restart local v4    # "params":[Ljava/lang/Object;
    :catch_2
    move-exception v1

    .line 188
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "When calling "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_3

    .line 196
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v4    # "params":[Ljava/lang/Object;
    :catch_3
    move-exception v1

    .line 198
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    const-string/jumbo v9, "Not found: InetAddress.isReachable"

    invoke-virtual {p0, v9, v12}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;I)V

    .line 199
    const-string/jumbo v9, "cannot do a proper reachability test on this Java version"

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;)V

    .line 200
    const/4 v5, 0x1

    .restart local v5    # "reachable":Z
    goto :goto_1

    .line 189
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v5    # "reachable":Z
    .restart local v4    # "params":[Ljava/lang/Object;
    :catch_4
    move-exception v1

    .line 191
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v3

    .line 192
    .local v3, "nested":Ljava/lang/Throwable;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "network error to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->log(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_3

    .line 194
    const/4 v5, 0x0

    .restart local v5    # "reachable":Z
    goto/16 :goto_1

    .line 204
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v3    # "nested":Ljava/lang/Throwable;
    .end local v4    # "params":[Ljava/lang/Object;
    :cond_5
    const-string/jumbo v9, " not"

    goto/16 :goto_2
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->host:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setTimeout(I)V
    .locals 0
    .param p1, "timeout"    # I

    .prologue
    .line 118
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->timeout:I

    .line 119
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReachable;->url:Ljava/lang/String;

    .line 110
    return-void
.end method
