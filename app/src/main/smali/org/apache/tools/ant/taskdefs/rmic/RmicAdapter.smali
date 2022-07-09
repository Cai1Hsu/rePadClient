.class public interface abstract Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
.super Ljava/lang/Object;
.source "RmicAdapter.java"


# virtual methods
.method public abstract execute()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract getClasspath()Lorg/apache/tools/ant/types/Path;
.end method

.method public abstract getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
.end method

.method public abstract setRmic(Lorg/apache/tools/ant/taskdefs/Rmic;)V
.end method
