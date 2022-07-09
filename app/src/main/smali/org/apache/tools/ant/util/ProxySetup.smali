.class public Lorg/apache/tools/ant/util/ProxySetup;
.super Ljava/lang/Object;
.source "ProxySetup.java"


# static fields
.field public static final FTP_NON_PROXY_HOSTS:Ljava/lang/String; = "ftp.nonProxyHosts"

.field public static final FTP_PROXY_HOST:Ljava/lang/String; = "ftp.proxyHost"

.field public static final FTP_PROXY_PORT:Ljava/lang/String; = "ftp.proxyPort"

.field public static final HTTPS_NON_PROXY_HOSTS:Ljava/lang/String; = "https.nonProxyHosts"

.field public static final HTTPS_PROXY_HOST:Ljava/lang/String; = "https.proxyHost"

.field public static final HTTPS_PROXY_PORT:Ljava/lang/String; = "https.proxyPort"

.field public static final HTTP_NON_PROXY_HOSTS:Ljava/lang/String; = "http.nonProxyHosts"

.field public static final HTTP_PROXY_HOST:Ljava/lang/String; = "http.proxyHost"

.field public static final HTTP_PROXY_PASSWORD:Ljava/lang/String; = "http.proxyPassword"

.field public static final HTTP_PROXY_PORT:Ljava/lang/String; = "http.proxyPort"

.field public static final HTTP_PROXY_USERNAME:Ljava/lang/String; = "http.proxyUser"

.field public static final SOCKS_PROXY_HOST:Ljava/lang/String; = "socksProxyHost"

.field public static final SOCKS_PROXY_PASSWORD:Ljava/lang/String; = "java.net.socks.password"

.field public static final SOCKS_PROXY_PORT:Ljava/lang/String; = "socksProxyPort"

.field public static final SOCKS_PROXY_USERNAME:Ljava/lang/String; = "java.net.socks.username"

.field public static final USE_SYSTEM_PROXIES:Ljava/lang/String; = "java.net.useSystemProxies"


# instance fields
.field private owner:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "owner"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lorg/apache/tools/ant/util/ProxySetup;->owner:Lorg/apache/tools/ant/Project;

    .line 77
    return-void
.end method

.method public static getSystemProxySetting()Ljava/lang/String;
    .locals 2

    .prologue
    .line 85
    :try_start_0
    const-string/jumbo v1, "java.net.useSystemProxies"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 88
    .local v0, "e":Ljava/lang/SecurityException;
    :goto_0
    return-object v1

    .line 86
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_0
    move-exception v0

    .line 88
    .restart local v0    # "e":Ljava/lang/SecurityException;
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public enableProxies()V
    .locals 6

    .prologue
    .line 99
    invoke-static {}, Lorg/apache/tools/ant/util/ProxySetup;->getSystemProxySetting()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 100
    iget-object v3, p0, Lorg/apache/tools/ant/util/ProxySetup;->owner:Lorg/apache/tools/ant/Project;

    const-string/jumbo v4, "java.net.useSystemProxies"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "proxies":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 102
    :cond_0
    const-string/jumbo v2, "true"

    .line 104
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "setting java.net.useSystemProxies to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "message":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/util/ProxySetup;->owner:Lorg/apache/tools/ant/Project;

    const/4 v4, 0x4

    invoke-virtual {v3, v1, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 107
    const-string/jumbo v3, "java.net.useSystemProxies"

    invoke-static {v3, v2}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "proxies":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 108
    .restart local v1    # "message":Ljava/lang/String;
    .restart local v2    # "proxies":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Ljava/lang/SecurityException;
    iget-object v3, p0, Lorg/apache/tools/ant/util/ProxySetup;->owner:Lorg/apache/tools/ant/Project;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Security Exception when "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    goto :goto_0
.end method
