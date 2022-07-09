.class public Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
.super Ljava/lang/Object;
.source "BookmarkedConference.java"

# interfaces
.implements Lorg/jivesoftware/smackx/bookmark/SharedBookmark;


# instance fields
.field private autoJoin:Z

.field private isShared:Z

.field private final jid:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private nickname:Ljava/lang/String;

.field private password:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->jid:Ljava/lang/String;

    .line 39
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "jid"    # Ljava/lang/String;
    .param p3, "autoJoin"    # Z
    .param p4, "nickname"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->name:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->jid:Ljava/lang/String;

    .line 46
    iput-boolean p3, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->autoJoin:Z

    .line 47
    iput-object p4, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->nickname:Ljava/lang/String;

    .line 48
    iput-object p5, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->password:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 116
    if-eqz p1, :cond_0

    instance-of v1, p1, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    if-nez v1, :cond_1

    .line 117
    :cond_0
    const/4 v1, 0x0

    .line 120
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 119
    check-cast v0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    .line 120
    .local v0, "conference":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getJid()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->jid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNickname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->nickname:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->password:Ljava/lang/String;

    return-object v0
.end method

.method public isAutoJoin()Z
    .locals 1

    .prologue
    .line 71
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->autoJoin:Z

    return v0
.end method

.method public isShared()Z
    .locals 1

    .prologue
    .line 128
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->isShared:Z

    return v0
.end method

.method protected setAutoJoin(Z)V
    .locals 0
    .param p1, "autoJoin"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->autoJoin:Z

    .line 76
    return-void
.end method

.method protected setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->name:Ljava/lang/String;

    .line 63
    return-void
.end method

.method protected setNickname(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickname"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->nickname:Ljava/lang/String;

    .line 99
    return-void
.end method

.method protected setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->password:Ljava/lang/String;

    .line 113
    return-void
.end method

.method protected setShared(Z)V
    .locals 0
    .param p1, "isShared"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->isShared:Z

    .line 125
    return-void
.end method
