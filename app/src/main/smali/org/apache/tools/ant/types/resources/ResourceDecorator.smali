.class public abstract Lorg/apache/tools/ant/types/resources/ResourceDecorator;
.super Lorg/apache/tools/ant/types/Resource;
.source "ResourceDecorator.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private resource:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 45
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 52
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 53
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 145
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
.method public final addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->checkChildrenAllowed()V

    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must not specify more than one resource"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 66
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->setChecked(Z)V

    .line 70
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    .line 71
    return-void
.end method

.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 170
    if-ne p1, p0, :cond_0

    .line 171
    const/4 v0, 0x0

    .line 177
    .end local p1    # "other":Ljava/lang/Object;
    :goto_0
    return v0

    .line 173
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lorg/apache/tools/ant/types/resources/ResourceDecorator;

    if-eqz v0, :cond_1

    .line 174
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    check-cast p1, Lorg/apache/tools/ant/types/resources/ResourceDecorator;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0

    .line 177
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stack"    # Ljava/util/Stack;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    :goto_0
    return-void

    .line 212
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 213
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/Resource;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 215
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 216
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->setChecked(Z)V

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method protected final getResource()Lorg/apache/tools/ant/types/Resource;
    .locals 2

    .prologue
    .line 193
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    .line 200
    :goto_0
    return-object v0

    .line 196
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    .line 197
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "no resource specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->dieOnCircularReference()V

    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    goto :goto_0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 113
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 185
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    shl-int/lit8 v0, v0, 0x4

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    return v0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 145
    sget-object v0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setDirectory(Z)V
    .locals 3
    .param p1, "directory"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 257
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "you can\'t change the directory state of a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setExists(Z)V
    .locals 3
    .param p1, "exists"    # Z

    .prologue
    .line 237
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "you can\'t change the exists state of a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setLastModified(J)V
    .locals 3
    .param p1, "lastmodified"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 247
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "you can\'t change the timestamp of a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "you can\'t change the name of a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 156
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 157
    return-void
.end method

.method public setSize(J)V
    .locals 3
    .param p1, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 267
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "you can\'t change the size of a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceDecorator;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
