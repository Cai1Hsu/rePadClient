.class public Lorg/apache/tools/ant/types/resources/PropertyResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "PropertyResource.java"


# static fields
.field private static final PROPERTY_MAGIC:I

.field private static final UNSET:Ljava/io/InputStream;

.field static class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-string/jumbo v0, "PropertyResource"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/resources/PropertyResource;->PROPERTY_MAGIC:I

    .line 41
    new-instance v0, Lorg/apache/tools/ant/types/resources/PropertyResource$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/PropertyResource$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/resources/PropertyResource;->UNSET:Ljava/io/InputStream;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/PropertyResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 61
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 197
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
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 119
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 122
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 156
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 159
    :goto_0
    return-object v1

    .line 158
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v0

    .line 159
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_1

    sget-object v1, Lorg/apache/tools/ant/types/resources/PropertyResource;->UNSET:Ljava/io/InputStream;

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0
.end method

.method public getObjectValue()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/PropertyResource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v1

    .line 85
    :goto_0
    return-object v1

    .line 84
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 85
    .local v0, "p":Lorg/apache/tools/ant/Project;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 177
    :goto_0
    return-object v0

    .line 174
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isExists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 175
    new-instance v0, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/ImmutableResourceException;-><init>()V

    throw v0

    .line 177
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/util/PropertyOutputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/util/PropertyOutputStream;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;
    .locals 3

    .prologue
    .line 196
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 197
    sget-object v1, Lorg/apache/tools/ant/types/resources/PropertyResource;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.Resource"

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/PropertyResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/resources/PropertyResource;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v2, "resource"

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 201
    :goto_1
    return-object v1

    .line 197
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/PropertyResource;->class$org$apache$tools$ant$types$Resource:Ljava/lang/Class;

    goto :goto_0

    .line 199
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v0

    .line 200
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lorg/apache/tools/ant/types/Resource;

    if-eqz v1, :cond_2

    .line 201
    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    .end local v0    # "o":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_1

    .line 203
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "This PropertyResource does not reference or proxy another Resource"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSize()J
    .locals 4

    .prologue
    .line 105
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v2

    .line 109
    :goto_0
    return-wide v2

    .line 108
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v0

    .line 109
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_1

    const-wide/16 v2, 0x0

    goto :goto_0

    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    int-to-long v2, v1

    goto :goto_0
.end method

.method public getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/PropertyResource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 72
    :goto_0
    return-object v1

    .line 71
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 72
    .local v0, "p":Lorg/apache/tools/ant/Project;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v0

    .line 133
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->hashCode()I

    move-result v0

    sget v1, Lorg/apache/tools/ant/types/resources/PropertyResource;->PROPERTY_MAGIC:I

    mul-int/2addr v0, v1

    goto :goto_0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    .line 96
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isReferenceOrProxy()Z
    .locals 1

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getObjectValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->isReferenceOrProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getReferencedOrProxied()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/PropertyResource;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
