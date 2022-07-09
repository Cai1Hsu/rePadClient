.class public Lorg/jivesoftware/smackx/jingle/JingleException;
.super Lorg/jivesoftware/smack/XMPPException;
.source "JingleException.java"


# static fields
.field private static final serialVersionUID:J = -0x151c7efda23cc956L


# instance fields
.field private final error:Lorg/jivesoftware/smackx/packet/JingleError;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPException;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleException;->error:Lorg/jivesoftware/smackx/packet/JingleError;

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleException;->error:Lorg/jivesoftware/smackx/packet/JingleError;

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/JingleError;)V
    .locals 0
    .param p1, "error"    # Lorg/jivesoftware/smackx/packet/JingleError;

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPException;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleException;->error:Lorg/jivesoftware/smackx/packet/JingleError;

    .line 60
    return-void
.end method


# virtual methods
.method public getError()Lorg/jivesoftware/smackx/packet/JingleError;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleException;->error:Lorg/jivesoftware/smackx/packet/JingleError;

    return-object v0
.end method
