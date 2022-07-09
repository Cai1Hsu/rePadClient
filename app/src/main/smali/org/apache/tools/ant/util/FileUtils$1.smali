.class Lorg/apache/tools/ant/util/FileUtils$1;
.super Ljava/lang/Object;
.source "FileUtils.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/FileUtils;

.field private final val$localFileName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/FileUtils;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/FileUtils;
    .param p2, "val$localFileName"    # Ljava/lang/String;

    .prologue
    .line 1375
    iput-object p1, p0, Lorg/apache/tools/ant/util/FileUtils$1;->this$0:Lorg/apache/tools/ant/util/FileUtils;

    iput-object p2, p0, Lorg/apache/tools/ant/util/FileUtils$1;->val$localFileName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 1376
    iget-object v0, p0, Lorg/apache/tools/ant/util/FileUtils$1;->val$localFileName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/FileUtils$1;->val$localFileName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
