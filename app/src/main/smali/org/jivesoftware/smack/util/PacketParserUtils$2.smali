.class final Lorg/jivesoftware/smack/util/PacketParserUtils$2;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "PacketParserUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/util/PacketParserUtils;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smack/packet/IQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 365
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 1

    .prologue
    .line 368
    const/4 v0, 0x0

    return-object v0
.end method
