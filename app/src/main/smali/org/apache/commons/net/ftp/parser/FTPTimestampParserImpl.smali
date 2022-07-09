.class public Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;
.super Ljava/lang/Object;
.source "FTPTimestampParserImpl.java"

# interfaces
.implements Lorg/apache/commons/net/ftp/parser/FTPTimestampParser;
.implements Lorg/apache/commons/net/ftp/Configurable;


# instance fields
.field private defaultDateFormat:Ljava/text/SimpleDateFormat;

.field private lenientFutureDates:Z

.field private recentDateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->lenientFutureDates:Z

    .line 53
    const-string/jumbo v0, "MMM d yyyy"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->setDefaultDateFormat(Ljava/lang/String;)V

    .line 54
    const-string/jumbo v0, "MMM d HH:mm"

    invoke-direct {p0, v0}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->setRecentDateFormat(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method private setDefaultDateFormat(Ljava/lang/String;)V
    .locals 2
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 175
    if-eqz p1, :cond_0

    .line 176
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    .line 177
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 179
    :cond_0
    return-void
.end method

.method private setRecentDateFormat(Ljava/lang/String;)V
    .locals 2
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 196
    if-eqz p1, :cond_0

    .line 197
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    .line 198
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 200
    :cond_0
    return-void
.end method

.method private setServerTimeZone(Ljava/lang/String;)V
    .locals 2
    .param p1, "serverTimeZoneId"    # Ljava/lang/String;

    .prologue
    .line 224
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 225
    .local v0, "serverTimeZone":Ljava/util/TimeZone;
    if-eqz p1, :cond_0

    .line 226
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 228
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 229
    iget-object v1, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    if-eqz v1, :cond_1

    .line 230
    iget-object v1, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 232
    :cond_1
    return-void
.end method


# virtual methods
.method public configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V
    .locals 7
    .param p1, "config"    # Lorg/apache/commons/net/ftp/FTPClientConfig;

    .prologue
    const/4 v6, 0x0

    .line 257
    const/4 v1, 0x0

    .line 259
    .local v1, "dfs":Ljava/text/DateFormatSymbols;
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getServerLanguageCode()Ljava/lang/String;

    move-result-object v2

    .line 260
    .local v2, "languageCode":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getShortMonthNames()Ljava/lang/String;

    move-result-object v4

    .line 261
    .local v4, "shortmonths":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 262
    invoke-static {v4}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getDateFormatSymbols(Ljava/lang/String;)Ljava/text/DateFormatSymbols;

    move-result-object v1

    .line 270
    :goto_0
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getRecentDateFormatStr()Ljava/lang/String;

    move-result-object v3

    .line 271
    .local v3, "recentFormatString":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 272
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    .line 278
    :goto_1
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getDefaultDateFormatStr()Ljava/lang/String;

    move-result-object v0

    .line 279
    .local v0, "defaultFormatString":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 280
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "defaultFormatString cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 263
    .end local v0    # "defaultFormatString":Ljava/lang/String;
    .end local v3    # "recentFormatString":Ljava/lang/String;
    :cond_0
    if-eqz v2, :cond_1

    .line 264
    invoke-static {v2}, Lorg/apache/commons/net/ftp/FTPClientConfig;->lookupDateFormatSymbols(Ljava/lang/String;)Ljava/text/DateFormatSymbols;

    move-result-object v1

    goto :goto_0

    .line 266
    :cond_1
    const-string/jumbo v5, "en"

    invoke-static {v5}, Lorg/apache/commons/net/ftp/FTPClientConfig;->lookupDateFormatSymbols(Ljava/lang/String;)Ljava/text/DateFormatSymbols;

    move-result-object v1

    goto :goto_0

    .line 274
    .restart local v3    # "recentFormatString":Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/text/SimpleDateFormat;

    invoke-direct {v5, v3, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    iput-object v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    .line 275
    iget-object v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    goto :goto_1

    .line 282
    .restart local v0    # "defaultFormatString":Ljava/lang/String;
    :cond_3
    new-instance v5, Ljava/text/SimpleDateFormat;

    invoke-direct {v5, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    iput-object v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    .line 283
    iget-object v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 285
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->getServerTimeZoneId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->setServerTimeZone(Ljava/lang/String;)V

    .line 287
    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->isLenientFutureDates()Z

    move-result v5

    iput-boolean v5, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->lenientFutureDates:Z

    .line 288
    return-void
.end method

.method public getDefaultDateFormat()Ljava/text/SimpleDateFormat;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method public getDefaultDateFormatString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRecentDateFormat()Ljava/text/SimpleDateFormat;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method public getRecentDateFormatString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerTimeZone()Ljava/util/TimeZone;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method public getShortMonths()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->getDateFormatSymbols()Ljava/text/DateFormatSymbols;

    move-result-object v0

    invoke-virtual {v0}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method isLenientFutureDates()Z
    .locals 1

    .prologue
    .line 293
    iget-boolean v0, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->lenientFutureDates:Z

    return v0
.end method

.method public parseTimestamp(Ljava/lang/String;)Ljava/util/Calendar;
    .locals 2
    .param p1, "timestampStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 76
    .local v0, "now":Ljava/util/Calendar;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->parseTimestamp(Ljava/lang/String;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v1

    return-object v1
.end method

.method public parseTimestamp(Ljava/lang/String;Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 11
    .param p1, "timestampStr"    # Ljava/lang/String;
    .param p2, "serverTime"    # Ljava/util/Calendar;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 95
    invoke-virtual {p2}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;

    .line 96
    .local v1, "now":Ljava/util/Calendar;
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->getServerTimeZone()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 97
    invoke-virtual {v1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Calendar;

    .line 98
    .local v5, "working":Ljava/util/Calendar;
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->getServerTimeZone()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 99
    new-instance v3, Ljava/text/ParsePosition;

    invoke-direct {v3, v10}, Ljava/text/ParsePosition;-><init>(I)V

    .line 101
    .local v3, "pp":Ljava/text/ParsePosition;
    const/4 v2, 0x0

    .line 102
    .local v2, "parsed":Ljava/util/Date;
    iget-object v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    if-eqz v7, :cond_1

    .line 103
    iget-boolean v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->lenientFutureDates:Z

    if-eqz v7, :cond_0

    .line 106
    const/4 v7, 0x5

    invoke-virtual {v1, v7, v9}, Ljava/util/Calendar;->add(II)V

    .line 108
    :cond_0
    iget-object v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v7, p1, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v2

    .line 110
    :cond_1
    if-eqz v2, :cond_3

    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v7, v8, :cond_3

    .line 112
    invoke-virtual {v5, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 113
    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v5, v9, v7}, Ljava/util/Calendar;->set(II)V

    .line 115
    invoke-virtual {v5, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 116
    const/4 v7, -0x1

    invoke-virtual {v5, v9, v7}, Ljava/util/Calendar;->add(II)V

    .line 156
    :cond_2
    :goto_0
    return-object v5

    .line 124
    :cond_3
    iget-object v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    if-eqz v7, :cond_4

    .line 125
    new-instance v3, Ljava/text/ParsePosition;

    .end local v3    # "pp":Ljava/text/ParsePosition;
    invoke-direct {v3, v10}, Ljava/text/ParsePosition;-><init>(I)V

    .line 126
    .restart local v3    # "pp":Ljava/text/ParsePosition;
    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 127
    .local v6, "year":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "timeStampStrPlusYear":Ljava/lang/String;
    new-instance v0, Ljava/text/SimpleDateFormat;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v8}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " yyyy"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v8}, Ljava/text/SimpleDateFormat;->getDateFormatSymbols()Ljava/text/DateFormatSymbols;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    .line 130
    .local v0, "hackFormatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, v10}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 131
    iget-object v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->recentDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v7}, Ljava/text/SimpleDateFormat;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 132
    invoke-virtual {v0, v4, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v2

    .line 134
    .end local v0    # "hackFormatter":Ljava/text/SimpleDateFormat;
    .end local v4    # "timeStampStrPlusYear":Ljava/lang/String;
    .end local v6    # "year":I
    :cond_4
    if-eqz v2, :cond_5

    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x5

    if-ne v7, v8, :cond_5

    .line 135
    invoke-virtual {v5, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    goto :goto_0

    .line 138
    :cond_5
    new-instance v3, Ljava/text/ParsePosition;

    .end local v3    # "pp":Ljava/text/ParsePosition;
    invoke-direct {v3, v10}, Ljava/text/ParsePosition;-><init>(I)V

    .line 139
    .restart local v3    # "pp":Ljava/text/ParsePosition;
    iget-object v7, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->defaultDateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v7, p1, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v2

    .line 147
    if-eqz v2, :cond_6

    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v7, v8, :cond_6

    .line 148
    invoke-virtual {v5, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 150
    :cond_6
    new-instance v7, Ljava/text/ParseException;

    const-string/jumbo v8, "Timestamp could not be parsed with older or recent DateFormat"

    invoke-virtual {v3}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v9

    invoke-direct {v7, v8, v9}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v7
.end method

.method setLenientFutureDates(Z)V
    .locals 0
    .param p1, "lenientFutureDates"    # Z

    .prologue
    .line 299
    iput-boolean p1, p0, Lorg/apache/commons/net/ftp/parser/FTPTimestampParserImpl;->lenientFutureDates:Z

    .line 300
    return-void
.end method
