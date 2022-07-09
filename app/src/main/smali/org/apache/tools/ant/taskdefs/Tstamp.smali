.class public Lorg/apache/tools/ant/taskdefs/Tstamp;
.super Lorg/apache/tools/ant/Task;
.source "Tstamp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Tstamp$Unit;,
        Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
    }
.end annotation


# instance fields
.field private customFormats:Ljava/util/Vector;

.field private prefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->customFormats:Ljava/util/Vector;

    .line 48
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    .line 285
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Tstamp;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Tstamp;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Tstamp;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tstamp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    return-void
.end method


# virtual methods
.method public createFormat()Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;-><init>(Lorg/apache/tools/ant/taskdefs/Tstamp;)V

    .line 99
    .local v0, "cts":Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->customFormats:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 100
    return-object v0
.end method

.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 70
    :try_start_0
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 72
    .local v1, "d":Ljava/util/Date;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->customFormats:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v4

    .line 73
    .local v4, "i":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 74
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;

    .line 75
    .local v0, "cts":Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tstamp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tstamp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-virtual {v0, v7, v1, v8}, Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;->execute(Lorg/apache/tools/ant/Project;Ljava/util/Date;Lorg/apache/tools/ant/Location;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 88
    .end local v0    # "cts":Lorg/apache/tools/ant/taskdefs/Tstamp$CustomFormat;
    .end local v1    # "d":Ljava/util/Date;
    .end local v4    # "i":Ljava/util/Enumeration;
    :catch_0
    move-exception v3

    .line 89
    .local v3, "e":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 78
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "d":Ljava/util/Date;
    .restart local v4    # "i":Ljava/util/Enumeration;
    :cond_0
    :try_start_1
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v7, "yyyyMMdd"

    invoke-direct {v2, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 79
    .local v2, "dstamp":Ljava/text/SimpleDateFormat;
    const-string/jumbo v7, "DSTAMP"

    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Tstamp;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string/jumbo v7, "HHmm"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 82
    .local v6, "tstamp":Ljava/text/SimpleDateFormat;
    const-string/jumbo v7, "TSTAMP"

    invoke-virtual {v6, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Tstamp;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string/jumbo v7, "MMMM d yyyy"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v5, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 86
    .local v5, "today":Ljava/text/SimpleDateFormat;
    const-string/jumbo v7, "TODAY"

    invoke-virtual {v5, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Tstamp;->setProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 91
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tstamp;->prefix:Ljava/lang/String;

    .line 61
    :cond_0
    return-void
.end method
