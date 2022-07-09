.class Lorg/apache/tools/ant/taskdefs/Copy$1;
.super Ljava/lang/Object;
.source "Copy.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceFactory;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Copy;

.field private final val$toDir:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Copy;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Copy;
    .param p2, "val$toDir"    # Ljava/io/File;

    .prologue
    .line 833
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy$1;->this$0:Lorg/apache/tools/ant/taskdefs/Copy;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Copy$1;->val$toDir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 834
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy$1;->val$toDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method
