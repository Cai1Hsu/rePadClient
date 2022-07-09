.class public interface abstract Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
.super Ljava/lang/Object;
.source "DependencyAnalyzer.java"


# virtual methods
.method public abstract addClassPath(Lorg/apache/tools/ant/types/Path;)V
.end method

.method public abstract addRootClass(Ljava/lang/String;)V
.end method

.method public abstract addSourcePath(Lorg/apache/tools/ant/types/Path;)V
.end method

.method public abstract config(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract getClassContainer(Ljava/lang/String;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getClassDependencies()Ljava/util/Enumeration;
.end method

.method public abstract getFileDependencies()Ljava/util/Enumeration;
.end method

.method public abstract getSourceContainer(Ljava/lang/String;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract reset()V
.end method

.method public abstract setClosure(Z)V
.end method
