.class public final Lorg/apache/tools/ant/util/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# static fields
.field public static final DATE_HEADER_FORMAT:Ljava/text/DateFormat;

.field private static final DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

.field public static final ISO8601_DATETIME_PATTERN:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss"

.field public static final ISO8601_DATE_PATTERN:Ljava/lang/String; = "yyyy-MM-dd"

.field public static final ISO8601_TIME_PATTERN:Ljava/lang/String; = "HH:mm:ss"

.field private static final LIMITS:[D

.field private static final MINUTES_FORMAT:Ljava/text/ChoiceFormat;

.field private static final MINUTES_PART:[Ljava/lang/String;

.field private static final MINUTE_SECONDS:Ljava/text/MessageFormat;

.field private static final ONE_HOUR:I = 0x3c

.field private static final ONE_MINUTE:I = 0x3c

.field private static final ONE_SECOND:I = 0x3e8

.field private static final SECONDS_FORMAT:Ljava/text/ChoiceFormat;

.field private static final SECONDS_PART:[Ljava/lang/String;

.field private static final TEN:I = 0xa


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 69
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "EEE, dd MMM yyyy HH:mm:ss "

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT:Ljava/text/DateFormat;

    .line 72
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "EEE, dd MMM yyyy HH:mm:ss "

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

    .line 77
    new-instance v0, Ljava/text/MessageFormat;

    const-string/jumbo v1, "{0}{1}"

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->MINUTE_SECONDS:Ljava/text/MessageFormat;

    .line 80
    new-array v0, v5, [D

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->LIMITS:[D

    .line 82
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, ""

    aput-object v1, v0, v3

    const-string/jumbo v1, "1 minute "

    aput-object v1, v0, v4

    const-string/jumbo v1, "{0,number,###############} minutes "

    aput-object v1, v0, v6

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->MINUTES_PART:[Ljava/lang/String;

    .line 84
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "0 seconds"

    aput-object v1, v0, v3

    const-string/jumbo v1, "1 second"

    aput-object v1, v0, v4

    const-string/jumbo v1, "{1,number} seconds"

    aput-object v1, v0, v6

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->SECONDS_PART:[Ljava/lang/String;

    .line 86
    new-instance v0, Ljava/text/ChoiceFormat;

    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->LIMITS:[D

    sget-object v2, Lorg/apache/tools/ant/util/DateUtils;->MINUTES_PART:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/text/ChoiceFormat;-><init>([D[Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->MINUTES_FORMAT:Ljava/text/ChoiceFormat;

    .line 89
    new-instance v0, Ljava/text/ChoiceFormat;

    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->LIMITS:[D

    sget-object v2, Lorg/apache/tools/ant/util/DateUtils;->SECONDS_PART:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/text/ChoiceFormat;-><init>([D[Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/util/DateUtils;->SECONDS_FORMAT:Ljava/text/ChoiceFormat;

    .line 93
    sget-object v0, Lorg/apache/tools/ant/util/DateUtils;->MINUTE_SECONDS:Ljava/text/MessageFormat;

    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->MINUTES_FORMAT:Ljava/text/ChoiceFormat;

    invoke-virtual {v0, v3, v1}, Ljava/text/MessageFormat;->setFormat(ILjava/text/Format;)V

    .line 94
    sget-object v0, Lorg/apache/tools/ant/util/DateUtils;->MINUTE_SECONDS:Ljava/text/MessageFormat;

    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->SECONDS_FORMAT:Ljava/text/ChoiceFormat;

    invoke-virtual {v0, v4, v1}, Ljava/text/MessageFormat;->setFormat(ILjava/text/Format;)V

    .line 95
    return-void

    .line 80
    :array_0
    .array-data 8
        0x0
        0x3ff0000000000000L    # 1.0
        0x4000000000000000L    # 2.0
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    return-void
.end method

.method private static createDateFormat(Ljava/lang/String;)Ljava/text/DateFormat;
    .locals 3
    .param p0, "pattern"    # Ljava/lang/String;

    .prologue
    .line 150
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 151
    .local v1, "sdf":Ljava/text/SimpleDateFormat;
    const-string/jumbo v2, "GMT"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 152
    .local v0, "gmt":Ljava/util/TimeZone;
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 153
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 154
    return-object v1
.end method

.method public static format(JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # J
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 109
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0, p2}, Lorg/apache/tools/ant/util/DateUtils;->format(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-static {p1}, Lorg/apache/tools/ant/util/DateUtils;->createDateFormat(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    .line 121
    .local v0, "df":Ljava/text/DateFormat;
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatElapsedTime(J)Ljava/lang/String;
    .locals 10
    .param p0, "millis"    # J

    .prologue
    const-wide/16 v8, 0x3c

    .line 138
    const-wide/16 v6, 0x3e8

    div-long v4, p0, v6

    .line 139
    .local v4, "seconds":J
    div-long v2, v4, v8

    .line 140
    .local v2, "minutes":J
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v6, Ljava/lang/Long;

    invoke-direct {v6, v2, v3}, Ljava/lang/Long;-><init>(J)V

    aput-object v6, v0, v1

    const/4 v1, 0x1

    new-instance v6, Ljava/lang/Long;

    rem-long v8, v4, v8

    invoke-direct {v6, v8, v9}, Ljava/lang/Long;-><init>(J)V

    aput-object v6, v0, v1

    .line 141
    .local v0, "args":[Ljava/lang/Object;
    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->MINUTE_SECONDS:Ljava/text/MessageFormat;

    invoke-virtual {v1, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getDateForHeader()Ljava/lang/String;
    .locals 13

    .prologue
    const/16 v12, 0xa

    .line 210
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 211
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    .line 212
    .local v0, "tz":Ljava/util/TimeZone;
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v7, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v7, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x5

    invoke-virtual {v7, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v5, 0x7

    invoke-virtual {v7, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    const/16 v6, 0xe

    invoke-virtual {v7, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual/range {v0 .. v6}, Ljava/util/TimeZone;->getOffset(IIIIII)I

    move-result v10

    .line 218
    .local v10, "offset":I
    new-instance v11, Ljava/lang/StringBuffer;

    if-gez v10, :cond_2

    const-string/jumbo v1, "-"

    :goto_0
    invoke-direct {v11, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 219
    .local v11, "tzMarker":Ljava/lang/StringBuffer;
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v10

    .line 220
    const v1, 0x36ee80

    div-int v8, v10, v1

    .line 221
    .local v8, "hours":I
    const v1, 0xea60

    div-int v1, v10, v1

    mul-int/lit8 v2, v8, 0x3c

    sub-int v9, v1, v2

    .line 222
    .local v9, "minutes":I
    if-ge v8, v12, :cond_0

    .line 223
    const-string/jumbo v1, "0"

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    :cond_0
    invoke-virtual {v11, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 226
    if-ge v9, v12, :cond_1

    .line 227
    const-string/jumbo v1, "0"

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 229
    :cond_1
    invoke-virtual {v11, v9}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 230
    sget-object v2, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

    monitor-enter v2

    .line 231
    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v3, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 218
    .end local v8    # "hours":I
    .end local v9    # "minutes":I
    .end local v11    # "tzMarker":Ljava/lang/StringBuffer;
    :cond_2
    const-string/jumbo v1, "+"

    goto :goto_0

    .line 232
    .restart local v8    # "hours":I
    .restart local v9    # "minutes":I
    .restart local v11    # "tzMarker":Ljava/lang/StringBuffer;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static getPhaseOfMoon(Ljava/util/Calendar;)I
    .locals 4
    .param p0, "cal"    # Ljava/util/Calendar;

    .prologue
    .line 193
    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 194
    .local v0, "dayOfTheYear":I
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit16 v3, v3, -0x76c

    rem-int/lit8 v3, v3, 0x13

    add-int/lit8 v2, v3, 0x1

    .line 195
    .local v2, "yearInMetonicCycle":I
    mul-int/lit8 v3, v2, 0xb

    add-int/lit8 v3, v3, 0x12

    rem-int/lit8 v1, v3, 0x1e

    .line 196
    .local v1, "epact":I
    const/16 v3, 0x19

    if-ne v1, v3, :cond_0

    const/16 v3, 0xb

    if-gt v2, v3, :cond_1

    :cond_0
    const/16 v3, 0x18

    if-ne v1, v3, :cond_2

    .line 197
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 199
    :cond_2
    add-int v3, v0, v1

    mul-int/lit8 v3, v3, 0x6

    add-int/lit8 v3, v3, 0xb

    rem-int/lit16 v3, v3, 0xb1

    div-int/lit8 v3, v3, 0x16

    and-int/lit8 v3, v3, 0x7

    return v3
.end method

.method public static parseDateFromHeader(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "datestr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 246
    sget-object v1, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

    monitor-enter v1

    .line 247
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/util/DateUtils;->DATE_HEADER_FORMAT_INT:Ljava/text/DateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 248
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static parseIso8601Date(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "datestr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 279
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseIso8601DateTime(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "datestr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 264
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static parseIso8601DateTimeOrDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "datestr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 296
    :try_start_0
    invoke-static {p0}, Lorg/apache/tools/ant/util/DateUtils;->parseIso8601DateTime(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 298
    :goto_0
    return-object v1

    .line 297
    :catch_0
    move-exception v0

    .line 298
    .local v0, "px":Ljava/text/ParseException;
    invoke-static {p0}, Lorg/apache/tools/ant/util/DateUtils;->parseIso8601Date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0
.end method
