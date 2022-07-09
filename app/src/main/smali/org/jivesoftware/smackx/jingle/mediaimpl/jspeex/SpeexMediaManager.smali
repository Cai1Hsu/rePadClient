.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
.source "SpeexMediaManager.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field public static final MEDIA_NAME:Ljava/lang/String; = "Speex"


# instance fields
.field private payloads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 1
    .param p1, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->payloads:Ljava/util/List;

    .line 53
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->setupPayloads()V

    .line 54
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->setupJMF()V

    .line 55
    return-void
.end method

.method private static runLinuxPreInstall()V
    .locals 0

    .prologue
    .line 129
    return-void
.end method

.method public static setupJMF()V
    .locals 10

    .prologue
    .line 95
    const-string/jumbo v5, "user.home"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "homeDir":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v5, ".jmf"

    invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .local v3, "jmfDir":Ljava/io/File;
    const-string/jumbo v5, "java.class.path"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "classpath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "path.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    const-string/jumbo v5, "java.class.path"

    invoke-static {v5, v0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 103
    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    .line 105
    :cond_0
    new-instance v4, Ljava/io/File;

    const-string/jumbo v5, "jmf.properties"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .local v4, "jmfProperties":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 109
    :try_start_0
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :cond_1
    :goto_0
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->runLinuxPreInstall()V

    .line 121
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-nez v5, :cond_2

    .line 122
    new-instance v5, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;-><init>([Ljava/lang/String;Z)V

    .line 125
    :cond_2
    return-void

    .line 111
    :catch_0
    move-exception v1

    .line 112
    .local v1, "ex":Ljava/io/IOException;
    sget-object v5, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v6, "Failed to create jmf.properties"

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private setupPayloads()V
    .locals 4

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->payloads:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    const/16 v2, 0xf

    const-string/jumbo v3, "speex"

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method


# virtual methods
.method public createMediaSession(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
    .locals 6
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    const/4 v4, 0x0

    .line 66
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    const-string/jumbo v0, "Speex"

    return-object v0
.end method

.method public getPayloads()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;->payloads:Ljava/util/List;

    return-object v0
.end method
