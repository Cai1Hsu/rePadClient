.class Lorg/apache/tools/zip/ZipFile$1;
.super Ljava/util/zip/InflaterInputStream;
.source "ZipFile.java"


# instance fields
.field private final this$0:Lorg/apache/tools/zip/ZipFile;

.field private final val$inflater:Ljava/util/zip/Inflater;


# direct methods
.method constructor <init>(Lorg/apache/tools/zip/ZipFile;Ljava/io/InputStream;Ljava/util/zip/Inflater;Ljava/util/zip/Inflater;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/zip/ZipFile;
    .param p2, "x0"    # Ljava/io/InputStream;
    .param p3, "x1"    # Ljava/util/zip/Inflater;
    .param p4, "val$inflater"    # Ljava/util/zip/Inflater;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 275
    iput-object p1, p0, Lorg/apache/tools/zip/ZipFile$1;->this$0:Lorg/apache/tools/zip/ZipFile;

    iput-object p4, p0, Lorg/apache/tools/zip/ZipFile$1;->val$inflater:Ljava/util/zip/Inflater;

    invoke-direct {p0, p2, p3}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 277
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$1;->val$inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 278
    return-void
.end method
