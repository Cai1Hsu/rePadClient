.class final Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;
.super Ljava/io/Reader;
.source "Concat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Concat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MultiReader"
.end annotation


# instance fields
.field private factory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

.field private lastChars:[C

.field private lastPos:I

.field private needAddSeparator:Z

.field private reader:Ljava/io/Reader;

.field private readerSources:Ljava/util/Iterator;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Concat;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/util/Iterator;Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .param p2, "readerSources"    # Ljava/util/Iterator;
    .param p3, "factory"    # Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    .prologue
    const/4 v1, 0x0

    .line 231
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 224
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    .line 225
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    .line 226
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    .line 227
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    .line 232
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->readerSources:Ljava/util/Iterator;

    .line 233
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->factory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    .line 234
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/util/Iterator;Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;Lorg/apache/tools/ant/taskdefs/Concat$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/Concat;
    .param p2, "x1"    # Ljava/util/Iterator;
    .param p3, "x2"    # Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;
    .param p4, "x3"    # Lorg/apache/tools/ant/taskdefs/Concat$1;

    .prologue
    .line 223
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;-><init>(Lorg/apache/tools/ant/taskdefs/Concat;Ljava/util/Iterator;Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;)V

    return-void
.end method

.method private addLastChar(C)V
    .locals 4
    .param p1, "ch"    # C

    .prologue
    .line 355
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    array-length v1, v1

    add-int/lit8 v0, v1, -0x2

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 356
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    add-int/lit8 v3, v0, 0x1

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 355
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 358
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aput-char p1, v1, v2

    .line 359
    return-void
.end method

.method private getReader()Ljava/io/Reader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->readerSources:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->factory:Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->readerSources:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;->getReader(Ljava/lang/Object;)Ljava/io/Reader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 241
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    return-object v0
.end method

.method private isFixLastLine()Z
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Concat;->access$100(Lorg/apache/tools/ant/taskdefs/Concat;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Concat;->access$200(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/StringBuffer;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMissingEndOfLine()Z
    .locals 3

    .prologue
    .line 366
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 367
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    aget-char v1, v1, v0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_0

    .line 368
    const/4 v1, 0x1

    .line 371
    :goto_1
    return v1

    .line 366
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 371
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private nextReader()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->close()V

    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    .line 247
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
    .line 345
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    if-eqz v0, :cond_0

    .line 346
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 348
    :cond_0
    return-void
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    const/4 v5, 0x0

    .line 257
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    if-eqz v2, :cond_1

    .line 258
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 259
    .local v1, "ret":I
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 260
    iput v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    .line 261
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    .line 278
    .end local v1    # "ret":I
    :cond_0
    :goto_0
    return v1

    .line 265
    :cond_1
    :goto_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->getReader()Ljava/io/Reader;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 266
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->getReader()Ljava/io/Reader;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/Reader;->read()I

    move-result v0

    .line 267
    .local v0, "ch":I
    if-ne v0, v1, :cond_2

    .line 268
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->nextReader()V

    .line 269
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->isFixLastLine()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->isMissingEndOfLine()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 270
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    .line 271
    iput v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    goto :goto_1

    .line 274
    :cond_2
    int-to-char v2, v0

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->addLastChar(C)V

    move v1, v0

    .line 275
    goto :goto_0
.end method

.method public read([CII)I
    .locals 8
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v7, 0x0

    .line 292
    const/4 v0, 0x0

    .line 293
    .local v0, "amountRead":I
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->getReader()Ljava/io/Reader;

    move-result-object v4

    if-nez v4, :cond_1

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    if-eqz v4, :cond_9

    .line 294
    :cond_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    if-eqz v4, :cond_4

    .line 295
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    aput-char v4, p1, p2

    .line 296
    iget v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Concat;->access$000(Lorg/apache/tools/ant/taskdefs/Concat;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 297
    iput v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    .line 298
    iput-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    .line 300
    :cond_2
    add-int/lit8 p3, p3, -0x1

    .line 301
    add-int/lit8 p2, p2, 0x1

    .line 302
    add-int/lit8 v0, v0, 0x1

    .line 303
    if-nez p3, :cond_0

    move v3, v0

    .line 337
    :cond_3
    :goto_1
    return v3

    .line 308
    :cond_4
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->getReader()Ljava/io/Reader;

    move-result-object v4

    invoke-virtual {v4, p1, p2, p3}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 309
    .local v2, "nRead":I
    if-eq v2, v3, :cond_5

    if-nez v2, :cond_6

    .line 310
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->nextReader()V

    .line 311
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->isFixLastLine()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->isMissingEndOfLine()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 312
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->needAddSeparator:Z

    .line 313
    iput v7, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastPos:I

    goto :goto_0

    .line 316
    :cond_6
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->isFixLastLine()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 317
    move v1, v2

    .line 318
    .local v1, "i":I
    :goto_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->lastChars:[C

    array-length v4, v4

    sub-int v4, v2, v4

    if-le v1, v4, :cond_7

    .line 320
    if-gtz v1, :cond_8

    .line 326
    .end local v1    # "i":I
    :cond_7
    sub-int/2addr p3, v2

    .line 327
    add-int/2addr p2, v2

    .line 328
    add-int/2addr v0, v2

    .line 329
    if-nez p3, :cond_0

    move v3, v0

    .line 330
    goto :goto_1

    .line 323
    .restart local v1    # "i":I
    :cond_8
    add-int v4, p2, v1

    add-int/lit8 v4, v4, -0x1

    aget-char v4, p1, v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/Concat$MultiReader;->addLastChar(C)V

    .line 319
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 334
    .end local v1    # "i":I
    .end local v2    # "nRead":I
    :cond_9
    if-eqz v0, :cond_3

    move v3, v0

    .line 337
    goto :goto_1
.end method
