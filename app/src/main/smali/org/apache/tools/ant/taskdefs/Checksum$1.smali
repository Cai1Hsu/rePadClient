.class Lorg/apache/tools/ant/taskdefs/Checksum$1;
.super Ljava/lang/Object;
.source "Checksum.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Checksum;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Checksum;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Checksum;

    .prologue
    .line 559
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Checksum$1;->this$0:Lorg/apache/tools/ant/taskdefs/Checksum;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 560
    move-object v0, p1

    check-cast v0, Ljava/io/File;

    .local v0, "f1":Ljava/io/File;
    move-object v1, p2

    .line 561
    check-cast v1, Ljava/io/File;

    .line 562
    .local v1, "f2":Ljava/io/File;
    if-nez v0, :cond_1

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0

    :cond_1
    if-nez v1, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Checksum$1;->this$0:Lorg/apache/tools/ant/taskdefs/Checksum;

    invoke-static {v2, v0}, Lorg/apache/tools/ant/taskdefs/Checksum;->access$000(Lorg/apache/tools/ant/taskdefs/Checksum;Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Checksum$1;->this$0:Lorg/apache/tools/ant/taskdefs/Checksum;

    invoke-static {v3, v1}, Lorg/apache/tools/ant/taskdefs/Checksum;->access$000(Lorg/apache/tools/ant/taskdefs/Checksum;Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method
