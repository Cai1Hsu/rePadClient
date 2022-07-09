.class public Lorg/jivesoftware/smackx/packet/Jingle;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Jingle.java"


# static fields
.field public static final NAMESPACE:Ljava/lang/String; = "urn:xmpp:tmp:jingle"

.field public static final NODENAME:Ljava/lang/String; = "jingle"


# instance fields
.field private action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field private contentInfo:Lorg/jivesoftware/smackx/packet/JingleContentInfo;

.field private final contents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContent;",
            ">;"
        }
    .end annotation
.end field

.field private initiator:Ljava/lang/String;

.field private responder:Ljava/lang/String;

.field private sid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 152
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 145
    invoke-direct {p0, v0, v0, p1}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Ljava/util/List;Lorg/jivesoftware/smackx/packet/JingleContentInfo;Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lorg/jivesoftware/smackx/packet/JingleContentInfo;Ljava/lang/String;)V
    .locals 2
    .param p2, "mi"    # Lorg/jivesoftware/smackx/packet/JingleContentInfo;
    .param p3, "sid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContent;",
            ">;",
            "Lorg/jivesoftware/smackx/packet/JingleContentInfo;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "contents":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/JingleContent;>;"
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    .line 74
    if-eqz p1, :cond_0

    .line 75
    invoke-interface {p1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 78
    :cond_0
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/packet/Jingle;->setContentInfo(Lorg/jivesoftware/smackx/packet/JingleContentInfo;)V

    .line 79
    invoke-virtual {p0, p3}, Lorg/jivesoftware/smackx/packet/Jingle;->setSid(Ljava/lang/String;)V

    .line 82
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->initiator:Ljava/lang/String;

    .line 83
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->responder:Ljava/lang/String;

    .line 84
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V
    .locals 1
    .param p1, "action"    # Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .prologue
    const/4 v0, 0x0

    .line 131
    invoke-direct {p0, v0, v0, v0}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Ljava/util/List;Lorg/jivesoftware/smackx/packet/JingleContentInfo;Ljava/lang/String;)V

    .line 132
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 135
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/JingleContent;)V
    .locals 2
    .param p1, "content"    # Lorg/jivesoftware/smackx/packet/JingleContent;

    .prologue
    const/4 v1, 0x0

    .line 93
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    .line 95
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    .line 98
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->initiator:Ljava/lang/String;

    .line 99
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->responder:Ljava/lang/String;

    .line 102
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->UNKNOWN:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 103
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/JingleContentInfo;)V
    .locals 2
    .param p1, "info"    # Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    .prologue
    const/4 v1, 0x0

    .line 112
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    .line 114
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/packet/Jingle;->setContentInfo(Lorg/jivesoftware/smackx/packet/JingleContentInfo;)V

    .line 117
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->initiator:Ljava/lang/String;

    .line 118
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->responder:Ljava/lang/String;

    .line 121
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->UNKNOWN:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 122
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 123
    return-void
.end method

.method public static getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    const-string/jumbo v0, "jingle"

    return-object v0
.end method

.method public static getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    const-string/jumbo v0, "urn:xmpp:tmp:jingle"

    return-object v0
.end method

.method public static getSessionHash(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p0, "sid"    # Ljava/lang/String;
    .param p1, "initiator"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 332
    const/16 v0, 0x1f

    .line 333
    .local v0, "PRIME":I
    const/4 v1, 0x1

    .line 334
    .local v1, "result":I
    if-nez p1, :cond_0

    move v3, v2

    :goto_0
    add-int/lit8 v1, v3, 0x1f

    .line 335
    mul-int/lit8 v3, v1, 0x1f

    if-nez p0, :cond_1

    :goto_1
    add-int v1, v3, v2

    .line 336
    return v1

    .line 334
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_0

    .line 335
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_1
.end method


# virtual methods
.method public addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V
    .locals 2
    .param p1, "content"    # Lorg/jivesoftware/smackx/packet/JingleContent;

    .prologue
    .line 242
    if-eqz p1, :cond_0

    .line 243
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    monitor-enter v1

    .line 244
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    monitor-exit v1

    .line 247
    :cond_0
    return-void

    .line 245
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addContents(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "contentList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/JingleContent;>;"
    if-eqz p1, :cond_0

    .line 256
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    monitor-enter v1

    .line 257
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 258
    monitor-exit v1

    .line 260
    :cond_0
    return-void

    .line 258
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    return-object v0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 345
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 347
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/packet/Jingle;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    const-string/jumbo v3, " xmlns=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/packet/Jingle;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getInitiator()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 350
    const-string/jumbo v3, " initiator=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getInitiator()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getResponder()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 353
    const-string/jumbo v3, " responder=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getResponder()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 356
    const-string/jumbo v3, " action=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getSid()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 359
    const-string/jumbo v3, " sid=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/Jingle;->getSid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    :cond_3
    const-string/jumbo v3, ">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    monitor-enter v4

    .line 364
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 365
    .local v1, "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/JingleContent;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 367
    .end local v1    # "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_4
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 370
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contentInfo:Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    if-eqz v3, :cond_5

    .line 371
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contentInfo:Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/JingleContentInfo;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    :cond_5
    const-string/jumbo v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/packet/Jingle;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getContentInfo()Lorg/jivesoftware/smackx/packet/JingleContentInfo;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contentInfo:Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    return-object v0
.end method

.method public getContents()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 220
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    monitor-enter v1

    .line 221
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 222
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getContentsList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 231
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    monitor-enter v1

    .line 232
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contents:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 233
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getInitiator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->initiator:Ljava/lang/String;

    return-object v0
.end method

.method public getResponder()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->responder:Ljava/lang/String;

    return-object v0
.end method

.method public getSid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Jingle;->sid:Ljava/lang/String;

    return-object v0
.end method

.method public setAction(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V
    .locals 0
    .param p1, "action"    # Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .prologue
    .line 277
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->action:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 278
    return-void
.end method

.method public setContentInfo(Lorg/jivesoftware/smackx/packet/JingleContentInfo;)V
    .locals 0
    .param p1, "contentInfo"    # Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    .prologue
    .line 211
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->contentInfo:Lorg/jivesoftware/smackx/packet/JingleContentInfo;

    .line 212
    return-void
.end method

.method public setInitiator(Ljava/lang/String;)V
    .locals 0
    .param p1, "initiator"    # Ljava/lang/String;

    .prologue
    .line 299
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->initiator:Ljava/lang/String;

    .line 300
    return-void
.end method

.method public setResponder(Ljava/lang/String;)V
    .locals 0
    .param p1, "resp"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->responder:Ljava/lang/String;

    .line 322
    return-void
.end method

.method public final setSid(Ljava/lang/String;)V
    .locals 0
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 164
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Jingle;->sid:Ljava/lang/String;

    .line 165
    return-void
.end method
