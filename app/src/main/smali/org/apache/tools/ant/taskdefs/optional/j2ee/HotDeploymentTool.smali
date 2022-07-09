.class public interface abstract Lorg/apache/tools/ant/taskdefs/optional/j2ee/HotDeploymentTool;
.super Ljava/lang/Object;
.source "HotDeploymentTool.java"


# static fields
.field public static final ACTION_DELETE:Ljava/lang/String; = "delete"

.field public static final ACTION_DEPLOY:Ljava/lang/String; = "deploy"

.field public static final ACTION_LIST:Ljava/lang/String; = "list"

.field public static final ACTION_UNDEPLOY:Ljava/lang/String; = "undeploy"

.field public static final ACTION_UPDATE:Ljava/lang/String; = "update"


# virtual methods
.method public abstract deploy()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract setTask(Lorg/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy;)V
.end method

.method public abstract validateAttributes()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method
