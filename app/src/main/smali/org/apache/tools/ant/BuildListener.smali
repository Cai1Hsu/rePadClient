.class public interface abstract Lorg/apache/tools/ant/BuildListener;
.super Ljava/lang/Object;
.source "BuildListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
.end method

.method public abstract taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
.end method
