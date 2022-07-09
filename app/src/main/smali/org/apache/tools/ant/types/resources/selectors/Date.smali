.class public Lorg/apache/tools/ant/types/resources/selectors/Date;
.super Ljava/lang/Object;
.source "Date.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final MILLIS_OR_DATETIME:Ljava/lang/String; = "Either the millis or the datetime attribute must be set."


# instance fields
.field private dateTime:Ljava/lang/String;

.field private granularity:J

.field private millis:Ljava/lang/Long;

.field private pattern:Ljava/lang/String;

.field private when:Lorg/apache/tools/ant/types/TimeComparison;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/selectors/Date;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;

    .line 44
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;

    .line 46
    sget-object v0, Lorg/apache/tools/ant/types/TimeComparison;->EQUAL:Lorg/apache/tools/ant/types/TimeComparison;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->when:Lorg/apache/tools/ant/types/TimeComparison;

    .line 47
    sget-object v0, Lorg/apache/tools/ant/types/resources/selectors/Date;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->granularity:J

    return-void
.end method


# virtual methods
.method public declared-synchronized getDatetime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getGranularity()J
    .locals 2

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->granularity:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMillis()J
    .locals 2

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getWhen()Lorg/apache/tools/ant/types/TimeComparison;
    .locals 1

    .prologue
    .line 127
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->when:Lorg/apache/tools/ant/types/TimeComparison;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 11
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 136
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;

    if-nez v1, :cond_0

    .line 137
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Either the millis or the datetime attribute must be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 139
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;

    if-nez v1, :cond_3

    .line 140
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;

    if-nez v1, :cond_1

    const/4 v1, 0x3

    const/4 v2, 0x3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1, v2, v3}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 145
    .local v0, "df":Ljava/text/DateFormat;
    :goto_0
    :try_start_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 146
    .local v8, "m":J
    const-wide/16 v2, 0x0

    cmp-long v1, v8, v2

    if-gez v1, :cond_2

    .line 147
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Date of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " results in negative milliseconds value"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " relative to epoch (January 1, 1970, 00:00:00 GMT)."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    .end local v8    # "m":J
    :catch_0
    move-exception v10

    .line 153
    .local v10, "pe":Ljava/text/ParseException;
    :try_start_3
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Date of "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v3, " Cannot be parsed correctly. It should be in"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;

    if-nez v1, :cond_4

    const-string/jumbo v1, " MM/DD/YYYY HH:MM AM_PM"

    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v3, " format."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 140
    .end local v0    # "df":Ljava/text/DateFormat;
    .end local v10    # "pe":Ljava/text/ParseException;
    :cond_1
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 151
    .restart local v0    # "df":Ljava/text/DateFormat;
    .restart local v8    # "m":J
    :cond_2
    :try_start_4
    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setMillis(J)V
    :try_end_4
    .catch Ljava/text/ParseException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 159
    .end local v0    # "df":Ljava/text/DateFormat;
    .end local v8    # "m":J
    :cond_3
    :try_start_5
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->when:Lorg/apache/tools/ant/types/TimeComparison;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-wide v6, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->granularity:J

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/types/TimeComparison;->evaluate(JJJ)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v1

    monitor-exit p0

    return v1

    .line 153
    .restart local v0    # "df":Ljava/text/DateFormat;
    .restart local v10    # "pe":Ljava/text/ParseException;
    :cond_4
    :try_start_6
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized setDateTime(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 70
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->dateTime:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    .line 70
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setGranularity(J)V
    .locals 1
    .param p1, "g"    # J

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->granularity:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMillis(J)V
    .locals 1
    .param p1, "m"    # J

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->millis:Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPattern(Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 103
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->pattern:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit p0

    return-void

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/TimeComparison;

    .prologue
    .line 119
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Date;->when:Lorg/apache/tools/ant/types/TimeComparison;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    monitor-exit p0

    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
