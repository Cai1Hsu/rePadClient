.class public Lorg/jivesoftware/smackx/packet/StreamInitiation;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "StreamInitiation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;,
        Lorg/jivesoftware/smackx/packet/StreamInitiation$File;
    }
.end annotation


# instance fields
.field private featureNegotiation:Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

.field private file:Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

.field private id:Ljava/lang/String;

.field private mimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 380
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 4

    .prologue
    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 139
    const-string/jumbo v2, "<si xmlns=\"http://jabber.org/protocol/si\" "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getSessionID()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 141
    const-string/jumbo v2, "id=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getSessionID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getMimeType()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 144
    const-string/jumbo v2, "mime-type=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_1
    const-string/jumbo v2, "profile=\"http://jabber.org/protocol/si/profile/file-transfer\">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->file:Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->toXML()Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "fileXML":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .end local v1    # "fileXML":Ljava/lang/String;
    :cond_2
    :goto_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->featureNegotiation:Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

    if-eqz v2, :cond_3

    .line 162
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->featureNegotiation:Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;->toXML()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    :cond_3
    const-string/jumbo v2, "</si>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 155
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v2

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 156
    const-string/jumbo v2, "<si xmlns=\"http://jabber.org/protocol/si\">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 159
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "IQ Type not understood"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getFeatureNegotiationForm()Lorg/jivesoftware/smackx/packet/DataForm;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->featureNegotiation:Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;->getData()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v0

    return-object v0
.end method

.method public getFile()Lorg/jivesoftware/smackx/packet/StreamInitiation$File;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->file:Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->id:Ljava/lang/String;

    return-object v0
.end method

.method public setFeatureNegotiationForm(Lorg/jivesoftware/smackx/packet/DataForm;)V
    .locals 1
    .param p1, "form"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 117
    new-instance v0, Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;-><init>(Lorg/jivesoftware/smackx/packet/StreamInitiation;Lorg/jivesoftware/smackx/packet/DataForm;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->featureNegotiation:Lorg/jivesoftware/smackx/packet/StreamInitiation$Feature;

    .line 118
    return-void
.end method

.method public setFile(Lorg/jivesoftware/smackx/packet/StreamInitiation$File;)V
    .locals 0
    .param p1, "file"    # Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->file:Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    .line 99
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 0
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->mimeType:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setSesssionID(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/StreamInitiation;->id:Ljava/lang/String;

    .line 54
    return-void
.end method
