.class public final Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;
.super Ljava/lang/Object;
.source "XSLTProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/XSLTProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "TraceConfiguration"
.end annotation


# instance fields
.field private elements:Z

.field private extension:Z

.field private generation:Z

.field private selection:Z

.field private templates:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    .prologue
    .line 1426
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getElements()Z
    .locals 1

    .prologue
    .line 1442
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->elements:Z

    return v0
.end method

.method public getExtension()Z
    .locals 1

    .prologue
    .line 1458
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->extension:Z

    return v0
.end method

.method public getGeneration()Z
    .locals 1

    .prologue
    .line 1474
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->generation:Z

    return v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2

    .prologue
    .line 1513
    new-instance v0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;)V

    return-object v0
.end method

.method public getSelection()Z
    .locals 1

    .prologue
    .line 1490
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->selection:Z

    return v0
.end method

.method public getTemplates()Z
    .locals 1

    .prologue
    .line 1506
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->templates:Z

    return v0
.end method

.method public setElements(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1434
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->elements:Z

    .line 1435
    return-void
.end method

.method public setExtension(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1450
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->extension:Z

    .line 1451
    return-void
.end method

.method public setGeneration(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1466
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->generation:Z

    .line 1467
    return-void
.end method

.method public setSelection(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1482
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->selection:Z

    .line 1483
    return-void
.end method

.method public setTemplates(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1498
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;->templates:Z

    .line 1499
    return-void
.end method
