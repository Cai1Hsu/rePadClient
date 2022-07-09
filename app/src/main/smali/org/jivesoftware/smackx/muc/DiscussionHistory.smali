.class public Lorg/jivesoftware/smackx/muc/DiscussionHistory;
.super Ljava/lang/Object;
.source "DiscussionHistory.java"


# instance fields
.field private maxChars:I

.field private maxStanzas:I

.field private seconds:I

.field private since:Ljava/util/Date;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    .line 51
    iput v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    .line 52
    iput v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    return-void
.end method

.method private isConfigured()Z
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 142
    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    if-gt v0, v1, :cond_0

    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    if-gt v0, v1, :cond_0

    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    if-gt v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->since:Ljava/util/Date;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method getMUCHistory()Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 154
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->isConfigured()Z

    move-result v1

    if-nez v1, :cond_1

    .line 155
    const/4 v0, 0x0

    .line 171
    :cond_0
    :goto_0
    return-object v0

    .line 158
    :cond_1
    new-instance v0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;-><init>()V

    .line 159
    .local v0, "mucHistory":Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    if-le v1, v2, :cond_2

    .line 160
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->setMaxChars(I)V

    .line 162
    :cond_2
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    if-le v1, v2, :cond_3

    .line 163
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->setMaxStanzas(I)V

    .line 165
    :cond_3
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    if-le v1, v2, :cond_4

    .line 166
    iget v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->setSeconds(I)V

    .line 168
    :cond_4
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->since:Ljava/util/Date;

    if-eqz v1, :cond_0

    .line 169
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->since:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->setSince(Ljava/util/Date;)V

    goto :goto_0
.end method

.method public getMaxChars()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    return v0
.end method

.method public getMaxStanzas()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    return v0
.end method

.method public getSeconds()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    return v0
.end method

.method public getSince()Ljava/util/Date;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->since:Ljava/util/Date;

    return-object v0
.end method

.method public setMaxChars(I)V
    .locals 0
    .param p1, "maxChars"    # I

    .prologue
    .line 101
    iput p1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxChars:I

    .line 102
    return-void
.end method

.method public setMaxStanzas(I)V
    .locals 0
    .param p1, "maxStanzas"    # I

    .prologue
    .line 110
    iput p1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->maxStanzas:I

    .line 111
    return-void
.end method

.method public setSeconds(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 122
    iput p1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->seconds:I

    .line 123
    return-void
.end method

.method public setSince(Ljava/util/Date;)V
    .locals 0
    .param p1, "since"    # Ljava/util/Date;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/DiscussionHistory;->since:Ljava/util/Date;

    .line 134
    return-void
.end method
