.class Lorg/jivesoftware/smack/ReconnectionManager$2;
.super Ljava/lang/Thread;
.source "ReconnectionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/ReconnectionManager;->reconnect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private attempts:I

.field final synthetic this$0:Lorg/jivesoftware/smack/ReconnectionManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/ReconnectionManager;)V
    .locals 1

    .prologue
    .line 90
    iput-object p1, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 95
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    return-void
.end method

.method private timeDelay()I
    .locals 2

    .prologue
    .line 103
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    .line 104
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    const/16 v1, 0xd

    if-le v0, v1, :cond_0

    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    mul-int/lit8 v0, v0, 0x5

    .line 110
    :goto_0
    return v0

    .line 107
    :cond_0
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    const/4 v1, 0x7

    if-le v0, v1, :cond_1

    .line 108
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    goto :goto_0

    .line 110
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 120
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 122
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager$2;->timeDelay()I

    move-result v2

    .line 127
    .local v2, "remainingSeconds":I
    :goto_1
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    if-lez v2, :cond_1

    .line 130
    const-wide/16 v4, 0x3e8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 131
    add-int/lit8 v2, v2, -0x1

    .line 132
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyAttemptToReconnectIn(I)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 135
    :catch_0
    move-exception v1

    .line 136
    .local v1, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 138
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyReconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_1

    .line 144
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 145
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$300(Lorg/jivesoftware/smack/ReconnectionManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->connect()V
    :try_end_1
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 148
    :catch_1
    move-exception v0

    .line 150
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyReconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_0

    .line 153
    .end local v0    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v2    # "remainingSeconds":I
    :cond_2
    return-void
.end method
