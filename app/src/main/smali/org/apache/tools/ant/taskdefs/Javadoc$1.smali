.class Lorg/apache/tools/ant/taskdefs/Javadoc$1;
.super Ljava/lang/Object;
.source "Javadoc.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 2389
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$1;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p1, "dir1"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 2390
    const-string/jumbo v0, ".java"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$1;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->access$100(Lorg/apache/tools/ant/taskdefs/Javadoc;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "package.html"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
