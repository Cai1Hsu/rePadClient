.class public Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;
.super Ljava/lang/Thread;
.source "PumpStreamHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ThreadWithPumper"
.end annotation


# instance fields
.field private final pumper:Lorg/apache/tools/ant/taskdefs/StreamPumper;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/StreamPumper;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/taskdefs/StreamPumper;

    .prologue
    .line 291
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 292
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;->pumper:Lorg/apache/tools/ant/taskdefs/StreamPumper;

    .line 293
    return-void
.end method


# virtual methods
.method protected getPumper()Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper;->pumper:Lorg/apache/tools/ant/taskdefs/StreamPumper;

    return-object v0
.end method
