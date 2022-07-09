.class public abstract Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "TokenFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;
.implements Lorg/apache/tools/ant/filters/TokenFilter$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ChainableReaderFilter"
.end annotation


# instance fields
.field private byLine:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 312
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 314
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;->byLine:Z

    return-void
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 332
    new-instance v0, Lorg/apache/tools/ant/filters/TokenFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/TokenFilter;-><init>(Ljava/io/Reader;)V

    .line 333
    .local v0, "tokenFilter":Lorg/apache/tools/ant/filters/TokenFilter;
    iget-boolean v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;->byLine:Z

    if-nez v1, :cond_0

    .line 334
    new-instance v1, Lorg/apache/tools/ant/filters/TokenFilter$FileTokenizer;

    invoke-direct {v1}, Lorg/apache/tools/ant/filters/TokenFilter$FileTokenizer;-><init>()V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/TokenFilter;->add(Lorg/apache/tools/ant/util/Tokenizer;)V

    .line 336
    :cond_0
    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/filters/TokenFilter;->add(Lorg/apache/tools/ant/filters/TokenFilter$Filter;)V

    .line 337
    return-object v0
.end method

.method public setByLine(Z)V
    .locals 0
    .param p1, "byLine"    # Z

    .prologue
    .line 322
    iput-boolean p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;->byLine:Z

    .line 323
    return-void
.end method
