.class public Lcom/mongodb/MongoClientURI;
.super Ljava/lang/Object;
.source "MongoClientURI.java"


# static fields
.field static final LOGGER:Ljava/util/logging/Logger;

.field private static final PREFIX:Ljava/lang/String; = "mongodb://"

.field private static final UTF_8:Ljava/lang/String; = "UTF-8"

.field static allKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static authKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static generalOptionsKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static readPreferenceKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static writeConcernKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final collection:Ljava/lang/String;

.field private final credentials:Lcom/mongodb/MongoCredential;

.field private final database:Ljava/lang/String;

.field private final hosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final options:Lcom/mongodb/MongoClientOptions;

.field private final uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 261
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    .line 262
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    .line 263
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    .line 264
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    .line 265
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    .line 268
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "minpoolsize"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 269
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "maxpoolsize"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 270
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "waitqueuemultiple"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 271
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "waitqueuetimeoutms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 272
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "connecttimeoutms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 273
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "maxidletimems"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 274
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "maxlifetimems"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 275
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "sockettimeoutms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 276
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "sockettimeoutms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 277
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "autoconnectretry"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 278
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "ssl"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 279
    sget-object v0, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    const-string/jumbo v1, "replicaset"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 281
    sget-object v0, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    const-string/jumbo v1, "slaveok"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 282
    sget-object v0, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    const-string/jumbo v1, "readpreference"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 283
    sget-object v0, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    const-string/jumbo v1, "readpreferencetags"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 285
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    const-string/jumbo v1, "safe"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 286
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    const-string/jumbo v1, "w"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 287
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    const-string/jumbo v1, "wtimeout"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 288
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    const-string/jumbo v1, "fsync"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 289
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    const-string/jumbo v1, "j"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 291
    sget-object v0, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    const-string/jumbo v1, "authmechanism"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 292
    sget-object v0, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    const-string/jumbo v1, "authsource"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 293
    sget-object v0, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    const-string/jumbo v1, "gssapiservicename"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 295
    sget-object v0, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    sget-object v1, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 296
    sget-object v0, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    sget-object v1, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 297
    sget-object v0, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    sget-object v1, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 298
    sget-object v0, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    sget-object v1, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 638
    const-string/jumbo v0, "com.mongodb.MongoURI"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/MongoClientURI;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 165
    new-instance v0, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/mongodb/MongoClientURI;-><init>(Ljava/lang/String;Lcom/mongodb/MongoClientOptions$Builder;)V

    .line 166
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/MongoClientOptions$Builder;)V
    .locals 12
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "builder"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    :try_start_0
    iput-object p1, p0, Lcom/mongodb/MongoClientURI;->uri:Ljava/lang/String;

    .line 180
    const-string/jumbo v10, "mongodb://"

    invoke-virtual {p1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 181
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "uri needs to start with mongodb://"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :catch_0
    move-exception v2

    .line 257
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v10, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v11, "This should not happen"

    invoke-direct {v10, v11, v2}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 183
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    :try_start_1
    const-string/jumbo v10, "mongodb://"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 188
    const/4 v9, 0x0

    .line 189
    .local v9, "userName":Ljava/lang/String;
    const/4 v7, 0x0

    .line 192
    .local v7, "password":[C
    const-string/jumbo v10, "/"

    invoke-virtual {p1, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 193
    .local v3, "idx":I
    if-gez v3, :cond_3

    .line 194
    const-string/jumbo v10, "?"

    invoke-virtual {p1, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 195
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "URI contains options without trailing slash"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 197
    :cond_1
    move-object v8, p1

    .line 198
    .local v8, "serverPart":Ljava/lang/String;
    const/4 v4, 0x0

    .line 199
    .local v4, "nsPart":Ljava/lang/String;
    const-string/jumbo v6, ""

    .line 216
    .local v6, "optionsPart":Ljava/lang/String;
    :goto_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 218
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string/jumbo v10, "@"

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 220
    if-lez v3, :cond_2

    .line 221
    const/4 v10, 0x0

    invoke-virtual {v8, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 222
    .local v1, "authPart":Ljava/lang/String;
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {v8, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 224
    const-string/jumbo v10, ":"

    invoke-virtual {v1, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 225
    const/4 v10, -0x1

    if-ne v3, v10, :cond_5

    .line 226
    const-string/jumbo v10, "UTF-8"

    invoke-static {v1, v10}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 233
    .end local v1    # "authPart":Ljava/lang/String;
    :cond_2
    :goto_1
    const-string/jumbo v10, ","

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    invoke-static {v0, v10}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 235
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->hosts:Ljava/util/List;

    .line 238
    if-eqz v4, :cond_7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-eqz v10, :cond_7

    .line 239
    const-string/jumbo v10, "."

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 240
    if-gez v3, :cond_6

    .line 241
    iput-object v4, p0, Lcom/mongodb/MongoClientURI;->database:Ljava/lang/String;

    .line 242
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->collection:Ljava/lang/String;

    .line 252
    :goto_2
    invoke-direct {p0, v6}, Lcom/mongodb/MongoClientURI;->parseOptions(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 253
    .local v5, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0, v5, p2}, Lcom/mongodb/MongoClientURI;->createOptions(Ljava/util/Map;Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/MongoClientOptions;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->options:Lcom/mongodb/MongoClientOptions;

    .line 254
    iget-object v10, p0, Lcom/mongodb/MongoClientURI;->database:Ljava/lang/String;

    invoke-direct {p0, v5, v9, v7, v10}, Lcom/mongodb/MongoClientURI;->createCredentials(Ljava/util/Map;Ljava/lang/String;[CLjava/lang/String;)Lcom/mongodb/MongoCredential;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    .line 255
    invoke-direct {p0, v5}, Lcom/mongodb/MongoClientURI;->warnOnUnsupportedOptions(Ljava/util/Map;)V

    .line 259
    return-void

    .line 201
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "nsPart":Ljava/lang/String;
    .end local v5    # "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "optionsPart":Ljava/lang/String;
    .end local v8    # "serverPart":Ljava/lang/String;
    :cond_3
    const/4 v10, 0x0

    invoke-virtual {p1, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 202
    .restart local v8    # "serverPart":Ljava/lang/String;
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 204
    .restart local v4    # "nsPart":Ljava/lang/String;
    const-string/jumbo v10, "?"

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 205
    if-ltz v3, :cond_4

    .line 206
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {v4, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 207
    .restart local v6    # "optionsPart":Ljava/lang/String;
    const/4 v10, 0x0

    invoke-virtual {v4, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 209
    .end local v6    # "optionsPart":Ljava/lang/String;
    :cond_4
    const-string/jumbo v6, ""

    .restart local v6    # "optionsPart":Ljava/lang/String;
    goto/16 :goto_0

    .line 228
    .restart local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "authPart":Ljava/lang/String;
    :cond_5
    const/4 v10, 0x0

    invoke-virtual {v1, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "UTF-8"

    invoke-static {v10, v11}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 229
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {v1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "UTF-8"

    invoke-static {v10, v11}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toCharArray()[C

    move-result-object v7

    goto :goto_1

    .line 244
    .end local v1    # "authPart":Ljava/lang/String;
    :cond_6
    const/4 v10, 0x0

    invoke-virtual {v4, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->database:Ljava/lang/String;

    .line 245
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {v4, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->collection:Ljava/lang/String;

    goto :goto_2

    .line 248
    :cond_7
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->database:Ljava/lang/String;

    .line 249
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mongodb/MongoClientURI;->collection:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private buildReadPreference(Ljava/lang/String;Lcom/mongodb/DBObject;Ljava/util/List;Ljava/lang/Boolean;)Lcom/mongodb/ReadPreference;
    .locals 1
    .param p1, "readPreferenceType"    # Ljava/lang/String;
    .param p2, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p4, "slaveOk"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/mongodb/DBObject;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Ljava/lang/Boolean;",
            ")",
            "Lcom/mongodb/ReadPreference;"
        }
    .end annotation

    .prologue
    .line 495
    .local p3, "remainingTagSets":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz p1, :cond_1

    .line 496
    if-nez p2, :cond_0

    .line 497
    invoke-static {p1}, Lcom/mongodb/ReadPreference;->valueOf(Ljava/lang/String;)Lcom/mongodb/ReadPreference;

    move-result-object v0

    .line 507
    :goto_0
    return-object v0

    .line 499
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/mongodb/DBObject;

    invoke-interface {p3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/DBObject;

    invoke-static {p1, p2, v0}, Lcom/mongodb/ReadPreference;->valueOf(Ljava/lang/String;Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;

    move-result-object v0

    goto :goto_0

    .line 502
    :cond_1
    if-eqz p4, :cond_2

    .line 503
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p4, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 504
    invoke-static {}, Lcom/mongodb/ReadPreference;->secondaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object v0

    goto :goto_0

    .line 507
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private buildWriteConcern(Ljava/lang/Boolean;Ljava/lang/String;IZZ)Lcom/mongodb/WriteConcern;
    .locals 3
    .param p1, "safe"    # Ljava/lang/Boolean;
    .param p2, "w"    # Ljava/lang/String;
    .param p3, "wTimeout"    # I
    .param p4, "fsync"    # Z
    .param p5, "journal"    # Z

    .prologue
    .line 512
    if-nez p2, :cond_0

    if-nez p3, :cond_0

    if-nez p4, :cond_0

    if-eqz p5, :cond_2

    .line 513
    :cond_0
    if-nez p2, :cond_1

    .line 514
    new-instance v1, Lcom/mongodb/WriteConcern;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p3, p4, p5}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V

    .line 529
    :goto_0
    return-object v1

    .line 517
    :cond_1
    :try_start_0
    new-instance v1, Lcom/mongodb/WriteConcern;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v1, v2, p3, p4, p5}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 518
    :catch_0
    move-exception v0

    .line 519
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lcom/mongodb/WriteConcern;

    invoke-direct {v1, p2, p3, p4, p5}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZ)V

    goto :goto_0

    .line 522
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    if-eqz p1, :cond_4

    .line 523
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 524
    sget-object v1, Lcom/mongodb/WriteConcern;->ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    goto :goto_0

    .line 526
    :cond_3
    sget-object v1, Lcom/mongodb/WriteConcern;->UNACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    goto :goto_0

    .line 529
    :cond_4
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private createCredentials(Ljava/util/Map;Ljava/lang/String;[CLjava/lang/String;)Lcom/mongodb/MongoCredential;
    .locals 10
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "password"    # [C
    .param p4, "database"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "[C",
            "Ljava/lang/String;",
            ")",
            "Lcom/mongodb/MongoCredential;"
        }
    .end annotation

    .prologue
    .line 416
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-nez p2, :cond_1

    .line 417
    const/4 v1, 0x0

    .line 458
    :cond_0
    :goto_0
    return-object v1

    .line 420
    :cond_1
    if-nez p4, :cond_2

    .line 421
    const-string/jumbo p4, "admin"

    .line 424
    :cond_2
    const-string/jumbo v5, "MONGODB-CR"

    .line 425
    .local v5, "mechanism":Ljava/lang/String;
    move-object v0, p4

    .line 426
    .local v0, "authSource":Ljava/lang/String;
    const/4 v2, 0x0

    .line 428
    .local v2, "gssapiServiceName":Ljava/lang/String;
    sget-object v7, Lcom/mongodb/MongoClientURI;->authKeys:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 429
    .local v4, "key":Ljava/lang/String;
    invoke-direct {p0, p1, v4}, Lcom/mongodb/MongoClientURI;->getLastValue(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 431
    .local v6, "value":Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 435
    const-string/jumbo v7, "authmechanism"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 436
    move-object v5, v6

    goto :goto_1

    .line 437
    :cond_4
    const-string/jumbo v7, "authsource"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 438
    move-object v0, v6

    goto :goto_1

    .line 439
    :cond_5
    const-string/jumbo v7, "gssapiservicename"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 440
    move-object v2, v6

    goto :goto_1

    .line 444
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_6
    const-string/jumbo v7, "GSSAPI"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 445
    invoke-static {p2}, Lcom/mongodb/MongoCredential;->createGSSAPICredential(Ljava/lang/String;)Lcom/mongodb/MongoCredential;

    move-result-object v1

    .line 446
    .local v1, "gssapiCredential":Lcom/mongodb/MongoCredential;
    if-eqz v2, :cond_0

    .line 447
    const-string/jumbo v7, "SERVICE_NAME"

    invoke-virtual {v1, v7, v2}, Lcom/mongodb/MongoCredential;->withMechanismProperty(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/MongoCredential;

    move-result-object v1

    goto :goto_0

    .line 451
    .end local v1    # "gssapiCredential":Lcom/mongodb/MongoCredential;
    :cond_7
    const-string/jumbo v7, "PLAIN"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 452
    invoke-static {p2, v0, p3}, Lcom/mongodb/MongoCredential;->createPlainCredential(Ljava/lang/String;Ljava/lang/String;[C)Lcom/mongodb/MongoCredential;

    move-result-object v1

    goto :goto_0

    .line 454
    :cond_8
    const-string/jumbo v7, "MONGODB-CR"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 455
    invoke-static {p2, v0, p3}, Lcom/mongodb/MongoCredential;->createMongoCRCredential(Ljava/lang/String;Ljava/lang/String;[C)Lcom/mongodb/MongoCredential;

    move-result-object v1

    goto :goto_0

    .line 457
    :cond_9
    const-string/jumbo v7, "MONGODB-X509"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 458
    invoke-static {p2}, Lcom/mongodb/MongoCredential;->createMongoX509Credential(Ljava/lang/String;)Lcom/mongodb/MongoCredential;

    move-result-object v1

    goto/16 :goto_0

    .line 461
    :cond_a
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Unsupported authMechanism: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private createOptions(Ljava/util/Map;Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/MongoClientOptions;
    .locals 6
    .param p2, "builder"    # Lcom/mongodb/MongoClientOptions$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Lcom/mongodb/MongoClientOptions$Builder;",
            ")",
            "Lcom/mongodb/MongoClientOptions;"
        }
    .end annotation

    .prologue
    .line 310
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    sget-object v5, Lcom/mongodb/MongoClientURI;->generalOptionsKeys:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 311
    .local v1, "key":Ljava/lang/String;
    invoke-direct {p0, p1, v1}, Lcom/mongodb/MongoClientURI;->getLastValue(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 312
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 316
    const-string/jumbo v5, "maxpoolsize"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 317
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->connectionsPerHost(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 318
    :cond_1
    const-string/jumbo v5, "minpoolsize"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 319
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->minConnectionsPerHost(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 320
    :cond_2
    const-string/jumbo v5, "maxidletimems"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 321
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionIdleTime(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 322
    :cond_3
    const-string/jumbo v5, "maxlifetimems"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 323
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionLifeTime(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 324
    :cond_4
    const-string/jumbo v5, "waitqueuemultiple"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 325
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->threadsAllowedToBlockForConnectionMultiplier(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 326
    :cond_5
    const-string/jumbo v5, "waitqueuetimeoutms"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 327
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->maxWaitTime(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto :goto_0

    .line 328
    :cond_6
    const-string/jumbo v5, "connecttimeoutms"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 329
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->connectTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto/16 :goto_0

    .line 330
    :cond_7
    const-string/jumbo v5, "sockettimeoutms"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 331
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->socketTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;

    goto/16 :goto_0

    .line 332
    :cond_8
    const-string/jumbo v5, "autoconnectretry"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 333
    invoke-virtual {p0, v3}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->autoConnectRetry(Z)Lcom/mongodb/MongoClientOptions$Builder;

    goto/16 :goto_0

    .line 334
    :cond_9
    const-string/jumbo v5, "replicaset"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 335
    invoke-virtual {p2, v3}, Lcom/mongodb/MongoClientOptions$Builder;->requiredReplicaSetName(Ljava/lang/String;)Lcom/mongodb/MongoClientOptions$Builder;

    goto/16 :goto_0

    .line 336
    :cond_a
    const-string/jumbo v5, "ssl"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 337
    invoke-virtual {p0, v3}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 338
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/mongodb/MongoClientOptions$Builder;->socketFactory(Ljavax/net/SocketFactory;)Lcom/mongodb/MongoClientOptions$Builder;

    goto/16 :goto_0

    .line 343
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_b
    invoke-direct {p0, p1}, Lcom/mongodb/MongoClientURI;->createWriteConcern(Ljava/util/Map;)Lcom/mongodb/WriteConcern;

    move-result-object v4

    .line 344
    .local v4, "writeConcern":Lcom/mongodb/WriteConcern;
    invoke-direct {p0, p1}, Lcom/mongodb/MongoClientURI;->createReadPreference(Ljava/util/Map;)Lcom/mongodb/ReadPreference;

    move-result-object v2

    .line 346
    .local v2, "readPreference":Lcom/mongodb/ReadPreference;
    if-eqz v4, :cond_c

    .line 347
    invoke-virtual {p2, v4}, Lcom/mongodb/MongoClientOptions$Builder;->writeConcern(Lcom/mongodb/WriteConcern;)Lcom/mongodb/MongoClientOptions$Builder;

    .line 349
    :cond_c
    if-eqz v2, :cond_d

    .line 350
    invoke-virtual {p2, v2}, Lcom/mongodb/MongoClientOptions$Builder;->readPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/MongoClientOptions$Builder;

    .line 353
    :cond_d
    invoke-virtual {p2}, Lcom/mongodb/MongoClientOptions$Builder;->build()Lcom/mongodb/MongoClientOptions;

    move-result-object v5

    return-object v5
.end method

.method private createReadPreference(Ljava/util/Map;)Lcom/mongodb/ReadPreference;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/mongodb/ReadPreference;"
        }
    .end annotation

    .prologue
    .line 385
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v7, 0x0

    .line 386
    .local v7, "slaveOk":Ljava/lang/Boolean;
    const/4 v5, 0x0

    .line 387
    .local v5, "readPreferenceType":Ljava/lang/String;
    const/4 v1, 0x0

    .line 388
    .local v1, "firstTagSet":Lcom/mongodb/DBObject;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 390
    .local v6, "remainingTagSets":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    sget-object v10, Lcom/mongodb/MongoClientURI;->readPreferenceKeys:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 391
    .local v4, "key":Ljava/lang/String;
    invoke-direct {p0, p1, v4}, Lcom/mongodb/MongoClientURI;->getLastValue(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 392
    .local v9, "value":Ljava/lang/String;
    if-eqz v9, :cond_0

    .line 396
    const-string/jumbo v10, "slaveok"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 397
    invoke-virtual {p0, v9}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v10

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_0

    .line 398
    :cond_1
    const-string/jumbo v10, "readpreference"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 399
    move-object v5, v9

    goto :goto_0

    .line 400
    :cond_2
    const-string/jumbo v10, "readpreferencetags"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 401
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 402
    .local v0, "cur":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mongodb/MongoClientURI;->getTagSet(Ljava/lang/String;)Lcom/mongodb/DBObject;

    move-result-object v8

    .line 403
    .local v8, "tagSet":Lcom/mongodb/DBObject;
    if-nez v1, :cond_3

    .line 404
    move-object v1, v8

    goto :goto_1

    .line 406
    :cond_3
    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 411
    .end local v0    # "cur":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v8    # "tagSet":Lcom/mongodb/DBObject;
    .end local v9    # "value":Ljava/lang/String;
    :cond_4
    invoke-direct {p0, v5, v1, v6, v7}, Lcom/mongodb/MongoClientURI;->buildReadPreference(Ljava/lang/String;Lcom/mongodb/DBObject;Ljava/util/List;Ljava/lang/Boolean;)Lcom/mongodb/ReadPreference;

    move-result-object v10

    return-object v10
.end method

.method private createWriteConcern(Ljava/util/Map;)Lcom/mongodb/WriteConcern;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/mongodb/WriteConcern;"
        }
    .end annotation

    .prologue
    .line 357
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .line 358
    .local v1, "safe":Ljava/lang/Boolean;
    const/4 v2, 0x0

    .line 359
    .local v2, "w":Ljava/lang/String;
    const/4 v3, 0x0

    .line 360
    .local v3, "wTimeout":I
    const/4 v4, 0x0

    .line 361
    .local v4, "fsync":Z
    const/4 v5, 0x0

    .line 363
    .local v5, "journal":Z
    sget-object v0, Lcom/mongodb/MongoClientURI;->writeConcernKeys:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 364
    .local v7, "key":Ljava/lang/String;
    invoke-direct {p0, p1, v7}, Lcom/mongodb/MongoClientURI;->getLastValue(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 365
    .local v8, "value":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 369
    const-string/jumbo v0, "safe"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 370
    invoke-virtual {p0, v8}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0

    .line 371
    :cond_1
    const-string/jumbo v0, "w"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 372
    move-object v2, v8

    goto :goto_0

    .line 373
    :cond_2
    const-string/jumbo v0, "wtimeout"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 374
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 375
    :cond_3
    const-string/jumbo v0, "fsync"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 376
    invoke-virtual {p0, v8}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 377
    :cond_4
    const-string/jumbo v0, "j"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    invoke-virtual {p0, v8}, Lcom/mongodb/MongoClientURI;->_parseBoolean(Ljava/lang/String;)Z

    move-result v5

    goto :goto_0

    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    :cond_5
    move-object v0, p0

    .line 381
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/MongoClientURI;->buildWriteConcern(Ljava/lang/Boolean;Ljava/lang/String;IZZ)Lcom/mongodb/WriteConcern;

    move-result-object v0

    return-object v0
.end method

.method private getLastValue(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 466
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 467
    .local v0, "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 468
    const/4 v1, 0x0

    .line 470
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0
.end method

.method private getTagSet(Ljava/lang/String;)Lcom/mongodb/DBObject;
    .locals 9
    .param p1, "tagSetString"    # Ljava/lang/String;

    .prologue
    .line 533
    new-instance v5, Lcom/mongodb/BasicDBObject;

    invoke-direct {v5}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 534
    .local v5, "tagSet":Lcom/mongodb/DBObject;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 535
    const-string/jumbo v6, ","

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 536
    .local v3, "tag":Ljava/lang/String;
    const-string/jumbo v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 537
    .local v4, "tagKeyValuePair":[Ljava/lang/String;
    array-length v6, v4

    const/4 v7, 0x2

    if-eq v6, v7, :cond_0

    .line 538
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Bad read preference tags: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 540
    :cond_0
    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aget-object v7, v4, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 543
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "tag":Ljava/lang/String;
    .end local v4    # "tagKeyValuePair":[Ljava/lang/String;
    :cond_1
    return-object v5
.end method

.method private parseOptions(Ljava/lang/String;)Ljava/util/Map;
    .locals 10
    .param p1, "optionsPart"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 474
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 476
    .local v6, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string/jumbo v9, "&|;"

    invoke-virtual {p1, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .local v1, "arr$":[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v5, :cond_2

    aget-object v0, v1, v2

    .line 477
    .local v0, "_part":Ljava/lang/String;
    const-string/jumbo v9, "="

    invoke-virtual {v0, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 478
    .local v3, "idx":I
    if-ltz v3, :cond_1

    .line 479
    const/4 v9, 0x0

    invoke-virtual {v0, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 480
    .local v4, "key":Ljava/lang/String;
    add-int/lit8 v9, v3, 0x1

    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 481
    .local v7, "value":Ljava/lang/String;
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 482
    .local v8, "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v8, :cond_0

    .line 483
    new-instance v8, Ljava/util/ArrayList;

    .end local v8    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x1

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 485
    .restart local v8    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 486
    invoke-interface {v6, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    .end local v8    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 490
    .end local v0    # "_part":Ljava/lang/String;
    .end local v3    # "idx":I
    :cond_2
    return-object v6
.end method

.method private warnOnUnsupportedOptions(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 302
    .local p1, "optionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 303
    .local v1, "key":Ljava/lang/String;
    sget-object v2, Lcom/mongodb/MongoClientURI;->allKeys:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 304
    sget-object v2, Lcom/mongodb/MongoClientURI;->LOGGER:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unknown or Unsupported Option \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    goto :goto_0

    .line 307
    .end local v1    # "key":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method _parseBoolean(Ljava/lang/String;)Z
    .locals 3
    .param p1, "_in"    # Ljava/lang/String;

    .prologue
    .line 547
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 548
    .local v0, "in":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    const-string/jumbo v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "yes"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCollection()Ljava/lang/String;
    .locals 1

    .prologue
    .line 597
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->collection:Ljava/lang/String;

    return-object v0
.end method

.method public getCredentials()Lcom/mongodb/MongoCredential;
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    return-object v0
.end method

.method public getDatabase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 587
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->database:Ljava/lang/String;

    return-object v0
.end method

.method public getHosts()Ljava/util/List;
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
    .line 578
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->hosts:Ljava/util/List;

    return-object v0
.end method

.method public getOptions()Lcom/mongodb/MongoClientOptions;
    .locals 1

    .prologue
    .line 625
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->options:Lcom/mongodb/MongoClientOptions;

    return-object v0
.end method

.method public getPassword()[C
    .locals 1

    .prologue
    .line 569
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    invoke-virtual {v0}, Lcom/mongodb/MongoCredential;->getPassword()[C

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 606
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 560
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->credentials:Lcom/mongodb/MongoCredential;

    invoke-virtual {v0}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 642
    iget-object v0, p0, Lcom/mongodb/MongoClientURI;->uri:Ljava/lang/String;

    return-object v0
.end method
