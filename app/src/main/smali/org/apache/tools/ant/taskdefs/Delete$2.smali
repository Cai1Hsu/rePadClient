.class Lorg/apache/tools/ant/taskdefs/Delete$2;
.super Ljava/lang/Object;
.source "Delete.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Delete;

.field private final val$files:[Ljava/lang/String;

.field private final val$fsDir:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Delete;[Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Delete;
    .param p2, "val$files"    # [Ljava/lang/String;
    .param p3, "val$fsDir"    # Ljava/io/File;

    .prologue
    .line 643
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->this$0:Lorg/apache/tools/ant/taskdefs/Delete;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->val$files:[Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->val$fsDir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 638
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 644
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->this$0:Lorg/apache/tools/ant/taskdefs/Delete;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->val$fsDir:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->val$files:[Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 641
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete$2;->val$files:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method
