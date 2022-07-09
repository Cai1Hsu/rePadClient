.class public Lorg/jivesoftware/smack/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;
    }
.end annotation


# static fields
.field private static final AMP_ENCODE:[C

.field private static final APOS_ENCODE:[C

.field private static final GT_ENCODE:[C

.field private static final LT_ENCODE:[C

.field private static final QUOTE_ENCODE:[C

.field public static final XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

.field private static final couplings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;",
            ">;"
        }
    .end annotation
.end field

.field private static final dateFormatter:Ljava/text/DateFormat;

.field private static final datePattern:Ljava/util/regex/Pattern;

.field private static final dateTimeFormatter:Ljava/text/DateFormat;

.field private static final dateTimeNoMillisFormatter:Ljava/text/DateFormat;

.field private static final dateTimeNoMillisPattern:Ljava/util/regex/Pattern;

.field private static final dateTimePattern:Ljava/util/regex/Pattern;

.field private static digest:Ljava/security/MessageDigest;

.field private static numbersAndLetters:[C

.field private static randGen:Ljava/util/Random;

.field private static final timeFormatter:Ljava/text/DateFormat;

.field private static final timeNoMillisFormatter:Ljava/text/DateFormat;

.field private static final timeNoMillisNoZoneFormatter:Ljava/text/DateFormat;

.field private static final timeNoMillisNoZonePattern:Ljava/util/regex/Pattern;

.field private static final timeNoMillisPattern:Ljava/util/regex/Pattern;

.field private static final timeNoZoneFormatter:Ljava/text/DateFormat;

.field private static final timeNoZonePattern:Ljava/util/regex/Pattern;

.field private static final timePattern:Ljava/util/regex/Pattern;

.field private static final xep0091Date6DigitFormatter:Ljava/text/DateFormat;

.field private static final xep0091Date7Digit1MonthFormatter:Ljava/text/DateFormat;

.field private static final xep0091Date7Digit2MonthFormatter:Ljava/text/DateFormat;

.field private static final xep0091Formatter:Ljava/text/DateFormat;

.field private static final xep0091Pattern:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x1

    .line 54
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    .line 59
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_DATE_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateFormatter:Ljava/text/DateFormat;

    .line 60
    const-string/jumbo v1, "^\\d+-\\d+-\\d+$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->datePattern:Ljava/util/regex/Pattern;

    .line 62
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_TIME_MILLIS_ZONE_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeFormatter:Ljava/text/DateFormat;

    .line 63
    const-string/jumbo v1, "^(\\d+:){2}\\d+.\\d+(Z|([+-](\\d+:\\d+)))$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timePattern:Ljava/util/regex/Pattern;

    .line 64
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_TIME_MILLIS_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoZoneFormatter:Ljava/text/DateFormat;

    .line 65
    const-string/jumbo v1, "^(\\d+:){2}\\d+.\\d+$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoZonePattern:Ljava/util/regex/Pattern;

    .line 67
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_TIME_ZONE_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisFormatter:Ljava/text/DateFormat;

    .line 68
    const-string/jumbo v1, "^(\\d+:){2}\\d+(Z|([+-](\\d+:\\d+)))$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisPattern:Ljava/util/regex/Pattern;

    .line 69
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_TIME_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisNoZoneFormatter:Ljava/text/DateFormat;

    .line 70
    const-string/jumbo v1, "^(\\d+:){2}\\d+$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisNoZonePattern:Ljava/util/regex/Pattern;

    .line 72
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_DATETIME_MILLIS_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeFormatter:Ljava/text/DateFormat;

    .line 73
    const-string/jumbo v1, "^\\d+(-\\d+){2}+T(\\d+:){2}\\d+.\\d+(Z|([+-](\\d+:\\d+)))?$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimePattern:Ljava/util/regex/Pattern;

    .line 74
    sget-object v1, Lorg/jivesoftware/smack/util/DateFormatType;->XEP_0082_DATETIME_PROFILE:Lorg/jivesoftware/smack/util/DateFormatType;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/DateFormatType;->createFormatter()Ljava/text/SimpleDateFormat;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisFormatter:Ljava/text/DateFormat;

    .line 75
    const-string/jumbo v1, "^\\d+(-\\d+){2}+T(\\d+:){2}\\d+(Z|([+-](\\d+:\\d+)))?$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisPattern:Ljava/util/regex/Pattern;

    .line 77
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Formatter:Ljava/text/DateFormat;

    .line 78
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyyMd\'T\'HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date6DigitFormatter:Ljava/text/DateFormat;

    .line 79
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyyMdd\'T\'HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit1MonthFormatter:Ljava/text/DateFormat;

    .line 80
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyyMMd\'T\'HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit2MonthFormatter:Ljava/text/DateFormat;

    .line 81
    const-string/jumbo v1, "^\\d+T\\d+:\\d+:\\d+$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Pattern:Ljava/util/regex/Pattern;

    .line 83
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    .line 86
    const-string/jumbo v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 87
    .local v0, "utc":Ljava/util/TimeZone;
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 88
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 89
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 90
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoZoneFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 91
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 92
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisNoZoneFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 93
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 94
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 96
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Formatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 97
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date6DigitFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 98
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit1MonthFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 99
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit1MonthFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v3}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 100
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit2MonthFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 101
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit2MonthFormatter:Ljava/text/DateFormat;

    invoke-virtual {v1, v3}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 103
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->datePattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->dateFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->dateTimePattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;Z)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisPattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;Z)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->timePattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->timeFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;Z)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->timeNoZonePattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->timeNoZoneFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisPattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;Z)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    new-instance v2, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisNoZonePattern:Ljava/util/regex/Pattern;

    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->timeNoMillisNoZoneFormatter:Ljava/text/DateFormat;

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;-><init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    const-string/jumbo v1, "&quot;"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    .line 113
    const-string/jumbo v1, "&apos;"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->APOS_ENCODE:[C

    .line 114
    const-string/jumbo v1, "&amp;"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    .line 115
    const-string/jumbo v1, "&lt;"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    .line 116
    const-string/jumbo v1, "&gt;"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    .line 598
    const/4 v1, 0x0

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    .line 730
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    .line 738
    const-string/jumbo v1, "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 766
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 768
    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 4
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 716
    :try_start_0
    const-string/jumbo v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 721
    .local v0, "bytes":[B
    :goto_0
    array-length v2, v0

    invoke-static {v0, v3, v2, v3}, Lorg/jivesoftware/smack/util/Base64;->decode([BIII)[B

    move-result-object v0

    .line 722
    return-object v0

    .line 717
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v1

    .line 718
    .local v1, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .restart local v0    # "bytes":[B
    goto :goto_0
.end method

.method private static determineNearestDate(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/Calendar;
    .locals 1
    .param p0, "now"    # Ljava/util/Calendar;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Calendar;",
            "Ljava/util/List",
            "<",
            "Ljava/util/Calendar;",
            ">;)",
            "Ljava/util/Calendar;"
        }
    .end annotation

    .prologue
    .line 243
    .local p1, "dates":Ljava/util/List;, "Ljava/util/List<Ljava/util/Calendar;>;"
    new-instance v0, Lorg/jivesoftware/smack/util/StringUtils$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/StringUtils$1;-><init>(Ljava/util/Calendar;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 253
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public static encodeBase64(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 662
    const/4 v0, 0x0

    .line 664
    .local v0, "bytes":[B
    :try_start_0
    const-string/jumbo v2, "ISO-8859-1"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 669
    :goto_0
    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 666
    :catch_0
    move-exception v1

    .line 667
    .local v1, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .locals 1
    .param p0, "data"    # [B

    .prologue
    .line 679
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BIIZ)Ljava/lang/String;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "lineBreaks"    # Z

    .prologue
    .line 703
    if-eqz p3, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public static encodeBase64([BZ)Ljava/lang/String;
    .locals 2
    .param p0, "data"    # [B
    .param p1, "lineBreaks"    # Z

    .prologue
    .line 690
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BIIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeHex([B)Ljava/lang/String;
    .locals 7
    .param p0, "bytes"    # [B

    .prologue
    const/16 v6, 0x10

    .line 643
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 645
    .local v2, "hex":Ljava/lang/StringBuilder;
    move-object v1, p0

    .local v1, "arr$":[B
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-byte v0, v1, v3

    .line 646
    .local v0, "aByte":B
    and-int/lit16 v5, v0, 0xff

    if-ge v5, v6, :cond_0

    .line 647
    const-string/jumbo v5, "0"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    :cond_0
    and-int/lit16 v5, v0, 0xff

    invoke-static {v5, v6}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 645
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 652
    .end local v0    # "aByte":B
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static escapeForXML(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3e

    .line 528
    if-nez p0, :cond_1

    .line 529
    const/4 p0, 0x0

    .line 592
    .end local p0    # "string":Ljava/lang/String;
    .local v1, "i":I
    .local v2, "input":[C
    .local v3, "last":I
    .local v4, "len":I
    .local v5, "out":Ljava/lang/StringBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 532
    .end local v1    # "i":I
    .end local v2    # "input":[C
    .end local v3    # "last":I
    .end local v4    # "len":I
    .end local v5    # "out":Ljava/lang/StringBuilder;
    .restart local p0    # "string":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 533
    .restart local v1    # "i":I
    const/4 v3, 0x0

    .line 534
    .restart local v3    # "last":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 535
    .restart local v2    # "input":[C
    array-length v4, v2

    .line 536
    .restart local v4    # "len":I
    new-instance v5, Ljava/lang/StringBuilder;

    int-to-double v6, v4

    const-wide v8, 0x3ff4cccccccccccdL    # 1.3

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 537
    .restart local v5    # "out":Ljava/lang/StringBuilder;
    :goto_1
    if-ge v1, v4, :cond_e

    .line 538
    aget-char v0, v2, v1

    .line 539
    .local v0, "ch":C
    if-le v0, v10, :cond_3

    .line 537
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 541
    :cond_3
    const/16 v6, 0x3c

    if-ne v0, v6, :cond_5

    .line 542
    if-le v1, v3, :cond_4

    .line 543
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 545
    :cond_4
    add-int/lit8 v3, v1, 0x1

    .line 546
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 548
    :cond_5
    if-ne v0, v10, :cond_7

    .line 549
    if-le v1, v3, :cond_6

    .line 550
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 552
    :cond_6
    add-int/lit8 v3, v1, 0x1

    .line 553
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 556
    :cond_7
    const/16 v6, 0x26

    if-ne v0, v6, :cond_a

    .line 557
    if-le v1, v3, :cond_8

    .line 558
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 561
    :cond_8
    add-int/lit8 v6, v1, 0x5

    if-le v4, v6, :cond_9

    add-int/lit8 v6, v1, 0x1

    aget-char v6, v2, v6

    const/16 v7, 0x23

    if-ne v6, v7, :cond_9

    add-int/lit8 v6, v1, 0x2

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_9

    add-int/lit8 v6, v1, 0x3

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_9

    add-int/lit8 v6, v1, 0x4

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_9

    add-int/lit8 v6, v1, 0x5

    aget-char v6, v2, v6

    const/16 v7, 0x3b

    if-eq v6, v7, :cond_2

    .line 567
    :cond_9
    add-int/lit8 v3, v1, 0x1

    .line 568
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 571
    :cond_a
    const/16 v6, 0x22

    if-ne v0, v6, :cond_c

    .line 572
    if-le v1, v3, :cond_b

    .line 573
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 575
    :cond_b
    add-int/lit8 v3, v1, 0x1

    .line 576
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 578
    :cond_c
    const/16 v6, 0x27

    if-ne v0, v6, :cond_2

    .line 579
    if-le v1, v3, :cond_d

    .line 580
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 582
    :cond_d
    add-int/lit8 v3, v1, 0x1

    .line 583
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->APOS_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 586
    .end local v0    # "ch":C
    :cond_e
    if-eqz v3, :cond_0

    .line 589
    if-le v1, v3, :cond_f

    .line 590
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 592
    :cond_f
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method public static escapeNode(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "node"    # Ljava/lang/String;

    .prologue
    .line 411
    if-nez p0, :cond_0

    .line 412
    const/4 v4, 0x0

    .line 437
    :goto_0
    return-object v4

    .line 414
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x8

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 415
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, "n":I
    :goto_1
    if-ge v2, v3, :cond_2

    .line 416
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 417
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_0

    .line 428
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 429
    const-string/jumbo v4, "\\20"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 418
    :sswitch_0
    const-string/jumbo v4, "\\22"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 419
    :sswitch_1
    const-string/jumbo v4, "\\26"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 420
    :sswitch_2
    const-string/jumbo v4, "\\27"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 421
    :sswitch_3
    const-string/jumbo v4, "\\2f"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 422
    :sswitch_4
    const-string/jumbo v4, "\\3a"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 423
    :sswitch_5
    const-string/jumbo v4, "\\3c"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 424
    :sswitch_6
    const-string/jumbo v4, "\\3e"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 425
    :sswitch_7
    const-string/jumbo v4, "\\40"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 426
    :sswitch_8
    const-string/jumbo v4, "\\5c"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 432
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 437
    .end local v1    # "c":C
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 417
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x26 -> :sswitch_1
        0x27 -> :sswitch_2
        0x2f -> :sswitch_3
        0x3a -> :sswitch_4
        0x3c -> :sswitch_5
        0x3e -> :sswitch_6
        0x40 -> :sswitch_7
        0x5c -> :sswitch_8
    .end sparse-switch
.end method

.method private static varargs filterDatesBefore(Ljava/util/Calendar;[Ljava/util/Calendar;)Ljava/util/List;
    .locals 6
    .param p0, "now"    # Ljava/util/Calendar;
    .param p1, "dates"    # [Ljava/util/Calendar;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Calendar;",
            "[",
            "Ljava/util/Calendar;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 230
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Ljava/util/Calendar;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/util/Calendar;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 233
    .local v1, "calendar":Ljava/util/Calendar;
    if-eqz v1, :cond_0

    invoke-virtual {v1, p0}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 234
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 238
    .end local v1    # "calendar":Ljava/util/Calendar;
    :cond_1
    return-object v4
.end method

.method public static formatDate(Ljava/util/Date;Lorg/jivesoftware/smack/util/DateFormatType;)Ljava/lang/String;
    .locals 1
    .param p0, "toFormat"    # Ljava/util/Date;
    .param p1, "type"    # Lorg/jivesoftware/smack/util/DateFormatType;

    .prologue
    .line 270
    const/4 v0, 0x0

    return-object v0
.end method

.method public static formatXEP0082Date(Ljava/util/Date;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 263
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeFormatter:Ljava/text/DateFormat;

    monitor-enter v1

    .line 264
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeFormatter:Ljava/text/DateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 265
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static handleDateWithMissingLeadingZeros(Ljava/lang/String;I)Ljava/util/Date;
    .locals 6
    .param p0, "stampString"    # Ljava/lang/String;
    .param p1, "dateLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 199
    const/4 v4, 0x6

    if-ne p1, v4, :cond_0

    .line 200
    sget-object v5, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date6DigitFormatter:Ljava/text/DateFormat;

    monitor-enter v5

    .line 201
    :try_start_0
    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date6DigitFormatter:Ljava/text/DateFormat;

    invoke-virtual {v4, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    monitor-exit v5

    .line 214
    :goto_0
    return-object v4

    .line 202
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 204
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 206
    .local v1, "now":Ljava/util/Calendar;
    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit1MonthFormatter:Ljava/text/DateFormat;

    invoke-static {p0, v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseXEP91Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;

    move-result-object v2

    .line 207
    .local v2, "oneDigitMonth":Ljava/util/Calendar;
    sget-object v4, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Date7Digit2MonthFormatter:Ljava/text/DateFormat;

    invoke-static {p0, v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseXEP91Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;

    move-result-object v3

    .line 209
    .local v3, "twoDigitMonth":Ljava/util/Calendar;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/util/Calendar;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v3, v4, v5

    invoke-static {v1, v4}, Lorg/jivesoftware/smack/util/StringUtils;->filterDatesBefore(Ljava/util/Calendar;[Ljava/util/Calendar;)Ljava/util/List;

    move-result-object v0

    .line 211
    .local v0, "dates":Ljava/util/List;, "Ljava/util/List<Ljava/util/Calendar;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 212
    invoke-static {v1, v0}, Lorg/jivesoftware/smack/util/StringUtils;->determineNearestDate(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    goto :goto_0

    .line 214
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 617
    const-class v3, Lorg/jivesoftware/smack/util/StringUtils;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 619
    :try_start_1
    const-string/jumbo v2, "SHA-1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    sput-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 628
    :cond_0
    :goto_0
    :try_start_2
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    const-string/jumbo v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 633
    :goto_1
    :try_start_3
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->encodeHex([B)Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v2

    monitor-exit v3

    return-object v2

    .line 621
    :catch_0
    move-exception v1

    .line 622
    .local v1, "nsae":Ljava/security/NoSuchAlgorithmException;
    :try_start_4
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v4, "Failed to load the SHA-1 MessageDigest. Jive will be unable to function normally."

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 617
    .end local v1    # "nsae":Ljava/security/NoSuchAlgorithmException;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 630
    :catch_1
    move-exception v0

    .line 631
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_5
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public static isFullJID(Ljava/lang/String;)Z
    .locals 1
    .param p0, "jid"    # Ljava/lang/String;

    .prologue
    .line 372
    invoke-static {p0}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {p0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {p0}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    .line 374
    :cond_0
    const/4 v0, 0x0

    .line 376
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static parseBareAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 350
    if-nez p0, :cond_1

    .line 351
    const/4 p0, 0x0

    .line 361
    .end local p0    # "XMPPAddress":Ljava/lang/String;
    .local v0, "slashIndex":I
    :cond_0
    :goto_0
    return-object p0

    .line 353
    .end local v0    # "slashIndex":I
    .restart local p0    # "XMPPAddress":Ljava/lang/String;
    :cond_1
    const-string/jumbo v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 354
    .restart local v0    # "slashIndex":I
    if-ltz v0, :cond_0

    .line 357
    if-nez v0, :cond_2

    .line 358
    const-string/jumbo p0, ""

    goto :goto_0

    .line 361
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 7
    .param p0, "dateString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 141
    sget-object v5, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 147
    .local v4, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 148
    const-string/jumbo v5, "T"

    invoke-virtual {p0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 150
    .local v3, "length":I
    const/16 v5, 0x8

    if-ge v3, v5, :cond_0

    .line 151
    invoke-static {p0, v3}, Lorg/jivesoftware/smack/util/StringUtils;->handleDateWithMissingLeadingZeros(Ljava/lang/String;I)Ljava/util/Date;

    move-result-object v1

    .line 153
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_4

    .line 184
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "length":I
    :goto_0
    return-object v1

    .line 157
    .restart local v3    # "length":I
    :cond_0
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Formatter:Ljava/text/DateFormat;

    monitor-enter v6

    .line 158
    :try_start_0
    sget-object v5, Lorg/jivesoftware/smack/util/StringUtils;->xep0091Formatter:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    monitor-exit v6

    goto :goto_0

    .line 159
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 163
    .end local v3    # "length":I
    :cond_1
    sget-object v5, Lorg/jivesoftware/smack/util/StringUtils;->couplings:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;

    .line 164
    .local v0, "coupling":Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;
    iget-object v5, v0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 166
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 168
    iget-boolean v5, v0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->needToConvertTimeZone:Z

    if-eqz v5, :cond_3

    .line 169
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->convertTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 172
    :cond_3
    iget-object v6, v0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->formatter:Ljava/text/DateFormat;

    monitor-enter v6

    .line 173
    :try_start_1
    iget-object v5, v0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->formatter:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    monitor-exit v6

    goto :goto_0

    .line 174
    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v5

    .line 183
    .end local v0    # "coupling":Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_4
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisFormatter:Ljava/text/DateFormat;

    monitor-enter v6

    .line 184
    :try_start_2
    sget-object v5, Lorg/jivesoftware/smack/util/StringUtils;->dateTimeNoMillisFormatter:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    monitor-exit v6

    goto :goto_0

    .line 185
    :catchall_2
    move-exception v5

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v5
.end method

.method public static parseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 282
    if-nez p0, :cond_0

    .line 283
    const/4 v1, 0x0

    .line 290
    :goto_0
    return-object v1

    .line 285
    :cond_0
    const-string/jumbo v1, "@"

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 286
    .local v0, "atIndex":I
    if-gtz v0, :cond_1

    .line 287
    const-string/jumbo v1, ""

    goto :goto_0

    .line 290
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseResource(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 329
    if-nez p0, :cond_0

    .line 330
    const/4 v1, 0x0

    .line 337
    :goto_0
    return-object v1

    .line 332
    :cond_0
    const-string/jumbo v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 333
    .local v0, "slashIndex":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_1

    if-gez v0, :cond_2

    .line 334
    :cond_1
    const-string/jumbo v1, ""

    goto :goto_0

    .line 337
    :cond_2
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static parseServer(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 303
    if-nez p0, :cond_0

    .line 304
    const/4 v2, 0x0

    .line 316
    :goto_0
    return-object v2

    .line 306
    :cond_0
    const-string/jumbo v2, "@"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 308
    .local v0, "atIndex":I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 309
    const-string/jumbo v2, ""

    goto :goto_0

    .line 311
    :cond_1
    const-string/jumbo v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 312
    .local v1, "slashIndex":I
    if-lez v1, :cond_2

    if-le v1, v0, :cond_2

    .line 313
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 316
    :cond_2
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static parseXEP0082Date(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p0, "dateString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 128
    invoke-static {p0}, Lorg/jivesoftware/smack/util/StringUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static parseXEP91Date(Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;
    .locals 2
    .param p0, "stampString"    # Ljava/lang/String;
    .param p1, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 219
    :try_start_0
    monitor-enter p1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :try_start_1
    invoke-virtual {p1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 221
    invoke-virtual {p1}, Ljava/text/DateFormat;->getCalendar()Ljava/util/Calendar;

    move-result-object v1

    monitor-exit p1

    .line 225
    :goto_0
    return-object v1

    .line 222
    :catchall_0
    move-exception v1

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0

    .line 224
    :catch_0
    move-exception v0

    .line 225
    .local v0, "e":Ljava/text/ParseException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static randomString(I)Ljava/lang/String;
    .locals 5
    .param p0, "length"    # I

    .prologue
    .line 755
    const/4 v2, 0x1

    if-ge p0, v2, :cond_0

    .line 756
    const/4 v2, 0x0

    .line 763
    :goto_0
    return-object v2

    .line 759
    :cond_0
    new-array v1, p0, [C

    .line 760
    .local v1, "randBuffer":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 761
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    const/16 v4, 0x47

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 760
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 763
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method public static unescapeNode(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "node"    # Ljava/lang/String;

    .prologue
    .line 472
    if-nez p0, :cond_0

    .line 473
    const/4 v7, 0x0

    .line 517
    :goto_0
    return-object v7

    .line 475
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    .line 476
    .local v6, "nodeChars":[C
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v7, v6

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 477
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    array-length v5, v6

    .local v5, "n":I
    :goto_1
    if-ge v4, v5, :cond_5

    .line 479
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 480
    .local v1, "c":C
    const/16 v7, 0x5c

    if-ne v1, v7, :cond_1

    add-int/lit8 v7, v4, 0x2

    if-ge v7, v5, :cond_1

    .line 481
    add-int/lit8 v7, v4, 0x1

    aget-char v2, v6, v7

    .line 482
    .local v2, "c2":C
    add-int/lit8 v7, v4, 0x2

    aget-char v3, v6, v7

    .line 483
    .local v3, "c3":C
    const/16 v7, 0x32

    if-ne v2, v7, :cond_2

    .line 484
    sparse-switch v3, :sswitch_data_0

    .line 514
    .end local v2    # "c2":C
    .end local v3    # "c3":C
    :cond_1
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 477
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 485
    .restart local v2    # "c2":C
    .restart local v3    # "c3":C
    :sswitch_0
    const/16 v7, 0x20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 486
    :sswitch_1
    const/16 v7, 0x22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 487
    :sswitch_2
    const/16 v7, 0x26

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 488
    :sswitch_3
    const/16 v7, 0x27

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 489
    :sswitch_4
    const/16 v7, 0x2f

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 492
    :cond_2
    const/16 v7, 0x33

    if-ne v2, v7, :cond_3

    .line 493
    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto :goto_2

    .line 494
    :pswitch_1
    const/16 v7, 0x3a

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 495
    :pswitch_2
    const/16 v7, 0x3c

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 496
    :pswitch_3
    const/16 v7, 0x3e

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_3

    .line 499
    :cond_3
    const/16 v7, 0x34

    if-ne v2, v7, :cond_4

    .line 500
    const/16 v7, 0x30

    if-ne v3, v7, :cond_1

    .line 501
    const-string/jumbo v7, "@"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    add-int/lit8 v4, v4, 0x2

    .line 503
    goto :goto_3

    .line 506
    :cond_4
    const/16 v7, 0x35

    if-ne v2, v7, :cond_1

    .line 507
    const/16 v7, 0x63

    if-ne v3, v7, :cond_1

    .line 508
    const-string/jumbo v7, "\\"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    add-int/lit8 v4, v4, 0x2

    .line 510
    goto :goto_3

    .line 517
    .end local v1    # "c":C
    .end local v2    # "c2":C
    .end local v3    # "c3":C
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0

    .line 484
    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x32 -> :sswitch_1
        0x36 -> :sswitch_2
        0x37 -> :sswitch_3
        0x66 -> :sswitch_4
    .end sparse-switch

    .line 493
    :pswitch_data_0
    .packed-switch 0x61
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
