.class final Lorg/jivesoftware/smack/PrivacyListManager$1;
.super Ljava/lang/Object;
.source "PrivacyListManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionCreationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PrivacyListManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 59
    new-instance v0, Lorg/jivesoftware/smack/PrivacyListManager;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/jivesoftware/smack/PrivacyListManager;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/PrivacyListManager$1;)V

    .line 60
    return-void
.end method
