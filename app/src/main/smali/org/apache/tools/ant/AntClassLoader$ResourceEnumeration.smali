.class Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;
.super Ljava/lang/Object;
.source "AntClassLoader.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/AntClassLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResourceEnumeration"
.end annotation


# instance fields
.field private nextResource:Ljava/net/URL;

.field private pathElementsIndex:I

.field private resourceName:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/AntClassLoader;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/AntClassLoader;Ljava/lang/String;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/AntClassLoader;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->this$0:Lorg/apache/tools/ant/AntClassLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->resourceName:Ljava/lang/String;

    .line 109
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->pathElementsIndex:I

    .line 110
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->findNextResource()V

    .line 111
    return-void
.end method

.method private findNextResource()V
    .locals 4

    .prologue
    .line 145
    const/4 v1, 0x0

    .line 146
    .local v1, "url":Ljava/net/URL;
    :goto_0
    iget v2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->pathElementsIndex:I

    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->this$0:Lorg/apache/tools/ant/AntClassLoader;

    invoke-static {v3}, Lorg/apache/tools/ant/AntClassLoader;->access$000(Lorg/apache/tools/ant/AntClassLoader;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    if-nez v1, :cond_0

    .line 148
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->this$0:Lorg/apache/tools/ant/AntClassLoader;

    invoke-static {v2}, Lorg/apache/tools/ant/AntClassLoader;->access$000(Lorg/apache/tools/ant/AntClassLoader;)Ljava/util/Vector;

    move-result-object v2

    iget v3, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->pathElementsIndex:I

    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 149
    .local v0, "pathComponent":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->this$0:Lorg/apache/tools/ant/AntClassLoader;

    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->resourceName:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lorg/apache/tools/ant/AntClassLoader;->getResourceURL(Ljava/io/File;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 150
    iget v2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->pathElementsIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->pathElementsIndex:I
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    .end local v0    # "pathComponent":Ljava/io/File;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 156
    :cond_0
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->nextResource:Ljava/net/URL;

    .line 157
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->nextResource:Ljava/net/URL;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->nextResource:Ljava/net/URL;

    .line 131
    .local v0, "ret":Ljava/net/URL;
    if-nez v0, :cond_0

    .line 132
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 134
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;->findNextResource()V

    .line 135
    return-object v0
.end method
