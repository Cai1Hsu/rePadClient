.class public Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;
.super Lorg/apache/tools/ant/Task;
.source "SetProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$1;,
        Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;
    }
.end annotation


# static fields
.field private static final HTTP_PORT:I = 0x50

.field private static final SOCKS_PORT:I = 0x438


# instance fields
.field private nonProxyHosts:Ljava/lang/String;

.field protected proxyHost:Ljava/lang/String;

.field private proxyPassword:Ljava/lang/String;

.field protected proxyPort:I

.field private proxyUser:Ljava/lang/String;

.field private socksProxyHost:Ljava/lang/String;

.field private socksProxyPort:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    .line 70
    const/16 v0, 0x50

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPort:I

    .line 77
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyHost:Ljava/lang/String;

    .line 82
    const/16 v0, 0x438

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyPort:I

    .line 88
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    .line 93
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    .line 98
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPassword:Ljava/lang/String;

    .line 270
    return-void
.end method

.method private traceSettingInfo()V
    .locals 2

    .prologue
    .line 252
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Setting proxy to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->log(Ljava/lang/String;I)V

    .line 256
    return-void

    .line 252
    :cond_0
    const-string/jumbo v0, "\'\'"

    goto :goto_0
.end method


# virtual methods
.method public applyWebProxySettings()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x3

    .line 179
    const/4 v2, 0x0

    .line 180
    .local v2, "settingsChanged":Z
    const/4 v0, 0x0

    .line 181
    .local v0, "enablingProxy":Z
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v3

    .line 182
    .local v3, "sysprops":Ljava/util/Properties;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 183
    const/4 v2, 0x1

    .line 184
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_4

    .line 185
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->traceSettingInfo()V

    .line 186
    const/4 v0, 0x1

    .line 187
    const-string/jumbo v4, "http.proxyHost"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPort:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "portString":Ljava/lang/String;
    const-string/jumbo v4, "http.proxyPort"

    invoke-virtual {v3, v4, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string/jumbo v4, "https.proxyHost"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string/jumbo v4, "https.proxyPort"

    invoke-virtual {v3, v4, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string/jumbo v4, "ftp.proxyHost"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string/jumbo v4, "ftp.proxyPort"

    invoke-virtual {v3, v4, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 195
    const-string/jumbo v4, "http.nonProxyHosts"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string/jumbo v4, "https.nonProxyHosts"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string/jumbo v4, "ftp.nonProxyHosts"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 200
    const-string/jumbo v4, "http.proxyUser"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string/jumbo v4, "http.proxyPassword"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPassword:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .end local v1    # "portString":Ljava/lang/String;
    :cond_1
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyHost:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 218
    const/4 v2, 0x1

    .line 219
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyHost:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_5

    .line 220
    const/4 v0, 0x1

    .line 221
    const-string/jumbo v4, "socksProxyHost"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyHost:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string/jumbo v4, "socksProxyPort"

    iget v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyPort:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 225
    const-string/jumbo v4, "java.net.socks.username"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-string/jumbo v4, "java.net.socks.password"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPassword:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    :cond_2
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 239
    if-eqz v0, :cond_6

    .line 240
    new-instance v4, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPassword:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$1;)V

    invoke-static {v4}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 246
    :cond_3
    :goto_2
    return-void

    .line 204
    :cond_4
    const-string/jumbo v4, "resetting http proxy"

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->log(Ljava/lang/String;I)V

    .line 205
    const-string/jumbo v4, "http.proxyHost"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string/jumbo v4, "http.proxyPort"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string/jumbo v4, "http.proxyUser"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const-string/jumbo v4, "http.proxyPassword"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    const-string/jumbo v4, "https.proxyHost"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    const-string/jumbo v4, "https.proxyPort"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    const-string/jumbo v4, "ftp.proxyHost"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    const-string/jumbo v4, "ftp.proxyPort"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 230
    :cond_5
    const-string/jumbo v4, "resetting socks proxy"

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->log(Ljava/lang/String;I)V

    .line 231
    const-string/jumbo v4, "socksProxyHost"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const-string/jumbo v4, "socksProxyPort"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    const-string/jumbo v4, "java.net.socks.username"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    const-string/jumbo v4, "java.net.socks.password"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 242
    :cond_6
    if-eqz v2, :cond_3

    .line 243
    new-instance v4, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;

    const-string/jumbo v5, ""

    const-string/jumbo v6, ""

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy$1;)V

    invoke-static {v4}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto :goto_2
.end method

.method public execute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 264
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->applyWebProxySettings()V

    .line 265
    return-void
.end method

.method public setNonProxyHosts(Ljava/lang/String;)V
    .locals 0
    .param p1, "nonProxyHosts"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->nonProxyHosts:Ljava/lang/String;

    .line 150
    return-void
.end method

.method public setProxyHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyHost:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public setProxyPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "proxyPassword"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPassword:Ljava/lang/String;

    .line 169
    return-void
.end method

.method public setProxyPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 117
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyPort:I

    .line 118
    return-void
.end method

.method public setProxyUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "proxyUser"    # Ljava/lang/String;

    .prologue
    .line 159
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->proxyUser:Ljava/lang/String;

    .line 160
    return-void
.end method

.method public setSocksProxyHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyHost:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setSocksProxyPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 137
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/net/SetProxy;->socksProxyPort:I

    .line 138
    return-void
.end method
