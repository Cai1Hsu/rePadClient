.class public interface abstract Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
.super Ljava/lang/Object;
.source "JspCompilerAdapter.java"


# virtual methods
.method public abstract createMangler()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;
.end method

.method public abstract execute()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract implementsOwnDependencyChecking()Z
.end method

.method public abstract setJspc(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;)V
.end method
