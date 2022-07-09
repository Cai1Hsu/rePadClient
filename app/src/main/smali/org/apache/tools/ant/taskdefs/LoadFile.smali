.class public Lorg/apache/tools/ant/taskdefs/LoadFile;
.super Lorg/apache/tools/ant/taskdefs/LoadResource;
.source "LoadFile.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadResource;-><init>()V

    return-void
.end method


# virtual methods
.method public final setSrcFile(Ljava/io/File;)V
    .locals 1
    .param p1, "srcFile"    # Ljava/io/File;

    .prologue
    .line 38
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/LoadFile;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 39
    return-void
.end method
