.class public Lorg/apache/tools/ant/taskdefs/HostInfo;
.super Lorg/apache/tools/ant/Task;
.source "HostInfo.java"


# static fields
.field private static final ADDR4:Ljava/lang/String; = "ADDR4"

.field private static final ADDR6:Ljava/lang/String; = "ADDR6"

.field private static final DEF_DOMAIN:Ljava/lang/String; = "localdomain"

.field private static final DEF_LOCAL_ADDR4:Ljava/lang/String; = "127.0.0.1"

.field private static final DEF_LOCAL_ADDR6:Ljava/lang/String; = "::1"

.field private static final DEF_LOCAL_NAME:Ljava/lang/String; = "localhost"

.field private static final DEF_REM_ADDR4:Ljava/lang/String; = "0.0.0.0"

.field private static final DEF_REM_ADDR6:Ljava/lang/String; = "::"

.field private static final DOMAIN:Ljava/lang/String; = "DOMAIN"

.field private static final NAME:Ljava/lang/String; = "NAME"


# instance fields
.field private best4:Ljava/net/InetAddress;

.field private best6:Ljava/net/InetAddress;

.field private host:Ljava/lang/String;

.field private inetAddrs:Ljava/util/List;

.field private nameAddr:Ljava/net/InetAddress;

.field private prefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 64
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    return-void
.end method

.method private executeLocal()V
    .locals 6

    .prologue
    .line 119
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v3

    .line 120
    .local v3, "interfaces":Ljava/util/Enumeration;
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->inetAddrs:Ljava/util/List;

    .line 121
    :cond_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 122
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    .line 124
    .local v1, "currentif":Ljava/net/NetworkInterface;
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v0

    .line 125
    .local v0, "addrs":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 127
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->inetAddrs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 148
    .end local v0    # "addrs":Ljava/util/Enumeration;
    .end local v1    # "currentif":Ljava/net/NetworkInterface;
    .end local v3    # "interfaces":Ljava/util/Enumeration;
    :catch_0
    move-exception v2

    .line 149
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "Error retrieving local host information"

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v2, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 150
    const-string/jumbo v4, "DOMAIN"

    const-string/jumbo v5, "localdomain"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string/jumbo v4, "NAME"

    const-string/jumbo v5, "localhost"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-string/jumbo v4, "ADDR4"

    const-string/jumbo v5, "127.0.0.1"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    const-string/jumbo v4, "ADDR6"

    const-string/jumbo v5, "::1"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 130
    .restart local v3    # "interfaces":Ljava/util/Enumeration;
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->selectAddresses()V

    .line 132
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/HostInfo;->hasHostName(Ljava/net/InetAddress;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 133
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    invoke-virtual {v4}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setDomainAndName(Ljava/lang/String;)V

    .line 138
    :goto_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    if-eqz v4, :cond_3

    .line 139
    const-string/jumbo v4, "ADDR4"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :goto_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    if-eqz v4, :cond_4

    .line 144
    const-string/jumbo v4, "ADDR6"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 135
    :cond_2
    const-string/jumbo v4, "DOMAIN"

    const-string/jumbo v5, "localdomain"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    const-string/jumbo v4, "NAME"

    const-string/jumbo v5, "localhost"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 141
    :cond_3
    const-string/jumbo v4, "ADDR4"

    const-string/jumbo v5, "127.0.0.1"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 146
    :cond_4
    const-string/jumbo v4, "ADDR6"

    const-string/jumbo v5, "::1"

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private executeRemote()V
    .locals 3

    .prologue
    .line 219
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->inetAddrs:Ljava/util/List;

    .line 221
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->selectAddresses()V

    .line 223
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/HostInfo;->hasHostName(Ljava/net/InetAddress;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 224
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setDomainAndName(Ljava/lang/String;)V

    .line 228
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    if-eqz v1, :cond_1

    .line 229
    const-string/jumbo v1, "ADDR4"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :goto_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    if-eqz v1, :cond_2

    .line 234
    const-string/jumbo v1, "ADDR6"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    :goto_2
    return-void

    .line 226
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setDomainAndName(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Error retrieving remote host information for host:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 241
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setDomainAndName(Ljava/lang/String;)V

    .line 242
    const-string/jumbo v1, "ADDR4"

    const-string/jumbo v2, "0.0.0.0"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    const-string/jumbo v1, "ADDR6"

    const-string/jumbo v2, "::"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 231
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    const-string/jumbo v1, "ADDR4"

    const-string/jumbo v2, "0.0.0.0"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 236
    :cond_2
    const-string/jumbo v1, "ADDR6"

    const-string/jumbo v2, "::"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private hasHostName(Ljava/net/InetAddress;)Z
    .locals 2
    .param p1, "addr"    # Ljava/net/InetAddress;

    .prologue
    .line 159
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private selectAddresses()V
    .locals 4

    .prologue
    .line 163
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->inetAddrs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 164
    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 165
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 166
    .local v0, "current":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->isMulticastAddress()Z

    move-result v2

    if-nez v2, :cond_0

    .line 167
    instance-of v2, v0, Ljava/net/Inet4Address;

    if-eqz v2, :cond_1

    .line 168
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    invoke-direct {p0, v2, v0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->selectBestAddress(Ljava/net/InetAddress;Ljava/net/InetAddress;)Ljava/net/InetAddress;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    goto :goto_0

    .line 169
    :cond_1
    instance-of v2, v0, Ljava/net/Inet6Address;

    if-eqz v2, :cond_0

    .line 170
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    invoke-direct {p0, v2, v0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->selectBestAddress(Ljava/net/InetAddress;Ljava/net/InetAddress;)Ljava/net/InetAddress;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    goto :goto_0

    .line 175
    .end local v0    # "current":Ljava/net/InetAddress;
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best4:Ljava/net/InetAddress;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->best6:Ljava/net/InetAddress;

    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/HostInfo;->selectBestAddress(Ljava/net/InetAddress;Ljava/net/InetAddress;)Ljava/net/InetAddress;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->nameAddr:Ljava/net/InetAddress;

    .line 176
    return-void
.end method

.method private selectBestAddress(Ljava/net/InetAddress;Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 2
    .param p1, "bestSoFar"    # Ljava/net/InetAddress;
    .param p2, "current"    # Ljava/net/InetAddress;

    .prologue
    .line 180
    move-object v0, p1

    .line 181
    .local v0, "best":Ljava/net/InetAddress;
    if-nez v0, :cond_1

    .line 183
    move-object v0, p2

    .line 214
    :cond_0
    :goto_0
    return-object v0

    .line 185
    :cond_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v1

    if-nez v1, :cond_0

    .line 187
    invoke-virtual {p2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 189
    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    move-object v0, p2

    goto :goto_0

    .line 192
    :cond_2
    invoke-virtual {p2}, Ljava/net/InetAddress;->isSiteLocalAddress()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 196
    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Ljava/net/InetAddress;->isSiteLocalAddress()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->hasHostName(Ljava/net/InetAddress;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 199
    :cond_3
    move-object v0, p2

    goto :goto_0

    .line 206
    :cond_4
    invoke-virtual {v0}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Ljava/net/InetAddress;->isSiteLocalAddress()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->hasHostName(Ljava/net/InetAddress;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 210
    :cond_5
    move-object v0, p2

    goto :goto_0
.end method

.method private setDomainAndName(Ljava/lang/String;)V
    .locals 3
    .param p1, "fqdn"    # Ljava/lang/String;

    .prologue
    .line 249
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 250
    .local v0, "idx":I
    if-lez v0, :cond_0

    .line 251
    const-string/jumbo v1, "NAME"

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    const-string/jumbo v1, "DOMAIN"

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    :goto_0
    return-void

    .line 254
    :cond_0
    const-string/jumbo v1, "NAME"

    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    const-string/jumbo v1, "DOMAIN"

    const-string/jumbo v2, "localdomain"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/HostInfo;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->executeLocal()V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/HostInfo;->executeRemote()V

    goto :goto_0
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "aHost"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->host:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "aPrefix"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/HostInfo;->prefix:Ljava/lang/String;

    .line 89
    :cond_0
    return-void
.end method
