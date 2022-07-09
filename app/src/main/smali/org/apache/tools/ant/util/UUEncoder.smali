.class public Lorg/apache/tools/ant/util/UUEncoder;
.super Ljava/lang/Object;
.source "UUEncoder.java"


# static fields
.field protected static final DEFAULT_MODE:I = 0x284

.field private static final INPUT_BUFFER_SIZE:I = 0x1194

.field private static final MAX_CHARS_PER_LINE:I = 0x2d


# instance fields
.field private name:Ljava/lang/String;

.field private out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/util/UUEncoder;->name:Ljava/lang/String;

    .line 50
    return-void
.end method

.method private encodeBegin()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "begin 644 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/util/UUEncoder;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/UUEncoder;->encodeString(Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method private encodeEnd()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const-string/jumbo v0, " \nend\n"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/UUEncoder;->encodeString(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method private encodeLine([BIILjava/io/OutputStream;)V
    .locals 11
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    and-int/lit8 v9, p3, 0x3f

    add-int/lit8 v9, v9, 0x20

    int-to-byte v9, v9

    invoke-virtual {p4, v9}, Ljava/io/OutputStream;->write(I)V

    .line 119
    const/4 v7, 0x0

    .local v7, "i":I
    move v8, v7

    .end local v7    # "i":I
    .local v8, "i":I
    :goto_0
    if-ge v8, p3, :cond_1

    .line 121
    const/4 v1, 0x1

    .line 122
    .local v1, "b":B
    const/4 v2, 0x1

    .line 124
    .local v2, "c":B
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "i":I
    .restart local v7    # "i":I
    add-int v9, p2, v8

    aget-byte v0, p1, v9

    .line 125
    .local v0, "a":B
    if-ge v7, p3, :cond_0

    .line 126
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "i":I
    .restart local v8    # "i":I
    add-int v9, p2, v7

    aget-byte v1, p1, v9

    .line 127
    if-ge v8, p3, :cond_2

    .line 128
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "i":I
    .restart local v7    # "i":I
    add-int v9, p2, v8

    aget-byte v2, p1, v9

    .line 133
    :cond_0
    :goto_1
    ushr-int/lit8 v9, v0, 0x2

    and-int/lit8 v9, v9, 0x3f

    add-int/lit8 v9, v9, 0x20

    int-to-byte v3, v9

    .line 134
    .local v3, "d1":B
    shl-int/lit8 v9, v0, 0x4

    and-int/lit8 v9, v9, 0x30

    ushr-int/lit8 v10, v1, 0x4

    and-int/lit8 v10, v10, 0xf

    or-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x20

    int-to-byte v4, v9

    .line 135
    .local v4, "d2":B
    shl-int/lit8 v9, v1, 0x2

    and-int/lit8 v9, v9, 0x3c

    ushr-int/lit8 v10, v2, 0x6

    and-int/lit8 v10, v10, 0x3

    or-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x20

    int-to-byte v5, v9

    .line 136
    .local v5, "d3":B
    and-int/lit8 v9, v2, 0x3f

    add-int/lit8 v9, v9, 0x20

    int-to-byte v6, v9

    .line 139
    .local v6, "d4":B
    invoke-virtual {p4, v3}, Ljava/io/OutputStream;->write(I)V

    .line 140
    invoke-virtual {p4, v4}, Ljava/io/OutputStream;->write(I)V

    .line 141
    invoke-virtual {p4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 142
    invoke-virtual {p4, v6}, Ljava/io/OutputStream;->write(I)V

    move v8, v7

    .end local v7    # "i":I
    .restart local v8    # "i":I
    goto :goto_0

    .line 146
    .end local v0    # "a":B
    .end local v1    # "b":B
    .end local v2    # "c":B
    .end local v3    # "d1":B
    .end local v4    # "d2":B
    .end local v5    # "d3":B
    .end local v6    # "d4":B
    :cond_1
    const/16 v9, 0xa

    invoke-virtual {p4, v9}, Ljava/io/OutputStream;->write(I)V

    .line 147
    return-void

    .restart local v0    # "a":B
    .restart local v1    # "b":B
    .restart local v2    # "c":B
    :cond_2
    move v7, v8

    .end local v8    # "i":I
    .restart local v7    # "i":I
    goto :goto_1
.end method

.method private encodeString(Ljava/lang/String;)V
    .locals 2
    .param p1, "n"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v0, Ljava/io/PrintStream;

    iget-object v1, p0, Lorg/apache/tools/ant/util/UUEncoder;->out:Ljava/io/OutputStream;

    invoke-direct {v0, v1}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 86
    .local v0, "writer":Ljava/io/PrintStream;
    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 87
    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 88
    return-void
.end method


# virtual methods
.method public encode(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2d

    .line 62
    iput-object p2, p0, Lorg/apache/tools/ant/util/UUEncoder;->out:Ljava/io/OutputStream;

    .line 63
    invoke-direct {p0}, Lorg/apache/tools/ant/util/UUEncoder;->encodeBegin()V

    .line 64
    const/16 v5, 0x1194

    new-array v0, v5, [B

    .line 66
    .local v0, "buffer":[B
    :cond_0
    const/4 v5, 0x0

    array-length v6, v0

    invoke-virtual {p1, v0, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "count":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_2

    .line 67
    const/4 v3, 0x0

    .line 68
    .local v3, "pos":I
    :goto_0
    if-lez v1, :cond_0

    .line 69
    if-le v1, v4, :cond_1

    move v2, v4

    .line 72
    .local v2, "num":I
    :goto_1
    invoke-direct {p0, v0, v3, v2, p2}, Lorg/apache/tools/ant/util/UUEncoder;->encodeLine([BIILjava/io/OutputStream;)V

    .line 73
    add-int/2addr v3, v2

    .line 74
    sub-int/2addr v1, v2

    goto :goto_0

    .end local v2    # "num":I
    :cond_1
    move v2, v1

    .line 69
    goto :goto_1

    .line 77
    .end local v3    # "pos":I
    :cond_2
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/util/UUEncoder;->encodeEnd()V

    .line 79
    return-void
.end method
