.class Lcom/mongodb/InsertCommandMessage;
.super Lcom/mongodb/BaseWriteCommandMessage;
.source "InsertCommandMessage.java"


# instance fields
.field private final documents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field

.field private final encoder:Lcom/mongodb/DBEncoder;


# direct methods
.method public constructor <init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V
    .locals 0
    .param p1, "namespace"    # Lcom/mongodb/MongoNamespace;
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
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/MessageSettings;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p3, "documents":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-direct {p0, p1, p2, p4, p6}, Lcom/mongodb/BaseWriteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 30
    iput-object p3, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

    .line 31
    iput-object p5, p0, Lcom/mongodb/InsertCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    .line 32
    return-void
.end method


# virtual methods
.method protected getCommandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "insert"

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

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
    invoke-virtual {p0, p1, p2, p3}, Lcom/mongodb/InsertCommandMessage;->writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/InsertCommandMessage;

    move-result-object v0

    return-object v0
.end method

.method protected writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/InsertCommandMessage;
    .locals 8
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;
    .param p2, "commandStartPosition"    # I
    .param p3, "writer"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 40
    const/4 v0, 0x0

    .line 41
    .local v0, "nextMessage":Lcom/mongodb/InsertCommandMessage;
    const-string/jumbo v1, "documents"

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->writeStartArray(Ljava/lang/String;)V

    .line 42
    invoke-virtual {p0}, Lcom/mongodb/InsertCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings;->getMaxDocumentSize()I

    move-result v1

    invoke-virtual {p3, v1}, Lcom/mongodb/BSONBinaryWriter;->pushMaxDocumentSize(I)V

    .line 43
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v1, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v7, v1, :cond_0

    .line 44
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->mark()V

    .line 45
    iget-object v2, p0, Lcom/mongodb/InsertCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    iget-object v1, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    invoke-virtual {p3, v2, v1}, Lcom/mongodb/BSONBinaryWriter;->encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 46
    invoke-virtual {p1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    sub-int/2addr v1, p2

    add-int/lit8 v2, v7, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/InsertCommandMessage;->exceedsLimits(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 47
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->reset()V

    .line 48
    new-instance v0, Lcom/mongodb/InsertCommandMessage;

    .end local v0    # "nextMessage":Lcom/mongodb/InsertCommandMessage;
    invoke-virtual {p0}, Lcom/mongodb/InsertCommandMessage;->getWriteNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/InsertCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

    iget-object v4, p0, Lcom/mongodb/InsertCommandMessage;->documents:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v3, v7, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mongodb/InsertCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/InsertCommandMessage;->encoder:Lcom/mongodb/DBEncoder;

    invoke-virtual {p0}, Lcom/mongodb/InsertCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/InsertCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 53
    .restart local v0    # "nextMessage":Lcom/mongodb/InsertCommandMessage;
    :cond_0
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->popMaxDocumentSize()V

    .line 54
    invoke-virtual {p3}, Lcom/mongodb/BSONBinaryWriter;->writeEndArray()V

    .line 55
    return-object v0

    .line 43
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method
