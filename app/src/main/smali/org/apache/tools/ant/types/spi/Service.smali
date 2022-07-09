.class public Lorg/apache/tools/ant/types/spi/Service;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Service.java"


# instance fields
.field private providerList:Ljava/util/List;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->providerList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addConfiguredProvider(Lorg/apache/tools/ant/types/spi/Provider;)V
    .locals 1
    .param p1, "provider"    # Lorg/apache/tools/ant/types/spi/Provider;

    .prologue
    .line 58
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/spi/Provider;->check()V

    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->providerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    return-void
.end method

.method public check()V
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->type:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "type attribute must be set for service element"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/spi/Service;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 114
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->type:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 115
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Invalid empty type classname"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/spi/Service;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 118
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->providerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 119
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "provider attribute or nested provider element must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/spi/Service;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 123
    :cond_2
    return-void
.end method

.method public getAsStream()Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 93
    .local v0, "arrayOut":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/OutputStreamWriter;

    const-string/jumbo v4, "UTF-8"

    invoke-direct {v3, v0, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 94
    .local v3, "writer":Ljava/io/Writer;
    iget-object v4, p0, Lorg/apache/tools/ant/types/spi/Service;->providerList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 95
    .local v2, "providerIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 96
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/spi/Provider;

    .line 97
    .local v1, "provider":Lorg/apache/tools/ant/types/spi/Provider;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/spi/Provider;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 98
    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 100
    .end local v1    # "provider":Lorg/apache/tools/ant/types/spi/Provider;
    :cond_0
    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 101
    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v4
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/types/spi/Service;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 48
    new-instance v0, Lorg/apache/tools/ant/types/spi/Provider;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/spi/Provider;-><init>()V

    .line 49
    .local v0, "provider":Lorg/apache/tools/ant/types/spi/Provider;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/spi/Provider;->setClassName(Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lorg/apache/tools/ant/types/spi/Service;->providerList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/apache/tools/ant/types/spi/Service;->type:Ljava/lang/String;

    .line 77
    return-void
.end method
