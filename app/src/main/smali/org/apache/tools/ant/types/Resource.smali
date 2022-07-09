.class public Lorg/apache/tools/ant/types/Resource;
.super Lorg/apache/tools/ant/types/DataType;
.source "Resource.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/lang/Comparable;
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# static fields
.field protected static final MAGIC:I

.field private static final NULL_NAME:I

.field public static final UNKNOWN_DATETIME:J = 0x0L

.field public static final UNKNOWN_SIZE:J = -0x1L

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private directory:Ljava/lang/Boolean;

.field private exists:Ljava/lang/Boolean;

.field private lastmodified:Ljava/lang/Long;

.field private name:Ljava/lang/String;

.field private size:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-string/jumbo v0, "Resource"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/Resource;->MAGIC:I

    .line 50
    const-string/jumbo v0, "null name"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/Resource;->NULL_NAME:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 70
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 61
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    .line 62
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    .line 63
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    .line 64
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    .line 65
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 82
    const-wide/16 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v6, v3

    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;ZJZ)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZJ)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "exists"    # Z
    .param p3, "lastmodified"    # J

    .prologue
    .line 94
    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;ZJZ)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZJZ)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "exists"    # Z
    .param p3, "lastmodified"    # J
    .param p5, "directory"    # Z

    .prologue
    .line 107
    const-wide/16 v6, -0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move v5, p5

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/types/Resource;-><init>(Ljava/lang/String;ZJZJ)V

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZJZJ)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "exists"    # Z
    .param p3, "lastmodified"    # J
    .param p5, "directory"    # Z
    .param p6, "size"    # J

    .prologue
    const/4 v0, 0x0

    .line 120
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 61
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    .line 62
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    .line 63
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    .line 64
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    .line 65
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    .line 121
    iput-object p1, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    .line 122
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setName(Ljava/lang/String;)V

    .line 123
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/Resource;->setExists(Z)V

    .line 124
    invoke-virtual {p0, p3, p4}, Lorg/apache/tools/ant/types/Resource;->setLastModified(J)V

    .line 125
    invoke-virtual {p0, p5}, Lorg/apache/tools/ant/types/Resource;->setDirectory(Z)V

    .line 126
    invoke-virtual {p0, p6, p7}, Lorg/apache/tools/ant/types/Resource;->setSize(J)V

    .line 127
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 383
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

.method protected static getMagicNumber([B)I
    .locals 1
    .param p0, "seed"    # [B

    .prologue
    .line 58
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p0}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method


# virtual methods
.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 440
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p0    # "this":Lorg/apache/tools/ant/types/Resource;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lorg/apache/tools/ant/types/Resource;
    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 258
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 259
    :catch_0
    move-exception v0

    .line 260
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v2, "CloneNotSupportedException for a Resource caught. Derived classes must support cloning."

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 274
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Comparable;

    invoke-interface {v0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    .line 281
    :goto_0
    return v0

    .line 277
    :cond_0
    instance-of v0, p1, Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    .line 278
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can only be compared with Resources"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 291
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 294
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

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
    .line 320
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 321
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 323
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getLastModified()J
    .locals 5

    .prologue
    const-wide/16 v2, 0x0

    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 188
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    .line 194
    :cond_0
    :goto_0
    return-wide v0

    .line 190
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    if-nez v4, :cond_3

    :cond_2
    move-wide v0, v2

    .line 191
    goto :goto_0

    .line 193
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 194
    .local v0, "result":J
    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    move-wide v0, v2

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 337
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0

    .line 339
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    .line 247
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0

    :cond_1
    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 303
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 304
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 307
    :goto_0
    return v1

    .line 306
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "name":Ljava/lang/String;
    sget v2, Lorg/apache/tools/ant/types/Resource;->MAGIC:I

    if-nez v0, :cond_1

    sget v1, Lorg/apache/tools/ant/types/Resource;->NULL_NAME:I

    :goto_1
    mul-int/2addr v1, v2

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 211
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    .line 215
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    .line 164
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 382
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isFilesystemOnly()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/Resource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/Resource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    :cond_1
    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_2
    sget-object v0, Lorg/apache/tools/ant/types/Resource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 348
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Resource$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/Resource$1;-><init>(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0
.end method

.method public setDirectory(Z)V
    .locals 1
    .param p1, "directory"    # Z

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->checkAttributesAllowed()V

    .line 224
    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    .line 225
    return-void

    .line 224
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setExists(Z)V
    .locals 1
    .param p1, "exists"    # Z

    .prologue
    .line 172
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->checkAttributesAllowed()V

    .line 173
    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    .line 174
    return-void

    .line 173
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setLastModified(J)V
    .locals 1
    .param p1, "lastmodified"    # J

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->checkAttributesAllowed()V

    .line 203
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    .line 204
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->checkAttributesAllowed()V

    .line 152
    iput-object p1, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 416
    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->exists:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->lastmodified:Ljava/lang/Long;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->directory:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 421
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 423
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 424
    return-void
.end method

.method public setSize(J)V
    .locals 5
    .param p1, "size"    # J

    .prologue
    const-wide/16 v0, -0x1

    .line 233
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->checkAttributesAllowed()V

    .line 234
    new-instance v2, Ljava/lang/Long;

    cmp-long v3, p1, v0

    if-lez v3, :cond_0

    .end local p1    # "size":J
    :goto_0
    invoke-direct {v2, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v2, p0, Lorg/apache/tools/ant/types/Resource;->size:Ljava/lang/Long;

    .line 235
    return-void

    .restart local p1    # "size":J
    :cond_0
    move-wide p1, v0

    .line 234
    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 373
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final toLongString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 407
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getDataTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 392
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 393
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 396
    :cond_0
    :goto_0
    return-object v0

    .line 395
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, "n":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string/jumbo v0, "(anonymous)"

    goto :goto_0
.end method
