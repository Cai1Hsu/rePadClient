.class Lorg/apache/tools/ant/taskdefs/Length$AllHandler;
.super Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;
.source "Length.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Length;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AllHandler"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Length;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Length;
    .param p2, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 328
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length$AllHandler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    .line 329
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    .line 330
    return-void
.end method


# virtual methods
.method complete()V
    .locals 4

    .prologue
    .line 332
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$AllHandler;->getPs()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$AllHandler;->getAccum()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/PrintStream;->print(J)V

    .line 333
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->complete()V

    .line 334
    return-void
.end method
