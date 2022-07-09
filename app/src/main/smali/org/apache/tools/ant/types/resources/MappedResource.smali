.class public Lorg/apache/tools/ant/types/resources/MappedResource;
.super Lorg/apache/tools/ant/types/resources/ResourceDecorator;
.source "MappedResource.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private final mapper:Lorg/apache/tools/ant/util/FileNameMapper;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "m"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 43
    iput-object p2, p0, Lorg/apache/tools/ant/types/resources/MappedResource;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 44
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 74
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
.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 74
    sget-object v0, Lorg/apache/tools/ant/types/resources/MappedResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/MappedResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/MappedResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/resources/MappedResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 93
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 99
    :cond_0
    :goto_0
    return v3

    :cond_1
    move-object v0, p1

    .line 96
    check-cast v0, Lorg/apache/tools/ant/types/resources/MappedResource;

    .line 97
    .local v0, "m":Lorg/apache/tools/ant/types/resources/MappedResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getName()Ljava/lang/String;

    move-result-object v1

    .line 98
    .local v1, "myName":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getName()Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "otherName":Ljava/lang/String;
    if-nez v1, :cond_2

    if-nez v2, :cond_0

    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1
.end method

.method public getName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v1

    .line 51
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 55
    .end local v1    # "name":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 54
    .restart local v1    # "name":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/MappedResource;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-interface {v2, v1}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "mapped":[Ljava/lang/String;
    if-eqz v0, :cond_1

    array-length v2, v0

    if-lez v2, :cond_1

    const/4 v2, 0x0

    aget-object v2, v0, v2

    :goto_1
    move-object v1, v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, "n":Ljava/lang/String;
    if-nez v0, :cond_0

    invoke-super {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->hashCode()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/MappedResource;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/MappedResource;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 66
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 67
    return-void
.end method
