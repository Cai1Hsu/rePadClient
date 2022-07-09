.class public Lorg/apache/tools/ant/types/selectors/DateSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "DateSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/selectors/DateSelector$TimeComparisons;
    }
.end annotation


# static fields
.field public static final CHECKDIRS_KEY:Ljava/lang/String; = "checkdirs"

.field public static final DATETIME_KEY:Ljava/lang/String; = "datetime"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final GRANULARITY_KEY:Ljava/lang/String; = "granularity"

.field public static final MILLIS_KEY:Ljava/lang/String; = "millis"

.field public static final PATTERN_KEY:Ljava/lang/String; = "pattern"

.field public static final WHEN_KEY:Ljava/lang/String; = "when"


# instance fields
.field private dateTime:Ljava/lang/String;

.field private granularity:J

.field private includeDirs:Z

.field private millis:J

.field private pattern:Ljava/lang/String;

.field private when:Lorg/apache/tools/ant/types/TimeComparison;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/DateSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 42
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->includeDirs:Z

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->granularity:J

    .line 47
    sget-object v0, Lorg/apache/tools/ant/types/TimeComparison;->EQUAL:Lorg/apache/tools/ant/types/TimeComparison;

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->when:Lorg/apache/tools/ant/types/TimeComparison;

    .line 67
    sget-object v0, Lorg/apache/tools/ant/types/selectors/DateSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->granularity:J

    .line 68
    return-void
.end method


# virtual methods
.method public getMillis()J
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/DateSelector;->validate()V

    .line 104
    :cond_0
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    return-wide v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 8
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/DateSelector;->validate()V

    .line 247
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->includeDirs:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->when:Lorg/apache/tools/ant/types/TimeComparison;

    invoke-virtual {p3}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    iget-wide v4, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    iget-wide v6, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->granularity:J

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/types/TimeComparison;->evaluate(JJJ)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCheckdirs(Z)V
    .locals 0
    .param p1, "includeDirs"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->includeDirs:Z

    .line 125
    return-void
.end method

.method public setDatetime(Ljava/lang/String;)V
    .locals 2
    .param p1, "dateTime"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    .line 115
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    .line 116
    return-void
.end method

.method public setGranularity(I)V
    .locals 2
    .param p1, "granularity"    # I

    .prologue
    .line 133
    int-to-long v0, p1

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->granularity:J

    .line 134
    return-void
.end method

.method public setMillis(J)V
    .locals 1
    .param p1, "millis"    # J

    .prologue
    .line 93
    iput-wide p1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    .line 94
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 6
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 170
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 171
    if-eqz p1, :cond_6

    .line 172
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_6

    .line 173
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v2

    .line 174
    .local v2, "paramname":Ljava/lang/String;
    const-string/jumbo v3, "millis"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 176
    :try_start_0
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setMillis(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :catch_0
    move-exception v1

    .line 178
    .local v1, "nfe":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid millisecond setting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 181
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :cond_0
    const-string/jumbo v3, "datetime"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 182
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setDatetime(Ljava/lang/String;)V

    goto :goto_1

    .line 183
    :cond_1
    const-string/jumbo v3, "checkdirs"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 184
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setCheckdirs(Z)V

    goto :goto_1

    .line 185
    :cond_2
    const-string/jumbo v3, "granularity"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 187
    :try_start_1
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setGranularity(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 188
    :catch_1
    move-exception v1

    .line 189
    .restart local v1    # "nfe":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid granularity setting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 192
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :cond_3
    const-string/jumbo v3, "when"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 193
    new-instance v3, Lorg/apache/tools/ant/types/TimeComparison;

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/types/TimeComparison;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V

    goto/16 :goto_1

    .line 194
    :cond_4
    const-string/jumbo v3, "pattern"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 195
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setPattern(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 197
    :cond_5
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 201
    .end local v0    # "i":I
    .end local v2    # "paramname":Ljava/lang/String;
    :cond_6
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V
    .locals 0
    .param p1, "t"    # Lorg/apache/tools/ant/types/TimeComparison;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->when:Lorg/apache/tools/ant/types/TimeComparison;

    .line 152
    return-void
.end method

.method public setWhen(Lorg/apache/tools/ant/types/selectors/DateSelector$TimeComparisons;)V
    .locals 0
    .param p1, "tcmp"    # Lorg/apache/tools/ant/types/selectors/DateSelector$TimeComparisons;

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V

    .line 144
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{dateselector date: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    const-string/jumbo v1, " compare: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->when:Lorg/apache/tools/ant/types/TimeComparison;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/TimeComparison;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    const-string/jumbo v1, " granularity: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 78
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->granularity:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 79
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 80
    const-string/jumbo v1, " pattern: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    :cond_0
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const-wide/16 v4, 0x0

    .line 208
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    if-nez v2, :cond_1

    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 209
    const-string/jumbo v2, "You must provide a datetime or the number of milliseconds."

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 211
    :cond_1
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 213
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    if-nez v2, :cond_2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v6, v6, v2}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    .line 219
    .local v0, "df":Ljava/text/DateFormat;
    :goto_1
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setMillis(J)V

    .line 220
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->millis:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 221
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Date of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

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

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 225
    :catch_0
    move-exception v1

    .line 226
    .local v1, "pe":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Date of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->dateTime:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " Cannot be parsed correctly. It should be in"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    if-nez v2, :cond_3

    const-string/jumbo v2, " MM/DD/YYYY HH:MM AM_PM"

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " format."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/DateSelector;->setError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 213
    .end local v0    # "df":Ljava/text/DateFormat;
    .end local v1    # "pe":Ljava/text/ParseException;
    :cond_2
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    goto :goto_1

    .line 226
    .restart local v0    # "df":Ljava/text/DateFormat;
    .restart local v1    # "pe":Ljava/text/ParseException;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/DateSelector;->pattern:Ljava/lang/String;

    goto :goto_2
.end method
