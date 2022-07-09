.class public Lorg/apache/tools/ant/taskdefs/condition/Http;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Http.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final DEFAULT_REQUEST_METHOD:Ljava/lang/String; = "GET"

.field private static final ERROR_BEGINS:I = 0x190


# instance fields
.field private errorsBeginAt:I

.field private requestMethod:Ljava/lang/String;

.field private spec:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    .line 42
    const-string/jumbo v0, "GET"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->requestMethod:Ljava/lang/String;

    .line 53
    const/16 v0, 0x190

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->errorsBeginAt:I

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x3

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 86
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    if-nez v9, :cond_0

    .line 87
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "No url specified in http condition"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 89
    :cond_0
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Checking for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v11}, Lorg/apache/tools/ant/taskdefs/condition/Http;->log(Ljava/lang/String;I)V

    .line 91
    :try_start_0
    new-instance v6, Ljava/net/URL;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    invoke-direct {v6, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 93
    .local v6, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 94
    .local v2, "conn":Ljava/net/URLConnection;
    instance-of v9, v2, Ljava/net/HttpURLConnection;

    if-eqz v9, :cond_1

    .line 95
    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v4, v0

    .line 96
    .local v4, "http":Ljava/net/HttpURLConnection;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->requestMethod:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 98
    .local v1, "code":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Result code for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " was "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/condition/Http;->log(Ljava/lang/String;I)V

    .line 100
    if-lez v1, :cond_2

    iget v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->errorsBeginAt:I
    :try_end_1
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    if-ge v1, v9, :cond_2

    .line 114
    .end local v1    # "code":I
    .end local v2    # "conn":Ljava/net/URLConnection;
    .end local v4    # "http":Ljava/net/HttpURLConnection;
    :cond_1
    :goto_0
    return v7

    .restart local v1    # "code":I
    .restart local v2    # "conn":Ljava/net/URLConnection;
    .restart local v4    # "http":Ljava/net/HttpURLConnection;
    :cond_2
    move v7, v8

    .line 103
    goto :goto_0

    .line 105
    .end local v1    # "code":I
    .end local v2    # "conn":Ljava/net/URLConnection;
    .end local v4    # "http":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v5

    .line 106
    .local v5, "pe":Ljava/net/ProtocolException;
    :try_start_2
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Invalid HTTP protocol: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->requestMethod:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 111
    .end local v5    # "pe":Ljava/net/ProtocolException;
    .end local v6    # "url":Ljava/net/URL;
    :catch_1
    move-exception v3

    .line 112
    .local v3, "e":Ljava/net/MalformedURLException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Badly formed URL: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 108
    .end local v3    # "e":Ljava/net/MalformedURLException;
    .restart local v6    # "url":Ljava/net/URL;
    :catch_2
    move-exception v3

    .local v3, "e":Ljava/io/IOException;
    move v7, v8

    .line 109
    goto :goto_0
.end method

.method public setErrorsBeginAt(I)V
    .locals 0
    .param p1, "errorsBeginAt"    # I

    .prologue
    .line 61
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->errorsBeginAt:I

    .line 62
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 77
    if-nez p1, :cond_0

    const-string/jumbo v0, "GET"

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->requestMethod:Ljava/lang/String;

    .line 79
    return-void

    .line 77
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Http;->spec:Ljava/lang/String;

    .line 51
    return-void
.end method
