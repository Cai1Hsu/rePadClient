.class abstract Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "BinarySerializerBase"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 442
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 443
    return-void
.end method


# virtual methods
.method protected serialize([BBLjava/lang/StringBuilder;)V
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "type"    # B
    .param p3, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 446
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 447
    .local v0, "temp":Lcom/mongodb/DBObject;
    const-string/jumbo v1, "$binary"

    new-instance v2, Lcom/mongodb/util/Base64Codec;

    invoke-direct {v2}, Lcom/mongodb/util/Base64Codec;-><init>()V

    invoke-virtual {v2, p1}, Lcom/mongodb/util/Base64Codec;->encode([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    const-string/jumbo v1, "$type"

    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    iget-object v1, p0, Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;->serializer:Lcom/mongodb/util/ObjectSerializer;

    invoke-interface {v1, v0, p3}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 451
    return-void
.end method
