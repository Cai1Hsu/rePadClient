.class public Lorg/apache/tools/ant/types/Path$PathElement;
.super Ljava/lang/Object;
.source "Path.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PathElement"
.end annotation


# instance fields
.field private parts:[Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/types/Path;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/types/Path$PathElement;->this$0:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getParts()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    return-object v0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 133
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 125
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    iget-object v1, p0, Lorg/apache/tools/ant/types/Path$PathElement;->this$0:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    return-object v0
.end method

.method public setLocation(Ljava/io/File;)V
    .locals 3
    .param p1, "loc"    # Ljava/io/File;

    .prologue
    .line 99
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/types/Path;->translateFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->this$0:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/tools/ant/types/Path;->translatePath(Lorg/apache/tools/ant/Project;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    .line 109
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path$PathElement;->parts:[Ljava/lang/String;

    array-length v0, v0

    goto :goto_0
.end method
