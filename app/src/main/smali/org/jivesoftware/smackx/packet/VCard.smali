.class public Lorg/jivesoftware/smackx/packet/VCard;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "VCard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/VCard$ContentBuilder;,
        Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;
    }
.end annotation


# static fields
.field private static final DEFAULT_MIME_TYPE:Ljava/lang/String; = "image/jpeg"


# instance fields
.field private emailHome:Ljava/lang/String;

.field private emailWork:Ljava/lang/String;

.field private firstName:Ljava/lang/String;

.field private homeAddr:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private homePhones:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastName:Ljava/lang/String;

.field private middleName:Ljava/lang/String;

.field private organization:Ljava/lang/String;

.field private organizationUnit:Ljava/lang/String;

.field private otherSimpleFields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private otherUnescapableFields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private photoBinval:Ljava/lang/String;

.field private photoMimeType:Ljava/lang/String;

.field private workAddr:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private workPhones:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 126
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 94
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    .line 95
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    .line 103
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    .line 127
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasContent()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoMimeType:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1400(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1500(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasOrganizationFields()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1700(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/packet/VCard;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasNameField()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$800(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$900(Lorg/jivesoftware/smackx/packet/VCard;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    return-object v0
.end method

.method private checkAuthenticated(Lorg/jivesoftware/smack/Connection;Z)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "checkForAnonymous"    # Z

    .prologue
    .line 613
    if-nez p1, :cond_0

    .line 614
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "No connection was provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 616
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_1

    .line 617
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Connection is not authenticated"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 619
    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lorg/jivesoftware/smack/Connection;->isAnonymous()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 620
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Connection cannot be anonymous"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 622
    :cond_2
    return-void
.end method

.method private copyFieldsFrom(Lorg/jivesoftware/smackx/packet/VCard;)V
    .locals 9
    .param p1, "from"    # Lorg/jivesoftware/smackx/packet/VCard;

    .prologue
    .line 597
    const-class v6, Lorg/jivesoftware/smackx/packet/VCard;

    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 598
    .local v3, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v0, v4

    .line 599
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    const-class v7, Lorg/jivesoftware/smackx/packet/VCard;

    if-ne v6, v7, :cond_0

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 602
    const/4 v6, 0x1

    :try_start_0
    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 603
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, p0, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 598
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 605
    :catch_0
    move-exception v1

    .line 606
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "This cannot happen:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 610
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_1
    return-void
.end method

.method private doLoad(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 9
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 565
    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v6}, Lorg/jivesoftware/smackx/packet/VCard;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 566
    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 568
    .local v2, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 570
    const/4 v5, 0x0

    .line 572
    .local v5, "result":Lorg/jivesoftware/smackx/packet/VCard;
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lorg/jivesoftware/smackx/packet/VCard;

    move-object v5, v0

    .line 574
    if-nez v5, :cond_1

    .line 575
    const-string/jumbo v4, "Timeout getting VCard information"

    .line 576
    .local v4, "errorMessage":Ljava/lang/String;
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v8, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->request_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v7, v8, v4}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v6, v4, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 583
    .end local v4    # "errorMessage":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 584
    .local v3, "e":Ljava/lang/ClassCastException;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "No VCard for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 587
    .end local v3    # "e":Ljava/lang/ClassCastException;
    :cond_0
    invoke-direct {p0, v5}, Lorg/jivesoftware/smackx/packet/VCard;->copyFieldsFrom(Lorg/jivesoftware/smackx/packet/VCard;)V

    .line 588
    return-void

    .line 579
    :cond_1
    :try_start_1
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 580
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/VCard;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public static getBytes(Ljava/net/URL;)[B
    .locals 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 448
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 449
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 450
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 451
    invoke-static {v0}, Lorg/jivesoftware/smackx/packet/VCard;->getFileBytes(Ljava/io/File;)[B

    move-result-object v2

    .line 454
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getFileBytes(Ljava/io/File;)[B
    .locals 8
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    const/4 v0, 0x0

    .line 460
    .local v0, "bis":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 461
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v1, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v3, v6

    .line 462
    .local v3, "bytes":I
    new-array v2, v3, [B

    .line 463
    .local v2, "buffer":[B
    invoke-virtual {v1, v2}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v4

    .line 464
    .local v4, "readBytes":I
    array-length v5, v2

    if-eq v4, v5, :cond_1

    .line 465
    new-instance v5, Ljava/io/IOException;

    const-string/jumbo v6, "Entire file not read"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 470
    .end local v2    # "buffer":[B
    .end local v3    # "bytes":I
    .end local v4    # "readBytes":I
    :catchall_0
    move-exception v5

    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :goto_0
    if-eqz v0, :cond_0

    .line 471
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    :cond_0
    throw v5

    .line 470
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "buffer":[B
    .restart local v3    # "bytes":I
    .restart local v4    # "readBytes":I
    :cond_1
    if-eqz v1, :cond_2

    .line 471
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    :cond_2
    return-object v2

    .line 470
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "buffer":[B
    .end local v3    # "bytes":I
    .end local v4    # "readBytes":I
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v5

    goto :goto_0
.end method

.method private hasContent()Z
    .locals 1

    .prologue
    .line 626
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasNameField()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->hasOrganizationFields()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasNameField()Z
    .locals 1

    .prologue
    .line 641
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasOrganizationFields()Z
    .locals 1

    .prologue
    .line 645
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateFN()V
    .locals 3

    .prologue
    const/16 v2, 0x20

    .line 501
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 502
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 503
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 505
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 506
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 508
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 509
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    :cond_2
    const-string/jumbo v1, "FN"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setField(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 651
    if-ne p0, p1, :cond_1

    const/4 v1, 0x1

    .line 695
    :cond_0
    :goto_0
    return v1

    .line 652
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    move-object v0, p1

    .line 654
    check-cast v0, Lorg/jivesoftware/smackx/packet/VCard;

    .line 656
    .local v0, "vCard":Lorg/jivesoftware/smackx/packet/VCard;
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 659
    :cond_2
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-eqz v2, :cond_b

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 662
    :cond_3
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v2, :cond_c

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 665
    :cond_4
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 668
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 671
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 674
    :cond_5
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v2, :cond_e

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 677
    :cond_6
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-eqz v2, :cond_f

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 681
    :cond_7
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 685
    :cond_8
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 688
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 691
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    if-eqz v2, :cond_11

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 695
    :cond_9
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto/16 :goto_0

    .line 656
    :cond_a
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-eqz v2, :cond_2

    goto/16 :goto_0

    .line 659
    :cond_b
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-eqz v2, :cond_3

    goto/16 :goto_0

    .line 662
    :cond_c
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v2, :cond_4

    goto/16 :goto_0

    .line 671
    :cond_d
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v2, :cond_5

    goto/16 :goto_0

    .line 674
    :cond_e
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v2, :cond_6

    goto/16 :goto_0

    .line 677
    :cond_f
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-eqz v2, :cond_7

    goto/16 :goto_0

    .line 681
    :cond_10
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v2, :cond_8

    goto/16 :goto_0

    .line 691
    :cond_11
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    if-eqz v2, :cond_9

    goto/16 :goto_0
.end method

.method public getAddressFieldHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;

    .prologue
    .line 252
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getAddressFieldWork(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;

    .prologue
    .line 272
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getAvatar()[B
    .locals 1

    .prologue
    .line 427
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 428
    const/4 v0, 0x0

    .line 430
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0
.end method

.method public getAvatarHash()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 482
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getAvatar()[B

    move-result-object v0

    .line 483
    .local v0, "bytes":[B
    if-nez v0, :cond_0

    .line 497
    :goto_0
    return-object v3

    .line 489
    :cond_0
    :try_start_0
    const-string/jumbo v4, "SHA-1"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 496
    .local v1, "digest":Ljava/security/MessageDigest;
    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 497
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/StringUtils;->encodeHex([B)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 491
    .end local v1    # "digest":Ljava/security/MessageDigest;
    :catch_0
    move-exception v2

    .line 492
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0
.end method

.method public getAvatarMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 439
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 591
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 592
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    invoke-direct {v1, p0, v0}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;-><init>(Lorg/jivesoftware/smackx/packet/VCard;Ljava/lang/StringBuilder;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->write()V

    .line 593
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEmailHome()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    return-object v0
.end method

.method public getEmailWork()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    return-object v0
.end method

.method public getField(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getJabberId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string/jumbo v1, "JABBERID"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getMiddleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    return-object v0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 198
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string/jumbo v1, "NICKNAME"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getOrganization()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    return-object v0
.end method

.method public getOrganizationUnit()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneHome(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;

    .prologue
    .line 302
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneWork(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;

    .prologue
    .line 321
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 700
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 701
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1d

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 702
    mul-int/lit8 v1, v0, 0x1d

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 703
    mul-int/lit8 v1, v0, 0x1d

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 704
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v3, v1

    .line 705
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int v0, v3, v1

    .line 706
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int v0, v3, v1

    .line 707
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int v0, v3, v1

    .line 708
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_4
    add-int v0, v3, v1

    .line 709
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_5
    add-int v0, v3, v1

    .line 710
    mul-int/lit8 v3, v0, 0x1d

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_6
    add-int v0, v3, v1

    .line 711
    mul-int/lit8 v1, v0, 0x1d

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v1, v3

    .line 712
    mul-int/lit8 v1, v0, 0x1d

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 713
    return v0

    :cond_1
    move v1, v2

    .line 704
    goto :goto_0

    :cond_2
    move v1, v2

    .line 705
    goto :goto_1

    :cond_3
    move v1, v2

    .line 706
    goto :goto_2

    :cond_4
    move v1, v2

    .line 707
    goto :goto_3

    :cond_5
    move v1, v2

    .line 708
    goto :goto_4

    :cond_6
    move v1, v2

    .line 709
    goto :goto_5

    :cond_7
    move v1, v2

    .line 710
    goto :goto_6
.end method

.method public load(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 548
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/Connection;Z)V

    .line 550
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setFrom(Ljava/lang/String;)V

    .line 551
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->doLoad(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V

    .line 552
    return-void
.end method

.method public load(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 558
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/Connection;Z)V

    .line 560
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/packet/VCard;->setTo(Ljava/lang/String;)V

    .line 561
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/packet/VCard;->doLoad(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V

    .line 562
    return-void
.end method

.method public removeAvatar()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 348
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    .line 349
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoMimeType:Ljava/lang/String;

    .line 350
    return-void
.end method

.method public save(Lorg/jivesoftware/smack/Connection;)V
    .locals 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 524
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lorg/jivesoftware/smackx/packet/VCard;->checkAuthenticated(Lorg/jivesoftware/smack/Connection;Z)V

    .line 526
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 527
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/VCard;->setFrom(Ljava/lang/String;)V

    .line 528
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 529
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 531
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    .line 534
    .local v1, "response":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 535
    if-nez v1, :cond_0

    .line 536
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "No response from server on status set."

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 538
    :cond_0
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 539
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v2

    .line 541
    :cond_1
    return-void
.end method

.method public setAddressFieldHome(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 262
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homeAddr:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    return-void
.end method

.method public setAddressFieldWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "addrField"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 282
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workAddr:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    return-void
.end method

.method public setAvatar(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "encodedImage"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 389
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoBinval:Ljava/lang/String;

    .line 390
    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/VCard;->photoMimeType:Ljava/lang/String;

    .line 391
    return-void
.end method

.method public setAvatar(Ljava/net/URL;)V
    .locals 3
    .param p1, "avatarURL"    # Ljava/net/URL;

    .prologue
    .line 330
    const/4 v2, 0x0

    new-array v0, v2, [B

    .line 332
    .local v0, "bytes":[B
    :try_start_0
    invoke-static {p1}, Lorg/jivesoftware/smackx/packet/VCard;->getBytes(Ljava/net/URL;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 338
    :goto_0
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar([B)V

    .line 339
    return-void

    .line 334
    :catch_0
    move-exception v1

    .line 335
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public setAvatar([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 360
    const-string/jumbo v0, "image/jpeg"

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar([BLjava/lang/String;)V

    .line 361
    return-void
.end method

.method public setAvatar([BLjava/lang/String;)V
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 371
    if-nez p1, :cond_0

    .line 372
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->removeAvatar()V

    .line 380
    :goto_0
    return-void

    .line 377
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v0

    .line 379
    .local v0, "encodedImage":Ljava/lang/String;
    invoke-virtual {p0, v0, p2}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setEmailHome(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailHome:Ljava/lang/String;

    .line 211
    return-void
.end method

.method public setEmailWork(Ljava/lang/String;)V
    .locals 0
    .param p1, "emailWork"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->emailWork:Ljava/lang/String;

    .line 219
    return-void
.end method

.method public setEncodedImage(Ljava/lang/String;)V
    .locals 1
    .param p1, "encodedAvatar"    # Ljava/lang/String;

    .prologue
    .line 400
    const-string/jumbo v0, "image/jpeg"

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    return-void
.end method

.method public setField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/packet/VCard;->setField(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 148
    return-void
.end method

.method public setField(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "isUnescapable"    # Z

    .prologue
    .line 159
    if-nez p3, :cond_0

    .line 160
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherUnescapableFields:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setFirstName(Ljava/lang/String;)V
    .locals 0
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 172
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->firstName:Ljava/lang/String;

    .line 174
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->updateFN()V

    .line 175
    return-void
.end method

.method public setJabberId(Ljava/lang/String;)V
    .locals 2
    .param p1, "jabberId"    # Ljava/lang/String;

    .prologue
    .line 226
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string/jumbo v1, "JABBERID"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 182
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->lastName:Ljava/lang/String;

    .line 184
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->updateFN()V

    .line 185
    return-void
.end method

.method public setMiddleName(Ljava/lang/String;)V
    .locals 0
    .param p1, "middleName"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->middleName:Ljava/lang/String;

    .line 194
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/VCard;->updateFN()V

    .line 195
    return-void
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 2
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->otherSimpleFields:Ljava/util/Map;

    const-string/jumbo v1, "NICKNAME"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    return-void
.end method

.method public setOrganization(Ljava/lang/String;)V
    .locals 0
    .param p1, "organization"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organization:Ljava/lang/String;

    .line 235
    return-void
.end method

.method public setOrganizationUnit(Ljava/lang/String;)V
    .locals 0
    .param p1, "organizationUnit"    # Ljava/lang/String;

    .prologue
    .line 242
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard;->organizationUnit:Ljava/lang/String;

    .line 243
    return-void
.end method

.method public setPhoneHome(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;
    .param p2, "phoneNum"    # Ljava/lang/String;

    .prologue
    .line 293
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->homePhones:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    return-void
.end method

.method public setPhoneWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "phoneType"    # Ljava/lang/String;
    .param p2, "phoneNum"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard;->workPhones:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 717
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/VCard;->getChildElementXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
