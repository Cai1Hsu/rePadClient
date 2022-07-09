.class public Lorg/jivesoftware/smackx/search/UserSearch;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "UserSearch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/search/UserSearch$Provider;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 49
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/search/SimpleUserSearch;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {p0, p1, p2}, Lorg/jivesoftware/smackx/search/UserSearch;->buildDataForm(Lorg/jivesoftware/smackx/search/SimpleUserSearch;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V

    return-void
.end method

.method private static buildDataForm(Lorg/jivesoftware/smackx/search/SimpleUserSearch;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8
    .param p0, "search"    # Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    .param p1, "instructions"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 210
    new-instance v0, Lorg/jivesoftware/smackx/packet/DataForm;

    const-string/jumbo v5, "form"

    invoke-direct {v0, v5}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    .line 211
    .local v0, "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    const/4 v1, 0x0

    .line 212
    .local v1, "done":Z
    const-string/jumbo v5, "User Search"

    invoke-virtual {v0, v5}, Lorg/jivesoftware/smackx/packet/DataForm;->setTitle(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/DataForm;->addInstruction(Ljava/lang/String;)V

    .line 214
    :cond_0
    :goto_0
    if-nez v1, :cond_7

    .line 215
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 217
    .local v2, "eventType":I
    if-ne v2, v7, :cond_5

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "jabber:x:data"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 218
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 219
    .local v4, "name":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smackx/FormField;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 222
    .local v3, "field":Lorg/jivesoftware/smackx/FormField;
    const-string/jumbo v5, "first"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 223
    const-string/jumbo v5, "First Name"

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smackx/FormField;->setLabel(Ljava/lang/String;)V

    .line 235
    :cond_1
    :goto_1
    const-string/jumbo v5, "text-single"

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 236
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    goto :goto_0

    .line 225
    :cond_2
    const-string/jumbo v5, "last"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 226
    const-string/jumbo v5, "Last Name"

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smackx/FormField;->setLabel(Ljava/lang/String;)V

    goto :goto_1

    .line 228
    :cond_3
    const-string/jumbo v5, "email"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 229
    const-string/jumbo v5, "Email Address"

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smackx/FormField;->setLabel(Ljava/lang/String;)V

    goto :goto_1

    .line 231
    :cond_4
    const-string/jumbo v5, "nick"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 232
    const-string/jumbo v5, "Nickname"

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smackx/FormField;->setLabel(Ljava/lang/String;)V

    goto :goto_1

    .line 238
    .end local v3    # "field":Lorg/jivesoftware/smackx/FormField;
    .end local v4    # "name":Ljava/lang/String;
    :cond_5
    const/4 v5, 0x3

    if-ne v2, v5, :cond_6

    .line 239
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "query"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 240
    const/4 v1, 0x1

    goto :goto_0

    .line 243
    :cond_6
    if-ne v2, v7, :cond_0

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "jabber:x:data"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 244
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, p2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 246
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 249
    .end local v2    # "eventType":I
    :cond_7
    const-string/jumbo v5, "x"

    const-string/jumbo v6, "jabber:x:data"

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v5

    if-nez v5, :cond_8

    .line 250
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 252
    :cond_8
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<query xmlns=\"jabber:iq:search\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/search/UserSearch;->getExtensionsXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    const-string/jumbo v1, "</query>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSearchForm(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/Form;
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "searchService"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 69
    new-instance v2, Lorg/jivesoftware/smackx/search/UserSearch;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/search/UserSearch;-><init>()V

    .line 70
    .local v2, "search":Lorg/jivesoftware/smackx/search/UserSearch;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/search/UserSearch;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 71
    invoke-virtual {v2, p2}, Lorg/jivesoftware/smackx/search/UserSearch;->setTo(Ljava/lang/String;)V

    .line 73
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/search/UserSearch;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 74
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 76
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 79
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 80
    if-nez v1, :cond_0

    .line 81
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 83
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 84
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 86
    :cond_1
    invoke-static {v1}, Lorg/jivesoftware/smackx/Form;->getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;

    move-result-object v3

    return-object v3
.end method

.method public sendSearchForm(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "searchForm"    # Lorg/jivesoftware/smackx/Form;
    .param p3, "searchService"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v2, Lorg/jivesoftware/smackx/search/UserSearch;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/search/UserSearch;-><init>()V

    .line 101
    .local v2, "search":Lorg/jivesoftware/smackx/search/UserSearch;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/search/UserSearch;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 102
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smackx/search/UserSearch;->setTo(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/search/UserSearch;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 105
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/search/UserSearch;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 107
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 109
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 112
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 113
    if-nez v1, :cond_0

    .line 114
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 116
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 117
    invoke-virtual {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/search/UserSearch;->sendSimpleSearchForm(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v3

    .line 121
    :goto_0
    return-object v3

    :cond_1
    invoke-static {v1}, Lorg/jivesoftware/smackx/ReportedData;->getReportedDataFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v3

    goto :goto_0
.end method

.method public sendSimpleSearchForm(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 6
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "searchForm"    # Lorg/jivesoftware/smackx/Form;
    .param p3, "searchService"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v2, Lorg/jivesoftware/smackx/search/SimpleUserSearch;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;-><init>()V

    .line 136
    .local v2, "search":Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    invoke-virtual {v2, p2}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->setForm(Lorg/jivesoftware/smackx/Form;)V

    .line 137
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 138
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->setTo(Ljava/lang/String;)V

    .line 140
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 142
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 144
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/IQ;

    .line 147
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 148
    if-nez v1, :cond_0

    .line 149
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "No response from server on status set."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 151
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 152
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 155
    :cond_1
    instance-of v3, v1, Lorg/jivesoftware/smackx/search/SimpleUserSearch;

    if-eqz v3, :cond_2

    .line 156
    check-cast v1, Lorg/jivesoftware/smackx/search/SimpleUserSearch;

    .end local v1    # "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->getReportedData()Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v3

    .line 158
    :goto_0
    return-object v3

    .restart local v1    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method
