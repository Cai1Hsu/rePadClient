.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$19;
.super Ljavax/swing/table/DefaultTableModel;
.source "EnhancedDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addInformationPanel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5e48bb661b6d2515L


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;[[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 0
    .param p2, "x0"    # [[Ljava/lang/Object;
    .param p3, "x1"    # [Ljava/lang/Object;

    .prologue
    .line 665
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$19;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0, p2, p3}, Ljavax/swing/table/DefaultTableModel;-><init>([[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public isCellEditable(II)Z
    .locals 1
    .param p1, "rowIndex"    # I
    .param p2, "mColIndex"    # I

    .prologue
    .line 668
    const/4 v0, 0x0

    return v0
.end method
