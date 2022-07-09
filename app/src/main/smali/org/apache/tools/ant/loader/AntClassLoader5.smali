.class public Lorg/apache/tools/ant/loader/AntClassLoader5;
.super Lorg/apache/tools/ant/AntClassLoader;
.source "AntClassLoader5.java"

# interfaces
.implements Ljava/io/Closeable;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V
    .locals 0
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .param p3, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .param p4, "parentFirst"    # Z

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/AntClassLoader;-><init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V

    .line 52
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/loader/AntClassLoader5;->cleanup()V

    .line 62
    return-void
.end method

.method public getResources(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/loader/AntClassLoader5;->getNamedResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method
