.class Lorg/apache/tools/ant/taskdefs/Execute$1;
.super Ljava/io/OutputStream;
.source "Execute.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Execute;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Execute;

    .prologue
    .line 564
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute$1;->this$0:Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 0
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 566
    return-void
.end method
