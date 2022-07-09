.class public Lorg/apache/tools/ant/ExtensionPoint;
.super Lorg/apache/tools/ant/Target;
.source "ExtensionPoint.java"


# static fields
.field private static final NO_CHILDREN_ALLOWED:Ljava/lang/String; = "you must not nest child elements into an extension-point"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/tools/ant/Target;-><init>()V

    return-void
.end method


# virtual methods
.method public final addDataType(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 45
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must not nest child elements into an extension-point"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final addTask(Lorg/apache/tools/ant/Task;)V
    .locals 2
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 38
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must not nest child elements into an extension-point"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
