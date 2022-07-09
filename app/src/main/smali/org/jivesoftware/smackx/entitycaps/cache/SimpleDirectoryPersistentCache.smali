.class public Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;
.super Ljava/lang/Object;
.source "SimpleDirectoryPersistentCache.java"

# interfaces
.implements Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;


# instance fields
.field private cacheDir:Ljava/io/File;

.field private filenameEncoder:Lorg/jivesoftware/smack/util/StringEncoder;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 64
    invoke-static {}, Lorg/jivesoftware/smack/util/Base32Encoder;->getInstance()Lorg/jivesoftware/smack/util/Base32Encoder;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;-><init>(Ljava/io/File;Lorg/jivesoftware/smack/util/StringEncoder;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/jivesoftware/smack/util/StringEncoder;)V
    .locals 3
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "filenameEncoder"    # Lorg/jivesoftware/smack/util/StringEncoder;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cache directory \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\" does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cache directory \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\" is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->cacheDir:Ljava/io/File;

    .line 84
    iput-object p2, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->filenameEncoder:Lorg/jivesoftware/smack/util/StringEncoder;

    .line 85
    return-void
.end method

.method private static restoreInfoFromFile(Ljava/io/File;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 15
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 143
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v13}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 144
    .local v0, "dis":Ljava/io/DataInputStream;
    const/4 v3, 0x0

    .line 150
    .local v3, "fileContent":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 152
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    .line 154
    if-nez v3, :cond_0

    move-object v6, v12

    .line 192
    :goto_0
    return-object v6

    .line 152
    :catchall_0
    move-exception v12

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    throw v12

    .line 157
    :cond_0
    new-instance v9, Ljava/io/StringReader;

    invoke-direct {v9, v3}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 160
    .local v9, "reader":Ljava/io/Reader;
    :try_start_1
    new-instance v7, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v7}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    .line 161
    .local v7, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v13, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v14, 0x1

    invoke-interface {v7, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 162
    invoke-interface {v7, v9}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0

    .line 169
    new-instance v8, Lorg/jivesoftware/smackx/provider/DiscoverInfoProvider;

    invoke-direct {v8}, Lorg/jivesoftware/smackx/provider/DiscoverInfoProvider;-><init>()V

    .line 173
    .local v8, "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    :try_start_2
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 174
    const-string/jumbo v13, ""

    const-string/jumbo v14, "id"

    invoke-interface {v7, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 175
    .local v5, "id":Ljava/lang/String;
    const-string/jumbo v13, ""

    const-string/jumbo v14, "from"

    invoke-interface {v7, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 176
    .local v4, "from":Ljava/lang/String;
    const-string/jumbo v13, ""

    const-string/jumbo v14, "to"

    invoke-interface {v7, v13, v14}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 177
    .local v10, "to":Ljava/lang/String;
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_1

    .line 183
    :try_start_3
    invoke-interface {v8, v7}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 188
    .local v6, "iqPacket":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setPacketID(Ljava/lang/String;)V

    .line 189
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setFrom(Ljava/lang/String;)V

    .line 190
    invoke-virtual {v6, v10}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 191
    sget-object v12, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v6, v12}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    goto :goto_0

    .line 163
    .end local v4    # "from":Ljava/lang/String;
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "iqPacket":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .end local v7    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v8    # "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    .end local v10    # "to":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 164
    .local v11, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v11}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    move-object v6, v12

    .line 165
    goto :goto_0

    .line 178
    .end local v11    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v7    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v8    # "provider":Lorg/jivesoftware/smack/provider/IQProvider;
    :catch_1
    move-exception v2

    .local v2, "e1":Lorg/xmlpull/v1/XmlPullParserException;
    move-object v6, v12

    .line 179
    goto :goto_0

    .line 184
    .end local v2    # "e1":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4    # "from":Ljava/lang/String;
    .restart local v5    # "id":Ljava/lang/String;
    .restart local v10    # "to":Ljava/lang/String;
    :catch_2
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v6, v12

    .line 185
    goto :goto_0
.end method

.method private static writeInfoToFile(Ljava/io/File;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .param p1, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 129
    .local v0, "dos":Ljava/io/DataOutputStream;
    :try_start_0
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 133
    return-void

    .line 131
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    throw v1
.end method


# virtual methods
.method public addDiscoverInfoByNodePersistent(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    .locals 4
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 89
    iget-object v3, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->filenameEncoder:Lorg/jivesoftware/smack/util/StringEncoder;

    invoke-interface {v3, p1}, Lorg/jivesoftware/smack/util/StringEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, "filename":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->cacheDir:Ljava/io/File;

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    .local v2, "nodeFile":Ljava/io/File;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 93
    invoke-static {v2, p2}, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->writeInfoToFile(Ljava/io/File;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public emptyCache()V
    .locals 6

    .prologue
    .line 113
    iget-object v5, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->cacheDir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 114
    .local v2, "files":[Ljava/io/File;
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 115
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 114
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 117
    .end local v1    # "f":Ljava/io/File;
    :cond_0
    return-void
.end method

.method public replay()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v7, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->cacheDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 102
    .local v2, "files":[Ljava/io/File;
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 103
    .local v1, "f":Ljava/io/File;
    iget-object v7, p0, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->filenameEncoder:Lorg/jivesoftware/smack/util/StringEncoder;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/jivesoftware/smack/util/StringEncoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 104
    .local v6, "node":Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache;->restoreInfoFromFile(Ljava/io/File;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v4

    .line 105
    .local v4, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    if-nez v4, :cond_0

    .line 102
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 108
    :cond_0
    invoke-static {v6, v4}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->addDiscoverInfoByNode(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    goto :goto_1

    .line 110
    .end local v1    # "f":Ljava/io/File;
    .end local v4    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .end local v6    # "node":Ljava/lang/String;
    :cond_1
    return-void
.end method
