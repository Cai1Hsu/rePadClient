.class public Lorg/apache/tools/ant/taskdefs/MacroInstance$Element;
.super Ljava/lang/Object;
.source "MacroInstance.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroInstance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Element"
.end annotation


# instance fields
.field private unknownElements:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance$Element;->unknownElements:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance$Element;->unknownElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method

.method public getUnknownElements()Ljava/util/List;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroInstance$Element;->unknownElements:Ljava/util/List;

    return-object v0
.end method
