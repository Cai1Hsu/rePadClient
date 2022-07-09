.class Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;
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
.field private static final serialVersionUID:J = -0x3e8fa8d602ed3503L


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-direct {p0, p2}, Ljavax/swing/AbstractAction;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    const/4 v3, 0x0

    .line 139
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 141
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$102(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 149
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 151
    :try_start_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate()V
    :try_end_1
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 157
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$002(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 159
    :cond_1
    :goto_1
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e1":Lorg/jivesoftware/smack/XMPPException;
    :try_start_2
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$102(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    goto :goto_0

    .end local v0    # "e1":Lorg/jivesoftware/smack/XMPPException;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v2, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$102(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    throw v1

    .line 153
    :catch_1
    move-exception v0

    .line 154
    .restart local v0    # "e1":Lorg/jivesoftware/smack/XMPPException;
    :try_start_3
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 157
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$002(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    goto :goto_1

    .end local v0    # "e1":Lorg/jivesoftware/smack/XMPPException;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v2, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$002(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    throw v1
.end method
