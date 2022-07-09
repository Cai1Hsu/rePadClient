.class Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;
.super Ljava/io/Reader;
.source "FixCrLfFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/FixCrLfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleFilterReader"
.end annotation


# static fields
.field private static final PREEMPT_BUFFER_LENGTH:I = 0x10


# instance fields
.field private in:Ljava/io/Reader;

.field private preempt:[I

.field private preemptIndex:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 409
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 405
    const/16 v0, 0x10

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    .line 407
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    .line 410
    iput-object p1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    .line 411
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
    .line 455
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 456
    return-void
.end method

.method public editsBlocked()Z
    .locals 1

    .prologue
    .line 447
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    instance-of v0, v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    check-cast v0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->editsBlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public mark(I)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 471
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0, p1}, Ljava/io/Reader;->mark(I)V

    .line 472
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 463
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->markSupported()Z

    move-result v0

    return v0
.end method

.method public push(C)V
    .locals 0
    .param p1, "c"    # C

    .prologue
    .line 414
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->push(I)V

    .line 415
    return-void
.end method

.method public push(I)V
    .locals 6
    .param p1, "c"    # I

    .prologue
    const/4 v5, 0x0

    .line 419
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    iget v3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    aput p1, v2, v3
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    :goto_0
    return-void

    .line 420
    :catch_0
    move-exception v0

    .line 421
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    iget-object v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [I

    .line 422
    .local v1, "p2":[I
    iget-object v2, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    iget-object v3, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    array-length v3, v3

    invoke-static {v2, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    iput-object v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    .line 424
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->push(I)V

    goto :goto_0
.end method

.method public push(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 439
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->push([C)V

    .line 440
    return-void
.end method

.method public push([C)V
    .locals 2
    .param p1, "cs"    # [C

    .prologue
    .line 435
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->push([CII)V

    .line 436
    return-void
.end method

.method public push([CII)V
    .locals 3
    .param p1, "cs"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I

    .prologue
    .line 429
    add-int v2, p2, p3

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 430
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    aget-char v2, p1, v1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->push(C)V

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 432
    :cond_0
    return-void
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 451
    iget v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preempt:[I

    iget v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->preemptIndex:I

    aget v0, v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_0
.end method

.method public read([C)I
    .locals 2
    .param p1, "buf"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 479
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read([CII)I

    move-result v0

    return v0
.end method

.method public read([CII)I
    .locals 6
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 483
    const/4 v1, 0x0

    .line 484
    .local v1, "count":I
    const/4 v0, 0x0

    .local v0, "c":I
    move v2, p3

    .end local p3    # "length":I
    .local v2, "length":I
    move v3, p2

    .line 487
    .end local p2    # "start":I
    .local v3, "start":I
    :goto_0
    add-int/lit8 p3, v2, -0x1

    .end local v2    # "length":I
    .restart local p3    # "length":I
    if-lez v2, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->read()I

    move-result v0

    if-eq v0, v4, :cond_0

    .line 488
    add-int/lit8 p2, v3, 0x1

    .end local v3    # "start":I
    .restart local p2    # "start":I
    int-to-char v5, v0

    aput-char v5, p1, v3

    .line 489
    add-int/lit8 v1, v1, 0x1

    move v2, p3

    .end local p3    # "length":I
    .restart local v2    # "length":I
    move v3, p2

    .end local p2    # "start":I
    .restart local v3    # "start":I
    goto :goto_0

    .line 492
    .end local v2    # "length":I
    .restart local p3    # "length":I
    :cond_0
    if-nez v1, :cond_1

    if-ne v0, v4, :cond_1

    move v1, v4

    .end local v1    # "count":I
    :cond_1
    return v1
.end method

.method public ready()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->ready()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 459
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->reset()V

    .line 460
    return-void
.end method

.method public skip(J)J
    .locals 3
    .param p1, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 475
    iget-object v0, p0, Lorg/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v0, p1, p2}, Ljava/io/Reader;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
