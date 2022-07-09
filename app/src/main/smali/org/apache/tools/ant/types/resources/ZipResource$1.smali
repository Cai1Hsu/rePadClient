.class Lorg/apache/tools/ant/types/resources/ZipResource$1;
.super Ljava/io/FilterInputStream;
.source "ZipResource.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/resources/ZipResource;

.field private final val$z:Lorg/apache/tools/zip/ZipFile;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/resources/ZipResource;Ljava/io/InputStream;Lorg/apache/tools/zip/ZipFile;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/ZipResource;
    .param p2, "x0"    # Ljava/io/InputStream;
    .param p3, "val$z"    # Lorg/apache/tools/zip/ZipFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 145
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/ZipResource$1;->this$0:Lorg/apache/tools/ant/types/resources/ZipResource;

    iput-object p3, p0, Lorg/apache/tools/ant/types/resources/ZipResource$1;->val$z:Lorg/apache/tools/zip/ZipFile;

    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

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
    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource$1;->in:Ljava/io/InputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 143
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ZipResource$1;->val$z:Lorg/apache/tools/zip/ZipFile;

    invoke-virtual {v0}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 144
    return-void
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 147
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ZipResource$1;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 151
    return-void

    .line 149
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method
