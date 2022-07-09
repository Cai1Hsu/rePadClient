.class public Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
.super Ljava/lang/Object;
.source "PropertyFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;,
        Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;
    }
.end annotation


# static fields
.field private static final DEFAULT_DATE_VALUE:Ljava/lang/String; = "now"

.field private static final DEFAULT_INT_VALUE:I = 0x0

.field private static final DEFAULT_STRING_VALUE:Ljava/lang/String; = ""


# instance fields
.field private defaultValue:Ljava/lang/String;

.field private field:I

.field private key:Ljava/lang/String;

.field private newValue:Ljava/lang/String;

.field private operation:I

.field private pattern:Ljava/lang/String;

.field private type:I

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x0

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 274
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    .line 275
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    .line 276
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    .line 277
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    .line 278
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    .line 279
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    .line 280
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    .line 281
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->field:I

    .line 624
    return-void
.end method

.method private checkParameters()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 525
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 527
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "- is not supported for string properties (key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-nez v0, :cond_1

    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 531
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\"value\" and/or \"default\" attribute must be specified (key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 534
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 535
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "key is mandatory"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 537
    :cond_2
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 538
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "pattern is not supported for string properties (key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 541
    :cond_3
    return-void
.end method

.method private executeDate(Ljava/lang/String;)V
    .locals 8
    .param p1, "oldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 405
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 407
    .local v1, "currentValue":Ljava/util/Calendar;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 408
    const-string/jumbo v5, "yyyy/MM/dd HH:mm"

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    .line 410
    :cond_0
    new-instance v3, Ljava/text/SimpleDateFormat;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 412
    .local v3, "fmt":Ljava/text/DateFormat;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->getCurrentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, "currentStringValue":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 414
    const-string/jumbo v0, "now"

    .line 417
    :cond_1
    const-string/jumbo v5, "now"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 418
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 427
    :goto_0
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    .line 428
    const/4 v4, 0x0

    .line 430
    .local v4, "offset":I
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 431
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 432
    mul-int/lit8 v4, v4, -0x1

    .line 437
    :cond_2
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->field:I

    invoke-virtual {v1, v5, v4}, Ljava/util/Calendar;->add(II)V

    .line 440
    .end local v4    # "offset":I
    :cond_3
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    .line 441
    return-void

    .line 421
    :cond_4
    :try_start_1
    invoke-virtual {v3, v0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 422
    :catch_0
    move-exception v5

    goto :goto_0

    .line 434
    .restart local v4    # "offset":I
    :catch_1
    move-exception v2

    .line 435
    .local v2, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Value not an integer on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private executeInteger(Ljava/lang/String;)V
    .locals 8
    .param p1, "oldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 452
    const/4 v0, 0x0

    .line 453
    .local v0, "currentValue":I
    const/4 v3, 0x0

    .line 456
    .local v3, "newV":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    if-eqz v5, :cond_1

    new-instance v2, Ljava/text/DecimalFormat;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 459
    .local v2, "fmt":Ljava/text/DecimalFormat;
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->getCurrentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 460
    .local v1, "curval":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 461
    invoke-virtual {v2, v1}, Ljava/text/DecimalFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 471
    .end local v1    # "curval":Ljava/lang/String;
    :goto_1
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_3

    .line 472
    move v3, v0

    .line 492
    :cond_0
    :goto_2
    int-to-long v6, v3

    invoke-virtual {v2, v6, v7}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    .line 493
    return-void

    .line 456
    .end local v2    # "fmt":Ljava/text/DecimalFormat;
    :cond_1
    new-instance v2, Ljava/text/DecimalFormat;

    invoke-direct {v2}, Ljava/text/DecimalFormat;-><init>()V

    goto :goto_0

    .line 463
    .restart local v1    # "curval":Ljava/lang/String;
    .restart local v2    # "fmt":Ljava/text/DecimalFormat;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 474
    .end local v1    # "curval":Ljava/lang/String;
    :cond_3
    const/4 v4, 0x1

    .line 475
    .local v4, "operationValue":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 477
    :try_start_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/text/DecimalFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v4

    .line 485
    :cond_4
    :goto_3
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    if-nez v5, :cond_5

    .line 486
    add-int v3, v0, v4

    goto :goto_2

    .line 487
    :cond_5
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 488
    sub-int v3, v0, v4

    goto :goto_2

    .line 480
    :catch_0
    move-exception v5

    goto :goto_3

    .line 478
    :catch_1
    move-exception v5

    goto :goto_3

    .line 467
    .end local v4    # "operationValue":I
    :catch_2
    move-exception v5

    goto :goto_1

    .line 465
    :catch_3
    move-exception v5

    goto :goto_1
.end method

.method private executeString(Ljava/lang/String;)V
    .locals 4
    .param p1, "oldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 503
    const-string/jumbo v1, ""

    .line 505
    .local v1, "newV":Ljava/lang/String;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->getCurrentValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 507
    .local v0, "currentValue":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 508
    const-string/jumbo v0, ""

    .line 511
    :cond_0
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 512
    move-object v1, v0

    .line 516
    :cond_1
    :goto_0
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    .line 517
    return-void

    .line 513
    :cond_2
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    if-nez v2, :cond_1

    .line 514
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getCurrentValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "oldValue"    # Ljava/lang/String;

    .prologue
    .line 544
    const/4 v0, 0x0

    .line 545
    .local v0, "ret":Ljava/lang/String;
    iget v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    .line 548
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 549
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    .line 554
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_1

    .line 555
    move-object v0, p1

    .line 560
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-eqz v1, :cond_2

    if-nez p1, :cond_2

    .line 561
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    .line 567
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-eqz v1, :cond_3

    if-eqz p1, :cond_3

    .line 568
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    .line 574
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    if-eqz v1, :cond_4

    if-nez p1, :cond_4

    .line 575
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    .line 581
    :cond_4
    :goto_0
    return-object v0

    .line 578
    :cond_5
    if-nez p1, :cond_6

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    :goto_1
    goto :goto_0

    :cond_6
    move-object v0, p1

    goto :goto_1
.end method


# virtual methods
.method protected executeOn(Ljava/util/Properties;)V
    .locals 5
    .param p1, "props"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 363
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->checkParameters()V

    .line 365
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 366
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    :goto_0
    return-void

    .line 371
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 373
    .local v1, "oldValue":Ljava/lang/String;
    :try_start_0
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    if-nez v2, :cond_2

    .line 374
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->executeInteger(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 389
    :goto_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 390
    const-string/jumbo v2, ""

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    .line 394
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->newValue:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 375
    :cond_2
    :try_start_1
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 376
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->executeDate(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 383
    :catch_0
    move-exception v0

    .line 386
    .local v0, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_1

    .line 377
    .end local v0    # "npe":Ljava/lang/NullPointerException;
    :cond_3
    :try_start_2
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    .line 378
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->executeString(Ljava/lang/String;)V

    goto :goto_1

    .line 380
    :cond_4
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unknown operation type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method public setDefault(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 324
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->defaultValue:Ljava/lang/String;

    .line 325
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 288
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->key:Ljava/lang/String;

    .line 289
    return-void
.end method

.method public setOperation(Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;)V
    .locals 1
    .param p1, "value"    # Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;

    .prologue
    .line 306
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Operation;->toOperation(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->operation:I

    .line 307
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 333
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->pattern:Ljava/lang/String;

    .line 334
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;)V
    .locals 1
    .param p1, "value"    # Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;

    .prologue
    .line 314
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry$Type;->toType(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->type:I

    .line 315
    return-void
.end method

.method public setUnit(Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Unit;)V
    .locals 1
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Unit;

    .prologue
    .line 354
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Unit;->getCalendarField()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->field:I

    .line 355
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->value:Ljava/lang/String;

    .line 297
    return-void
.end method
