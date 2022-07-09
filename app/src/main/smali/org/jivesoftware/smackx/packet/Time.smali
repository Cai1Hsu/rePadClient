.class public Lorg/jivesoftware/smackx/packet/Time;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Time.java"


# static fields
.field private static displayFormat:Ljava/text/DateFormat;

.field private static utcFormat:Ljava/text/SimpleDateFormat;


# instance fields
.field private display:Ljava/lang/String;

.field private tz:Ljava/lang/String;

.field private utc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/packet/Time;->utcFormat:Ljava/text/SimpleDateFormat;

    .line 66
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/packet/Time;->displayFormat:Ljava/text/DateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 75
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 68
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    .line 69
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    .line 70
    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .locals 8
    .param p1, "cal"    # Ljava/util/Calendar;

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 68
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    .line 69
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    .line 70
    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    .line 87
    .local v0, "timeZone":Ljava/util/TimeZone;
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    .line 88
    sget-object v1, Lorg/jivesoftware/smackx/packet/Time;->displayFormat:Ljava/text/DateFormat;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    .line 90
    sget-object v1, Lorg/jivesoftware/smackx/packet/Time;->utcFormat:Ljava/text/SimpleDateFormat;

    new-instance v2, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v3

    int-to-long v6, v3

    sub-long/2addr v4, v6

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    .line 92
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<query xmlns=\"jabber:iq:time\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 187
    const-string/jumbo v1, "<utc>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</utc>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 190
    const-string/jumbo v1, "<tz>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</tz>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 193
    const-string/jumbo v1, "<display>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</display>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    :cond_2
    const-string/jumbo v1, "</query>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDisplay()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/util/Date;
    .locals 10

    .prologue
    .line 100
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 101
    const/4 v1, 0x0

    .line 114
    :goto_0
    return-object v1

    .line 103
    :cond_0
    const/4 v1, 0x0

    .line 105
    .local v1, "date":Ljava/util/Date;
    :try_start_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 107
    .local v0, "cal":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    sget-object v4, Lorg/jivesoftware/smackx/packet/Time;->utcFormat:Ljava/text/SimpleDateFormat;

    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 109
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 111
    .end local v0    # "cal":Ljava/util/Calendar;
    :catch_0
    move-exception v2

    .line 112
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getTz()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    return-object v0
.end method

.method public getUtc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplay(Ljava/lang/String;)V
    .locals 0
    .param p1, "display"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Time;->display:Ljava/lang/String;

    .line 181
    return-void
.end method

.method public setTime(Ljava/util/Date;)V
    .locals 8
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 124
    sget-object v0, Lorg/jivesoftware/smackx/packet/Time;->utcFormat:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v4

    int-to-long v4, v4

    sub-long/2addr v2, v4

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setTz(Ljava/lang/String;)V
    .locals 0
    .param p1, "tz"    # Ljava/lang/String;

    .prologue
    .line 162
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Time;->tz:Ljava/lang/String;

    .line 163
    return-void
.end method

.method public setUtc(Ljava/lang/String;)V
    .locals 0
    .param p1, "utc"    # Ljava/lang/String;

    .prologue
    .line 143
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/Time;->utc:Ljava/lang/String;

    .line 145
    return-void
.end method
