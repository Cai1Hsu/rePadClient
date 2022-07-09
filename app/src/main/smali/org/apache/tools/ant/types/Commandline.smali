.class public Lorg/apache/tools/ant/types/Commandline;
.super Ljava/lang/Object;
.source "Commandline.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Commandline$Marker;,
        Lorg/apache/tools/ant/types/Commandline$Argument;
    }
.end annotation


# static fields
.field protected static final DISCLAIMER:Ljava/lang/String;

.field private static final IS_WIN_9X:Z


# instance fields
.field private arguments:Ljava/util/Vector;

.field private executable:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 57
    const-string/jumbo v0, "win9x"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/types/Commandline;->IS_WIN_9X:Z

    .line 69
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "The \' characters around the executable and arguments are"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "not part of the command."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/Commandline;->DISCLAIMER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "toProcess"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    .line 67
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    .line 83
    invoke-static {p1}, Lorg/apache/tools/ant/types/Commandline;->translateCommandline(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "tmp":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 85
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 86
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 90
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/types/Commandline;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    return-object v0
.end method

.method public static describeArguments(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;
    .locals 1
    .param p0, "line"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 620
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->describeArguments([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static describeArguments([Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 657
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/tools/ant/types/Commandline;->describeArguments([Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static describeArguments([Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p0, "args"    # [Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 671
    if-eqz p0, :cond_0

    array-length v2, p0

    if-gt v2, p1, :cond_1

    .line 672
    :cond_0
    const-string/jumbo v2, ""

    .line 684
    :goto_0
    return-object v2

    .line 674
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v2, "argument"

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 675
    .local v0, "buf":Ljava/lang/StringBuffer;
    array-length v2, p0

    if-le v2, p1, :cond_2

    .line 676
    const-string/jumbo v2, "s"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 678
    :cond_2
    const-string/jumbo v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 679
    move v1, p1

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_3

    .line 680
    const-string/jumbo v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 679
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 683
    :cond_3
    sget-object v2, Lorg/apache/tools/ant/types/Commandline;->DISCLAIMER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 684
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static describeCommand(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;
    .locals 1
    .param p0, "line"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 609
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static describeCommand([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 634
    if-eqz p0, :cond_0

    array-length v1, p0

    if-nez v1, :cond_1

    .line 635
    :cond_0
    const-string/jumbo v1, ""

    .line 646
    :goto_0
    return-object v1

    .line 637
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "Executing \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 638
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 639
    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 640
    array-length v1, p0

    if-le v1, v2, :cond_2

    .line 641
    const-string/jumbo v1, " with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 642
    invoke-static {p0, v2}, Lorg/apache/tools/ant/types/Commandline;->describeArguments([Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 646
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 644
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/types/Commandline;->DISCLAIMER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static quoteArgument(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "argument"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x27

    const/16 v2, 0x22

    const/4 v1, -0x1

    .line 421
    const-string/jumbo v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-le v0, v1, :cond_2

    .line 422
    const-string/jumbo v0, "\'"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-le v0, v1, :cond_0

    .line 423
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can\'t handle single and double quotes in same argument"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 426
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 434
    .end local p0    # "argument":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object p0

    .line 428
    .restart local p0    # "argument":Ljava/lang/String;
    :cond_2
    const-string/jumbo v0, "\'"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gt v0, v1, :cond_3

    const-string/jumbo v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gt v0, v1, :cond_3

    sget-boolean v0, Lorg/apache/tools/ant/types/Commandline;->IS_WIN_9X:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 432
    :cond_3
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static toString([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "line"    # [Ljava/lang/String;

    .prologue
    .line 447
    if-eqz p0, :cond_0

    array-length v2, p0

    if-nez v2, :cond_1

    .line 448
    :cond_0
    const-string/jumbo v2, ""

    .line 458
    :goto_0
    return-object v2

    .line 451
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 452
    .local v1, "result":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 453
    if-lez v0, :cond_2

    .line 454
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 456
    :cond_2
    aget-object v2, p0, v0

    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->quoteArgument(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 458
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static translateCommandline(Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p0, "toProcess"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    .line 468
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_1

    .line 470
    :cond_0
    const/4 v10, 0x0

    new-array v0, v10, [Ljava/lang/String;

    .line 527
    :goto_0
    return-object v0

    .line 474
    :cond_1
    const/4 v6, 0x0

    .line 475
    .local v6, "normal":I
    const/4 v3, 0x1

    .line 476
    .local v3, "inQuote":I
    const/4 v2, 0x2

    .line 477
    .local v2, "inDoubleQuote":I
    const/4 v7, 0x0

    .line 478
    .local v7, "state":I
    new-instance v8, Ljava/util/StringTokenizer;

    const-string/jumbo v10, "\"\' "

    invoke-direct {v8, p0, v10, v11}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 479
    .local v8, "tok":Ljava/util/StringTokenizer;
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 480
    .local v9, "v":Ljava/util/Vector;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 481
    .local v1, "current":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 483
    .local v4, "lastTokenHasBeenQuoted":Z
    :goto_1
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 484
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 485
    .local v5, "nextTok":Ljava/lang/String;
    packed-switch v7, :pswitch_data_0

    .line 503
    const-string/jumbo v10, "\'"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 504
    const/4 v7, 0x1

    .line 515
    :cond_2
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 487
    :pswitch_0
    const-string/jumbo v10, "\'"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 488
    const/4 v4, 0x1

    .line 489
    const/4 v7, 0x0

    goto :goto_1

    .line 491
    :cond_3
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 495
    :pswitch_1
    const-string/jumbo v10, "\""

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 496
    const/4 v4, 0x1

    .line 497
    const/4 v7, 0x0

    goto :goto_1

    .line 499
    :cond_4
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 505
    :cond_5
    const-string/jumbo v10, "\""

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 506
    const/4 v7, 0x2

    goto :goto_2

    .line 507
    :cond_6
    const-string/jumbo v10, " "

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 508
    if-nez v4, :cond_7

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-eqz v10, :cond_2

    .line 509
    :cond_7
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 510
    new-instance v1, Ljava/lang/StringBuffer;

    .end local v1    # "current":Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .restart local v1    # "current":Ljava/lang/StringBuffer;
    goto :goto_2

    .line 513
    :cond_8
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 519
    .end local v5    # "nextTok":Ljava/lang/String;
    :cond_9
    if-nez v4, :cond_a

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v10

    if-eqz v10, :cond_b

    .line 520
    :cond_a
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 522
    :cond_b
    if-eq v7, v11, :cond_c

    const/4 v10, 0x2

    if-ne v7, v10, :cond_d

    .line 523
    :cond_c
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "unbalanced quotes in "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 525
    :cond_d
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v10

    new-array v0, v10, [Ljava/lang/String;

    .line 526
    .local v0, "args":[Ljava/lang/String;
    invoke-virtual {v9, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 485
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public addArguments([Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # [Ljava/lang/String;

    .prologue
    .line 342
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 343
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 342
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 345
    :cond_0
    return-void
.end method

.method public addArgumentsToList(Ljava/util/ListIterator;)V
    .locals 6
    .param p1, "list"    # Ljava/util/ListIterator;

    .prologue
    .line 389
    iget-object v5, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 390
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_1

    .line 391
    iget-object v5, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Commandline$Argument;

    .line 392
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->getParts()[Ljava/lang/String;

    move-result-object v3

    .line 393
    .local v3, "s":[Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 394
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    array-length v5, v3

    if-ge v2, v5, :cond_0

    .line 395
    aget-object v5, v3, v2

    invoke-interface {p1, v5}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 394
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 390
    .end local v2    # "j":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 399
    .end local v0    # "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    .end local v3    # "s":[Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public addCommandToList(Ljava/util/ListIterator;)V
    .locals 1
    .param p1, "list"    # Ljava/util/ListIterator;

    .prologue
    .line 365
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 366
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 368
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Commandline;->addArgumentsToList(Ljava/util/ListIterator;)V

    .line 369
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 557
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    .line 558
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 559
    return-void
.end method

.method public clearArgs()V
    .locals 1

    .prologue
    .line 566
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 567
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 545
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Commandline;

    .line 546
    .local v0, "c":Lorg/apache/tools/ant/types/Commandline;
    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 547
    return-object v0

    .line 548
    .end local v0    # "c":Lorg/apache/tools/ant/types/Commandline;
    :catch_0
    move-exception v1

    .line 549
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 293
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 3
    .param p1, "insertAtStart"    # Z

    .prologue
    .line 307
    new-instance v0, Lorg/apache/tools/ant/types/Commandline$Argument;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline$Argument;-><init>()V

    .line 308
    .local v0, "argument":Lorg/apache/tools/ant/types/Commandline$Argument;
    if-eqz p1, :cond_0

    .line 309
    iget-object v1, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 313
    :goto_0
    return-object v0

    .line 311
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public createMarker()Lorg/apache/tools/ant/types/Commandline$Marker;
    .locals 2

    .prologue
    .line 578
    new-instance v0, Lorg/apache/tools/ant/types/Commandline$Marker;

    iget-object v1, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/Commandline$Marker;-><init>(Lorg/apache/tools/ant/types/Commandline;I)V

    return-object v0
.end method

.method public describeArguments()Ljava/lang/String;
    .locals 1

    .prologue
    .line 598
    invoke-static {p0}, Lorg/apache/tools/ant/types/Commandline;->describeArguments(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public describeCommand()Ljava/lang/String;
    .locals 1

    .prologue
    .line 588
    invoke-static {p0}, Lorg/apache/tools/ant/types/Commandline;->describeCommand(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArguments()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 377
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 378
    .local v1, "result":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/Commandline;->addArgumentsToList(Ljava/util/ListIterator;)V

    .line 379
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    .line 380
    .local v0, "res":[Ljava/lang/String;
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public getCommandline()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 352
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 353
    .local v0, "commands":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 354
    .local v1, "list":Ljava/util/ListIterator;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/Commandline;->addCommandToList(Ljava/util/ListIterator;)V

    .line 355
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-array v2, v3, [Ljava/lang/String;

    .line 356
    .local v2, "result":[Ljava/lang/String;
    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3
.end method

.method public getExecutable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 693
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->arguments:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 3
    .param p1, "executable"    # Ljava/lang/String;

    .prologue
    .line 322
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 327
    :cond_0
    :goto_0
    return-void

    .line 325
    :cond_1
    const/16 v0, 0x2f

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5c

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline;->executable:Ljava/lang/String;

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 536
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 406
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->toString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
