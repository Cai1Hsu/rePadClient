.class Lcom/mongodb/DeleteCommandMessage;
.super Lcom/mongodb/BaseWriteCommandMessage;
.source "DeleteCommandMessage.java"


# instance fields
.field private final deletes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final queryEncoder:Lcom/mongodb/DBEncoder;


# direct methods
.method public constructor <init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V
    .locals 0
    .param p1, "namespace"    # Lcom/mongodb/MongoNamespace;
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "commandEncoder"    # Lcom/mongodb/DBEncoder;
    .param p5, "queryEncoder"    # Lcom/mongodb/DBEncoder;
    .param p6, "settings"    # Lcom/mongodb/MessageSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/MongoNamespace;",
            "Lcom/mongodb/WriteConcern;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/MessageSettings;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p3, "deletes":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/RemoveRequest;>;"
    invoke-direct {p0, p1, p2, p4, p6}, Lcom/mongodb/BaseWriteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 30
    iput-object p3, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    .line 31
    iput-object p5, p0, Lcom/mongodb/DeleteCommandMessage;->queryEncoder:Lcom/mongodb/DBEncoder;

    .line 32
    return-void
.end method


# virtual methods
.method protected getCommandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    const-string/jumbo v0, "delete"

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BaseWriteCommandMessage;
    .locals 9
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;
    .param p2, "commandStartPosition"    # I
    .param p3, "writer"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 42
    const/4 v0, 0x0

    .line 43
    .local v0, "nextMessage":Lcom/mongodb/DeleteCommandMessage;
    const-string/jumbo v1, "deletes"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeStartArray(Ljava/lang/String;)V

    .line 44
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v1, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v7, v1, :cond_0

    .line 45
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->mark()V

    .line 46
    iget-object v1, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mongodb/RemoveRequest;

    .line 47
    .local v8, "remove":Lcom/mongodb/RemoveRequest;
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeStartDocument()V

    .line 48
    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings;->getMaxDocumentSize()I

    move-result v1

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->pushMaxDocumentSize(I)V

    .line 49
    const-string/jumbo v1, "q"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeName(Ljava/lang/String;)V

    .line 50
    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v1

    invoke-virtual {v8}, Lcom/mongodb/RemoveRequest;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 51
    const-string/jumbo v2, "limit"

    invoke-virtual {v8}, Lcom/mongodb/RemoveRequest;->isMulti()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p3, v2, v1}, Lcom/mongodb/BSONBinaryWriter;->writeInt32(Ljava/lang/String;I)V

    .line 52
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->popMaxDocumentSize()V

    .line 53
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeEndDocument()V

    .line 54
    invoke-virtual {p1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    sub-int/2addr v1, p2

    add-int/lit8 v2, v7, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/DeleteCommandMessage;->exceedsLimits(II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 55
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->reset()V

    .line 56
    new-instance v0, Lcom/mongodb/DeleteCommandMessage;

    .end local v0    # "nextMessage":Lcom/mongodb/DeleteCommandMessage;
    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getWriteNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    iget-object v4, p0, Lcom/mongodb/DeleteCommandMessage;->deletes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v3, v7, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/DeleteCommandMessage;->queryEncoder:Lcom/mongodb/DBEncoder;

    invoke-virtual {p0}, Lcom/mongodb/DeleteCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/DeleteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 61
    .end local v8    # "remove":Lcom/mongodb/RemoveRequest;
    .restart local v0    # "nextMessage":Lcom/mongodb/DeleteCommandMessage;
    :cond_0
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeEndArray()V

    .line 62
    return-object v0

    .line 51
    .restart local v8    # "remove":Lcom/mongodb/RemoveRequest;
    :cond_1
    const/4 v1, 0x1

    goto :goto_1

    .line 44
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method
