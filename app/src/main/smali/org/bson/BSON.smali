.class public Lorg/bson/BSON;
.super Ljava/lang/Object;
.source "BSON.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/BSON$RegexFlag;
    }
.end annotation


# static fields
.field public static final ARRAY:B = 0x4t

.field public static final BINARY:B = 0x5t

.field public static final BOOLEAN:B = 0x8t

.field public static final B_BINARY:B = 0x2t

.field public static final B_FUNC:B = 0x1t

.field public static final B_GENERAL:B = 0x0t

.field public static final B_UUID:B = 0x3t

.field public static final CODE:B = 0xdt

.field public static final CODE_W_SCOPE:B = 0xft

.field public static final DATE:B = 0x9t

.field public static final EOO:B = 0x0t

.field private static final GLOBAL_FLAG:I = 0x100

.field static final LOGGER:Ljava/util/logging/Logger;

.field public static final MAXKEY:B = 0x7ft

.field public static final MINKEY:B = -0x1t

.field public static final NULL:B = 0xat

.field public static final NUMBER:B = 0x1t

.field public static final NUMBER_INT:B = 0x10t

.field public static final NUMBER_LONG:B = 0x12t

.field public static final OBJECT:B = 0x3t

.field public static final OID:B = 0x7t

.field public static final REF:B = 0xct

.field public static final REGEX:B = 0xbt

.field public static final STRING:B = 0x2t

.field public static final SYMBOL:B = 0xet

.field public static final TIMESTAMP:B = 0x11t

.field public static final UNDEFINED:B = 0x6t

.field private static _decodeHooks:Z

.field static _decodingHooks:Lorg/bson/util/ClassMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/ClassMap",
            "<",
            "Ljava/util/List",
            "<",
            "Lorg/bson/Transformer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static _encodeHooks:Z

.field static _encodingHooks:Lorg/bson/util/ClassMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/ClassMap",
            "<",
            "Ljava/util/List",
            "<",
            "Lorg/bson/Transformer;",
            ">;>;"
        }
    .end annotation
.end field

.field static _staticDecoder:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/bson/BSONDecoder;",
            ">;"
        }
    .end annotation
.end field

.field static _staticEncoder:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/bson/BSONEncoder;",
            ">;"
        }
    .end annotation
.end field

.field protected static _utf8:Ljava/nio/charset/Charset;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 33
    const-string/jumbo v0, "org.bson.BSON"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/bson/BSON;->LOGGER:Ljava/util/logging/Logger;

    .line 292
    sput-boolean v1, Lorg/bson/BSON;->_encodeHooks:Z

    .line 293
    sput-boolean v1, Lorg/bson/BSON;->_decodeHooks:Z

    .line 294
    new-instance v0, Lorg/bson/util/ClassMap;

    invoke-direct {v0}, Lorg/bson/util/ClassMap;-><init>()V

    sput-object v0, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    .line 297
    new-instance v0, Lorg/bson/util/ClassMap;

    invoke-direct {v0}, Lorg/bson/util/ClassMap;-><init>()V

    sput-object v0, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    .line 304
    const-string/jumbo v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/bson/BSON;->_utf8:Ljava/nio/charset/Charset;

    .line 323
    new-instance v0, Lorg/bson/BSON$1;

    invoke-direct {v0}, Lorg/bson/BSON$1;-><init>()V

    sput-object v0, Lorg/bson/BSON;->_staticEncoder:Ljava/lang/ThreadLocal;

    .line 329
    new-instance v0, Lorg/bson/BSON$2;

    invoke-direct {v0}, Lorg/bson/BSON$2;-><init>()V

    sput-object v0, Lorg/bson/BSON;->_staticDecoder:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    return-void
.end method

.method private static _anyHooks()Z
    .locals 1

    .prologue
    .line 289
    sget-boolean v0, Lorg/bson/BSON;->_encodeHooks:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lorg/bson/BSON;->_decodeHooks:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static _warnUnsupportedRegex(Ljava/lang/String;)V
    .locals 3
    .param p0, "flag"    # Ljava/lang/String;

    .prologue
    .line 167
    sget-object v0, Lorg/bson/BSON;->LOGGER:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "flag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " not supported by db."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method public static addDecodingHook(Ljava/lang/Class;Lorg/bson/Transformer;)V
    .locals 2
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "t"    # Lorg/bson/Transformer;

    .prologue
    .line 187
    const/4 v1, 0x1

    sput-boolean v1, Lorg/bson/BSON;->_decodeHooks:Z

    .line 188
    sget-object v1, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v1, p0}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 189
    .local v0, "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    if-nez v0, :cond_0

    .line 190
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .end local v0    # "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 191
    .restart local v0    # "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    sget-object v1, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v1, p0, v0}, Lorg/bson/util/ClassMap;->put(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    return-void
.end method

.method public static addEncodingHook(Ljava/lang/Class;Lorg/bson/Transformer;)V
    .locals 2
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "t"    # Lorg/bson/Transformer;

    .prologue
    .line 177
    const/4 v1, 0x1

    sput-boolean v1, Lorg/bson/BSON;->_encodeHooks:Z

    .line 178
    sget-object v1, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v1, p0}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 179
    .local v0, "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    if-nez v0, :cond_0

    .line 180
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .end local v0    # "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 181
    .restart local v0    # "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    sget-object v1, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v1, p0, v0}, Lorg/bson/util/ClassMap;->put(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    return-void
.end method

.method public static applyDecodingHooks(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 210
    invoke-static {}, Lorg/bson/BSON;->_anyHooks()Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez p0, :cond_1

    .line 217
    :cond_0
    return-object p0

    .line 213
    :cond_1
    sget-object v3, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 214
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    if-eqz v1, :cond_0

    .line 215
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/bson/Transformer;

    .line 216
    .local v2, "t":Lorg/bson/Transformer;
    invoke-interface {v2, p0}, Lorg/bson/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0
.end method

.method public static applyEncodingHooks(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 197
    invoke-static {}, Lorg/bson/BSON;->_anyHooks()Z

    move-result v3

    if-nez v3, :cond_1

    .line 206
    :cond_0
    return-object p0

    .line 200
    :cond_1
    sget-object v3, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v3}, Lorg/bson/util/ClassMap;->size()I

    move-result v3

    if-eqz v3, :cond_0

    if-eqz p0, :cond_0

    .line 202
    sget-object v3, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 203
    .local v1, "l":Ljava/util/List;, "Ljava/util/List<Lorg/bson/Transformer;>;"
    if-eqz v1, :cond_0

    .line 204
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/bson/Transformer;

    .line 205
    .local v2, "t":Lorg/bson/Transformer;
    invoke-interface {v2, p0}, Lorg/bson/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0
.end method

.method public static clearAllHooks()V
    .locals 0

    .prologue
    .line 281
    invoke-static {}, Lorg/bson/BSON;->clearEncodingHooks()V

    .line 282
    invoke-static {}, Lorg/bson/BSON;->clearDecodingHooks()V

    .line 283
    return-void
.end method

.method public static clearDecodingHooks()V
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x0

    sput-boolean v0, Lorg/bson/BSON;->_decodeHooks:Z

    .line 262
    sget-object v0, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0}, Lorg/bson/util/ClassMap;->clear()V

    .line 263
    return-void
.end method

.method public static clearEncodingHooks()V
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    sput-boolean v0, Lorg/bson/BSON;->_encodeHooks:Z

    .line 233
    sget-object v0, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0}, Lorg/bson/util/ClassMap;->clear()V

    .line 234
    return-void
.end method

.method public static decode([B)Lorg/bson/BSONObject;
    .locals 2
    .param p0, "b"    # [B

    .prologue
    .line 319
    sget-object v1, Lorg/bson/BSON;->_staticDecoder:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSONDecoder;

    .line 320
    .local v0, "d":Lorg/bson/BSONDecoder;
    invoke-interface {v0, p0}, Lorg/bson/BSONDecoder;->readObject([B)Lorg/bson/BSONObject;

    move-result-object v1

    return-object v1
.end method

.method public static encode(Lorg/bson/BSONObject;)[B
    .locals 2
    .param p0, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 309
    sget-object v1, Lorg/bson/BSON;->_staticEncoder:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSONEncoder;

    .line 311
    .local v0, "e":Lorg/bson/BSONEncoder;
    :try_start_0
    invoke-interface {v0, p0}, Lorg/bson/BSONEncoder;->encode(Lorg/bson/BSONObject;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 314
    invoke-interface {v0}, Lorg/bson/BSONEncoder;->done()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Lorg/bson/BSONEncoder;->done()V

    throw v1
.end method

.method public static getDecodingHooks(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/bson/Transformer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 254
    sget-object v0, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0, p0}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public static getEncodingHooks(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/bson/Transformer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 225
    sget-object v0, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0, p0}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public static hasDecodeHooks()Z
    .locals 1

    .prologue
    .line 174
    sget-boolean v0, Lorg/bson/BSON;->_decodeHooks:Z

    return v0
.end method

.method public static regexFlag(C)I
    .locals 4
    .param p0, "c"    # C

    .prologue
    .line 101
    invoke-static {p0}, Lorg/bson/BSON$RegexFlag;->getByCharacter(C)Lorg/bson/BSON$RegexFlag;

    move-result-object v0

    .line 102
    .local v0, "flag":Lorg/bson/BSON$RegexFlag;
    if-nez v0, :cond_0

    .line 103
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unrecognized flag ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_0
    iget-object v1, v0, Lorg/bson/BSON$RegexFlag;->unsupported:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 106
    iget-object v1, v0, Lorg/bson/BSON$RegexFlag;->unsupported:Ljava/lang/String;

    invoke-static {v1}, Lorg/bson/BSON;->_warnUnsupportedRegex(Ljava/lang/String;)V

    .line 107
    const/4 v1, 0x0

    .line 110
    :goto_0
    return v1

    :cond_1
    iget v1, v0, Lorg/bson/BSON$RegexFlag;->javaFlag:I

    goto :goto_0
.end method

.method public static regexFlags(Ljava/lang/String;)I
    .locals 7
    .param p0, "flags"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, "fint":I
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    move v1, v0

    .line 97
    .end local v0    # "fint":I
    .local v1, "fint":I
    :goto_0
    return v1

    .line 84
    .end local v1    # "fint":I
    .restart local v0    # "fint":I
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 86
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 87
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/bson/BSON$RegexFlag;->getByCharacter(C)Lorg/bson/BSON$RegexFlag;

    move-result-object v2

    .line 88
    .local v2, "flag":Lorg/bson/BSON$RegexFlag;
    if-eqz v2, :cond_3

    .line 89
    iget v4, v2, Lorg/bson/BSON$RegexFlag;->javaFlag:I

    or-int/2addr v0, v4

    .line 90
    iget-object v4, v2, Lorg/bson/BSON$RegexFlag;->unsupported:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 91
    iget-object v4, v2, Lorg/bson/BSON$RegexFlag;->unsupported:Ljava/lang/String;

    invoke-static {v4}, Lorg/bson/BSON;->_warnUnsupportedRegex(Ljava/lang/String;)V

    .line 86
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 94
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "unrecognized flag ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "] "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "flag":Lorg/bson/BSON$RegexFlag;
    :cond_4
    move v1, v0

    .line 97
    .end local v0    # "fint":I
    .restart local v1    # "fint":I
    goto :goto_0
.end method

.method public static regexFlags(I)Ljava/lang/String;
    .locals 7
    .param p0, "flags"    # I

    .prologue
    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .local v1, "buf":Ljava/lang/StringBuilder;
    invoke-static {}, Lorg/bson/BSON$RegexFlag;->values()[Lorg/bson/BSON$RegexFlag;

    move-result-object v0

    .local v0, "arr$":[Lorg/bson/BSON$RegexFlag;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v0, v3

    .line 121
    .local v2, "flag":Lorg/bson/BSON$RegexFlag;
    iget v5, v2, Lorg/bson/BSON$RegexFlag;->javaFlag:I

    and-int/2addr v5, p0

    if-lez v5, :cond_0

    .line 122
    iget-char v5, v2, Lorg/bson/BSON$RegexFlag;->flagChar:C

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 123
    iget v5, v2, Lorg/bson/BSON$RegexFlag;->javaFlag:I

    sub-int/2addr p0, v5

    .line 120
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 127
    .end local v2    # "flag":Lorg/bson/BSON$RegexFlag;
    :cond_1
    if-lez p0, :cond_2

    .line 128
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "some flags could not be recognized."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 130
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static removeDecodingHook(Ljava/lang/Class;Lorg/bson/Transformer;)V
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "t"    # Lorg/bson/Transformer;

    .prologue
    .line 276
    invoke-static {p0}, Lorg/bson/BSON;->getDecodingHooks(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 277
    return-void
.end method

.method public static removeDecodingHooks(Ljava/lang/Class;)V
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 269
    sget-object v0, Lorg/bson/BSON;->_decodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0, p0}, Lorg/bson/util/ClassMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    return-void
.end method

.method public static removeEncodingHook(Ljava/lang/Class;Lorg/bson/Transformer;)V
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;
    .param p1, "t"    # Lorg/bson/Transformer;

    .prologue
    .line 247
    invoke-static {p0}, Lorg/bson/BSON;->getEncodingHooks(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 248
    return-void
.end method

.method public static removeEncodingHooks(Ljava/lang/Class;)V
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 240
    sget-object v0, Lorg/bson/BSON;->_encodingHooks:Lorg/bson/util/ClassMap;

    invoke-virtual {v0, p0}, Lorg/bson/util/ClassMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    return-void
.end method

.method public static toInt(Ljava/lang/Object;)I
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 338
    if-nez p0, :cond_0

    .line 339
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 342
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 345
    :goto_0
    return v0

    .line 344
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 345
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 347
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "can\'t convert: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " to int"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
