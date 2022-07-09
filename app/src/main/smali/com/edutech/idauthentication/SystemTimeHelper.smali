.class public Lcom/edutech/idauthentication/SystemTimeHelper;
.super Ljava/lang/Object;
.source "SystemTimeHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compareTime(Ljava/lang/String;Ljava/lang/String;)J
    .locals 14
    .param p0, "begin"    # Ljava/lang/String;
    .param p1, "end"    # Ljava/lang/String;

    .prologue
    const-wide/16 v8, 0x0

    .line 31
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v10, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v2, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 34
    .local v2, "dateFormate":Ljava/text/SimpleDateFormat;
    const-wide/16 v6, 0x0

    .line 37
    .local v6, "seconds":J
    :try_start_0
    invoke-virtual {v2, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 38
    .local v0, "date1":Ljava/util/Date;
    invoke-virtual {v2, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 40
    .local v1, "date2":Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    sub-long v4, v10, v12

    .line 43
    .local v4, "diff":J
    const-wide/16 v10, 0x3e8

    div-long v6, v4, v10
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    cmp-long v10, v6, v8

    if-gez v10, :cond_0

    .line 56
    .end local v0    # "date1":Ljava/util/Date;
    .end local v1    # "date2":Ljava/util/Date;
    .end local v4    # "diff":J
    :goto_0
    return-wide v8

    .line 50
    :catch_0
    move-exception v3

    .line 52
    .local v3, "e":Ljava/text/ParseException;
    invoke-virtual {v3}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_0

    .end local v3    # "e":Ljava/text/ParseException;
    .restart local v0    # "date1":Ljava/util/Date;
    .restart local v1    # "date2":Ljava/util/Date;
    .restart local v4    # "diff":J
    :cond_0
    move-wide v8, v6

    .line 56
    goto :goto_0
.end method

.method public static getTheSystemTime()Ljava/lang/String;
    .locals 3

    .prologue
    .line 18
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 19
    .local v1, "sDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, "date":Ljava/lang/String;
    return-object v0
.end method
