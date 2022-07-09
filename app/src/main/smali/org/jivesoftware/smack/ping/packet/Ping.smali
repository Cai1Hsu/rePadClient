.class public Lorg/jivesoftware/smack/ping/packet/Ping;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Ping.java"


# static fields
.field public static final ELEMENT:Ljava/lang/String; = "ping"

.field public static final NAMESPACE:Ljava/lang/String; = "urn:xmpp:ping"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 31
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/ping/packet/Ping;->setTo(Ljava/lang/String;)V

    .line 32
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/ping/packet/Ping;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 33
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    const-string/jumbo v0, "<ping xmlns=\'urn:xmpp:ping\' />"

    return-object v0
.end method
