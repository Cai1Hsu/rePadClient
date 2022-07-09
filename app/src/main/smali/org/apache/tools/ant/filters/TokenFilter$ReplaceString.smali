.class public Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;
.super Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.source "TokenFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReplaceString"
.end annotation


# instance fields
.field private from:Ljava/lang/String;

.field private to:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 344
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 373
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->from:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 374
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Missing from in stringreplace"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 376
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 377
    .local v1, "ret":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 378
    .local v2, "start":I
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->from:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 379
    .local v0, "found":I
    :goto_0
    if-ltz v0, :cond_3

    .line 381
    if-le v0, v2, :cond_1

    .line 382
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 386
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->to:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 387
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->to:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 391
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->from:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int v2, v0, v3

    .line 392
    iget-object v3, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->from:Ljava/lang/String;

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    .line 396
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v2, :cond_4

    .line 397
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 400
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 354
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->from:Ljava/lang/String;

    .line 355
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 363
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;->to:Ljava/lang/String;

    .line 364
    return-void
.end method
