.class Lcom/mongodb/Response$MyInputStream;
.super Ljava/io/InputStream;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MyInputStream"
.end annotation


# instance fields
.field final _in:Ljava/io/InputStream;

.field private _toGo:I


# direct methods
.method constructor <init>(Ljava/io/InputStream;I)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "max"    # I

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 129
    iput-object p1, p0, Lcom/mongodb/Response$MyInputStream;->_in:Ljava/io/InputStream;

    .line 130
    iput p2, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    .line 131
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/Response$MyInputStream;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/Response$MyInputStream;

    .prologue
    .line 127
    iget v0, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    return v0
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/mongodb/Response$MyInputStream;->_in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 2

    .prologue
    .line 162
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t close thos"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    iget v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    if-gtz v1, :cond_0

    .line 142
    const/4 v0, -0x1

    .line 147
    :goto_0
    return v0

    .line 144
    :cond_0
    iget-object v1, p0, Lcom/mongodb/Response$MyInputStream;->_in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 145
    .local v0, "val":I
    iget v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    goto :goto_0
.end method

.method public read([BII)I
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    if-gtz v1, :cond_0

    .line 154
    const/4 v0, -0x1

    .line 158
    :goto_0
    return v0

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/mongodb/Response$MyInputStream;->_in:Ljava/io/InputStream;

    iget v2, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v1, p1, p2, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 157
    .local v0, "n":I
    iget v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/mongodb/Response$MyInputStream;->_toGo:I

    goto :goto_0
.end method
