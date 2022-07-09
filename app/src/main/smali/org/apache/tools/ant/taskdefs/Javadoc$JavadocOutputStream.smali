.class Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
.super Lorg/apache/tools/ant/taskdefs/LogOutputStream;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JavadocOutputStream"
.end annotation


# instance fields
.field private queuedLine:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;I)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;
    .param p2, "level"    # I

    .prologue
    .line 2426
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    .line 2427
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .line 2435
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    .line 2428
    return-void
.end method


# virtual methods
.method protected logFlush()V
    .locals 2

    .prologue
    .line 2458
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2459
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-super {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    .line 2460
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    .line 2462
    :cond_0
    return-void
.end method

.method protected processLine(Ljava/lang/String;I)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "messageLevel"    # I

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x2

    .line 2437
    if-ne p2, v1, :cond_1

    const-string/jumbo v0, "Generating "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2439
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2440
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    invoke-super {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    .line 2442
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    .line 2454
    :goto_0
    return-void

    .line 2444
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 2445
    const-string/jumbo v0, "Building "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2446
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    invoke-super {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    .line 2450
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    .line 2452
    :cond_2
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    goto :goto_0

    .line 2448
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->queuedLine:Ljava/lang/String;

    invoke-super {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    goto :goto_1
.end method
