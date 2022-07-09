.class public Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "IsLastModified.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;
    }
.end annotation


# instance fields
.field private dateTime:Ljava/lang/String;

.field private dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

.field private millis:J

.field private mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

.field private resource:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 40
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    .line 42
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Touch;->DEFAULT_DF_FACTORY:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    .line 44
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->access$000()Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    .line 173
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 86
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only one resource can be tested"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->resource:Lorg/apache/tools/ant/types/Resource;

    .line 89
    return-void
.end method

.method public eval()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 149
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->validate()V

    .line 150
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->getMillis()J

    move-result-wide v2

    .line 151
    .local v2, "expected":J
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    .line 152
    .local v0, "actual":J
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "expected timestamp: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ", actual timestamp: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->log(Ljava/lang/String;I)V

    .line 155
    const-string/jumbo v6, "equals"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 156
    cmp-long v6, v2, v0

    if-nez v6, :cond_1

    .line 168
    :cond_0
    :goto_0
    return v4

    :cond_1
    move v4, v5

    .line 156
    goto :goto_0

    .line 158
    :cond_2
    const-string/jumbo v6, "before"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 159
    cmp-long v6, v2, v0

    if-gtz v6, :cond_0

    move v4, v5

    goto :goto_0

    .line 161
    :cond_3
    const-string/jumbo v6, "not-before"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 162
    cmp-long v6, v2, v0

    if-lez v6, :cond_0

    move v4, v5

    goto :goto_0

    .line 164
    :cond_4
    const-string/jumbo v6, "after"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 165
    cmp-long v6, v2, v0

    if-ltz v6, :cond_0

    move v4, v5

    goto :goto_0

    .line 167
    :cond_5
    const-string/jumbo v6, "not-after"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 168
    cmp-long v6, v2, v0

    if-gez v6, :cond_0

    move v4, v5

    goto :goto_0

    .line 170
    :cond_6
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unknown mode "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected getMillis()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 119
    iget-wide v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    cmp-long v6, v6, v4

    if-ltz v6, :cond_1

    .line 120
    iget-wide v4, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    .line 145
    :cond_0
    :goto_0
    return-wide v4

    .line 122
    :cond_1
    const-string/jumbo v6, "now"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    goto :goto_0

    .line 125
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    invoke-interface {v6}, Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;->getPrimaryFormat()Ljava/text/DateFormat;

    move-result-object v0

    .line 126
    .local v0, "df":Ljava/text/DateFormat;
    const/4 v1, 0x0

    .line 128
    .local v1, "pe":Ljava/text/ParseException;
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    goto :goto_0

    .line 129
    :catch_0
    move-exception v2

    .line 130
    .local v2, "peOne":Ljava/text/ParseException;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    invoke-interface {v6}, Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;->getFallbackFormat()Ljava/text/DateFormat;

    move-result-object v0

    .line 131
    if-nez v0, :cond_3

    .line 132
    move-object v1, v2

    .line 141
    :goto_1
    if-eqz v1, :cond_0

    .line 142
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v4, v5, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 135
    :cond_3
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v4

    goto :goto_0

    .line 136
    :catch_1
    move-exception v3

    .line 137
    .local v3, "peTwo":Ljava/text/ParseException;
    move-object v1, v3

    goto :goto_1
.end method

.method public setDatetime(Ljava/lang/String;)V
    .locals 0
    .param p1, "dateTime"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setMillis(J)V
    .locals 1
    .param p1, "millis"    # J

    .prologue
    .line 52
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    .line 53
    return-void
.end method

.method public setMode(Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;)V
    .locals 0
    .param p1, "mode"    # Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->mode:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$CompareMode;

    .line 96
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 71
    new-instance v0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;-><init>(Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dfFactory:Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;

    .line 79
    return-void
.end method

.method protected validate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 102
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 103
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one of dateTime and millis can be set"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_0
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->millis:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->dateTime:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 107
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "millis or dateTime is required"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;->resource:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_2

    .line 110
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "resource is required"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_2
    return-void
.end method
