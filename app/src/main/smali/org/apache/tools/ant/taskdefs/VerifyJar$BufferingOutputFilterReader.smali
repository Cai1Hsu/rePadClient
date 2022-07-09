.class Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;
.super Ljava/io/Reader;
.source "VerifyJar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/VerifyJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BufferingOutputFilterReader"
.end annotation


# instance fields
.field private buffer:Ljava/lang/StringBuffer;

.field private next:Ljava/io/Reader;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "next"    # Ljava/io/Reader;

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 183
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->buffer:Ljava/lang/StringBuffer;

    .line 186
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->next:Ljava/io/Reader;

    .line 187
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 207
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->buffer:Ljava/lang/StringBuffer;

    .line 208
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->next:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 200
    return-void
.end method

.method public read([CII)I
    .locals 2
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->next:Ljava/io/Reader;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    move-result v0

    .line 193
    .local v0, "result":I
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 195
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
