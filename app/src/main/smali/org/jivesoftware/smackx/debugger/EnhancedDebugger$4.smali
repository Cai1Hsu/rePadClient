.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$4;
.super Ljavax/swing/table/DefaultTableModel;
.source "EnhancedDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addBasicPanels()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x70e94f258a4d4b30L


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;[Ljava/lang/Object;I)V
    .locals 0
    .param p2, "x0"    # [Ljava/lang/Object;
    .param p3, "x1"    # I

    .prologue
    .line 255
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$4;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0, p2, p3}, Ljavax/swing/table/DefaultTableModel;-><init>([Ljava/lang/Object;I)V

    return-void
.end method


# virtual methods
.method public getColumnClass(I)Ljava/lang/Class;
    .locals 1
    .param p1, "columnIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 262
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 263
    :cond_0
    const-class v0, Ljavax/swing/Icon;

    .line 265
    :goto_0
    return-object v0

    :cond_1
    invoke-super {p0, p1}, Ljavax/swing/table/DefaultTableModel;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method public isCellEditable(II)Z
    .locals 1
    .param p1, "rowIndex"    # I
    .param p2, "mColIndex"    # I

    .prologue
    .line 258
    const/4 v0, 0x0

    return v0
.end method
