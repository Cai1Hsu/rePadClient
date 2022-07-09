.class public final Lcom/mongodb/MongoCredential;
.super Ljava/lang/Object;
.source "MongoCredential.java"


# annotations
.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# static fields
.field public static final GSSAPI_MECHANISM:Ljava/lang/String; = "GSSAPI"

.field public static final MONGODB_CR_MECHANISM:Ljava/lang/String; = "MONGODB-CR"

.field public static final MONGODB_X509_MECHANISM:Ljava/lang/String; = "MONGODB-X509"

.field public static final PLAIN_MECHANISM:Ljava/lang/String; = "PLAIN"


# instance fields
.field private final mechanism:Ljava/lang/String;

.field private final mechanismProperties:Ljava/util/Map;
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

.field private final password:[C

.field private final source:Ljava/lang/String;

.field private final userName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mongodb/MongoCredential;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "from"    # Lcom/mongodb/MongoCredential;
    .param p2, "mechanismPropertyKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/mongodb/MongoCredential;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 175
    .local p3, "mechanismPropertyValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    iget-object v0, p1, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    .line 177
    iget-object v0, p1, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    .line 178
    iget-object v0, p1, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    .line 179
    iget-object v0, p1, Lcom/mongodb/MongoCredential;->password:[C

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->password:[C

    .line 180
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    .line 181
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[C)V
    .locals 2
    .param p1, "mechanism"    # Ljava/lang/String;
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/String;
    .param p4, "password"    # [C

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    if-nez p1, :cond_0

    .line 145
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "mechanism can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_0
    if-nez p2, :cond_1

    .line 149
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "username can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_1
    const-string/jumbo v0, "MONGODB-CR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p4, :cond_2

    .line 153
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Password can not be null for MONGODB-CR mechanism"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_2
    const-string/jumbo v0, "GSSAPI"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p4, :cond_3

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Password must be null for the GSSAPI mechanism"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_3
    iput-object p1, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    .line 161
    iput-object p2, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    .line 162
    iput-object p3, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    .line 163
    if-eqz p4, :cond_4

    invoke-virtual {p4}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    :goto_0
    iput-object v0, p0, Lcom/mongodb/MongoCredential;->password:[C

    .line 164
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    .line 165
    return-void

    .line 163
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static createGSSAPICredential(Ljava/lang/String;)Lcom/mongodb/MongoCredential;
    .locals 4
    .param p0, "userName"    # Ljava/lang/String;

    .prologue
    .line 92
    new-instance v0, Lcom/mongodb/MongoCredential;

    const-string/jumbo v1, "GSSAPI"

    const-string/jumbo v2, "$external"

    const/4 v3, 0x0

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/mongodb/MongoCredential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[C)V

    return-object v0
.end method

.method public static createMongoCRCredential(Ljava/lang/String;Ljava/lang/String;[C)Lcom/mongodb/MongoCredential;
    .locals 2
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "database"    # Ljava/lang/String;
    .param p2, "password"    # [C

    .prologue
    .line 77
    new-instance v0, Lcom/mongodb/MongoCredential;

    const-string/jumbo v1, "MONGODB-CR"

    invoke-direct {v0, v1, p0, p1, p2}, Lcom/mongodb/MongoCredential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[C)V

    return-object v0
.end method

.method public static createMongoX509Credential(Ljava/lang/String;)Lcom/mongodb/MongoCredential;
    .locals 4
    .param p0, "userName"    # Ljava/lang/String;

    .prologue
    .line 104
    new-instance v0, Lcom/mongodb/MongoCredential;

    const-string/jumbo v1, "MONGODB-X509"

    const-string/jumbo v2, "$external"

    const/4 v3, 0x0

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/mongodb/MongoCredential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[C)V

    return-object v0
.end method

.method public static createPlainCredential(Ljava/lang/String;Ljava/lang/String;[C)Lcom/mongodb/MongoCredential;
    .locals 2
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "password"    # [C

    .prologue
    .line 118
    new-instance v0, Lcom/mongodb/MongoCredential;

    const-string/jumbo v1, "PLAIN"

    invoke-direct {v0, v1, p0, p1, p2}, Lcom/mongodb/MongoCredential;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[C)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 240
    if-ne p0, p1, :cond_1

    .line 251
    :cond_0
    :goto_0
    return v1

    .line 241
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 243
    check-cast v0, Lcom/mongodb/MongoCredential;

    .line 245
    .local v0, "that":Lcom/mongodb/MongoCredential;
    iget-object v3, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 246
    :cond_4
    iget-object v3, p0, Lcom/mongodb/MongoCredential;->password:[C

    iget-object v4, v0, Lcom/mongodb/MongoCredential;->password:[C

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    goto :goto_0

    .line 247
    :cond_5
    iget-object v3, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 248
    :cond_6
    iget-object v3, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    goto :goto_0

    .line 249
    :cond_7
    iget-object v3, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    iget-object v4, v0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getMechanism()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    return-object v0
.end method

.method public getMechanismProperty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 234
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 235
    .local v0, "value":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/Object;, "TT;"
    :cond_0
    move-object p2, v0

    goto :goto_0
.end method

.method public getPassword()[C
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->password:[C

    if-nez v0, :cond_0

    .line 218
    const/4 v0, 0x0

    .line 220
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->password:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    goto :goto_0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 256
    iget-object v1, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 257
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 258
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 259
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->password:[C

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->password:[C

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([C)I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 260
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 261
    return v0

    .line 259
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 266
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongoCredential{mechanism=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->mechanism:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", userName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", source=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->source:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", password=<hidden>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mechanismProperties="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoCredential;->mechanismProperties:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withMechanismProperty(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/MongoCredential;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)",
            "Lcom/mongodb/MongoCredential;"
        }
    .end annotation

    .prologue
    .line 131
    .local p2, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/mongodb/MongoCredential;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/MongoCredential;-><init>(Lcom/mongodb/MongoCredential;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method
