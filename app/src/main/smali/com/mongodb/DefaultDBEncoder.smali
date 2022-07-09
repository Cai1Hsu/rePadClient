.class public Lcom/mongodb/DefaultDBEncoder;
.super Lorg/bson/BasicBSONEncoder;
.source "DefaultDBEncoder.java"

# interfaces
.implements Lcom/mongodb/DBEncoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DefaultDBEncoder$DefaultFactory;
    }
.end annotation


# static fields
.field public static FACTORY:Lcom/mongodb/DBEncoderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 88
    new-instance v0, Lcom/mongodb/DefaultDBEncoder$DefaultFactory;

    invoke-direct {v0}, Lcom/mongodb/DefaultDBEncoder$DefaultFactory;-><init>()V

    sput-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/bson/BasicBSONEncoder;-><init>()V

    .line 91
    return-void
.end method


# virtual methods
.method protected putDBPointer(Ljava/lang/String;Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "oid"    # Lorg/bson/types/ObjectId;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 67
    const/16 v0, 0xc

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DefaultDBEncoder;->_put(BLjava/lang/String;)V

    .line 69
    invoke-virtual {p0, p2}, Lcom/mongodb/DefaultDBEncoder;->_putValueString(Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p3}, Lorg/bson/types/ObjectId;->_time()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 71
    iget-object v0, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p3}, Lorg/bson/types/ObjectId;->_machine()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 72
    iget-object v0, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p3}, Lorg/bson/types/ObjectId;->_inc()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 73
    return-void
.end method

.method protected putDBRef(Ljava/lang/String;Lcom/mongodb/DBRefBase;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ref"    # Lcom/mongodb/DBRefBase;

    .prologue
    const/4 v3, 0x0

    .line 76
    const/4 v1, 0x3

    invoke-virtual {p0, v1, p1}, Lcom/mongodb/DefaultDBEncoder;->_put(BLjava/lang/String;)V

    .line 77
    iget-object v1, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 78
    .local v0, "sizePos":I
    iget-object v1, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1, v3}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 80
    const-string/jumbo v1, "$ref"

    invoke-virtual {p2}, Lcom/mongodb/DBRefBase;->getRef()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/DefaultDBEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 81
    const-string/jumbo v1, "$id"

    invoke-virtual {p2}, Lcom/mongodb/DBRefBase;->getId()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/DefaultDBEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    iget-object v1, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1, v3}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 84
    iget-object v1, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v2, p0, Lcom/mongodb/DefaultDBEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v2}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {v1, v0, v2}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 85
    return-void
.end method

.method protected putSpecial(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 52
    instance-of v0, p2, Lcom/mongodb/DBRefBase;

    if-eqz v0, :cond_0

    .line 53
    check-cast p2, Lcom/mongodb/DBRefBase;

    .end local p2    # "val":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DefaultDBEncoder;->putDBRef(Ljava/lang/String;Lcom/mongodb/DBRefBase;)V

    .line 54
    const/4 v0, 0x1

    .line 56
    :goto_0
    return v0

    .restart local p2    # "val":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    const-string/jumbo v0, "DefaultDBEncoder"

    return-object v0
.end method

.method public writeObject(Lorg/bson/io/OutputBuffer;Lorg/bson/BSONObject;)I
    .locals 1
    .param p1, "buf"    # Lorg/bson/io/OutputBuffer;
    .param p2, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mongodb/DefaultDBEncoder;->set(Lorg/bson/io/OutputBuffer;)V

    .line 33
    invoke-super {p0, p2}, Lorg/bson/BasicBSONEncoder;->putObject(Lorg/bson/BSONObject;)I

    move-result v0

    .line 34
    .local v0, "x":I
    invoke-virtual {p0}, Lcom/mongodb/DefaultDBEncoder;->done()V

    .line 35
    return v0
.end method
