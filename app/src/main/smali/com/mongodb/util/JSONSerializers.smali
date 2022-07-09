.class public Lcom/mongodb/util/JSONSerializers;
.super Ljava/lang/Object;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/util/JSONSerializers$1;,
        Lcom/mongodb/util/JSONSerializers$ByteArraySerializer;,
        Lcom/mongodb/util/JSONSerializers$BinarySerializer;,
        Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;,
        Lcom/mongodb/util/JSONSerializers$DateSerializer;,
        Lcom/mongodb/util/JSONSerializers$BSONTimestampSerializer;,
        Lcom/mongodb/util/JSONSerializers$UUIDSerializer;,
        Lcom/mongodb/util/JSONSerializers$StringSerializer;,
        Lcom/mongodb/util/JSONSerializers$PatternSerializer;,
        Lcom/mongodb/util/JSONSerializers$ObjectIdSerializer;,
        Lcom/mongodb/util/JSONSerializers$MinKeySerializer;,
        Lcom/mongodb/util/JSONSerializers$MaxKeySerializer;,
        Lcom/mongodb/util/JSONSerializers$MapSerializer;,
        Lcom/mongodb/util/JSONSerializers$IterableSerializer;,
        Lcom/mongodb/util/JSONSerializers$DBRefBaseSerializer;,
        Lcom/mongodb/util/JSONSerializers$DBObjectSerializer;,
        Lcom/mongodb/util/JSONSerializers$LegacyDateSerializer;,
        Lcom/mongodb/util/JSONSerializers$CodeWScopeSerializer;,
        Lcom/mongodb/util/JSONSerializers$CodeSerializer;,
        Lcom/mongodb/util/JSONSerializers$LegacyBSONTimestampSerializer;,
        Lcom/mongodb/util/JSONSerializers$ToStringSerializer;,
        Lcom/mongodb/util/JSONSerializers$ObjectArraySerializer;,
        Lcom/mongodb/util/JSONSerializers$LegacyBinarySerializer;,
        Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method static addCommonSerializers()Lcom/mongodb/util/ClassMapBasedObjectSerializer;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 89
    new-instance v0, Lcom/mongodb/util/ClassMapBasedObjectSerializer;

    invoke-direct {v0}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;-><init>()V

    .line 91
    .local v0, "serializer":Lcom/mongodb/util/ClassMapBasedObjectSerializer;
    const-class v1, [Ljava/lang/Object;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$ObjectArraySerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$ObjectArraySerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 92
    const-class v1, Ljava/lang/Boolean;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$ToStringSerializer;

    invoke-direct {v2, v3}, Lcom/mongodb/util/JSONSerializers$ToStringSerializer;-><init>(Lcom/mongodb/util/JSONSerializers$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 93
    const-class v1, Lorg/bson/types/Code;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$CodeSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$CodeSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 94
    const-class v1, Lorg/bson/types/CodeWScope;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$CodeWScopeSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$CodeWScopeSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 95
    const-class v1, Lcom/mongodb/DBObject;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$DBObjectSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$DBObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 96
    const-class v1, Lcom/mongodb/DBRefBase;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$DBRefBaseSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$DBRefBaseSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 97
    const-class v1, Ljava/lang/Iterable;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$IterableSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$IterableSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 98
    const-class v1, Ljava/util/Map;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$MapSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$MapSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 99
    const-class v1, Lorg/bson/types/MaxKey;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$MaxKeySerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$MaxKeySerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 100
    const-class v1, Lorg/bson/types/MinKey;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$MinKeySerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$MinKeySerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 101
    const-class v1, Ljava/lang/Number;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$ToStringSerializer;

    invoke-direct {v2, v3}, Lcom/mongodb/util/JSONSerializers$ToStringSerializer;-><init>(Lcom/mongodb/util/JSONSerializers$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 102
    const-class v1, Lorg/bson/types/ObjectId;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$ObjectIdSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$ObjectIdSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 103
    const-class v1, Ljava/util/regex/Pattern;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$PatternSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$PatternSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 104
    const-class v1, Ljava/lang/String;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$StringSerializer;

    invoke-direct {v2, v3}, Lcom/mongodb/util/JSONSerializers$StringSerializer;-><init>(Lcom/mongodb/util/JSONSerializers$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 105
    const-class v1, Ljava/util/UUID;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$UUIDSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$UUIDSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 106
    return-object v0
.end method

.method public static getLegacy()Lcom/mongodb/util/ObjectSerializer;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 61
    invoke-static {}, Lcom/mongodb/util/JSONSerializers;->addCommonSerializers()Lcom/mongodb/util/ClassMapBasedObjectSerializer;

    move-result-object v0

    .line 63
    .local v0, "serializer":Lcom/mongodb/util/ClassMapBasedObjectSerializer;
    const-class v1, Ljava/util/Date;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$LegacyDateSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$LegacyDateSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 64
    const-class v1, Lorg/bson/types/BSONTimestamp;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$LegacyBSONTimestampSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$LegacyBSONTimestampSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 65
    const-class v1, Lorg/bson/types/Binary;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$LegacyBinarySerializer;

    invoke-direct {v2, v3}, Lcom/mongodb/util/JSONSerializers$LegacyBinarySerializer;-><init>(Lcom/mongodb/util/JSONSerializers$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 66
    const-class v1, [B

    new-instance v2, Lcom/mongodb/util/JSONSerializers$LegacyBinarySerializer;

    invoke-direct {v2, v3}, Lcom/mongodb/util/JSONSerializers$LegacyBinarySerializer;-><init>(Lcom/mongodb/util/JSONSerializers$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 67
    return-object v0
.end method

.method public static getStrict()Lcom/mongodb/util/ObjectSerializer;
    .locals 3

    .prologue
    .line 78
    invoke-static {}, Lcom/mongodb/util/JSONSerializers;->addCommonSerializers()Lcom/mongodb/util/ClassMapBasedObjectSerializer;

    move-result-object v0

    .line 80
    .local v0, "serializer":Lcom/mongodb/util/ClassMapBasedObjectSerializer;
    const-class v1, Ljava/util/Date;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$DateSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$DateSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 81
    const-class v1, Lorg/bson/types/BSONTimestamp;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$BSONTimestampSerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$BSONTimestampSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 82
    const-class v1, Lorg/bson/types/Binary;

    new-instance v2, Lcom/mongodb/util/JSONSerializers$BinarySerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$BinarySerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 83
    const-class v1, [B

    new-instance v2, Lcom/mongodb/util/JSONSerializers$ByteArraySerializer;

    invoke-direct {v2, v0}, Lcom/mongodb/util/JSONSerializers$ByteArraySerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V

    .line 85
    return-object v0
.end method
