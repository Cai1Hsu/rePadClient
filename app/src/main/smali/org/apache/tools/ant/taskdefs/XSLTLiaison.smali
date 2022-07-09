.class public interface abstract Lorg/apache/tools/ant/taskdefs/XSLTLiaison;
.super Ljava/lang/Object;
.source "XSLTLiaison.java"


# static fields
.field public static final FILE_PROTOCOL_PREFIX:Ljava/lang/String; = "file://"


# virtual methods
.method public abstract addParam(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract setStylesheet(Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract transform(Ljava/io/File;Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
