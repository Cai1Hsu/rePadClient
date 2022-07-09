.class public interface abstract Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;
.super Ljava/lang/Object;
.source "EJBDeploymentTool.java"


# virtual methods
.method public abstract configure(Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;)V
.end method

.method public abstract processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract setTask(Lorg/apache/tools/ant/Task;)V
.end method

.method public abstract validateConfigured()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method
