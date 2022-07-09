.class Lorg/apache/tools/ant/taskdefs/Concat$1;
.super Ljava/lang/Object;
.source "Concat.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Concat;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 494
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$1;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getReader(Ljava/lang/Object;)Ljava/io/Reader;
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 495
    check-cast p1, Lorg/apache/tools/ant/types/Resource;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 496
    .local v0, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedReader;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$1;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1300(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    :goto_0
    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v2

    :cond_0
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat$1;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1300(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_0
.end method
