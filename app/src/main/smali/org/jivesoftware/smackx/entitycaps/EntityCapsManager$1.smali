.class final Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionCreationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 102
    instance-of v0, p1, Lorg/jivesoftware/smack/XMPPConnection;

    if-eqz v0, :cond_0

    .line 103
    new-instance v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;)V

    .line 104
    :cond_0
    return-void
.end method
