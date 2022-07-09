.class public Lorg/jivesoftware/smackx/packet/DelayInfo;
.super Lorg/jivesoftware/smackx/packet/DelayInformation;
.source "DelayInfo.java"


# instance fields
.field wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/packet/DelayInformation;)V
    .locals 1
    .param p1, "delay"    # Lorg/jivesoftware/smackx/packet/DelayInformation;

    .prologue
    .line 40
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DelayInformation;->getStamp()Ljava/util/Date;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/packet/DelayInformation;-><init>(Ljava/util/Date;)V

    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    .line 42
    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    const-string/jumbo v0, "delay"

    return-object v0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DelayInformation;->getFrom()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    const-string/jumbo v0, "urn:xmpp:delay"

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DelayInformation;->getReason()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStamp()Ljava/util/Date;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DelayInformation;->getStamp()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/DelayInformation;->setFrom(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public setReason(Ljava/lang/String;)V
    .locals 1
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DelayInfo;->wrappedInfo:Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/DelayInformation;->setReason(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    const-string/jumbo v1, " stamp=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getStamp()Ljava/util/Date;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->formatXEP0082Date(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getFrom()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 95
    const-string/jumbo v1, " from=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    :cond_0
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getReason()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 99
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    :cond_1
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DelayInfo;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
