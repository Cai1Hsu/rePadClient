.class Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;
.super Ljava/io/FilterInputStream;
.source "AbstractClasspathResource.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;

.field private final val$classLoader:Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;Ljava/io/InputStream;Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;
    .param p2, "x0"    # Ljava/io/InputStream;
    .param p3, "val$classLoader"    # Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 184
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;->this$0:Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;

    iput-object p3, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;->val$classLoader:Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;

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
    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;->in:Ljava/io/InputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;->val$classLoader:Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->cleanup()V

    .line 183
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
    .line 186
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 190
    return-void

    .line 188
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method
