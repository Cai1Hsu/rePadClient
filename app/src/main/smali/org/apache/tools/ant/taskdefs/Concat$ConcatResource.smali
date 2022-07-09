.class final Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "Concat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Concat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ConcatResource"
.end annotation


# instance fields
.field private c:Lorg/apache/tools/ant/types/ResourceCollection;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Concat;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .param p2, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 382
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 383
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->c:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 384
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/Concat$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .param p2, "x1"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p3, "x2"    # Lorg/apache/tools/ant/taskdefs/Concat$1;

    .prologue
    .line 379
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Lorg/apache/tools/ant/types/ResourceCollection;)V

    return-void
.end method


# virtual methods
.method public getInputStream()Ljava/io/InputStream;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 386
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$300(Lorg/apache/tools/ant/taskdefs/Concat;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 387
    new-instance v6, Lorg/apache/tools/ant/util/ConcatResourceInputStream;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->c:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 388
    .local v6, "result":Lorg/apache/tools/ant/util/ConcatResourceInputStream;
    invoke-virtual {v6, p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 423
    .end local v6    # "result":Lorg/apache/tools/ant/util/ConcatResourceInputStream;
    :goto_0
    return-object v6

    .line 391
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    new-instance v8, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->c:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v10}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v11}, Lorg/apache/tools/ant/taskdefs/Concat;->access$400(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    move-result-object v11

    invoke-direct {v8, v9, v10, v11, v12}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/util/Iterator;Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;Lorg/apache/tools/ant/taskdefs/Concat$1;)V

    invoke-static {v7, v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$600(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v5

    .line 394
    .local v5, "resourceReader":Ljava/io/Reader;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-nez v7, :cond_1

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-nez v7, :cond_1

    .line 395
    move-object v2, v5

    .line 423
    .local v2, "rdr":Ljava/io/Reader;
    :goto_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1100(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_7

    new-instance v7, Lorg/apache/tools/ant/util/ReaderInputStream;

    invoke-direct {v7, v2}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;)V

    :goto_2
    move-object v6, v7

    goto :goto_0

    .line 397
    .end local v2    # "rdr":Ljava/io/Reader;
    :cond_1
    const/4 v3, 0x1

    .line 398
    .local v3, "readerCount":I
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 399
    add-int/lit8 v3, v3, 0x1

    .line 401
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 402
    add-int/lit8 v3, v3, 0x1

    .line 404
    :cond_3
    new-array v4, v3, [Ljava/io/Reader;

    .line 405
    .local v4, "readers":[Ljava/io/Reader;
    const/4 v0, 0x0

    .line 406
    .local v0, "pos":I
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 407
    new-instance v7, Ljava/io/StringReader;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    aput-object v7, v4, v0

    .line 408
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$700(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->access$900(Lorg/apache/tools/ant/taskdefs/Concat$TextElement;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 409
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    aget-object v8, v4, v0

    invoke-static {v7, v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$600(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v7

    aput-object v7, v4, v0

    .line 411
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 413
    :cond_5
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "pos":I
    .local v1, "pos":I
    aput-object v5, v4, v0

    .line 414
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    if-eqz v7, :cond_6

    .line 415
    new-instance v7, Ljava/io/StringReader;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    aput-object v7, v4, v1

    .line 416
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat;->access$800(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$TextElement;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Concat$TextElement;->access$900(Lorg/apache/tools/ant/taskdefs/Concat$TextElement;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 417
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    aget-object v8, v4, v1

    invoke-static {v7, v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$600(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v7

    aput-object v7, v4, v1

    .line 420
    :cond_6
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1000(Lorg/apache/tools/ant/taskdefs/Concat;)Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    move-result-object v9

    invoke-direct {v2, v7, v8, v9, v12}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/util/Iterator;Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;Lorg/apache/tools/ant/taskdefs/Concat$1;)V

    .restart local v2    # "rdr":Ljava/io/Reader;
    goto/16 :goto_1

    .line 423
    .end local v1    # "pos":I
    .end local v3    # "readerCount":I
    .end local v4    # "readers":[Ljava/io/Reader;
    :cond_7
    new-instance v7, Lorg/apache/tools/ant/util/ReaderInputStream;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1100(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v2, v8}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1200(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "concat ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->c:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$ConcatResource;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Concat;->access$1200(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
