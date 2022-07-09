.class Lcom/mongodb/util/JSONSerializers$DBObjectSerializer;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DBObjectSerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 228
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 229
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 233
    const/4 v1, 0x1

    .line 234
    .local v1, "first":Z
    const-string/jumbo v5, "{ "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v0, p1

    .line 235
    check-cast v0, Lcom/mongodb/DBObject;

    .line 238
    .local v0, "dbo":Lcom/mongodb/DBObject;
    invoke-interface {v0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 239
    .local v4, "s":Ljava/lang/String;
    move-object v3, v4

    .line 241
    .local v3, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 242
    const/4 v1, 0x0

    .line 246
    :goto_1
    invoke-static {p2, v3}, Lcom/mongodb/util/JSON;->string(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 247
    const-string/jumbo v5, " : "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    iget-object v5, p0, Lcom/mongodb/util/JSONSerializers$DBObjectSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    invoke-interface {v0, v3}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    goto :goto_0

    .line 244
    :cond_0
    const-string/jumbo v5, " , "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 251
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "s":Ljava/lang/String;
    :cond_1
    const-string/jumbo v5, "}"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    return-void
.end method
