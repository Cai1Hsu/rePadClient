.class public Lorg/jivesoftware/smackx/provider/DelayInfoProvider;
.super Lorg/jivesoftware/smackx/provider/DelayInformationProvider;
.source "DelayInfoProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/DelayInformationProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 2
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v1, Lorg/jivesoftware/smackx/packet/DelayInfo;

    invoke-super {p0, p1}, Lorg/jivesoftware/smackx/provider/DelayInformationProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/packet/DelayInfo;-><init>(Lorg/jivesoftware/smackx/packet/DelayInformation;)V

    return-object v1
.end method
