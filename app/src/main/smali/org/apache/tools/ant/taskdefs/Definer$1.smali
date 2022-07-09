.class Lorg/apache/tools/ant/taskdefs/Definer$1;
.super Ljava/lang/Object;
.source "Definer.java"

# interfaces
.implements Ljava/util/Enumeration;


# instance fields
.field private more:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Definer;

.field private final val$url:Ljava/net/URL;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Definer;Ljava/net/URL;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Definer;
    .param p2, "val$url"    # Ljava/net/URL;

    .prologue
    .line 257
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->this$0:Lorg/apache/tools/ant/taskdefs/Definer;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->val$url:Ljava/net/URL;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 253
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->more:Z

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->more:Z

    return v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 258
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->more:Z

    if-eqz v0, :cond_0

    .line 259
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->more:Z

    .line 260
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer$1;->val$url:Ljava/net/URL;

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method
