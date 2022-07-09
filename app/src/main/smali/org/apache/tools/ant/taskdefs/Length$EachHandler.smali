.class Lorg/apache/tools/ant/taskdefs/Length$EachHandler;
.super Lorg/apache/tools/ant/taskdefs/Length$Handler;
.source "Length.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Length;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EachHandler"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Length;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Length;
    .param p2, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 289
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    .line 290
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Length$Handler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    .line 291
    return-void
.end method


# virtual methods
.method protected handle(Lorg/apache/tools/ant/types/Resource;)V
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;->getPs()Ljava/io/PrintStream;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 294
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;->getPs()Ljava/io/PrintStream;

    move-result-object v2

    const-string/jumbo v3, " : "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 296
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    .line 297
    .local v0, "size":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 298
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;->getPs()Ljava/io/PrintStream;

    move-result-object v2

    const-string/jumbo v3, "unknown"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 302
    :goto_0
    return-void

    .line 300
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;->getPs()Ljava/io/PrintStream;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/io/PrintStream;->println(J)V

    goto :goto_0
.end method
