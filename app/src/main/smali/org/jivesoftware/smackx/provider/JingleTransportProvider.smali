.class public abstract Lorg/jivesoftware/smackx/provider/JingleTransportProvider;
.super Ljava/lang/Object;
.source "JingleTransportProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/provider/JingleTransportProvider$RawUdp;,
        Lorg/jivesoftware/smackx/provider/JingleTransportProvider$Ice;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method protected getInstance()Lorg/jivesoftware/smackx/packet/JingleTransport;
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleTransport;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/JingleTransport;-><init>()V

    return-object v0
.end method

.method protected abstract parseCandidate(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, "done":Z
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider;->getInstance()Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v4

    .line 65
    .local v4, "trans":Lorg/jivesoftware/smackx/packet/JingleTransport;
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 66
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 67
    .local v1, "eventType":I
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 69
    .local v3, "name":Ljava/lang/String;
    const/4 v5, 0x2

    if-ne v1, v5, :cond_2

    .line 70
    const-string/jumbo v5, "candidate"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 71
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider;->parseCandidate(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;

    move-result-object v2

    .line 72
    .local v2, "jtc":Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    if-eqz v2, :cond_0

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smackx/packet/JingleTransport;->addCandidate(Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;)V

    goto :goto_0

    .line 75
    .end local v2    # "jtc":Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    :cond_1
    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unknown tag \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\" in transport element."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v5

    .line 78
    :cond_2
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    .line 79
    const-string/jumbo v5, "transport"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 80
    const/4 v0, 0x1

    goto :goto_0

    .line 85
    .end local v1    # "eventType":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_3
    return-object v4
.end method
