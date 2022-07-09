.class public interface abstract Lorg/apache/tools/ant/FileScanner;
.super Ljava/lang/Object;
.source "FileScanner.java"


# virtual methods
.method public abstract addDefaultExcludes()V
.end method

.method public abstract getBasedir()Ljava/io/File;
.end method

.method public abstract getExcludedDirectories()[Ljava/lang/String;
.end method

.method public abstract getExcludedFiles()[Ljava/lang/String;
.end method

.method public abstract getIncludedDirectories()[Ljava/lang/String;
.end method

.method public abstract getIncludedFiles()[Ljava/lang/String;
.end method

.method public abstract getNotIncludedDirectories()[Ljava/lang/String;
.end method

.method public abstract getNotIncludedFiles()[Ljava/lang/String;
.end method

.method public abstract scan()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract setBasedir(Ljava/io/File;)V
.end method

.method public abstract setBasedir(Ljava/lang/String;)V
.end method

.method public abstract setCaseSensitive(Z)V
.end method

.method public abstract setExcludes([Ljava/lang/String;)V
.end method

.method public abstract setIncludes([Ljava/lang/String;)V
.end method
