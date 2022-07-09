.class public Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;
.super Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.source "TransportCandidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Fixed"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 416
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>()V

    .line 417
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 426
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>(Ljava/lang/String;I)V

    .line 427
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "generation"    # I

    .prologue
    .line 437
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>(Ljava/lang/String;II)V

    .line 438
    return-void
.end method
