.class public abstract Lorg/jivesoftware/smack/sasl/SASLMechanism;
.super Ljava/lang/Object;
.source "SASLMechanism.java"

# interfaces
.implements Ljavax/security/auth/callback/CallbackHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Challenge;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;
    }
.end annotation


# instance fields
.field protected authenticationId:Ljava/lang/String;

.field protected hostname:Ljava/lang/String;

.field protected password:Ljava/lang/String;

.field private saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

.field protected sc:Ljavax/security/sasl/SaslClient;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/SASLAuthentication;)V
    .locals 0
    .param p1, "saslAuthentication"    # Lorg/jivesoftware/smack/SASLAuthentication;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 91
    return-void
.end method


# virtual methods
.method protected authenticate()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 189
    const/4 v0, 0x0

    .line 191
    .local v0, "authenticationText":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    invoke-interface {v3}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 192
    iget-object v3, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    const/4 v4, 0x0

    new-array v4, v4, [B

    invoke-interface {v3, v4}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v2

    .line 193
    .local v2, "response":[B
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BZ)Ljava/lang/String;
    :try_end_0
    .catch Ljavax/security/sasl/SaslException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 200
    .end local v2    # "response":[B
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v3

    new-instance v4, Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5, v0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/SASLAuthentication;->send(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 201
    return-void

    .line 195
    :catch_0
    move-exception v1

    .line 196
    .local v1, "e":Ljavax/security/sasl/SaslException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "SASL authentication failed"

    invoke-direct {v3, v4, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p0, p1, p2, p2, p3}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 145
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticationId:Ljava/lang/String;

    .line 146
    iput-object p4, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->password:Ljava/lang/String;

    .line 147
    iput-object p2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->hostname:Ljava/lang/String;

    .line 149
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 150
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 151
    .local v4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "xmpp"

    move-object v1, p1

    move-object v3, p3

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 152
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate()V

    .line 153
    return-void
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V
    .locals 6
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 182
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 183
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 184
    .local v4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "xmpp"

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 185
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate()V

    .line 186
    return-void
.end method

.method public challengeReceived(Ljava/lang/String;)V
    .locals 5
    .param p1, "challenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 213
    if-eqz p1, :cond_0

    .line 214
    iget-object v2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v3

    invoke-interface {v2, v3}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v0

    .line 220
    .local v0, "response":[B
    :goto_0
    if-nez v0, :cond_1

    .line 221
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;)V

    .line 228
    .local v1, "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    :goto_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->send(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 229
    return-void

    .line 216
    .end local v0    # "response":[B
    .end local v1    # "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    new-array v3, v4, [B

    invoke-interface {v2, v3}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v0

    .restart local v0    # "response":[B
    goto :goto_0

    .line 224
    :cond_1
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;

    invoke-static {v0, v4}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BZ)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;Ljava/lang/String;)V

    .restart local v1    # "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    goto :goto_1
.end method

.method protected abstract getName()Ljava/lang/String;
.end method

.method protected getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    return-object v0
.end method

.method public handle([Ljavax/security/auth/callback/Callback;)V
    .locals 7
    .param p1, "callbacks"    # [Ljavax/security/auth/callback/Callback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/security/auth/callback/UnsupportedCallbackException;
        }
    .end annotation

    .prologue
    .line 247
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p1

    if-ge v0, v5, :cond_4

    .line 248
    aget-object v5, p1, v0

    instance-of v5, v5, Ljavax/security/auth/callback/NameCallback;

    if-eqz v5, :cond_1

    .line 249
    aget-object v1, p1, v0

    check-cast v1, Ljavax/security/auth/callback/NameCallback;

    .line 250
    .local v1, "ncb":Ljavax/security/auth/callback/NameCallback;
    iget-object v5, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticationId:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljavax/security/auth/callback/NameCallback;->setName(Ljava/lang/String;)V

    .line 247
    .end local v1    # "ncb":Ljavax/security/auth/callback/NameCallback;
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_1
    aget-object v5, p1, v0

    instance-of v5, v5, Ljavax/security/auth/callback/PasswordCallback;

    if-eqz v5, :cond_2

    .line 252
    aget-object v2, p1, v0

    check-cast v2, Ljavax/security/auth/callback/PasswordCallback;

    .line 253
    .local v2, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    iget-object v5, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->password:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    invoke-virtual {v2, v5}, Ljavax/security/auth/callback/PasswordCallback;->setPassword([C)V

    goto :goto_1

    .line 254
    .end local v2    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :cond_2
    aget-object v5, p1, v0

    instance-of v5, v5, Ljavax/security/sasl/RealmCallback;

    if-eqz v5, :cond_3

    .line 255
    aget-object v3, p1, v0

    check-cast v3, Ljavax/security/sasl/RealmCallback;

    .line 259
    .local v3, "rcb":Ljavax/security/sasl/RealmCallback;
    invoke-virtual {v3}, Ljavax/security/sasl/RealmCallback;->getDefaultText()Ljava/lang/String;

    move-result-object v4

    .line 262
    .local v4, "text":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljavax/security/sasl/RealmCallback;->setText(Ljava/lang/String;)V

    goto :goto_1

    .line 263
    .end local v3    # "rcb":Ljavax/security/sasl/RealmCallback;
    .end local v4    # "text":Ljava/lang/String;
    :cond_3
    aget-object v5, p1, v0

    instance-of v5, v5, Ljavax/security/sasl/RealmChoiceCallback;

    if-nez v5, :cond_0

    .line 267
    new-instance v5, Ljavax/security/auth/callback/UnsupportedCallbackException;

    aget-object v6, p1, v0

    invoke-direct {v5, v6}, Ljavax/security/auth/callback/UnsupportedCallbackException;-><init>(Ljavax/security/auth/callback/Callback;)V

    throw v5

    .line 270
    :cond_4
    return-void
.end method
