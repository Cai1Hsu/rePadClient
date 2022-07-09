.class public Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "ChatSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings$InternalProvider;
    }
.end annotation


# static fields
.field public static final BOT_SETTINGS:I = 0x2

.field public static final ELEMENT_NAME:Ljava/lang/String; = "chat-settings"

.field public static final IMAGE_SETTINGS:I = 0x0

.field public static final NAMESPACE:Ljava/lang/String; = "http://jivesoftware.com/protocol/workgroup"

.field public static final TEXT_SETTINGS:I = 0x1


# instance fields
.field private key:Ljava/lang/String;

.field private settings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;",
            ">;"
        }
    .end annotation
.end field

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->type:I

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->settings:Ljava/util/List;

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->type:I

    .line 57
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->setKey(Ljava/lang/String;)V

    .line 58
    return-void
.end method


# virtual methods
.method public addSetting(Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;)V
    .locals 1
    .param p1, "setting"    # Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->settings:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public getChatSetting(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->getSettings()Ljava/util/Collection;

    move-result-object v1

    .line 78
    .local v1, "col":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;>;"
    if-eqz v1, :cond_1

    .line 79
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 80
    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 81
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    .line 82
    .local v0, "chatSetting":Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    .end local v0    # "chatSetting":Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    .end local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;>;"
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x22

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "chat-settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    const-string/jumbo v1, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->key:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " key=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_0
    iget v1, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->type:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " type=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    :cond_1
    const-string/jumbo v1, "></"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "chat-settings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getFirstEntry()Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->settings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->settings:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    .line 94
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSettings()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->settings:Ljava/util/List;

    return-object v0
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->key:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->type:I

    .line 66
    return-void
.end method
