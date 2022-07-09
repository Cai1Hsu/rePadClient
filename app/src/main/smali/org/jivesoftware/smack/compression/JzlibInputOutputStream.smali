.class public Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;
.super Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;
.source "JzlibInputOutputStream.java"


# static fields
.field private static ziClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static zoClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 34
    sput-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->zoClass:Ljava/lang/Class;

    .line 35
    sput-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->ziClass:Ljava/lang/Class;

    .line 39
    :try_start_0
    const-string/jumbo v0, "com.jcraft.jzlib.ZOutputStream"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->zoClass:Ljava/lang/Class;

    .line 40
    const-string/jumbo v0, "com.jcraft.jzlib.ZInputStream"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->ziClass:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :goto_0
    return-void

    .line 41
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/jivesoftware/smack/compression/XMPPInputOutputStream;-><init>()V

    .line 46
    const-string/jumbo v0, "zlib"

    iput-object v0, p0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->compressionMethod:Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method public getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 9
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 57
    sget-object v3, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->ziClass:Ljava/lang/Class;

    new-array v4, v8, [Ljava/lang/Class;

    const-class v5, Ljava/io/InputStream;

    aput-object v5, v4, v7

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 58
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v3, v8, [Ljava/lang/Object;

    aput-object p1, v3, v7

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 60
    .local v1, "in":Ljava/lang/Object;
    sget-object v3, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->ziClass:Ljava/lang/Class;

    const-string/jumbo v4, "setFlushMode"

    new-array v5, v8, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 61
    .local v2, "method":Ljava/lang/reflect/Method;
    new-array v3, v8, [Ljava/lang/Object;

    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    check-cast v1, Ljava/io/InputStream;

    .end local v1    # "in":Ljava/lang/Object;
    return-object v1
.end method

.method public getOutputStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 10
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 68
    sget-object v3, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->zoClass:Ljava/lang/Class;

    new-array v4, v9, [Ljava/lang/Class;

    const-class v5, Ljava/io/OutputStream;

    aput-object v5, v4, v7

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v8

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 69
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v3, v9, [Ljava/lang/Object;

    aput-object p1, v3, v7

    const/16 v4, 0x9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 71
    .local v2, "out":Ljava/lang/Object;
    sget-object v3, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->zoClass:Ljava/lang/Class;

    const-string/jumbo v4, "setFlushMode"

    new-array v5, v8, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 72
    .local v1, "method":Ljava/lang/reflect/Method;
    new-array v3, v8, [Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    check-cast v2, Ljava/io/OutputStream;

    .end local v2    # "out":Ljava/lang/Object;
    return-object v2
.end method

.method public isSupported()Z
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->zoClass:Ljava/lang/Class;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/jivesoftware/smack/compression/JzlibInputOutputStream;->ziClass:Ljava/lang/Class;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
