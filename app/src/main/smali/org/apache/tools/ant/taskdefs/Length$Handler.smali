.class abstract Lorg/apache/tools/ant/taskdefs/Length$Handler;
.super Ljava/lang/Object;
.source "Length.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Length;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "Handler"
.end annotation


# instance fields
.field private ps:Ljava/io/PrintStream;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Length;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Length;
    .param p2, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 273
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length$Handler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 274
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Length$Handler;->ps:Ljava/io/PrintStream;

    .line 275
    return-void
.end method


# virtual methods
.method complete()V
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length$Handler;->ps:Ljava/io/PrintStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 285
    return-void
.end method

.method protected getPs()Ljava/io/PrintStream;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length$Handler;->ps:Ljava/io/PrintStream;

    return-object v0
.end method

.method protected abstract handle(Lorg/apache/tools/ant/types/Resource;)V
.end method
