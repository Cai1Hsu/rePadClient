.class public Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtensionInfo"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private path:Lorg/apache/tools/ant/types/Path;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 139
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 195
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    .line 197
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->name:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 171
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setPathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 207
    return-void
.end method
