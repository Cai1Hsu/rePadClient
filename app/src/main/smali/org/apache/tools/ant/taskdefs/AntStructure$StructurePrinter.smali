.class public interface abstract Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;
.super Ljava/lang/Object;
.source "AntStructure.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/AntStructure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StructurePrinter"
.end annotation


# virtual methods
.method public abstract printElementDecl(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Class;)V
.end method

.method public abstract printHead(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/util/Hashtable;Ljava/util/Hashtable;)V
.end method

.method public abstract printTail(Ljava/io/PrintWriter;)V
.end method

.method public abstract printTargetDecl(Ljava/io/PrintWriter;)V
.end method
