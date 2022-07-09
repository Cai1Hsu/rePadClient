.class public Lorg/jivesoftware/smack/ping/provider/PingProvider;
.super Ljava/lang/Object;
.source "PingProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 1
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v0, Lorg/jivesoftware/smack/ping/packet/Ping;

    invoke-direct {v0}, Lorg/jivesoftware/smack/ping/packet/Ping;-><init>()V

    return-object v0
.end method
