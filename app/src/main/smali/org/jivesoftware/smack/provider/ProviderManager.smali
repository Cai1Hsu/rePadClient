.class public Lorg/jivesoftware/smack/provider/ProviderManager;
.super Ljava/lang/Object;
.source "ProviderManager.java"


# static fields
.field private static instance:Lorg/jivesoftware/smack/provider/ProviderManager;


# instance fields
.field private extensionProviders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private iqProviders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 435
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    .line 123
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    .line 436
    invoke-virtual {p0}, Lorg/jivesoftware/smack/provider/ProviderManager;->initialize()V

    .line 437
    return-void
.end method

.method private getClassLoaders()[Ljava/lang/ClassLoader;
    .locals 8

    .prologue
    .line 421
    const/4 v6, 0x2

    new-array v2, v6, [Ljava/lang/ClassLoader;

    .line 422
    .local v2, "classLoaders":[Ljava/lang/ClassLoader;
    const/4 v6, 0x0

    const-class v7, Lorg/jivesoftware/smack/provider/ProviderManager;

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 423
    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    aput-object v7, v2, v6

    .line 425
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 426
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

    .line 427
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_0

    .line 428
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 426
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 431
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

.method public static declared-synchronized getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;
    .locals 2

    .prologue
    .line 133
    const-class v1, Lorg/jivesoftware/smack/provider/ProviderManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->instance:Lorg/jivesoftware/smack/provider/ProviderManager;

    if-nez v0, :cond_0

    .line 134
    new-instance v0, Lorg/jivesoftware/smack/provider/ProviderManager;

    invoke-direct {v0}, Lorg/jivesoftware/smack/provider/ProviderManager;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->instance:Lorg/jivesoftware/smack/provider/ProviderManager;

    .line 136
    :cond_0
    sget-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->instance:Lorg/jivesoftware/smack/provider/ProviderManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 133
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 410
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/><"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static declared-synchronized setInstance(Lorg/jivesoftware/smack/provider/ProviderManager;)V
    .locals 3
    .param p0, "providerManager"    # Lorg/jivesoftware/smack/provider/ProviderManager;

    .prologue
    .line 148
    const-class v1, Lorg/jivesoftware/smack/provider/ProviderManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smack/provider/ProviderManager;->instance:Lorg/jivesoftware/smack/provider/ProviderManager;

    if-eqz v0, :cond_0

    .line 149
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "ProviderManager singleton already set"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 151
    :cond_0
    :try_start_1
    sput-object p0, Lorg/jivesoftware/smack/provider/ProviderManager;->instance:Lorg/jivesoftware/smack/provider/ProviderManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 152
    monitor-exit v1

    return-void
.end method


# virtual methods
.method public addExtensionProvider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "provider"    # Ljava/lang/Object;

    .prologue
    .line 370
    instance-of v1, p3, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    if-nez v1, :cond_0

    instance-of v1, p3, Ljava/lang/Class;

    if-nez v1, :cond_0

    .line 371
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Provider must be a PacketExtensionProvider or a Class instance."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 374
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 375
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    return-void
.end method

.method public addIQProvider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "provider"    # Ljava/lang/Object;

    .prologue
    .line 311
    instance-of v1, p3, Lorg/jivesoftware/smack/provider/IQProvider;

    if-nez v1, :cond_1

    instance-of v1, p3, Ljava/lang/Class;

    if-eqz v1, :cond_0

    const-class v2, Lorg/jivesoftware/smack/packet/IQ;

    move-object v1, p3

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 314
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Provider must be an IQProvider or a Class instance."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 317
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    return-void
.end method

.method public getExtensionProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 354
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getExtensionProviders()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 399
    iget-object v0, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 284
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 285
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getIQProviders()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 296
    iget-object v0, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method protected initialize()V
    .locals 21

    .prologue
    .line 158
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/provider/ProviderManager;->getClassLoaders()[Ljava/lang/ClassLoader;

    move-result-object v4

    .line 159
    .local v4, "classLoaders":[Ljava/lang/ClassLoader;
    move-object v2, v4

    .local v2, "arr$":[Ljava/lang/ClassLoader;
    array-length v12, v2

    .local v12, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_0
    if-ge v10, v12, :cond_3

    aget-object v3, v2, v10

    .line 160
    .local v3, "classLoader":Ljava/lang/ClassLoader;
    const-string/jumbo v19, "META-INF/smack.providers"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v16

    .line 162
    .local v16, "providerEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 163
    invoke-interface/range {v16 .. v16}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/net/URL;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 164
    .local v18, "url":Ljava/net/URL;
    const/16 v17, 0x0

    .line 166
    .local v17, "providerStream":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v17

    .line 167
    new-instance v14, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v14}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    .line 168
    .local v14, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v19, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-interface {v14, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 169
    const-string/jumbo v19, "UTF-8"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-interface {v14, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 170
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v9

    .line 172
    .local v9, "eventType":I
    :cond_0
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v9, v0, :cond_1

    .line 173
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string/jumbo v20, "iqProvider"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 174
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 175
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 176
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    .line 177
    .local v8, "elementName":Ljava/lang/String;
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 178
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 179
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v13

    .line 180
    .local v13, "namespace":Ljava/lang/String;
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 181
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 182
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "className":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v13}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 186
    .local v11, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v19

    if-nez v19, :cond_1

    .line 193
    :try_start_2
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    .line 194
    .local v15, "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v19, Lorg/jivesoftware/smack/provider/IQProvider;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual {v15}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 243
    .end local v5    # "className":Ljava/lang/String;
    .end local v8    # "elementName":Ljava/lang/String;
    .end local v11    # "key":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    :goto_2
    :try_start_3
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v9

    .line 245
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v9, v0, :cond_0

    .line 249
    :try_start_4
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_1

    .line 251
    :catch_0
    move-exception v19

    goto/16 :goto_1

    .line 197
    .restart local v5    # "className":Ljava/lang/String;
    .restart local v8    # "elementName":Ljava/lang/String;
    .restart local v11    # "key":Ljava/lang/String;
    .restart local v13    # "namespace":Ljava/lang/String;
    .restart local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :try_start_5
    const-class v19, Lorg/jivesoftware/smack/packet/IQ;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 201
    .end local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v6

    .line 202
    .local v6, "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_6
    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 248
    .end local v5    # "className":Ljava/lang/String;
    .end local v6    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v8    # "elementName":Ljava/lang/String;
    .end local v9    # "eventType":I
    .end local v11    # "key":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v14    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_0
    move-exception v19

    .line 249
    :try_start_7
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 253
    :goto_3
    :try_start_8
    throw v19
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 258
    .end local v2    # "arr$":[Ljava/lang/ClassLoader;
    .end local v3    # "classLoader":Ljava/lang/ClassLoader;
    .end local v4    # "classLoaders":[Ljava/lang/ClassLoader;
    .end local v10    # "i$":I
    .end local v12    # "len$":I
    .end local v16    # "providerEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .end local v17    # "providerStream":Ljava/io/InputStream;
    .end local v18    # "url":Ljava/net/URL;
    :catch_2
    move-exception v7

    .line 259
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 261
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_3
    return-void

    .line 206
    .restart local v2    # "arr$":[Ljava/lang/ClassLoader;
    .restart local v3    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v4    # "classLoaders":[Ljava/lang/ClassLoader;
    .restart local v9    # "eventType":I
    .restart local v10    # "i$":I
    .restart local v12    # "len$":I
    .restart local v14    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v16    # "providerEnum":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .restart local v17    # "providerStream":Ljava/io/InputStream;
    .restart local v18    # "url":Ljava/net/URL;
    :cond_4
    :try_start_9
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string/jumbo v20, "extensionProvider"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 207
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 208
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 209
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    .line 210
    .restart local v8    # "elementName":Ljava/lang/String;
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 211
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 212
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v13

    .line 213
    .restart local v13    # "namespace":Ljava/lang/String;
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 214
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 215
    invoke-interface {v14}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    .line 218
    .restart local v5    # "className":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v13}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 219
    .restart local v11    # "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move-result v19

    if-nez v19, :cond_1

    .line 227
    :try_start_a
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    .line 228
    .restart local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v19, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual {v15}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_2

    .line 237
    .end local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_3
    move-exception v6

    .line 238
    .restart local v6    # "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_b
    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_2

    .line 232
    .end local v6    # "cnfe":Ljava/lang/ClassNotFoundException;
    .restart local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    :try_start_c
    const-class v19, Lorg/jivesoftware/smack/packet/PacketExtension;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto/16 :goto_2

    .line 159
    .end local v5    # "className":Ljava/lang/String;
    .end local v8    # "elementName":Ljava/lang/String;
    .end local v9    # "eventType":I
    .end local v11    # "key":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v14    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v15    # "provider":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "providerStream":Ljava/io/InputStream;
    .end local v18    # "url":Ljava/net/URL;
    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 251
    .restart local v17    # "providerStream":Ljava/io/InputStream;
    .restart local v18    # "url":Ljava/net/URL;
    :catch_4
    move-exception v20

    goto/16 :goto_3
.end method

.method public removeExtensionProvider(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 387
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 388
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->extensionProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    return-void
.end method

.method public removeIQProvider(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 330
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/provider/ProviderManager;->getProviderKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 331
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jivesoftware/smack/provider/ProviderManager;->iqProviders:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    return-void
.end method
