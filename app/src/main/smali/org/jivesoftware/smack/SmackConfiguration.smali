.class public final Lorg/jivesoftware/smack/SmackConfiguration;
.super Ljava/lang/Object;
.source "SmackConfiguration.java"


# static fields
.field private static final SMACK_VERSION:Ljava/lang/String; = "3.3.0"

.field private static autoEnableEntityCaps:Z

.field private static defaultMechs:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static keepAliveInterval:I

.field private static localSocks5ProxyEnabled:Z

.field private static localSocks5ProxyPort:I

.field private static packetCollectorSize:I

.field private static packetReplyTimeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .prologue
    const/16 v12, 0x1388

    const/4 v13, 0x1

    .line 53
    sput v12, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 54
    const/16 v11, 0x7530

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    .line 55
    new-instance v11, Ljava/util/Vector;

    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    sput-object v11, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    .line 57
    sput-boolean v13, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    .line 58
    const/16 v11, 0x1e61

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    .line 59
    sput v12, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    .line 64
    const/4 v11, 0x0

    sput-boolean v11, Lorg/jivesoftware/smack/SmackConfiguration;->autoEnableEntityCaps:Z

    .line 79
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getClassLoaders()[Ljava/lang/ClassLoader;

    move-result-object v2

    .line 80
    .local v2, "classLoaders":[Ljava/lang/ClassLoader;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/ClassLoader;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_4

    aget-object v1, v0, v6

    .line 81
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    const-string/jumbo v11, "META-INF/smack-config.xml"

    invoke-virtual {v1, v11}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v3

    .line 82
    .local v3, "configEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_a

    .line 83
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/net/URL;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 84
    .local v10, "url":Ljava/net/URL;
    const/4 v9, 0x0

    .line 86
    .local v9, "systemStream":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v10}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v9

    .line 87
    new-instance v8, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v8}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    .line 88
    .local v8, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v11, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v12, 0x1

    invoke-interface {v8, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 89
    const-string/jumbo v11, "UTF-8"

    invoke-interface {v8, v9, v11}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 90
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    .line 92
    .local v5, "eventType":I
    :cond_0
    const/4 v11, 0x2

    if-ne v5, v11, :cond_1

    .line 93
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "className"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 95
    invoke-static {v8}, Lorg/jivesoftware/smack/SmackConfiguration;->parseClassToLoad(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 119
    :cond_1
    :goto_2
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v5

    .line 121
    if-ne v5, v13, :cond_0

    .line 128
    :try_start_2
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 130
    :catch_0
    move-exception v11

    goto :goto_1

    .line 97
    :cond_2
    :try_start_3
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "packetReplyTimeout"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 98
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 123
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v4

    .line 124
    .local v4, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 128
    :try_start_5
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    .line 130
    :catch_2
    move-exception v11

    goto :goto_1

    .line 100
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v5    # "eventType":I
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_3
    :try_start_6
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "keepAliveInterval"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 101
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 127
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_0
    move-exception v11

    .line 128
    :try_start_7
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 132
    :goto_3
    :try_start_8
    throw v11
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 137
    .end local v1    # "classLoader":Ljava/lang/ClassLoader;
    .end local v3    # "configEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    .end local v9    # "systemStream":Ljava/io/InputStream;
    .end local v10    # "url":Ljava/net/URL;
    :catch_3
    move-exception v4

    .line 138
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 140
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_4
    return-void

    .line 103
    .restart local v1    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v3    # "configEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .restart local v5    # "eventType":I
    .restart local v6    # "i$":I
    .restart local v7    # "len$":I
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v9    # "systemStream":Ljava/io/InputStream;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_5
    :try_start_9
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "mechName"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 104
    sget-object v11, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 106
    :cond_6
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "localSocks5ProxyEnabled"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 107
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v11

    sput-boolean v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    goto :goto_2

    .line 109
    :cond_7
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "localSocks5ProxyPort"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 110
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    goto/16 :goto_2

    .line 112
    :cond_8
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "packetCollectorSize"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 113
    sget v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    invoke-static {v8, v11}, Lorg/jivesoftware/smack/SmackConfiguration;->parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v11

    sput v11, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    goto/16 :goto_2

    .line 115
    :cond_9
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "autoEnableEntityCaps"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 116
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v11

    sput-boolean v11, Lorg/jivesoftware/smack/SmackConfiguration;->autoEnableEntityCaps:Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_2

    .line 80
    .end local v5    # "eventType":I
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v9    # "systemStream":Ljava/io/InputStream;
    .end local v10    # "url":Ljava/net/URL;
    :cond_a
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 130
    .restart local v9    # "systemStream":Ljava/io/InputStream;
    .restart local v10    # "url":Ljava/net/URL;
    :catch_4
    move-exception v12

    goto/16 :goto_3
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    return-void
.end method

.method public static addSaslMech(Ljava/lang/String;)V
    .locals 1
    .param p0, "mech"    # Ljava/lang/String;

    .prologue
    .line 228
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 231
    :cond_0
    return-void
.end method

.method public static addSaslMechs(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "mechs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 240
    .local v1, "mech":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/SmackConfiguration;->addSaslMech(Ljava/lang/String;)V

    goto :goto_0

    .line 242
    .end local v1    # "mech":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static autoEnableEntityCaps()Z
    .locals 1

    .prologue
    .line 319
    sget-boolean v0, Lorg/jivesoftware/smack/SmackConfiguration;->autoEnableEntityCaps:Z

    return v0
.end method

.method private static getClassLoaders()[Ljava/lang/ClassLoader;
    .locals 8

    .prologue
    .line 361
    const/4 v6, 0x2

    new-array v2, v6, [Ljava/lang/ClassLoader;

    .line 362
    .local v2, "classLoaders":[Ljava/lang/ClassLoader;
    const/4 v6, 0x0

    const-class v7, Lorg/jivesoftware/smack/SmackConfiguration;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 363
    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 365
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 366
    .local v5, "loaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ClassLoader;>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/ClassLoader;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 367
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_0

    .line 368
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 371
    .end local v1    # "classLoader":Ljava/lang/ClassLoader;
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/ClassLoader;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/ClassLoader;

    return-object v6
.end method

.method public static getKeepAliveInterval()I
    .locals 1

    .prologue
    .line 187
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    return v0
.end method

.method public static getLocalSocks5ProxyPort()I
    .locals 1

    .prologue
    .line 301
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    return v0
.end method

.method public static getPacketCollectorSize()I
    .locals 1

    .prologue
    .line 209
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    return v0
.end method

.method public static getPacketReplyTimeout()I
    .locals 1

    .prologue
    .line 159
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    if-gtz v0, :cond_0

    .line 160
    const/16 v0, 0x1388

    sput v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 162
    :cond_0
    sget v0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    return v0
.end method

.method public static getSaslMechs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    const-string/jumbo v0, "3.3.0"

    return-object v0
.end method

.method public static isLocalSocks5ProxyEnabled()Z
    .locals 1

    .prologue
    .line 283
    sget-boolean v0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    return v0
.end method

.method private static parseClassToLoad(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 332
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    .line 335
    .local v0, "className":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    :goto_0
    return-void

    .line 337
    :catch_0
    move-exception v1

    .line 338
    .local v1, "cnfe":Ljava/lang/ClassNotFoundException;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Error! A startup class specified in smack-config.xml could not be loaded: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static parseIntProperty(Lorg/xmlpull/v1/XmlPullParser;I)I
    .locals 2
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 347
    :try_start_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    .line 351
    .end local p1    # "defaultValue":I
    :goto_0
    return p1

    .line 349
    .restart local p1    # "defaultValue":I
    :catch_0
    move-exception v0

    .line 350
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method public static removeSaslMech(Ljava/lang/String;)V
    .locals 1
    .param p0, "mech"    # Ljava/lang/String;

    .prologue
    .line 250
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    sget-object v0, Lorg/jivesoftware/smack/SmackConfiguration;->defaultMechs:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 253
    :cond_0
    return-void
.end method

.method public static removeSaslMechs(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, "mechs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 262
    .local v1, "mech":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/SmackConfiguration;->removeSaslMech(Ljava/lang/String;)V

    goto :goto_0

    .line 264
    .end local v1    # "mech":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static setAutoEnableEntityCaps(Z)V
    .locals 0
    .param p0, "b"    # Z

    .prologue
    .line 328
    sput-boolean p0, Lorg/jivesoftware/smack/SmackConfiguration;->autoEnableEntityCaps:Z

    .line 329
    return-void
.end method

.method public static setKeepAliveInterval(I)V
    .locals 0
    .param p0, "interval"    # I

    .prologue
    .line 199
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->keepAliveInterval:I

    .line 200
    return-void
.end method

.method public static setLocalSocks5ProxyEnabled(Z)V
    .locals 0
    .param p0, "localSocks5ProxyEnabled"    # Z

    .prologue
    .line 292
    sput-boolean p0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyEnabled:Z

    .line 293
    return-void
.end method

.method public static setLocalSocks5ProxyPort(I)V
    .locals 0
    .param p0, "localSocks5ProxyPort"    # I

    .prologue
    .line 311
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->localSocks5ProxyPort:I

    .line 312
    return-void
.end method

.method public static setPacketCollectorSize(I)V
    .locals 0
    .param p0, "collectorSize"    # I

    .prologue
    .line 219
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->packetCollectorSize:I

    .line 220
    return-void
.end method

.method public static setPacketReplyTimeout(I)V
    .locals 1
    .param p0, "timeout"    # I

    .prologue
    .line 172
    if-gtz p0, :cond_0

    .line 173
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 175
    :cond_0
    sput p0, Lorg/jivesoftware/smack/SmackConfiguration;->packetReplyTimeout:I

    .line 176
    return-void
.end method
