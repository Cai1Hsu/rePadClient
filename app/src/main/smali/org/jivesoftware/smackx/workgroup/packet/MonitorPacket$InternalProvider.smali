.class public Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket$InternalProvider;
.super Ljava/lang/Object;
.source "MonitorPacket.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 85
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    if-eq v4, v6, :cond_0

    .line 86
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string/jumbo v5, "Parser not in proper position, or bad XML."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 89
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;-><init>()V

    .line 91
    .local v2, "packet":Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;
    const/4 v0, 0x0

    .line 94
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_4

    .line 95
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 96
    .local v1, "eventType":I
    if-ne v1, v6, :cond_3

    const-string/jumbo v4, "isMonitor"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 97
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "value":Ljava/lang/String;
    const-string/jumbo v4, "false"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 99
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setMonitor(Z)V

    goto :goto_0

    .line 102
    :cond_2
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/workgroup/packet/MonitorPacket;->setMonitor(Z)V

    goto :goto_0

    .line 105
    .end local v3    # "value":Ljava/lang/String;
    :cond_3
    const/4 v4, 0x3

    if-ne v1, v4, :cond_1

    const-string/jumbo v4, "monitor"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 106
    const/4 v0, 0x1

    goto :goto_0

    .line 110
    .end local v1    # "eventType":I
    :cond_4
    return-object v2
.end method
