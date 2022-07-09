.class Lorg/jivesoftware/smackx/jingle/JingleSession$3;
.super Ljava/lang/Object;
.source "JingleSession.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/JingleSession;->updatePacketListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0

    .prologue
    .line 687
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    const/4 v6, 0x0

    .line 690
    instance-of v7, p1, Lorg/jivesoftware/smack/packet/IQ;

    if-eqz v7, :cond_0

    move-object v1, p1

    .line 691
    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 693
    .local v1, "iq":Lorg/jivesoftware/smack/packet/IQ;
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v3

    .line 695
    .local v3, "me":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 730
    .end local v1    # "iq":Lorg/jivesoftware/smack/packet/IQ;
    .end local v3    # "me":Ljava/lang/String;
    :cond_0
    :goto_0
    return v6

    .line 699
    .restart local v1    # "iq":Lorg/jivesoftware/smack/packet/IQ;
    .restart local v3    # "me":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v4

    .line 701
    .local v4, "other":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getFrom()Ljava/lang/String;

    move-result-object v7

    if-nez v4, :cond_2

    const-string/jumbo v4, ""

    .end local v4    # "other":Ljava/lang/String;
    :cond_2
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 705
    instance-of v7, v1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v7, :cond_6

    move-object v2, v1

    .line 706
    check-cast v2, Lorg/jivesoftware/smackx/packet/Jingle;

    .line 708
    .local v2, "jin":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/Jingle;->getSid()Ljava/lang/String;

    move-result-object v5

    .line 709
    .local v5, "sid":Ljava/lang/String;
    if-eqz v5, :cond_3

    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 710
    :cond_3
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$100()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Ignored Jingle(SID) "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "|"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 699
    .end local v2    # "jin":Lorg/jivesoftware/smackx/packet/Jingle;
    .end local v5    # "sid":Ljava/lang/String;
    :cond_4
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 713
    .restart local v2    # "jin":Lorg/jivesoftware/smackx/packet/Jingle;
    .restart local v5    # "sid":Ljava/lang/String;
    :cond_5
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/Jingle;->getInitiator()Ljava/lang/String;

    move-result-object v0

    .line 714
    .local v0, "ini":Ljava/lang/String;
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$3;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    .line 715
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$100()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Ignored Jingle(INI): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 720
    .end local v0    # "ini":Ljava/lang/String;
    .end local v2    # "jin":Lorg/jivesoftware/smackx/packet/Jingle;
    .end local v5    # "sid":Ljava/lang/String;
    :cond_6
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 721
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$100()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Ignored Jingle(TYPE): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 723
    :cond_7
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 724
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$100()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Ignored Jingle(TYPE): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 728
    :cond_8
    const/4 v6, 0x1

    goto/16 :goto_0
.end method
