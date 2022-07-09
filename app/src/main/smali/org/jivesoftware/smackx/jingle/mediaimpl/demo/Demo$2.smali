.class Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;
.super Ljavax/swing/AbstractAction;
.source "Demo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->createGUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3bcaaea9173456afL


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-direct {p0, p2}, Ljavax/swing/AbstractAction;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 124
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 132
    :goto_0
    return-void

    .line 126
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$300(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleManager;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$200(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Ljavax/swing/JTextField;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/swing/JTextField;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleManager;->createOutgoingJingleSession(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$102(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 127
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->startOutgoing()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e1":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method
