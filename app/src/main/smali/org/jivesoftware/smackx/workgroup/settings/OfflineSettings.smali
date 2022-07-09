.class public Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "OfflineSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings$InternalProvider;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "offline-settings"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jivesoftware.com/protocol/workgroup"


# instance fields
.field private emailAddress:Ljava/lang/String;

.field private offlineText:Ljava/lang/String;

.field private redirectURL:Ljava/lang/String;

.field private subject:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 113
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x22

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "offline-settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    const-string/jumbo v1, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    const-string/jumbo v1, "></"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "offline-settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEmailAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->emailAddress:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    const-string/jumbo v0, ""

    .line 60
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->emailAddress:Ljava/lang/String;

    goto :goto_0
.end method

.method public getOfflineText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->offlineText:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    const-string/jumbo v0, ""

    .line 49
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->offlineText:Ljava/lang/String;

    goto :goto_0
.end method

.method public getRedirectURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->redirectURL:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 36
    const-string/jumbo v0, ""

    .line 38
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->redirectURL:Ljava/lang/String;

    goto :goto_0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->subject:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    const-string/jumbo v0, ""

    .line 71
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->subject:Ljava/lang/String;

    goto :goto_0
.end method

.method public isConfigured()Z
    .locals 1

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getEmailAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getSubject()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getOfflineText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public redirects()Z
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->getRedirectURL()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/workgroup/util/ModelUtil;->hasLength(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setEmailAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "emailAddress"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->emailAddress:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setOfflineText(Ljava/lang/String;)V
    .locals 0
    .param p1, "offlineText"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->offlineText:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setRedirectURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "redirectURL"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->redirectURL:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/OfflineSettings;->subject:Ljava/lang/String;

    .line 76
    return-void
.end method
