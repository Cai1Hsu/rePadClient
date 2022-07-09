.class Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;
.super Ljava/io/FilterReader;
.source "ChainReaderHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

.field private final val$classLoadersToCleanUp:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/filters/util/ChainReaderHelper;Ljava/io/Reader;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .param p2, "x0"    # Ljava/io/Reader;
    .param p3, "val$classLoadersToCleanUp"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 171
    iput-object p1, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;->this$0:Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    iput-object p3, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;->val$classLoadersToCleanUp:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Ljava/io/FilterReader;-><init>(Ljava/io/Reader;)V

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
    .line 168
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;->in:Ljava/io/Reader;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;->val$classLoadersToCleanUp:Ljava/util/ArrayList;

    invoke-static {v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->access$000(Ljava/util/List;)V

    .line 170
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
    .line 173
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 177
    return-void

    .line 175
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method
