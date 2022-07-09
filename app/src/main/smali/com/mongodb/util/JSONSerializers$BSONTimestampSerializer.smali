.class Lcom/mongodb/util/JSONSerializers$BSONTimestampSerializer;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BSONTimestampSerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 409
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 410
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 414
    move-object v0, p1

    check-cast v0, Lorg/bson/types/BSONTimestamp;

    .line 415
    .local v0, "t":Lorg/bson/types/BSONTimestamp;
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 416
    .local v1, "temp":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v3, "t"

    invoke-virtual {v0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    const-string/jumbo v3, "i"

    invoke-virtual {v0}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 419
    .local v2, "timestampObj":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v3, "$timestamp"

    invoke-virtual {v2, v3, v1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    iget-object v3, p0, Lcom/mongodb/util/JSONSerializers$BSONTimestampSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    invoke-interface {v3, v2, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 421
    return-void
.end method
