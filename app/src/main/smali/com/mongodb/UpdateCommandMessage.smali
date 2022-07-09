.class Lcom/mongodb/UpdateCommandMessage;
.super Lcom/mongodb/BaseWriteCommandMessage;
.source "UpdateCommandMessage.java"


# instance fields
.field private final encoder:Lcom/mongodb/DBEncoder;

.field private final updates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V
    .locals 0
    .param p1, "writeNamespace"    # Lcom/mongodb/MongoNamespace;
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "commandEncoder"    # Lcom/mongodb/DBEncoder;
    .param p5, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p6, "settings"    # Lcom/mongodb/MessageSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/MongoNamespace;",
            "Lcom/mongodb/WriteConcern;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/MessageSettings;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "updates":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ModifyRequest;>;"
    invoke-direct {p0, p1, p2, p4, p6}, Lcom/mongodb/BaseWriteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 31
    iput-object p3, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    .line 32
    iput-object p5, p0, Lcom/mongodb/UpdateCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    .line 33
    return-void
.end method


# virtual methods
.method protected getCommandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    const-string/jumbo v0, "update"

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected bridge synthetic writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BaseWriteCommandMessage;
    .locals 1
    .param p1, "x0"    # Lorg/bson/io/OutputBuffer;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Lcom/mongodb/UpdateCommandMessage;->writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/UpdateCommandMessage;

    move-result-object v0

    return-object v0
.end method

.method protected writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/UpdateCommandMessage;
    .locals 9
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;
    .param p2, "commandStartPosition"    # I
    .param p3, "writer"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 38
    const/4 v0, 0x0

    .line 39
    .local v0, "nextMessage":Lcom/mongodb/UpdateCommandMessage;
    const-string/jumbo v1, "updates"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeStartArray(Ljava/lang/String;)V

    .line 40
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v1, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v7, v1, :cond_2

    .line 41
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->mark()V

    .line 42
    iget-object v1, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mongodb/ModifyRequest;

    .line 43
    .local v8, "update":Lcom/mongodb/ModifyRequest;
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeStartDocument()V

    .line 44
    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings;->getMaxDocumentSize()I

    move-result v1

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->pushMaxDocumentSize(I)V

    .line 45
    const-string/jumbo v1, "q"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeName(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v1

    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 47
    const-string/jumbo v1, "u"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeName(Ljava/lang/String;)V

    .line 48
    iget-object v1, p0, Lcom/mongodb/UpdateCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 49
    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->isMulti()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    const-string/jumbo v1, "multi"

    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->isMulti()Z

    move-result v2

    invoke-virtual {p3, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->writeBoolean(Ljava/lang/String;Z)V

    .line 52
    :cond_0
    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->isUpsert()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 53
    const-string/jumbo v1, "upsert"

    invoke-virtual {v8}, Lcom/mongodb/ModifyRequest;->isUpsert()Z

    move-result v2

    invoke-virtual {p3, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->writeBoolean(Ljava/lang/String;Z)V

    .line 55
    :cond_1
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->popMaxDocumentSize()V

    .line 56
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeEndDocument()V

    .line 57
    invoke-virtual {p1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    sub-int/2addr v1, p2

    add-int/lit8 v2, v7, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/UpdateCommandMessage;->exceedsLimits(II)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 58
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->reset()V

    .line 59
    new-instance v0, Lcom/mongodb/UpdateCommandMessage;

    .end local v0    # "nextMessage":Lcom/mongodb/UpdateCommandMessage;
    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getWriteNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    iget-object v4, p0, Lcom/mongodb/UpdateCommandMessage;->updates:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v3, v7, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/UpdateCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    invoke-virtual {p0}, Lcom/mongodb/UpdateCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/UpdateCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 64
    .end local v8    # "update":Lcom/mongodb/ModifyRequest;
    .restart local v0    # "nextMessage":Lcom/mongodb/UpdateCommandMessage;
    :cond_2
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeEndArray()V

    .line 65
    return-object v0

    .line 40
    .restart local v8    # "update":Lcom/mongodb/ModifyRequest;
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0
.end method
