.class Lcom/mongodb/Response;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/Response$MyInputStream;
    }
.end annotation


# static fields
.field private static final MAX_LENGTH:I = 0x2000000


# instance fields
.field _cursor:J

.field final _flags:I

.field final _host:Lcom/mongodb/ServerAddress;

.field final _id:I

.field final _len:I

.field final _num:I

.field final _objects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field

.field final _operation:I

.field final _responseTo:I

.field final _startingFrom:I


# direct methods
.method constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/DBCollection;Ljava/io/InputStream;Lcom/mongodb/DBDecoder;)V
    .locals 7
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p2, "collection"    # Lcom/mongodb/DBCollection;
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "decoder"    # Lcom/mongodb/DBDecoder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/mongodb/Response;->_host:Lcom/mongodb/ServerAddress;

    .line 41
    const/16 v4, 0x24

    new-array v0, v4, [B

    .line 42
    .local v0, "b":[B
    invoke-static {p3, v0}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[B)V

    .line 43
    const/4 v2, 0x0

    .line 45
    .local v2, "pos":I
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_len:I

    .line 46
    add-int/lit8 v2, v2, 0x4

    .line 48
    iget v4, p0, Lcom/mongodb/Response;->_len:I

    const/high16 v5, 0x2000000

    if-le v4, v5, :cond_0

    .line 49
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "response too long: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mongodb/Response;->_len:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 52
    :cond_0
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_id:I

    .line 53
    add-int/lit8 v2, v2, 0x4

    .line 55
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_responseTo:I

    .line 56
    add-int/lit8 v2, v2, 0x4

    .line 58
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_operation:I

    .line 59
    add-int/lit8 v2, v2, 0x4

    .line 61
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_flags:I

    .line 62
    add-int/lit8 v2, v2, 0x4

    .line 64
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mongodb/Response;->_cursor:J

    .line 65
    add-int/lit8 v2, v2, 0x8

    .line 67
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_startingFrom:I

    .line 68
    add-int/lit8 v2, v2, 0x4

    .line 70
    invoke-static {v0, v2}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    iput v4, p0, Lcom/mongodb/Response;->_num:I

    .line 71
    add-int/lit8 v2, v2, 0x4

    .line 73
    new-instance v3, Lcom/mongodb/Response$MyInputStream;

    iget v4, p0, Lcom/mongodb/Response;->_len:I

    array-length v5, v0

    sub-int/2addr v4, v5

    invoke-direct {v3, p3, v4}, Lcom/mongodb/Response$MyInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 75
    .local v3, "user":Lcom/mongodb/Response$MyInputStream;
    iget v4, p0, Lcom/mongodb/Response;->_num:I

    const/4 v5, 0x2

    if-ge v4, v5, :cond_1

    .line 76
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    .line 80
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget v4, p0, Lcom/mongodb/Response;->_num:I

    if-ge v1, v4, :cond_3

    .line 81
    invoke-static {v3}, Lcom/mongodb/Response$MyInputStream;->access$000(Lcom/mongodb/Response$MyInputStream;)I

    move-result v4

    const/4 v5, 0x5

    if-ge v4, v5, :cond_2

    .line 82
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "should have more objects, but only "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Lcom/mongodb/Response$MyInputStream;->access$000(Lcom/mongodb/Response$MyInputStream;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " bytes left"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 78
    .end local v1    # "i":I
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    iget v5, p0, Lcom/mongodb/Response;->_num:I

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    goto :goto_0

    .line 85
    .restart local v1    # "i":I
    :cond_2
    iget-object v4, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    invoke-interface {p4, v3, p2}, Lcom/mongodb/DBDecoder;->decode(Ljava/io/InputStream;Lcom/mongodb/DBCollection;)Lcom/mongodb/DBObject;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 88
    :cond_3
    invoke-static {v3}, Lcom/mongodb/Response$MyInputStream;->access$000(Lcom/mongodb/Response$MyInputStream;)I

    move-result v4

    if-eqz v4, :cond_4

    .line 89
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "finished reading objects but still have: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Lcom/mongodb/Response$MyInputStream;->access$000(Lcom/mongodb/Response$MyInputStream;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " bytes to read!\' "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 91
    :cond_4
    iget v4, p0, Lcom/mongodb/Response;->_num:I

    iget-object v5, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v4, v5, :cond_5

    .line 92
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "something is really broken"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 93
    :cond_5
    return-void
.end method


# virtual methods
.method public cursor()J
    .locals 2

    .prologue
    .line 112
    iget-wide v0, p0, Lcom/mongodb/Response;->_cursor:J

    return-wide v0
.end method

.method public get(I)Lcom/mongodb/DBObject;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getError()Lcom/mongodb/ServerError;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 116
    iget v2, p0, Lcom/mongodb/Response;->_num:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    .line 124
    :cond_0
    :goto_0
    return-object v1

    .line 119
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/mongodb/Response;->get(I)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 121
    .local v0, "obj":Lcom/mongodb/DBObject;
    invoke-static {v0, v1}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 124
    new-instance v1, Lcom/mongodb/ServerError;

    invoke-direct {v1, v0}, Lcom/mongodb/ServerError;-><init>(Lcom/mongodb/DBObject;)V

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mongodb/Response;->_objects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public serverUsed()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/mongodb/Response;->_host:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lcom/mongodb/Response;->_num:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "flags:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/Response;->_flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " _cursor:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/Response;->_cursor:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " _startingFrom:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/Response;->_startingFrom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " _num:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/Response;->_num:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
