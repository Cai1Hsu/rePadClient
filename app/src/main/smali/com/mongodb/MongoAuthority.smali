.class Lcom/mongodb/MongoAuthority;
.super Ljava/lang/Object;
.source "MongoAuthority.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MongoAuthority$Type;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field private final credentialsStore:Lcom/mongodb/MongoCredentialsStore;

.field private final serverAddresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final type:Lcom/mongodb/MongoAuthority$Type;


# direct methods
.method private constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredentialsStore;)V
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p2, "credentialsStore"    # Lcom/mongodb/MongoCredentialsStore;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    if-nez p1, :cond_0

    .line 114
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "serverAddress can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_0
    if-nez p2, :cond_1

    .line 118
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "credentialsStore can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_1
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mongodb/ServerAddress;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    .line 122
    iput-object p2, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    .line 123
    sget-object v0, Lcom/mongodb/MongoAuthority$Type;->Direct:Lcom/mongodb/MongoAuthority$Type;

    iput-object v0, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    .line 124
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Lcom/mongodb/MongoAuthority$Type;Lcom/mongodb/MongoCredentialsStore;)V
    .locals 2
    .param p2, "type"    # Lcom/mongodb/MongoAuthority$Type;
    .param p3, "credentialsStore"    # Lcom/mongodb/MongoCredentialsStore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Lcom/mongodb/MongoAuthority$Type;",
            "Lcom/mongodb/MongoCredentialsStore;",
            ")V"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "serverAddresses":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    if-nez p1, :cond_0

    .line 135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "serverAddresses can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_0
    if-nez p3, :cond_1

    .line 139
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "credentialsStore can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_1
    if-nez p2, :cond_2

    .line 143
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "type can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_2
    sget-object v0, Lcom/mongodb/MongoAuthority$Type;->Direct:Lcom/mongodb/MongoAuthority$Type;

    if-ne p2, v0, :cond_3

    .line 147
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "type can not be Direct with a list of server addresses"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_3
    iput-object p2, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    .line 151
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    .line 152
    iput-object p3, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    .line 153
    return-void
.end method

.method public static direct(Lcom/mongodb/ServerAddress;)Lcom/mongodb/MongoAuthority;
    .locals 1
    .param p0, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 54
    const/4 v0, 0x0

    check-cast v0, Lcom/mongodb/MongoCredential;

    invoke-static {p0, v0}, Lcom/mongodb/MongoAuthority;->direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    return-object v0
.end method

.method public static direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;
    .locals 1
    .param p0, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 64
    new-instance v0, Lcom/mongodb/MongoCredentialsStore;

    invoke-direct {v0, p1}, Lcom/mongodb/MongoCredentialsStore;-><init>(Lcom/mongodb/MongoCredential;)V

    invoke-static {p0, v0}, Lcom/mongodb/MongoAuthority;->direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    return-object v0
.end method

.method public static direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;
    .locals 1
    .param p0, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p1, "credentialsStore"    # Lcom/mongodb/MongoCredentialsStore;

    .prologue
    .line 74
    new-instance v0, Lcom/mongodb/MongoAuthority;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/MongoAuthority;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredentialsStore;)V

    return-object v0
.end method

.method public static dynamicSet(Ljava/util/List;)Lcom/mongodb/MongoAuthority;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;)",
            "Lcom/mongodb/MongoAuthority;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "serverAddresses":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    const/4 v0, 0x0

    check-cast v0, Lcom/mongodb/MongoCredential;

    invoke-static {p0, v0}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    return-object v0
.end method

.method public static dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredential;)Lcom/mongodb/MongoAuthority;
    .locals 1
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Lcom/mongodb/MongoCredential;",
            ")",
            "Lcom/mongodb/MongoAuthority;"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "serverAddresses":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    new-instance v0, Lcom/mongodb/MongoCredentialsStore;

    invoke-direct {v0, p1}, Lcom/mongodb/MongoCredentialsStore;-><init>(Lcom/mongodb/MongoCredential;)V

    invoke-static {p0, v0}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    return-object v0
.end method

.method public static dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;
    .locals 2
    .param p1, "credentialsStore"    # Lcom/mongodb/MongoCredentialsStore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Lcom/mongodb/MongoCredentialsStore;",
            ")",
            "Lcom/mongodb/MongoAuthority;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "serverAddresses":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    new-instance v0, Lcom/mongodb/MongoAuthority;

    sget-object v1, Lcom/mongodb/MongoAuthority$Type;->Set:Lcom/mongodb/MongoAuthority$Type;

    invoke-direct {v0, p0, v1, p1}, Lcom/mongodb/MongoAuthority;-><init>(Ljava/util/List;Lcom/mongodb/MongoAuthority$Type;Lcom/mongodb/MongoCredentialsStore;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 185
    if-ne p0, p1, :cond_1

    .line 194
    :cond_0
    :goto_0
    return v1

    .line 186
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

    .line 188
    check-cast v0, Lcom/mongodb/MongoAuthority;

    .line 190
    .local v0, "that":Lcom/mongodb/MongoAuthority;
    iget-object v3, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    iget-object v4, v0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    invoke-virtual {v3, v4}, Lcom/mongodb/MongoCredentialsStore;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 191
    :cond_4
    iget-object v3, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    iget-object v4, v0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    goto :goto_0

    .line 192
    :cond_5
    iget-object v3, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    iget-object v4, v0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    return-object v0
.end method

.method public getServerAddresses()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getType()Lcom/mongodb/MongoAuthority$Type;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 199
    iget-object v1, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredentialsStore;->hashCode()I

    move-result v0

    .line 200
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 201
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    invoke-virtual {v2}, Lcom/mongodb/MongoAuthority$Type;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 202
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongoAuthority{type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoAuthority;->type:Lcom/mongodb/MongoAuthority$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", serverAddresses="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoAuthority;->serverAddresses:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", credentials="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoAuthority;->credentialsStore:Lcom/mongodb/MongoCredentialsStore;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
