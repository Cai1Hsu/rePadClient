.class public Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;
.super Ljava/lang/Object;
.source "FixCRLF.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/FixCRLF;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "OneLiner"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;
    }
.end annotation


# static fields
.field private static final CTRLZ:C = '\u001a'

.field private static final INBUFLEN:I = 0x2000

.field private static final LINEBUFLEN:I = 0xc8

.field private static final LOOKING:I = 0x1

.field private static final NOTJAVA:I = 0x0

.field private static final UNDEF:I = -0x1


# instance fields
.field private eofStr:Ljava/lang/StringBuffer;

.field private eolStr:Ljava/lang/StringBuffer;

.field private line:Ljava/lang/StringBuffer;

.field private reachedEof:Z

.field private reader:Ljava/io/BufferedReader;

.field private srcFile:Ljava/io/File;

.field private state:I

.field private final this$0:Lorg/apache/tools/ant/taskdefs/FixCRLF;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/FixCRLF;Ljava/io/File;)V
    .locals 5
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/FixCRLF;
    .param p2, "srcFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 417
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->this$0:Lorg/apache/tools/ant/taskdefs/FixCRLF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 401
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->this$0:Lorg/apache/tools/ant/taskdefs/FixCRLF;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->access$000(Lorg/apache/tools/ant/taskdefs/FixCRLF;)Lorg/apache/tools/ant/filters/FixCrLfFilter;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->getJavafiles()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->state:I

    .line 403
    new-instance v1, Ljava/lang/StringBuffer;

    const/16 v3, 0xc8

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    .line 404
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eofStr:Ljava/lang/StringBuffer;

    .line 407
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    .line 408
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reachedEof:Z

    .line 418
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->srcFile:Ljava/io/File;

    .line 420
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->access$100(Lorg/apache/tools/ant/taskdefs/FixCRLF;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    :goto_1
    const/16 v3, 0x2000

    invoke-direct {v2, v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    .line 425
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->nextLine()V

    .line 430
    return-void

    :cond_0
    move v1, v2

    .line 401
    goto :goto_0

    .line 420
    :cond_1
    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->access$100(Lorg/apache/tools/ant/taskdefs/FixCRLF;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 426
    :catch_0
    move-exception v0

    .line 427
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
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
    .line 576
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    if-eqz v0, :cond_0

    .line 577
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 579
    :cond_0
    return-void
.end method

.method public getEofStr()Ljava/lang/String;
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eofStr:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 537
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->state:I

    return v0
.end method

.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 552
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reachedEof:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 562
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_0

    .line 563
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string/jumbo v2, "OneLiner"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 565
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;-><init>(Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    .local v0, "tmpLine":Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->nextLine()V

    .line 568
    return-object v0
.end method

.method protected nextLine()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/16 v8, 0xd

    const/4 v7, -0x1

    const/16 v6, 0xa

    .line 438
    const/4 v0, -0x1

    .line 439
    .local v0, "ch":I
    const/4 v2, 0x0

    .line 441
    .local v2, "eolcount":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    .line 442
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    .line 445
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 446
    :goto_0
    if-eq v0, v7, :cond_0

    if-eq v0, v8, :cond_0

    if-eq v0, v6, :cond_0

    .line 447
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    int-to-char v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 448
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->read()I

    move-result v0

    goto :goto_0

    .line 451
    :cond_0
    if-ne v0, v7, :cond_2

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 453
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reachedEof:Z

    .line 522
    :cond_1
    :goto_1
    return-void

    .line 457
    :cond_2
    int-to-char v4, v0

    packed-switch v4, :pswitch_data_0

    .line 499
    :goto_2
    :pswitch_0
    :sswitch_0
    if-nez v2, :cond_1

    .line 500
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    .line 501
    .local v3, "i":I
    :cond_3
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_4

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v4

    const/16 v5, 0x1a

    if-eq v4, v5, :cond_3

    .line 504
    :cond_4
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_1

    .line 507
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eofStr:Ljava/lang/StringBuffer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 508
    if-gez v3, :cond_6

    .line 509
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 510
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reachedEof:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 518
    .end local v3    # "i":I
    :catch_0
    move-exception v1

    .line 519
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->srcFile:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->this$0:Lorg/apache/tools/ant/taskdefs/FixCRLF;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v4, v5, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 461
    .end local v1    # "e":Ljava/io/IOException;
    :pswitch_1
    add-int/lit8 v2, v2, 0x1

    .line 462
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    const/16 v5, 0xd

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 463
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Ljava/io/BufferedReader;->mark(I)V

    .line 464
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 465
    sparse-switch v0, :sswitch_data_0

    .line 484
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->reset()V

    goto/16 :goto_2

    .line 467
    :sswitch_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 468
    int-to-char v4, v0

    if-ne v4, v6, :cond_5

    .line 469
    add-int/lit8 v2, v2, 0x2

    .line 470
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    const-string/jumbo v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_2

    .line 472
    :cond_5
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v4}, Ljava/io/BufferedReader;->reset()V

    goto/16 :goto_2

    .line 476
    :sswitch_2
    add-int/lit8 v2, v2, 0x1

    .line 477
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_2

    .line 490
    :pswitch_2
    add-int/lit8 v2, v2, 0x1

    .line 491
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->eolStr:Ljava/lang/StringBuffer;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_2

    .line 512
    .restart local v3    # "i":I
    :cond_6
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->line:Ljava/lang/StringBuffer;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 457
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 465
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0xa -> :sswitch_2
        0xd -> :sswitch_1
    .end sparse-switch
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 545
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->state:I

    .line 546
    return-void
.end method
