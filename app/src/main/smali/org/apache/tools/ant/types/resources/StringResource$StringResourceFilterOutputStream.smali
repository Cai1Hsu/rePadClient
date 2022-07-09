.class Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;
.super Ljava/io/FilterOutputStream;
.source "StringResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/resources/StringResource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StringResourceFilterOutputStream"
.end annotation


# instance fields
.field private final baos:Ljava/io/ByteArrayOutputStream;

.field private final this$0:Lorg/apache/tools/ant/types/resources/StringResource;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/resources/StringResource;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/StringResource;

    .prologue
    .line 247
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->this$0:Lorg/apache/tools/ant/types/resources/StringResource;

    .line 248
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, v0}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->out:Ljava/io/OutputStream;

    check-cast v0, Ljava/io/ByteArrayOutputStream;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    .line 250
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V

    .line 254
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->this$0:Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-static {v1}, Lorg/apache/tools/ant/types/resources/StringResource;->access$000(Lorg/apache/tools/ant/types/resources/StringResource;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "result":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->this$0:Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-static {v1, v0}, Lorg/apache/tools/ant/types/resources/StringResource;->access$100(Lorg/apache/tools/ant/types/resources/StringResource;Ljava/lang/String;)V

    .line 258
    return-void

    .line 254
    .end local v0    # "result":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/StringResource$StringResourceFilterOutputStream;->this$0:Lorg/apache/tools/ant/types/resources/StringResource;

    invoke-static {v2}, Lorg/apache/tools/ant/types/resources/StringResource;->access$000(Lorg/apache/tools/ant/types/resources/StringResource;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
