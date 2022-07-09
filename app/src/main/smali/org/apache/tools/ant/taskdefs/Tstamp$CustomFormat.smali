.class public Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
.super Ljava/lang/Object;
.source "Tstamp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Tstamp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CustomFormat"
.end annotation


# instance fields
.field private country:Ljava/lang/String;

.field private field:I

.field private language:Ljava/lang/String;

.field private offset:I

.field private pattern:Ljava/lang/String;

.field private propertyName:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

.field private timeZone:Ljava/util/TimeZone;

.field private variant:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Tstamp;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Tstamp;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->offset:I

    .line 128
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->field:I

    .line 134
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/tools/ant/Project;Ljava/util/Date;Lorg/apache/tools/ant/Location;)V
    .locals 7
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "date"    # Ljava/util/Date;
    .param p3, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 248
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->propertyName:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 249
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "property attribute must be provided"

    invoke-direct {v2, v3, p3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 253
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->pattern:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 254
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "pattern attribute must be provided"

    invoke-direct {v2, v3, p3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 259
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->language:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 260
    new-instance v1, Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->pattern:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 269
    .local v1, "sdf":Ljava/text/SimpleDateFormat;
    :goto_0
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->offset:I

    if-eqz v2, :cond_2

    .line 270
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 271
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 272
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->field:I

    iget v3, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->offset:I

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 273
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p2

    .line 275
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->timeZone:Ljava/util/TimeZone;

    if-eqz v2, :cond_3

    .line 276
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 278
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->propertyName:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lorg/apache/tools/ant/taskdefs/Tstamp;->access$000(Lorg/apache/tools/ant/taskdefs/Tstamp;Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    return-void

    .line 261
    .end local v1    # "sdf":Ljava/text/SimpleDateFormat;
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->variant:Ljava/lang/String;

    if-nez v2, :cond_5

    .line 262
    new-instance v1, Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->pattern:Ljava/lang/String;

    new-instance v3, Ljava/util/Locale;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->language:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->country:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .restart local v1    # "sdf":Ljava/text/SimpleDateFormat;
    goto :goto_0

    .line 265
    .end local v1    # "sdf":Ljava/text/SimpleDateFormat;
    :cond_5
    new-instance v1, Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->pattern:Ljava/lang/String;

    new-instance v3, Ljava/util/Locale;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->language:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->country:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->variant:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .restart local v1    # "sdf":Ljava/text/SimpleDateFormat;
    goto :goto_0
.end method

.method public setLocale(Ljava/lang/String;)V
    .locals 5
    .param p1, "locale"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v2, " \t\n\r\u000c,"

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .local v1, "st":Ljava/util/StringTokenizer;
    :try_start_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->language:Ljava/lang/String;

    .line 167
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 168
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->country:Ljava/lang/String;

    .line 169
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 170
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->variant:Ljava/lang/String;

    .line 171
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "bad locale format"

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Tstamp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/util/NoSuchElementException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "bad locale format"

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Tstamp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 177
    .end local v0    # "e":Ljava/util/NoSuchElementException;
    :cond_0
    :try_start_1
    const-string/jumbo v2, ""

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->country:Ljava/lang/String;
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0

    .line 183
    :cond_1
    return-void
.end method

.method public setOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .prologue
    .line 200
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->offset:I

    .line 201
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->pattern:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->propertyName:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setTimezone(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 192
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->timeZone:Ljava/util/TimeZone;

    .line 193
    return-void
.end method

.method public setUnit(Ljava/lang/String;)V
    .locals 3
    .param p1, "unit"    # Ljava/lang/String;

    .prologue
    .line 214
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->this$0:Lorg/apache/tools/ant/taskdefs/Tstamp;

    const-string/jumbo v2, "DEPRECATED - The setUnit(String) method has been deprecated. Use setUnit(Tstamp.Unit) instead."

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tstamp;->log(Ljava/lang/String;)V

    .line 216
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;-><init>()V

    .line 217
    .local v0, "u":Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->setValue(Ljava/lang/String;)V

    .line 218
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->getCalendarField()I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->field:I

    .line 219
    return-void
.end method

.method public setUnit(Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;)V
    .locals 1
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;

    .prologue
    .line 238
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;->getCalendarField()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->field:I

    .line 239
    return-void
.end method
