.class final Lorg/jivesoftware/smack/packet/IQ$2;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "IQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/packet/IQ;->createErrorResponse(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smack/packet/XMPPError;)Lorg/jivesoftware/smack/packet/IQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$request:Lorg/jivesoftware/smack/packet/IQ;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/packet/IQ;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/IQ$2;->val$request:Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/IQ$2;->val$request:Lorg/jivesoftware/smack/packet/IQ;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getChildElementXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
